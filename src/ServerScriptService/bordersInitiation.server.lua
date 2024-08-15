local gameEnvironment = game.Workspace

local Border = {}
Border.__index = Border

function Border.new(name, position, size)

	
	local self = setmetatable({}, Border)
	
	self.Instance = Instance.new("Part")
	self.Instance.Parent = gameEnvironment
	self.Instance.Name = name
	self.Instance.Size = size
	self.Instance.Position = position
	self.Instance.Anchored = true
	self.Instance.Color = Color3.fromRGB(91, 91, 91)
	self.Instance.Material = Enum.Material.SmoothPlastic
	self.Instance.CastShadow = false
	self.Instance.Transparency = 0
	self.Instance.CanCollide = true
	
	print("Required " ..name.. " has been created")
	--[[ Group A (Composition) Creation of a border class, in which the border class would be  
	composed of a basePart instance
	]]
	
	return self
end

function Border:collisionProtection()
	local debounce = false

	return function(hit)
		if not debounce then
			if string.find(hit.Parent.Name:lower(), "minion") or string.find(hit.Parent.Name:lower(), "monster") then
				debounce = true
				local humanoidRootPart = hit.Parent:FindFirstChild("HumanoidRootPart")
				if humanoidRootPart then
					humanoidRootPart.CFrame = CFrame.new(Vector3.new(5, 5.962, 0))
				end
				wait()
				debounce = false
			end
		end
	end
	
	--[[ Border collisionProtection Method prevents the various monster and minions falling from the gameEnvironmentBorder
	by teleporting them back to the spawn point (Vector3.new(5, 5.962, 0))]]
	
end



local gameEnvironmentborder1 = Border.new("gameEnvironmentBorder1", Vector3.new(-124, 43, 0), Vector3.new(12, 118, 250))
local gameEnvironmentborder2 = Border.new("gameEnvironmentBorder2", Vector3.new(124, 43, 0), Vector3.new(12, 118, 250))
local gameEnvironmentborder3 = Border.new("gameEnvironmentBorder3", Vector3.new(0, 43, -124), Vector3.new(250, 118, 12))
local gameEnvironmentborder4 = Border.new("gameEnvironmentBorder4", Vector3.new(0, 43, 124), Vector3.new(250, 118, 12))
local gameEnvironmentborder5 = Border.new("gameEnvironmentBorder5", Vector3.new(0, 94, 0), Vector3.new(250, 16, 250))


local intermissionBorder1 = Border.new("intermissionBorder1", Vector3.new(-124, 1043, 0), Vector3.new(2, 118, 250))
local intermissionBorder2 = Border.new("intermissionBorder2", Vector3.new(124, 1043, 0), Vector3.new(2, 118, 250))
local intermissionBorder3 = Border.new("intermissionBorder3", Vector3.new(0, 1043, -124), Vector3.new(250, 118, 2))
local intermissionBorder4 = Border.new("intermissionBorder4", Vector3.new(0, 1043, 124), Vector3.new(250, 118, 2))
local intermissionBorder5 = Border.new("intermissionBorder5", Vector3.new(0, 1094, 0), Vector3.new(250, 16, 250))
-- [[Group A dynamic generation of many border objects using Border.new]]


gameEnvironmentborder1.Instance.Touched:Connect(gameEnvironmentborder1:collisionProtection())
gameEnvironmentborder2.Instance.Touched:Connect(gameEnvironmentborder2:collisionProtection())
gameEnvironmentborder3.Instance.Touched:Connect(gameEnvironmentborder3:collisionProtection())
gameEnvironmentborder4.Instance.Touched:Connect(gameEnvironmentborder4:collisionProtection())
gameEnvironmentborder5.Instance.Touched:Connect(gameEnvironmentborder5:collisionProtection())