local replicatedStorage = game:GetService("ReplicatedStorage")
-- referring to the existing in-built ROBLOX service of ReplicatedStorage

-- Creation of a difficulty selector GUI
local difficultySelectorGui = Instance.new("ScreenGui")
difficultySelectorGui.Name = "difficulty10SelectorGui"
difficultySelectorGui.Parent = game.Players.LocalPlayer.PlayerGui
difficultySelectorGui.Enabled = false

local difficultySelectorFrame = Instance.new("Frame")
difficultySelectorFrame.Name = "difficultySelectorFrame"
difficultySelectorFrame.Parent = difficultySelectorGui
difficultySelectorFrame.Position = UDim2.new(0.25, 0, 0.114, 0)
difficultySelectorFrame.Size = UDim2.new(0.5, 0, 0.767, 0)
difficultySelectorFrame.BackgroundTransparency = 0.5
local UICorner = Instance.new("UICorner")
UICorner.Parent = difficultySelectorFrame


local difficultySelectorTitle = Instance.new("TextLabel")
difficultySelectorTitle.Name = "difficultySelectorTitle"
difficultySelectorTitle.Parent = difficultySelectorFrame
difficultySelectorTitle.Size = UDim2.new(0, 473, 0, 63)
difficultySelectorTitle.Position = UDim2.new(0, 0, 0, 0)
difficultySelectorTitle.BackgroundTransparency = 1
difficultySelectorTitle.Font = Enum.Font.Ubuntu
difficultySelectorTitle.Text = "Select Game Difficulty"
difficultySelectorTitle.TextScaled = true


--[[ Creation of a difficulty button for the specific 10 second time, so that the player 
can select the difficulty they want ]]

local function createDifficultyButton (difficulty, position, textcolour)
	local difficultyButton = Instance.new("TextButton")
	difficultyButton.Name = difficulty.. "Difficulty"
	difficultyButton.Parent = difficultySelectorFrame
	difficultyButton.Size = UDim2.new(0, 200, 0, 50)
	difficultyButton.Position = position
	difficultyButton.BackgroundTransparency = 0
	difficultyButton.Font = Enum.Font.Ubuntu
	difficultyButton.Text = difficulty.." Difficulty"
	difficultyButton.TextScaled = true
	difficultyButton.TextColor3 = textcolour
	local UICorner = Instance.new("UICorner")
	UICorner.Parent = difficultyButton
	
	return difficultyButton
end


local hardDifficultyButton = createDifficultyButton("hard", UDim2.new(0, 135, 0, 84), Color3.fromRGB(255,0,0))
local mediumDifficultyButton = createDifficultyButton("medium", UDim2.new(0, 135, 0, 159), Color3.fromRGB(255, 255, 0))
local easyDifficultyButton = createDifficultyButton("easy", UDim2.new(0, 135, 0, 234), Color3.fromRGB(0, 255, 0))


local winLossConditionGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("winLoss10ConditionGui")
local getReadyGUI = game.Players.LocalPlayer.PlayerGui:WaitForChild("getReadyGui")

local function beginEvent (difficulty)
	local replicatedStorage = game:GetService("ReplicatedStorage")
	local timeSetEvent = replicatedStorage.TimeSet10Event
	
	print(difficulty.." difficulty GameMode is now Loading......")
	difficultySelectorGui.Enabled = false
	winLossConditionGUI.Enabled = true
	wait(3)
	getReadyGUI.Enabled = true
	wait(2)
	getReadyGUI.Enabled = false
	
	local survivalTimeModeEvent = replicatedStorage[difficulty.."SurvivalTimeModeEvent"]
	survivalTimeModeEvent:FireServer()
	timeSetEvent:FireServer()
end

hardDifficultyButton.MouseButton1Down:Connect(function ()
	beginEvent("hard")
end)

mediumDifficultyButton.MouseButton1Down:Connect(function ()
	beginEvent("medium")
end)

easyDifficultyButton.MouseButton1Down:Connect(function ()
	beginEvent("easy")
end)



