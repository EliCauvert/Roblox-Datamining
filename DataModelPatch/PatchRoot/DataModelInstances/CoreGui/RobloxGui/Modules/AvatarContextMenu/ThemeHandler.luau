local StarterGui = game:GetService("StarterGui")
local Theme = {
	BackgroundImage = "rbxasset://textures/blackBkg_round.png",
	BackgroundImageTransparency = 0,
	BackgroundTransparency = 1,
	ButtonFrameTransparency = 0,
	ButtonImage = "",
	ButtonTransparency = 1,
	ButtonHoverTransparency = 0.5,
	TextScale = 1,
	LeaveMenuImage = "rbxasset://textures/loading/cancelButton.png",
	ScrollRightImage = "rbxasset://textures/ui/AvatarContextMenu_Arrow.png",
	ScrollLeftImage = "",
	AspectRatio = 1.15,
	BackgroundImageScaleType = Enum.ScaleType.Slice,
	BackgroundImageSliceCenter = Rect.new(12, 12, 12, 12),
	BackgroundColor = Color3.fromRGB(31, 31, 31),
	NameTagColor = Color3.fromRGB(79, 79, 79),
	NameUnderlineColor = Color3.fromRGB(255, 255, 255),
	ButtonFrameColor = Color3.fromRGB(79, 79, 79),
	ButtonImageScaleType = Enum.ScaleType.Slice,
	ButtonImageSliceCenter = Rect.new(8, 6, 46, 44),
	ButtonColor = Color3.fromRGB(79, 79, 79),
	ButtonHoverColor = Color3.fromRGB(163, 162, 165),
	ButtonUnderlineColor = Color3.fromRGB(137, 137, 137),
	Font = Enum.Font.SourceSansBold,
	TextColor = Color3.fromRGB(255, 255, 255),
	SelectedCharacterIndicator = game:GetService("InsertService"):LoadLocalAsset("rbxasset://models/AvatarContextMenu/AvatarContextArrow.rbxm"),
	Size = UDim2.new(0.95, 0, 0.9, 0),
	MinSize = Vector2.new(200, 200),
	MaxSize = Vector2.new(300, 300),
	AnchorPoint = Vector2.new(0.5, 1),
	OnScreenPosition = UDim2.new(0.5, 0, 0.98, 0),
	OffScreenPosition = UDim2.new(0.5, 0, 1, 300)
}
local Module = {}
Module.__index = Module

function Module:UpdateTheme(p1)
	-- upvalues: Theme (copy)
	local Theme1 = {}
	
	for i, value in pairs(Theme) do
		if typeof(p1[i]) == typeof(value) then
			Theme1[i] = p1[i]
		elseif p1[i] == nil then
			Theme1[i] = value
		else
			error(string.format("AvatarContextMenuTheme wrong type for key %s: %s. Expected type %s", i, typeof(p1[i]), (typeof(value))), 2)
		end
	end
	self.Theme = Theme1
end

function Module.RegisterCoreMethods(p2)
	-- upvalues: Theme (copy), StarterGui (copy)
	StarterGui:RegisterSetCore("AvatarContextMenuTheme", function(List)
		-- upvalues: Theme (upval), p2 (copy)
		if type(List) ~= "table" then
			error("AvatarContextMenuTheme argument must be a table")
			
			return
		end
		for i in pairs(List) do
			if Theme[i] == nil then
				error(string.format("AvatarContextMenuTheme got invalid key: %s", i))
			end
		end
		p2:UpdateTheme(List)
	end)
end

function Module:GetTheme()
	return self.Theme
end

function Module.new()
	-- upvalues: Module (copy), Theme (copy)
	local self = setmetatable({}, Module)
	self.Theme = Theme
	self:RegisterCoreMethods()
	
	return self
end

return Module.new()