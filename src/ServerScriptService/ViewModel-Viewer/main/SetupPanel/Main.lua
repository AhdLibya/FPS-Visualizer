return function (mainGui)
	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	Main.BackgroundTransparency = 0.5
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.fromScale(0.212, 0.775)
	Main.Size = UDim2.fromScale(0.324, 0.323)

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Name = "UIStroke"
	UIStroke.Color = Color3.fromRGB(68, 68, 68)
	UIStroke.Thickness = 3
	UIStroke.Parent = Main

	local Header = Instance.new("Frame")
	do
		Header.Name = "Header"
		Header.AnchorPoint = Vector2.new(0.5, 0)
		Header.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Header.BorderColor3 = Color3.fromRGB(63, 63, 63)
		Header.BorderSizePixel = 2
		Header.Position = UDim2.fromScale(0.5, -1.92e-07)
		Header.Size = UDim2.fromScale(1, 0.1)

		local Close = Instance.new("TextButton")
		Close.Name = "Close"
		Close.FontFace = Font.new(
			"rbxasset://fonts/families/GothamSSm.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Close.Text = "X"
		Close.TextColor3 = Color3.fromRGB(255, 255, 255)
		Close.TextScaled = true
		Close.TextSize = 14
		Close.TextWrapped = true
		Close.AutoButtonColor = false
		Close.AnchorPoint = Vector2.new(1, 0.5)
		Close.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Close.BorderSizePixel = 0
		Close.Position = UDim2.fromScale(1, 0.5)
		Close.Size = UDim2.fromScale(0.1, 0.99)

		local UICorner = Instance.new("UICorner")
		UICorner.Name = "UICorner"
		UICorner.CornerRadius = UDim.new(0.1, 0)
		UICorner.Parent = Close

		Close.Parent = Header

		local Tilte = Instance.new("TextLabel")
		Tilte.Name = "Tilte"
		Tilte.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Tilte.Text = "Viewer Setup Panel"
		Tilte.TextColor3 = Color3.fromRGB(255, 255, 255)
		Tilte.TextScaled = true
		Tilte.TextSize = 14
		Tilte.TextWrapped = true
		Tilte.Active = true
		Tilte.AnchorPoint = Vector2.new(0, 0.5)
		Tilte.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Tilte.BackgroundTransparency = 1
		Tilte.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tilte.BorderSizePixel = 0
		Tilte.Position = UDim2.fromScale(0, 0.5)
		Tilte.Selectable = true
		Tilte.Size = UDim2.fromScale(0.5, 0.99)

		local UICorner1 = Instance.new("UICorner")
		UICorner1.Name = "UICorner"
		UICorner1.CornerRadius = UDim.new(0.1, 0)
		UICorner1.Parent = Tilte

		Tilte.Parent = Header

		local DragPoint = Instance.new("Frame")
		DragPoint.Name = "DragPoint"
		DragPoint.Active = true
		DragPoint.AnchorPoint = Vector2.new(0.5, 0.5)
		DragPoint.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		DragPoint.BackgroundTransparency = 1
		DragPoint.BorderColor3 = Color3.fromRGB(0, 0, 0)
		DragPoint.BorderSizePixel = 0
		DragPoint.Position = UDim2.fromScale(0.446, 0.5)
		DragPoint.Selectable = true
		DragPoint.Size = UDim2.fromScale(0.879, 0.99)
		DragPoint.Parent = Header

		Header.Parent = Main
	end

	local Alert = Instance.new("Frame")
	do
		Alert.Name = "Alert"
		Alert.AnchorPoint = Vector2.new(1, 0)
		Alert.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Alert.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Alert.BorderSizePixel = 0
		Alert.Position = UDim2.fromScale(1.52, 0)
		Alert.Size = UDim2.fromScale(0.5, 0.5)
		Alert.Visible = false

		local Label = Instance.new("TextLabel")
		Label.Name = "Label"
		Label.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Label.Text = "Alert"
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextScaled = true
		Label.TextSize = 14
		Label.TextWrapped = true
		Label.AnchorPoint = Vector2.new(0.5, 0)
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1
		Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Label.BorderSizePixel = 0
		Label.Position = UDim2.fromScale(0.5, 0)
		Label.Size = UDim2.fromScale(0.8, 0.15)
		Label.Parent = Alert

		local Ok = Instance.new("TextButton")
		Ok.Name = "Ok"
		Ok.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Ok.Text = "Continue"
		Ok.TextColor3 = Color3.fromRGB(255, 255, 255)
		Ok.TextScaled = true
		Ok.TextSize = 14
		Ok.TextWrapped = true
		Ok.AnchorPoint = Vector2.new(0, 1)
		Ok.BackgroundColor3 = Color3.fromRGB(243, 8, 8)
		Ok.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Ok.BorderSizePixel = 0
		Ok.Position = UDim2.fromScale(0.05, 1)
		Ok.Size = UDim2.fromScale(0.4, 0.2)

		local UICorner = Instance.new("UICorner")
		UICorner.Name = "UICorner"
		UICorner.CornerRadius = UDim.new(0.1, 0)
		UICorner.Parent = Ok

		local UIStroke = Instance.new("UIStroke")
		UIStroke.Name = "UIStroke"
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Parent = Ok

		Ok.Parent = Alert

		local UIStroke1 = Instance.new("UIStroke")
		UIStroke1.Name = "UIStroke"
		UIStroke1.Color = Color3.fromRGB(54, 54, 54)
		UIStroke1.Thickness = 3
		UIStroke1.Parent = Alert

		local Cancel = Instance.new("TextButton")
		Cancel.Name = "Cancel"
		Cancel.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Cancel.Text = "Cancel"
		Cancel.TextColor3 = Color3.fromRGB(255, 255, 255)
		Cancel.TextScaled = true
		Cancel.TextSize = 14
		Cancel.TextWrapped = true
		Cancel.AnchorPoint = Vector2.new(1, 1)
		Cancel.BackgroundColor3 = Color3.fromRGB(0, 191, 255)
		Cancel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Cancel.BorderSizePixel = 0
		Cancel.Position = UDim2.fromScale(0.95, 1)
		Cancel.Size = UDim2.fromScale(0.4, 0.2)

		local UICorner1 = Instance.new("UICorner")
		UICorner1.Name = "UICorner"
		UICorner1.CornerRadius = UDim.new(0.1, 0)
		UICorner1.Parent = Cancel

		local UIStroke2 = Instance.new("UIStroke")
		UIStroke2.Name = "UIStroke"
		UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke2.Parent = Cancel

		Cancel.Parent = Alert

		local Note = Instance.new("TextLabel")
		Note.Name = "Note"
		Note.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Note.Text = " Removing this framework will delete the 'core' folder and its contents. Proceed with caution. Delete framework?"
		Note.TextColor3 = Color3.fromRGB(255, 255, 255)
		Note.TextScaled = true
		Note.TextSize = 14
		Note.TextWrapped = true
		Note.AnchorPoint = Vector2.new(0.5, 0.5)
		Note.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Note.BackgroundTransparency = 1
		Note.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Note.BorderSizePixel = 0
		Note.Position = UDim2.fromScale(0.5, 0.45)
		Note.Size = UDim2.fromScale(1, 0.5)
		Note.Parent = Alert

		Alert.Parent = Main
	end

	local Body = Instance.new("Frame")
	Body.Name = "Body"
	Body.AnchorPoint = Vector2.new(0.5, 1)
	Body.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	Body.BackgroundTransparency = 0.5
	Body.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Body.BorderSizePixel = 0
	Body.Position = UDim2.fromScale(0.5, 1)
	Body.Size = UDim2.fromScale(1, 0.9)

	local Action = Instance.new("Frame")
	do
		Action.Name = "Action"
		Action.AnchorPoint = Vector2.new(0, 0.5)
		Action.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Action.BorderColor3 = Color3.fromRGB(63, 63, 63)
		Action.BorderSizePixel = 2
		Action.Position = UDim2.fromScale(-1.48e-08, 0.5)
		Action.Size = UDim2.fromScale(0.286, 0.992)

		local Use = Instance.new("TextButton")
		Use.Name = "Use"
		Use.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Use.Text = "Attach"
		Use.TextColor3 = Color3.fromRGB(255, 255, 255)
		Use.TextScaled = true
		Use.TextSize = 65
		Use.TextWrapped = true
		Use.BackgroundColor3 = Color3.fromRGB(0, 191, 255)
		Use.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Use.BorderSizePixel = 0
		Use.Position = UDim2.fromScale(0.0196, 0.205)
		Use.Size = UDim2.fromOffset(105, 24)

		local UICorner = Instance.new("UICorner")
		UICorner.Name = "UICorner"
		UICorner.CornerRadius = UDim.new(0.1, 0)
		UICorner.Parent = Use

		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		UIAspectRatioConstraint.Name = "UIAspectRatioConstraint"
		UIAspectRatioConstraint.AspectRatio = 4.25
		UIAspectRatioConstraint.Parent = Use

		local UIStroke = Instance.new("UIStroke")
		UIStroke.Name = "UIStroke"
		UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke.Parent = Use

		Use.Parent = Action

		--local Remove = Instance.new("TextButton")
		--Remove.Name = "Remove"
		--Remove.FontFace = Font.new(
		--	"rbxasset://fonts/families/Inconsolata.json",
		--	Enum.FontWeight.Bold,
		--	Enum.FontStyle.Normal
		--)
		--Remove.Text = "Detach"
		--Remove.TextColor3 = Color3.fromRGB(255, 255, 255)
		--Remove.TextScaled = true
		--Remove.TextSize = 65
		--Remove.TextWrapped = true
		--Remove.BackgroundColor3 = Color3.fromRGB(0, 191, 255)
		--Remove.BorderColor3 = Color3.fromRGB(0, 0, 0)
		--Remove.BorderSizePixel = 0
		--Remove.Position = UDim2.fromScale(0.0196, 0.605)
		--Remove.Size = UDim2.fromOffset(105, 24)
		
		--local UICorner1 = Instance.new("UICorner")
		--UICorner1.Name = "UICorner"
		--UICorner1.CornerRadius = UDim.new(0.1, 0)
		--UICorner1.Parent = Remove

		--local UIAspectRatioConstraint1 = Instance.new("UIAspectRatioConstraint")
		--UIAspectRatioConstraint1.Name = "UIAspectRatioConstraint"
		--UIAspectRatioConstraint1.AspectRatio = 4.25
		--UIAspectRatioConstraint1.Parent = Remove

		--local UIStroke1 = Instance.new("UIStroke")
		--UIStroke1.Name = "UIStroke"
		--UIStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		--UIStroke1.Parent = Remove

		--Remove.Parent = Action

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Name = "UIListLayout"
		UIListLayout.Padding = UDim.new(0.2, 0)
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.Parent = Action

		local Terminate = Instance.new("TextButton")

		Terminate.Name = "Terminate"
		Terminate.FontFace = Font.new(
			"rbxasset://fonts/families/Inconsolata.json",
			Enum.FontWeight.Bold,
			Enum.FontStyle.Normal
		)
		Terminate.Text = "Terminate"
		Terminate.TextColor3 = Color3.fromRGB(255, 255, 255)
		Terminate.TextScaled = true
		Terminate.TextSize = 65
		Terminate.TextWrapped = true
		Terminate.BackgroundColor3 = Color3.fromRGB(243, 8, 8)
		Terminate.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Terminate.BorderSizePixel = 0
		Terminate.Position = UDim2.fromScale(0.0196, 0.605)
		Terminate.Size = UDim2.fromOffset(105, 24)


		local UICorner2 = Instance.new("UICorner")
		UICorner2.Name = "UICorner"
		UICorner2.CornerRadius = UDim.new(0.1, 0)
		UICorner2.Parent = Terminate

		local UIAspectRatioConstraint2 = Instance.new("UIAspectRatioConstraint")
		UIAspectRatioConstraint2.Name = "UIAspectRatioConstraint"
		UIAspectRatioConstraint2.AspectRatio = 4.25
		UIAspectRatioConstraint2.Parent = Terminate

		local UIStroke2 = Instance.new("UIStroke")
		UIStroke2.Name = "UIStroke"
		UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		UIStroke2.Parent = Terminate

		Terminate.Parent = Action

		Action.Parent = Body
	end

	local Explorer = Instance.new("ScrollingFrame")
	do
		Explorer.Name = "Explorer"
		Explorer.AutomaticCanvasSize = Enum.AutomaticSize.XY
		Explorer.CanvasSize = UDim2.fromScale(0, 0.9)
		Explorer.ScrollBarThickness = 3
		Explorer.AnchorPoint = Vector2.new(1, 0.5)
		Explorer.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Explorer.BorderColor3 = Color3.fromRGB(63, 63, 63)
		Explorer.BorderSizePixel = 2
		Explorer.Position = UDim2.fromScale(1, 0.5)
		Explorer.Selectable = false
		Explorer.Size = UDim2.fromScale(0.714, 0.992)
		Explorer.SelectionGroup = false

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Name = "UIListLayout"
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Parent = Explorer

		local UIPadding = Instance.new("UIPadding")
		UIPadding.Name = "UIPadding"
		UIPadding.PaddingLeft = UDim.new(0, 4)
		UIPadding.PaddingRight = UDim.new(0, 4)
		UIPadding.Parent = Explorer
		Explorer.Parent = Body
	end
	Body.Parent = Main
	Main.Parent = mainGui
	return Main
end