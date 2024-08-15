-- Creation of a gameMode Selector Gui
local gameModeSelectorGui = Instance.new("ScreenGui")
gameModeSelectorGui.Name = "gameModeSelectorGui"
gameModeSelectorGui.Parent = game.Players.LocalPlayer.PlayerGui


local gameModeSelectorFrame = Instance.new("Frame")
gameModeSelectorFrame.Name = "gameModeSelectorFrame"
gameModeSelectorFrame.Parent = gameModeSelectorGui
gameModeSelectorFrame.Position = UDim2.new(0.25, 0, 0.114, 0)
gameModeSelectorFrame.Size = UDim2.new(0.5, 0, 0.767, 0)
gameModeSelectorFrame.BackgroundTransparency = 0.5
local UICorner = Instance.new("UICorner")
UICorner.Parent = gameModeSelectorFrame

local gameModeSelectorTitle = Instance.new("TextLabel")
gameModeSelectorTitle.Name = "gameModeSelectorTitle"
gameModeSelectorTitle.Parent = gameModeSelectorFrame
gameModeSelectorTitle.Size = UDim2.new(0, 473, 0, 63)
gameModeSelectorTitle.Position = UDim2.new(0, 0, 0, 0)
gameModeSelectorTitle.BackgroundTransparency = 1
gameModeSelectorTitle.Font = Enum.Font.Ubuntu
gameModeSelectorTitle.Text = "Select Game Mode"
gameModeSelectorTitle.TextScaled = true

-- There is one gameMode called 'Survivl Time Game Mode'
local survivalTimeButton = Instance.new("TextButton")
survivalTimeButton.Name = "survivalTimeButton"
survivalTimeButton.Parent = gameModeSelectorFrame
survivalTimeButton.Size = UDim2.new(0, 200, 0, 50)
survivalTimeButton.Position = UDim2.new(0, 135, 0, 84)
survivalTimeButton.BackgroundTransparency = 0
survivalTimeButton.Font = Enum.Font.Ubuntu
survivalTimeButton.Text = "SurvivalTime Mode"
survivalTimeButton.TextSize = 18
local UICorner2 = Instance.new("UICorner")
UICorner2.Parent = survivalTimeButton

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[ Once the player selects the Survival Time game mode, the time Selector GUI appears,
so that the player can select their time objective to survive for...]]

local timeSelectorGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("timeSelectorGui")
local playerName = game.Players.LocalPlayer.Name

survivalTimeButton.MouseButton1Down:Connect(function ()
	timeSelectorGUI.Enabled = true
	gameModeSelectorGui.Enabled = false
	print("Survival Time gameMode selected!")
end)

