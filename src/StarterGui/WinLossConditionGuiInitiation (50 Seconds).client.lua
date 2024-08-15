-- Creation of a Win/Loss condition GUI, which will allow the player to know what their game Objective is

local winLossConditionGUI = Instance.new("ScreenGui")
winLossConditionGUI.Parent = game.Players.LocalPlayer.PlayerGui
winLossConditionGUI.Name = "winLoss50ConditionGui"
winLossConditionGUI.Enabled = false

local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0.25, 0, 0.02, 0)
Frame.Size = UDim2.new(0.5, 0, 0.15, 0)
Frame.BackgroundTransparency = 0.5
Frame.Parent = winLossConditionGUI

local winTextLable = Instance.new("TextLabel")
winTextLable.Parent = Frame
winTextLable.Size = UDim2.new(0, 518, 0, 34.5)
winTextLable.Position = UDim2.new(0, 0, 0, 0)
winTextLable.BackgroundTransparency = 1
winTextLable.Font = Enum.Font.Ubuntu
winTextLable.Text = "Winning Condition: Do not die for a minimum of 50 seconds"
winTextLable.TextColor3 = Color3.fromRGB(85, 255, 0)
winTextLable.TextScaled = true

local lossTextLable = Instance.new("TextLabel")
lossTextLable.Parent = Frame
lossTextLable.Size = UDim2.new(0, 518, 0, 34.5)
lossTextLable.Position = UDim2.new(0, 0, 0.5, 0)
lossTextLable.BackgroundTransparency = 1
lossTextLable.Font = Enum.Font.Ubuntu
lossTextLable.Text = "Losing Condition: Die within 50 seconds"
lossTextLable.TextColor3 = Color3.fromRGB(255, 0, 0)
lossTextLable.TextScaled = true

local UICorners = Instance.new("UICorner")
UICorners.Parent = Frame

