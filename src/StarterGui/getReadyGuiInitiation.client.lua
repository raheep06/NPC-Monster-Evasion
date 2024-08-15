--[[ Once player has selected all their preferences for the gameMode, the player will be given a warning
to allow them to prepare for what's in store for them (NPC Attacks)]]

-- Creation of a getReadyGui to inform the player, that they are about to be teleported to the gameEnvironment

local getReadyGUI = Instance.new("ScreenGui")
getReadyGUI.Parent = game.Players.LocalPlayer.PlayerGui
getReadyGUI.Name = "getReadyGui"
getReadyGUI.Enabled = false

local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0.25, 0, 0.423, 0)
Frame.Size = UDim2.new(0.5, 0, 0.15, 0)
Frame.BackgroundTransparency = 0.5
Frame.Parent = getReadyGUI


local getReadyTextLable = Instance.new("TextLabel")
getReadyTextLable.Parent = Frame
getReadyTextLable.Size = UDim2.new(0, 473, 0, 69)
getReadyTextLable.Position = UDim2.new(0, 0, 0, 0)
getReadyTextLable.BackgroundTransparency = 1
getReadyTextLable.Font = Enum.Font.Ubuntu
getReadyTextLable.Text = "Get Ready to Run!"
getReadyTextLable.TextColor3 = Color3.fromRGB(255, 0, 0)
getReadyTextLable.TextScaled = true


local UICorners = Instance.new("UICorner")
UICorners.Parent = Frame

