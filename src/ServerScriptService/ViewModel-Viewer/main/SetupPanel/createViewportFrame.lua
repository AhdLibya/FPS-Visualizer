local Types = require(script.Parent.Parent.Parent.Types)

local function createViewportFrame(setupPanel: Types._setupPanel , model: Model)
	local ViewportFrame 			= Instance.new("ViewportFrame")
	ViewportFrame.Name 				= "ViewportFrame"
	ViewportFrame.Ambient 			= Color3.fromRGB(220, 220, 220)
	ViewportFrame.LightColor 		= Color3.fromRGB(229, 229, 229)
	ViewportFrame.LightDirection	= Vector3.new(-2, -2, -2)
	ViewportFrame.AnchorPoint 		= Vector2.new(0.5, 0.5)
	ViewportFrame.BackgroundColor3 	= Color3.fromRGB(212, 248, 255)
	ViewportFrame.BorderColor3 		= Color3.fromRGB(0, 0, 0)
	ViewportFrame.BorderSizePixel 	= 0
	ViewportFrame.Position 			= UDim2.fromScale(0.5, 0.5)
	ViewportFrame.Size 				= UDim2.fromScale(1, 1)

	local Baseplate = Instance.new("Part")
	Baseplate.Name = "Baseplate"
	Baseplate.Anchored = true
	Baseplate.BottomSurface = Enum.SurfaceType.Smooth
	Baseplate.BrickColor = BrickColor.new("Dark grey metallic")
	Baseplate.CFrame = CFrame.new(0, -8, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	Baseplate.Color = Color3.fromRGB(91, 91, 91)
	Baseplate.Locked = true
	Baseplate.Size = Vector3.new(2.05e+03, 16, 2.05e+03)
	Baseplate.TopSurface = Enum.SurfaceType.Smooth

	local Texture = Instance.new("Texture")
	Texture.Name = "Texture"
	Texture.StudsPerTileU = 8
	Texture.StudsPerTileV = 8
	Texture.Color3 = Color3.fromRGB(0, 0, 0)
	Texture.Texture = "rbxassetid://6372755229"
	Texture.Transparency = 0.8
	Texture.Face = Enum.NormalId.Top
	Texture.Parent = Baseplate

	Baseplate.Parent = ViewportFrame

	local Camera = Instance.new("Camera")
	Camera.Name = "Camera"
	Camera.CFrame = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	
	Camera.CameraType 	= Enum.CameraType.Scriptable
	Camera.Parent 		= ViewportFrame
	ViewportFrame.CurrentCamera = Camera
	
	return ViewportFrame
end

return createViewportFrame