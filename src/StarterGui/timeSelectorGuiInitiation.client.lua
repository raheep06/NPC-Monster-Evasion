-- Creation of a 'Please select time to survive for' Gui

local timeSelectorGui = Instance.new("ScreenGui")
timeSelectorGui.Name = "timeSelectorGui"
timeSelectorGui.Parent = game.Players.LocalPlayer.PlayerGui
timeSelectorGui.Enabled = false
local timeSelectorFrame = Instance.new("Frame")
timeSelectorFrame.Name = "timeSelectorFrame"
timeSelectorFrame.Parent = timeSelectorGui
timeSelectorFrame.Position = UDim2.new(0.25, 0, 0.114, 0)
timeSelectorFrame.Size = UDim2.new(0.5, 0, 0.767, 0)
timeSelectorFrame.BackgroundTransparency = 0.5
local UICorner = Instance.new("UICorner")
UICorner.Parent = timeSelectorFrame
local timeSelectorTitle = Instance.new("TextLabel")
timeSelectorTitle.Name = "timeSelectorTitle"
timeSelectorTitle.Parent = timeSelectorFrame
timeSelectorTitle.Size = UDim2.new(0, 473, 0, 63)
timeSelectorTitle.Position = UDim2.new(0, 0, 0, 0)
timeSelectorTitle.BackgroundTransparency = 1
timeSelectorTitle.Font = Enum.Font.Ubuntu
timeSelectorTitle.Text = "Select Seconds Alive Condition"
timeSelectorTitle.TextScaled = true


local survive10TimeButton = Instance.new("TextButton")
survive10TimeButton.Name = "survivalTimeButton"
survive10TimeButton.Parent = timeSelectorFrame
survive10TimeButton.Size = UDim2.new(0, 200, 0, 50)
survive10TimeButton.Position = UDim2.new(0, 135, 0, 84)
survive10TimeButton.BackgroundTransparency = 0
survive10TimeButton.Font = Enum.Font.Ubuntu
survive10TimeButton.Text = "Survive for 10 seconds"
survive10TimeButton.TextScaled = true
local UICorner2 = Instance.new("UICorner")
UICorner2.Parent = survive10TimeButton

local survive25TimeButton = Instance.new("TextButton")
survive25TimeButton.Name = "survivalTimeButton"
survive25TimeButton.Parent = timeSelectorFrame
survive25TimeButton.Size = UDim2.new(0, 200, 0, 50)
survive25TimeButton.Position = UDim2.new(0, 135, 0, 170)
survive25TimeButton.BackgroundTransparency = 0
survive25TimeButton.Font = Enum.Font.Ubuntu
survive25TimeButton.Text = "Survive for 25 seconds"
survive25TimeButton.TextScaled = true
local UICorner3 = Instance.new("UICorner")
UICorner3.Parent = survive25TimeButton

local survive50TimeButton = Instance.new("TextButton")
survive50TimeButton.Name = "survivalTimeButton"
survive50TimeButton.Parent = timeSelectorFrame
survive50TimeButton.Size = UDim2.new(0, 200, 0, 50)
survive50TimeButton.Position = UDim2.new(0, 135, 0, 256)
survive50TimeButton.BackgroundTransparency = 0
survive50TimeButton.Font = Enum.Font.Ubuntu
survive50TimeButton.Text = "Survive for 50 seconds"
survive50TimeButton.TextScaled = true
local UICorner4 = Instance.new("UICorner")
UICorner4.Parent = survive50TimeButton

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[ The player will be given their corresponding difficultySelector GUI prompt,
which will be specific to the time selected from this timeSelectorGUI]]

local difficulty10SelectorGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("difficulty10SelectorGui")
local difficulty25SelectorGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("difficulty25SelectorGui")
local difficulty50SelectorGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("difficulty50SelectorGui")

survive10TimeButton.MouseButton1Down:Connect(function ()
	print("10 second gameMode selected!")
	difficulty10SelectorGUI.Enabled = true
	timeSelectorGui.Enabled = false
end)

survive25TimeButton.MouseButton1Down:Connect(function ()
	print("25 second gameMode selected!")
	difficulty25SelectorGUI.Enabled = true
	timeSelectorGui.Enabled = false
end)

survive50TimeButton.MouseButton1Down:Connect(function ()
	print("50 second gameMode selected!")
	difficulty50SelectorGUI.Enabled = true
	timeSelectorGui.Enabled = false
end)