local editProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local parent = editProfileBackground.Parent
local reactModule = require(parent.React)
local image = require(parent.Foundation).Image
local useSelectedTheme = require(parent.RoactUtils).Hooks.useSelectedTheme
local constantsModule = require(editProfileBackground.Common.Constants)
local var1 = constantsModule.BACKGROUND_ASSET_IDS[1]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(0, 0, 0)
local color_2 = Color3.fromRGB(80, 80, 80)
local color_3 = Color3.fromRGB(30, 38, 58)
local color_4 = Color3.fromRGB(156, 178, 196)
local t = {
	[constantsModule.BACKGROUND_ASSET_IDS[2]] = Color3.fromRGB(255, 242, 216),
	[constantsModule.BACKGROUND_ASSET_IDS[3]] = Color3.fromRGB(254, 244, 194),
	[constantsModule.BACKGROUND_ASSET_IDS[4]] = Color3.fromRGB(238, 246, 216),
	[constantsModule.BACKGROUND_ASSET_IDS[5]] = Color3.fromRGB(214, 254, 202),
	[constantsModule.BACKGROUND_ASSET_IDS[6]] = Color3.fromRGB(192, 255, 226),
	[constantsModule.BACKGROUND_ASSET_IDS[7]] = Color3.fromRGB(208, 252, 255),
	[constantsModule.BACKGROUND_ASSET_IDS[8]] = Color3.fromRGB(238, 244, 255)
}

local function _(p1, p2)
	-- upvalues: var1 (ref), color_3 (ref), color_4 (ref), t (ref)
	return if p1 == var1 then if p2 == "dark" then color_3 else color_4 else t[p1]
end

return function(value)
	-- upvalues: useSelectedTheme (ref), reactModule (ref), var1 (ref), color_3 (ref), color_4 (ref), t (ref), color (ref), color_1 (ref), color_2 (ref), image (ref)
	local buttonSize = value.buttonSize
	local var2 = useSelectedTheme()
	local var3 = reactModule.useCallback(function()
		-- upvalues: value (ref)
		if value.selected then return end
		if value.onActivated then
			value.onActivated(value.profileBackgroundId)
		end
	end, {
		value.onActivated,
		value.selected,
		value.profileBackgroundId
	})
	local floored = math.floor(buttonSize * 0.4)
	local profileBackgroundId = value.profileBackgroundId
	
	return reactModule.createElement("ImageButton", {
		Size = UDim2.new(0, buttonSize, 0, buttonSize),
		BackgroundTransparency = 0,
		BackgroundColor3 = if profileBackgroundId == var1 then if var2 == "dark" then color_3 else color_4 else t[profileBackgroundId],
		BorderSizePixel = if value.selected then 3 else 0,
		BorderColor3 = if value.selected then color else color_1,
		LayoutOrder = value.LayoutOrder,
		[reactModule.Event.Activated] = var3
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		Overlay = value.selected and reactModule.createElement("Frame", {
			BackgroundTransparency = 0.5,
			ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = color_2,
			Size = UDim2.fromScale(0.8, 0.8)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		}) or nil,
		Checkmark = value.selected and reactModule.createElement(image, {
			tag = "position-center-center anchor-center-center",
			Image = "rbxassetid://6031094667",
			ZIndex = 3,
			Size = UDim2.fromOffset(floored, floored)
		}) or nil
	})
end