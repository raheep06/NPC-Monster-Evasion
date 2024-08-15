-- Accessing the ReplicatedStorage and ServerScriptService services in the Roblox game environment
local replicatedStorage = game:GetService("ReplicatedStorage")
local serverScriptService = game:GetService("ServerScriptService")

-- Retrieving the custom events from ReplicatedStorage
local easySurvivalTimeGameModeEvent = replicatedStorage:WaitForChild("easySurvivalTimeModeEvent")
local mediumSuvivalTimeGameModeEvent = replicatedStorage:WaitForChild("mediumSurvivalTimeModeEvent")
local hardSuvivalTimeGameModeEvent = replicatedStorage:WaitForChild("hardSurvivalTimeModeEvent")

-- Gaining access to the Game Classes Script that contains my own user-defined classes and methods
local Game = require(serverScriptService.Game)

--[[ GROUP A: Complex Client Server Model,
Server-Side Scripting using request and response objects for a complex client-server model
(lines 5 to 26) Connecting each game event to its corresponding Game method (startGameMode) difficulty
I created this Game method in my Classes ModuleScript]] 

easySurvivalTimeGameModeEvent.OnServerEvent:Connect(function()
	Game:startGameMode("easy")
end)

mediumSuvivalTimeGameModeEvent.OnServerEvent:Connect(function()
	Game:startGameMode("medium")
end)

hardSuvivalTimeGameModeEvent.OnServerEvent:Connect(function()
	Game:startGameMode("hard")
end)
