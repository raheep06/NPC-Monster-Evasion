local replicatedStorage = game:GetService("ReplicatedStorage")
local serverScriptService = game:GetService("ServerScriptService")
local youLostEvent = replicatedStorage.YouLostEvent
local youWonEvent = replicatedStorage.YouWonEvent

-- Gaining Access to my Game Module that includes NPC Classes, and storing the required classes in variables.

local Game = require(game:GetService("ServerScriptService").Game)
local monster = Game.Monster
local minion = Game.Minion
local character = script.Parent
local player = game.Players:GetPlayerFromCharacter(character)

--[[ ]]

--[[ When the client has selected their time, it will fire the event to the client. Now i connect to the event Fire
using onClientEvent (which actively listens for the event Fire) and then Depending on what the player sets their
timeObjective to in the timeSelectorEvent, that same value will be officially set within a valueHolder
object within the gameEnvironment]]

replicatedStorage.TimeSet10Event.OnServerEvent:Connect(function()
	serverScriptService.TimeSet.Value = 10
end)
replicatedStorage.TimeSet25Event.OnServerEvent:Connect(function()
	serverScriptService.TimeSet.Value = 25
end)
replicatedStorage.TimeSet50Event.OnServerEvent:Connect(function()
	serverScriptService.TimeSet.Value = 50
end)

local lastRecordedTime

while true do
	--[[ Extremely small wait time 1x10^-9 to allow for active checking whether the time in the gameMode 
	(lastRecordedTime) has reached the timeRequirement (timeObjective) (e.g., could be 10, 25 or 50 seconds... )]]
	wait(1e-1000000000)
	
	local timeObjective = serverScriptService.TimeSet.Value
	if timeObjective then
		if lastRecordedTime ~= timeObjective then
			if timeObjective == 0 then
				print("No Time has been selected yet")
			else
				print("Current selected Time is " .. timeObjective.. " seconds")
			end
			lastRecordedTime = timeObjective
		end
	else
		error("Time no longer being recorded...")
	end

	local playerHealth = character.Humanoid.Health
	
	if playerHealth <= 0 then
		print("Game Ended, Player has Died! and has failed to complete the gameMode !")
		lastRecordedTime = nil
		timeObjective = 0
		youLostEvent:FireAllClients()
		monster:Remove()
		minion:Remove()
		break
		
	else
		if timeObjective == 10 or timeObjective == 25 or timeObjective == 50 then
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local aliveTimeValue = leaderstats:FindFirstChild("AliveTime")
				if aliveTimeValue then
					aliveTimeValue = aliveTimeValue.Value
					if aliveTimeValue >= timeObjective then
						print("Game Complete: Player has won the gameMode!! yay!")
						
						youWonEvent:FireAllClients()
						
						-- Monster and Minions inherit the Remove method from the NPC baseClass
						
						monster:Remove()
						minion:Remove()
						
						for index, value in pairs(workspace:GetChildren()) do
							if string.find(string.lower(value.Name), "minion") 
								or string.find(string.lower(value.Name), "monster") 
								or string.find(string.lower(value.Name), "folder") 
								or string.find(string.lower(value.Name), "rock") then
								value.Parent = nil
							end
						end
						
						wait(1)
						for i, v in pairs(character:GetChildren()) do
							if v:IsA("Part") or v:IsA("UnionOperation") then
								v.Transparency = 1
							end
						end
						
						lastRecordedTime = nil
						serverScriptService.TimeSet.Value = 0
						character.HumanoidRootPart.Position = Vector3.new(2.046, 1010.054, 55.5)
						wait()
						character.Humanoid.Health -= 1e9
						break
					end
				end
			end
		end
	end
end