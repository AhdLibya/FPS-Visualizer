--[[
	the job of this singleton class is mange rendering the viewmodel for in the viewport 
	
	why it's singleton ?
	
			we need to have only one instance of this class because we don't want to render the viewmodel more than once 
			and also we don't want to create multiple instances of the same object in memory.
			
			
	how it works ?
	
			this class will be responsible for creating a new viewport frame and rendering the viewmodel inside it
			it will also handle all the events that related to rendering like (changing camera position, changing model position, etc..)
			
]]
local Dependencies = script.Parent.Parent.Dependencies
local Trove = require(Dependencies.Trove)

local trove = Trove.new()

local CAMERA_PART = "CameraPart"

local writable = {
	Anchored = true,
	Archivable = true,
	BrickColor = true,
	CanCollide = true,
	CFrame = CFrame.new(),
	Material = Enum.Material.Plastic,
	Transparency = 0,
	Reflectance = 0,
	Position = Vector3.new(),
	Rotation = Vector3.new(),
	Size = Vector3.new(),
}

local RenderManger = {}
local rendering = false

local function isWritable(property: string)
	return writable[property]
end



function RenderManger.addModel(model: Model , camera: Camera , viewport: ViewportFrame , target: PVInstance)
	if rendering then return end
	rendering = true
	local renderableModel = trove:Add(model:Clone())
	local store = table.clone(writable)
	renderableModel.Parent = viewport
	trove:Add(camera)
	
	trove:Add(function()
		table.clear(store)
	end)
	
	local function update()
		for _ , limb in model:GetDescendants() do
			if not limb:IsA("BasePart") then continue end
			local renderableLimb = renderableModel:FindFirstChild(limb.Name , true) :: BasePart
			if not renderableLimb then continue end
			if not renderableLimb:IsA("BasePart") then continue end
			for name , value in store do
				local newValue = limb[name]
				if newValue == value then continue end
				store[name] = newValue
				renderableLimb[name] = newValue
			end
		end
	end
	
	trove:BindToRenderStep("RENDER_CAMERA_TO_VIEWMODEL" , Enum.RenderPriority.Camera.Value + 1, function(dt: number)
		camera.CFrame = target:GetPivot()
		task.spawn(update)
	end)
end


function RenderManger.cleanup()
	rendering = false
	trove:Destroy()
end

return RenderManger
