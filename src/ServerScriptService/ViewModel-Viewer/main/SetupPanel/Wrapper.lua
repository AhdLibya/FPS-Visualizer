------------------------
local TweenService		= game:GetService("TweenService")
local UserInputService	= game:GetService("UserInputService")

--------------------
local Viewer        = script.Parent.Parent.Parent
local Dependencies  = Viewer.Dependencies
local Utiles        = Viewer.Util
local Theme         = settings().Studio.Theme

----------------
local Types     = require(Viewer.Types)
local Trove     = require(Dependencies.Trove)
local Signal    = require(Dependencies.Signal)
local GetItem   = require(script.Parent.GetItem)
local Loger     = require(Utiles.Loger)

----------------------------
local SELECTED	            = "Selected"
local NORMAL_COLOR          = Color3.fromRGB(37,37,37)
local CLOSE_HOVER_COLOR     = Color3.fromRGB(170, 0, 0)

local function isAnimatable(instance: Instance)
	return 
		instance:IsA("Model")
		and (instance:FindFirstChildOfClass("Humanoid") 
			or instance:FindFirstChildOfClass("AnimationController"))
end


return function (setupPanel: Types._setupPanel)
	--class
	local this         = {}
	-- store
	local itemsIndexer = {}
	
	this._trove             = Trove.new()
	this.InstanceAttached   = this._trove:Construct(Signal) :: Signal.Signal<...any>
	this.RemoveSignal       = this._trove:Construct(Signal) :: Signal.Signal<...any>
	this.TerminateSignal    = this._trove:Construct(Signal) :: Signal.Signal<...any>
	this.selected           = nil


	function this:init()
		local object = setupPanel._instance

		local function initItems(instance: Instance)
			if not isAnimatable(instance) then return end
			local item = this._trove:Add(GetItem(instance))
			itemsIndexer[instance] = item
			item.Parent = object.Body.Explorer
			
			this._trove:Connect(item.MouseEnter , function(x: number, y: number) 
				local isItemSelected = item:GetAttribute(SELECTED) ~= nil
				if isItemSelected then return end
				item.BackgroundColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.Item , Enum.StudioStyleGuideModifier.Hover)
			end)
			
			this._trove:Connect(item.MouseLeave , function(x: number, y: number) 
				local isItemSelected = item:GetAttribute(SELECTED) ~= nil
				if isItemSelected then return end
				item.BackgroundColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.Item, Enum.StudioStyleGuideModifier.Default)
			end)
			
			this._trove:Add(item.InputBegan:Connect(function(input: InputObject) 
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				if item:GetAttribute(SELECTED) then
					this:deselect(item)
				else
					this:select(item)
				end
			end))
		end

		for _ , instance in workspace:GetChildren() do
			task.spawn(initItems , instance)
		end
		this._trove:Add(workspace.DescendantAdded:Connect(initItems))
		this._trove:Add(workspace.DescendantRemoving:Connect(function(descendant: Instance) 
			if itemsIndexer[descendant] == nil then return end
			itemsIndexer[descendant]:Destroy()
			itemsIndexer[descendant] = nil
		end))
		local hoverInfo = TweenInfo.new(.15 , Enum.EasingStyle.Quad , Enum.EasingDirection.In)

		this._trove:Add(object.Header.Close.MouseEnter:Connect(function(x: number, y: number) 
			TweenService:Create(object.Header.Close , hoverInfo , {
				BackgroundColor3 = CLOSE_HOVER_COLOR;
			}):Play()
		end))

		this._trove:Add(object.Header.Close.MouseLeave:Connect(function(x: number, y: number) 
			TweenService:Create(object.Header.Close , hoverInfo , {
				BackgroundColor3 = NORMAL_COLOR;
			}):Play()
		end))

		this._trove:Add(object.Header.Close.MouseButton1Down:Connect(function()
			setupPanel:free()
		end))

		for _ , ActionButton : TextButton in object.Body.Action:GetChildren() do
			if not ActionButton:IsA("TextButton") then continue end
			ActionButton.MouseButton1Down:Connect(function(x: number, y: number)
				if ActionButton.Name == "Use" then
					this.InstanceAttached:Fire()
				elseif ActionButton.Name == "Terminate" then
					this.TerminateSignal:Fire()
				elseif ActionButton.Name == "Remove" then
					this.RemoveSignal:Fire()
				end
			end)
		end
		return self
	end

	function this:enableDrag()
		local object = setupPanel._instance
		local DragTaggle = false
		local StartPos : Vector3
		local FramePos : UDim2

		local inputEnded
		local inputChanged

		local function InputEnd(input : InputObject)
			if input.UserInputState ~= Enum.UserInputState.End then return end
			inputEnded:Disconnect()
			inputChanged:Disconnect()
			DragTaggle = false
		end

		local function InputChanged(input : InputObject)
			if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
			if not DragTaggle then return end
			local Distance = input.Position - StartPos
			local Position = UDim2.new( FramePos.X.Scale , FramePos.X.Offset +Distance.X , FramePos.Y.Scale , FramePos.Y.Offset + Distance.Y)
			object.Position = Position
		end

		local function InputBegan(input : InputObject)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			DragTaggle = true
			StartPos = input.Position
			FramePos = object.Position
			inputEnded = this._trove:Add(object.Header.DragPoint.InputEnded:Connect(InputEnd))
			inputChanged = this._trove:Add(UserInputService.InputChanged:Connect(InputChanged))
		end
		this._trove:Add(object.Header.DragPoint.InputBegan:Connect(InputBegan))
		return self
	end

	function this:select(item: Types.ExplorerItem)
		item:SetAttribute(SELECTED , true)
		local objectValue = item:WaitForChild("ref") :: ObjectValue
		local instance = objectValue.Value ::Model
		if not instance then
			Loger(`Internal Error Selection Value is nil`)
			return
		end
		if this.selected then
			this:deselect(this.selected)
		end
		this.selected = item
		item.BackgroundColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.Item, Enum.StudioStyleGuideModifier.Selected)
		item.NameTextLabel.TextColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Selected)
		if instance.PrimaryPart == nil then
			Loger("selected instance dose not have PrimaryPart")
		end
		setupPanel:setToViewport(instance)
		return self
	end

	function this:deselect(item: Types.ExplorerItem)
		item:SetAttribute(SELECTED , nil)
		item.BackgroundColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.Item, Enum.StudioStyleGuideModifier.Default)
		item.NameTextLabel.TextColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
		setupPanel:setToViewport(nil)
		return self
	end

	function this:instanceDeselect(instance: Instance)
		local item = itemsIndexer[instance]
		if not item then return end
		this:deselect(item)
	end

	function this:Alert(message: string , okCallBack:() -> ())
		local object = setupPanel._instance
		object.Alert.Visible = true
		object.Alert.Note.Text = message
		local active: RBXScriptConnection
		local cancel: RBXScriptConnection
		local didClean = false

		local function cleanup()
			if didClean then return end
			didClean = true
			object.Alert.Visible = false
			active:Disconnect()
			cancel:Disconnect()
		end

		cancel = this._trove:Add(object.Alert.Cancel.Activated:Connect(function()
			cleanup()
		end))

		active = this._trove:Add(object.Alert.Ok.Activated:Connect(function()
			okCallBack()
			cleanup()
		end))

		return cleanup
	end

	function this:cleanup()
		this._trove:Destroy()
		table.clear(this)
		table.clear(itemsIndexer)
	end
	return this
end
