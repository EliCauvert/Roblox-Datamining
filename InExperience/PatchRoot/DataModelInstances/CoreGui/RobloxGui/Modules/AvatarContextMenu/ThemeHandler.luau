local starterGuiService = game:GetService("StarterGui")
local t = {
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
local t_1 = {}
t_1.__index = t_1

function t_1:UpdateTheme(p1)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(t) do
		if typeof(p1[i]) == typeof(v) then
			t_1[i] = p1[i]
		elseif p1[i] == nil then
			t_1[i] = v
		else
			error(string.format("AvatarContextMenuTheme wrong type for key %s: %s. Expected type %s", i, typeof(p1[i]), typeof(v)), 2)
		end
	end
	self.Theme = t_1
end

function t_1.RegisterCoreMethods(p2)
	-- upvalues: t (ref), starterGuiService (ref)
	starterGuiService:RegisterSetCore("AvatarContextMenuTheme", function(value)
		-- upvalues: t (copy), p2 (ref)
		if type(value) ~= "table" then
			error("AvatarContextMenuTheme argument must be a table")
			
			return
		end
		for i in pairs(value) do
			if t[i] == nil then
				error(string.format("AvatarContextMenuTheme got invalid key: %s", i))
			end
		end
		p2:UpdateTheme(value)
	end)
end

function t_1:GetTheme()
	return self.Theme
end

function t_1.new()
	-- upvalues: t_1 (ref), t (ref)
	local tbl = setmetatable({}, t_1)
	tbl.Theme = t
	tbl:RegisterCoreMethods()
	
	return tbl
end

return t_1.new()