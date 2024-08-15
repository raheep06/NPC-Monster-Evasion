-- User-defined class for Platform
local Platform = {}
Platform.__index = Platform

function Platform.new(name, position, size, textureId, textureTransparency)
	local self = setmetatable({}, Platform)

	-- Creation of platform part
	local platformPart = Instance.new("Part")
	platformPart.Parent = game.Workspace
	platformPart.Name = name
	platformPart.Size = size
	platformPart.Position = position
	platformPart.Anchored = true
	platformPart.Color = Color3.fromRGB(91, 91, 91)
	platformPart.Material = Enum.Material.SmoothPlastic
	platformPart.TopSurface = Enum.SurfaceType.Smooth

	-- Creation of platform texture
	local platformTexture = Instance.new("Texture")
	platformTexture.Parent = platformPart
	platformTexture.Color3 = Color3.fromRGB(255, 255, 255)
	platformTexture.StudsPerTileU = 16
	platformTexture.StudsPerTileV = 8
	platformTexture.Texture = "rbxassetid://" .. textureId
	platformTexture.Transparency = textureTransparency or 0.8
	platformTexture.Face = Enum.NormalId.Top

	-- Assign platform part to self
	self.Instance = platformPart
	
	--[[ Group A (Composition) Creation of a platform class, in which the platformm class would be  
	composed of a basePart and texture instance
	]]
	
	return self
	
end

-- Creation of platform instances

--[[ Group A dynamic generation of platform objects
]]
local intermissionPlatform = Platform.new("intermissionPlatform", Vector3.new(0, 992, 0), Vector3.new(250, 16, 250), 6372755229)
local gameEnvironmentPlatform = Platform.new("gameEnvironmentPlatform", Vector3.new(0, -8, 0), Vector3.new(250, 16, 250), 6372755229)

-- Print platform names
print(intermissionPlatform.Instance.Name .. "has been created") 
print(gameEnvironmentPlatform.Instance.Name .. "has been created") 