local replicatedStorage = game:GetService("ReplicatedStorage")
-- gaining access to the in-built ROBLOX service of ReplicatedStorage
local youWonEvent = replicatedStorage.YouWonEvent

local function displayStatus()
	local completionGUI = Instance.new("ScreenGui")
	completionGUI.Parent = game.Players.LocalPlayer.PlayerGui
	completionGUI.Name = "completionGui"
	local Frame = Instance.new("Frame")
	Frame.Position = UDim2.new(0.25, 0, 0.17, 0)
	Frame.Size = UDim2.new(0.5, 0, 0.15, 0)
	Frame.BackgroundTransparency = 0.5
	Frame.Parent = completionGUI
	local UICorners = Instance.new("UICorner")
	UICorners.Parent = Frame
	local textLabel = Instance.new("TextLabel")
	textLabel.Parent = Frame
	textLabel.Size = UDim2.new(0, 518, 0, 69)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.Ubuntu
	textLabel.Text = "You Won"
	textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)

	textLabel.TextScaled = true

	task.wait(3)

	completionGUI:Remove()
end

--[[ When the client has died, it will fire the event to the client. Now i connect to the event Fire
using onClientEvent (which actively listens for the event Fire) and then pass the displayWin function]]

youWonEvent.OnClientEvent:Connect(function()
	displayStatus()
end)