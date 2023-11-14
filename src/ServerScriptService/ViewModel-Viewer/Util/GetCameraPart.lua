--!strict
local RENDER_TARGET_NAME = "Render_Target"
local CAMERA_PART_NAME = "CameraPart"

local function check(instance: Instance? , className: string)
	return instance ~= nil and instance:IsA(className)
end

local function GetRenderTarget(Parent: Instance): Instance?
	local renderTarget = Parent:FindFirstChild(RENDER_TARGET_NAME , true)
	if not check(renderTarget , "StringValue") then return end
	return renderTarget.Parent
end

local function GetRenderTargetObject(Parent: Instance): Instance?
	local renderTarget = Parent:FindFirstChild(RENDER_TARGET_NAME , true) :: ObjectValue
	if not check(renderTarget , "ObjectValue") then return end
	return renderTarget.Value
end

local function GetCameraPart(Parent: Instance): Instance?
	local renderTarget = Parent:FindFirstChild(CAMERA_PART_NAME , true)
	if not check(renderTarget , "BasePart") then return end
	return renderTarget
end

local function GetHumanoidRootPart(Parent: Instance): Instance?
	local renderTarget = Parent:FindFirstChild("HumanoidRootPart")
	if not check(renderTarget , "BasePart") then return end
	return renderTarget
end

return function(model: Model)
	local callbacks = {}
	callbacks[1] = GetRenderTargetObject
	callbacks[2] = GetCameraPart
	callbacks[3] = GetHumanoidRootPart
	
	local renderTarget = GetRenderTarget(model)
	
	while not renderTarget and #callbacks > 0  do
		local func = table.remove(callbacks , 1)
		if not func then break end
		renderTarget = func(model)
	end
	
	if not renderTarget then renderTarget = model.PrimaryPart end
	return renderTarget
end
