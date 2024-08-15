-- Definition of a class for SpawnLocation
local SpawnLocation = {}
SpawnLocation.__index = SpawnLocation

-- Constructor for SpawnLocation class
function SpawnLocation.new(position, duration, color)
	local self = setmetatable({}, SpawnLocation)

	-- Creation of the SpawnLocation instance
	self.instance = Instance.new("SpawnLocation")
	self.instance.Parent = game.Workspace
	self.instance.Name = "SpawnLocation"
	self.instance.Anchored = true
	self.instance.Size = Vector3.new(5, 0.1, 5)
	self.instance.Position = position or Vector3.new(0, 0, 0)
	self.instance.Material = Enum.Material.SmoothPlastic
	self.instance.Duration = 0
	self.instance.Color = color

	return self
end

-- instance of SpawnLocation created
local spawnLocation1 = SpawnLocation.new(Vector3.new(2.046, 1000.054, 55.5), 0, Color3.new(0, 1, 0))
