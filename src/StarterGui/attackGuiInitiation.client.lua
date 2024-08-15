-- Accessing the ReplicatedStorage service in the Roblox game environment
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Retrieving the custom events from ReplicatedStorage
local throwRockEvent = replicatedStorage.ThrowRockEvent
local chargeEvent = replicatedStorage.ChargeEvent
local spikesEvent = replicatedStorage.SpikesEvent
local highJumpEvent = replicatedStorage.HighJumpEvent

-- Definition of a base class for attacks
local Attack = {}
Attack.__index = Attack

function Attack.new(name, duration)
	local self = setmetatable({}, Attack)
	self.name = name
	self.duration = duration
	return self
end

function Attack:display()
	local attackDisplayGUI = Instance.new("ScreenGui")
	attackDisplayGUI.Parent = game.Players.LocalPlayer.PlayerGui
	attackDisplayGUI.Name = "AttackDisplayGui"

	local Frame = Instance.new("Frame")
	Frame.Position = UDim2.new(0.25, 0, 0.17, 0)
	Frame.Size = UDim2.new(0.5, 0, 0.15, 0)
	Frame.BackgroundTransparency = 0.5
	Frame.Parent = attackDisplayGUI

	local UICorners = Instance.new("UICorner")
	UICorners.Parent = Frame

	local textLabel = Instance.new("TextLabel")
	textLabel.Parent = Frame
	textLabel.Size = UDim2.new(0, 518, 0, 69)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.Ubuntu
	textLabel.Text = self.name
	textLabel.TextScaled = true

	task.wait(self.duration)
	attackDisplayGUI:Destroy()
end

-- Definition of subclasses for each type of attack
local ThrowRock = setmetatable({}, { __index = Attack })
local Charge = setmetatable({}, { __index = Attack })
local Spikes = setmetatable({}, { __index = Attack })
local HighJump = setmetatable({}, { __index = Attack })

--[[ attack instances definitionss, GROUP A: Dynamic generation of objects using OOP
Group A: each object inherits from the attack baseclass
]]
local throwRock = ThrowRock.new("Throw Rock", 0.5)
local charge = Charge.new("Charge", 0.5)
local spikes = Spikes.new("Spikes", 1)
local highJump = HighJump.new("High Jump", 0.5)

-- GROUP A: Connecting each game event from the server call to the client display function also PASSING THE required arguments
-- Code is now drastically reduced, with the implementation of functions, readability and maintainability is better now...
throwRockEvent.OnClientEvent:Connect(function()
	throwRock:display()
end)

chargeEvent.OnClientEvent:Connect(function()
	charge:display()
end)

spikesEvent.OnClientEvent:Connect(function()
	spikes:display()
end)

highJumpEvent.OnClientEvent:Connect(function()
	highJump:display()
end)