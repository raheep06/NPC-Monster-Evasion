local gameEnvironment = game.Workspace 
-- referencing the game's Workspace as gameEnvironment
local serverStorage = game.ServerStorage 
-- gaining access to the in-built ROBLOX service of ServerStorage
local starterPlayer = game.StarterPlayer 
-- gaining access to the in-built ROBLOX service of StarterPlayer



local Character = {}


function Character.new(model)
	local self = setmetatable({}, Character)
	self.Model = model
	self.Model.Parent = starterPlayer
	print("Character Model has been instantiated and is in player's control")
	return self
	
	-- referencing the Character Model that I created and stored in the ServerStorage
	-- setting the created Character Model as the physical body of the player, the player will be controlling this character.
	
	--[[GROUP A use of Composition OOP, Character.new method has an associated object within it which is the actual Model
	Object for the player]]
	
end


local playerCharacter = Character.new(serverStorage.StarterCharacter)
-- GROUP B as the code still uses simple OOP Model.	