-- Accessing the ReplicatedStorage service in the Roblox game environment
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Retrieving custom events from ReplicatedStorage
local hardSurvivalTimeModeEvent = replicatedStorage:WaitForChild("hardSurvivalTimeModeEvent")
local mediumSurvivalTimeModeEvent = replicatedStorage:WaitForChild("mediumSurvivalTimeModeEvent")
local easySurvivalTimeModeEvent = replicatedStorage:WaitForChild("easySurvivalTimeModeEvent")


-- Function handles player joining the game
local function onPlayerJoin(player)
	-- Creating a folder for leaderstats for the player
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	-- Creation of an IntValue to track the player's alive time
	local aliveTime = Instance.new("IntValue")
	aliveTime.Name = "AliveTime"
	aliveTime.Value = 0
	aliveTime.Parent = leaderstats

	-- Function to track the player's alive time
	local function trackAliveTime()
		while true do
			wait(1)
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if player.Character.Humanoid.Health > 0 then
					aliveTime.Value += 1
				else
					aliveTime.Value = 0
					break
				end
			else
				aliveTime.Value = 0
				break
			end
		end
	end
	
	-- Connecting the trackAliveTime function to each survival mode event
	local hardConnection = hardSurvivalTimeModeEvent.OnServerEvent:Connect(trackAliveTime)
	local mediumConnection = mediumSurvivalTimeModeEvent.OnServerEvent:Connect(trackAliveTime)
	local easyConnection = easySurvivalTimeModeEvent.OnServerEvent:Connect(trackAliveTime)

	-- Handling player's character addition and removal
	player.CharacterAdded:Connect(function(character)
		hardConnection:Disconnect()
		mediumConnection:Disconnect()
		easyConnection:Disconnect()
		hardConnection = hardSurvivalTimeModeEvent.OnServerEvent:Connect(trackAliveTime)
		mediumConnection = mediumSurvivalTimeModeEvent.OnServerEvent:Connect(trackAliveTime)
		easyConnection = easySurvivalTimeModeEvent.OnServerEvent:Connect(trackAliveTime)
	end)

	player.CharacterRemoving:Connect(function(character)
		hardConnection:Disconnect()
		mediumConnection:Disconnect()
		easyConnection:Disconnect()
	end)
end

-- Connecting the onPlayerJoin function to the PlayerAdded event
game.Players.PlayerAdded:Connect(onPlayerJoin)

---------------- GROUP A ----------------
--[[ Lines 40 to 71, The code establishes a client-server model where the server-side scripting 
provided by the current script triggers events (`OnServerEvent`) to clients, 
signaling game conditions. Clients respond by executing predefined functions (`trackAliveTime`) to track player actions. 
This interaction illustrates a form of request-response communication, where the server controls game events and 
communicates with clients,
extending the model beyond basic client-side scripting.]]