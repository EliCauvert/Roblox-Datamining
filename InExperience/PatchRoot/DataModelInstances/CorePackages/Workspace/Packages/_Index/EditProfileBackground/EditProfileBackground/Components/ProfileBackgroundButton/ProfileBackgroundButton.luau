local EditProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local Parent = EditProfileBackground.Parent
local ReactModule = require(Parent.React)
local Image = require(Parent.Foundation).Image
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local ConstantsModule = require(EditProfileBackground.Common.Constants)
local BACKGROUNDASSETID = ConstantsModule.BACKGROUND_ASSET_IDS[1]
local _Color3 = Color3.fromRGB(255, 255, 255)
local _Color3_1 = Color3.fromRGB(0, 0, 0)
local _Color3_2 = Color3.fromRGB(80, 80, 80)
local _Color3_3 = Color3.fromRGB(30, 38, 58)
local _Color3_4 = Color3.fromRGB(156, 178, 196)
local config = {
	[ConstantsModule.BACKGROUND_ASSET_IDS[2]] = Color3.fromRGB(255, 242, 216),
	[ConstantsModule.BACKGROUND_ASSET_IDS[3]] = Color3.fromRGB(254, 244, 194),
	[ConstantsModule.BACKGROUND_ASSET_IDS[4]] = Color3.fromRGB(238, 246, 216),
	[ConstantsModule.BACKGROUND_ASSET_IDS[5]] = Color3.fromRGB(214, 254, 202),
	[ConstantsModule.BACKGROUND_ASSET_IDS[6]] = Color3.fromRGB(192, 255, 226),
	[ConstantsModule.BACKGROUND_ASSET_IDS[7]] = Color3.fromRGB(208, 252, 255),
	[ConstantsModule.BACKGROUND_ASSET_IDS[8]] = Color3.fromRGB(238, 244, 255)
}

local function _(BACKGROUNDASSETID1, p1) --[[ Line: 38 | Named "getButtonColor" ]]
	-- upvalues: BACKGROUNDASSETID (copy), _Color3_3 (copy), _Color3_4 (copy), config (copy)
	return if BACKGROUNDASSETID1 == BACKGROUNDASSETID then if p1 == "dark" then _Color3_3 else _Color3_4 else config[BACKGROUNDASSETID1]
end

return function(Frame) --[[ Line: 53 | Named "ProfileBackgroundButton" ]]
	-- upvalues: UseSelectedThemeFunction (copy), ReactModule (copy), BACKGROUNDASSETID (copy), _Color3_3 (copy), _Color3_4 (copy), config (copy), _Color3 (copy), _Color3_1 (copy), _Color3_2 (copy), Image (copy)
	local ButtonSize: number = Frame.buttonSize
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local Floored = math.floor(ButtonSize * 0.4)
	local ProfileBackgroundId = Frame.profileBackgroundId
	
	return ReactModule.createElement("ImageButton", {
		Size = UDim2.new(0, ButtonSize, 0, ButtonSize),
		BackgroundTransparency = 0,
		BackgroundColor3 = if ProfileBackgroundId == BACKGROUNDASSETID then if UseSelectedThemeResult == "dark" then _Color3_3 else _Color3_4 else config[ProfileBackgroundId],
		BorderSizePixel = if Frame.selected then 3 else 0,
		BorderColor3 = if Frame.selected then _Color3 else _Color3_1,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Event.Activated] = ReactModule.useCallback(function() --[[ Line: 57 ]]
			-- upvalues: Frame (copy)
			if Frame.selected then return end
			if Frame.onActivated then
				Frame.onActivated(Frame.profileBackgroundId)
			end
		end, {
			Frame.onActivated,
			Frame.selected,
			Frame.profileBackgroundId
		})
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Overlay = Frame.selected and ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.5,
			ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = _Color3_2,
			Size = UDim2.fromScale(0.8, 0.8)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) or nil,
		Checkmark = Frame.selected and ReactModule.createElement(Image, {
			tag = "position-center-center anchor-center-center",
			Image = "rbxassetid://6031094667",
			ZIndex = 3,
			Size = UDim2.fromOffset(Floored, Floored)
		}) or nil
	})
end