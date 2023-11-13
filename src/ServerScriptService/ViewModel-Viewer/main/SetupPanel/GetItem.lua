local StudioService = game:GetService("StudioService")
local Types 		= require(script.Parent.Parent.Parent.Types)
local Theme 		= settings().Studio.Theme

local function GetItem(instance: Instance)
	local Item = Instance.new("Frame")
	Item.Name = "Item"
	Item.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
	Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Item.BorderSizePixel = 0
	Item.Size = UDim2.fromScale(1, 0.1)

	local ImageData = StudioService:GetClassIcon(instance.ClassName) :: Types.ImageData
	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.Name = "ImageLabel"
	ImageLabel.Image = ImageData.Image
	ImageLabel.ImageRectSize = ImageData.ImageRectSize
	ImageLabel.ImageRectOffset = ImageData.ImageRectOffset
	ImageLabel.BackgroundColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.Item, Enum.StudioStyleGuideModifier.Selected)
	ImageLabel.BackgroundTransparency = 1
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.fromOffset(5, 4)
	ImageLabel.Size = UDim2.fromOffset(16, 16)
	ImageLabel.Parent = Item

	local NameTextLabel = Instance.new("TextLabel")
	NameTextLabel.Name = "NameTextLabel"
	NameTextLabel.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json")
	NameTextLabel.TextColor3 = Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default);
	NameTextLabel.TextSize = 14
	NameTextLabel.TextXAlignment = Enum.TextXAlignment.Left
	NameTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameTextLabel.BackgroundTransparency = 1
	NameTextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NameTextLabel.BorderSizePixel = 0
	NameTextLabel.Position = UDim2.fromOffset(28, 0)
	NameTextLabel.Size = UDim2.new(1, -48, 0, 24)
	NameTextLabel.Text = instance.Name
	NameTextLabel.Parent = Item

	local ref = Instance.new("ObjectValue")
	ref.Value = instance
	ref.Name = "ref"
	ref.Parent = Item

	return Item :: Types.ExplorerItem
end

return GetItem