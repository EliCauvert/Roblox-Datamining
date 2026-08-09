local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local background2026 = require(authCommon.Common.AuthBackgroundConstants).Background2026

local function renderScrim(p0) --[[ line: 43 ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("ImageLabel", {
		ZIndex = 2,
		BorderSizePixel = 0,
		Image = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = p0
	})
end

local function renderImage(p1) --[[ line: 56 ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Image, {
		BorderSizePixel = 0,
		Image = p1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ScaleType = Enum.ScaleType.Crop
	})
end

return function(value) --[[ line: 67 | named "AuthBackgroundContainer" ]]
	-- upvalues: background2026 (ref), reactModule (ref), renderImage (ref), renderScrim (ref)
	local var5 = value.showImage ~= nil or value.showImage
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = if var5 then 1 else 0,
		BackgroundColor3 = value.fallbackBackgroundColor
	}, {
		Background = if var5 then renderImage(background2026.IMAGE) else nil,
		Scrim = if var5 and background2026.SCRIM_TRANSPARENCY < 1 then renderScrim(background2026.SCRIM_TRANSPARENCY) else nil
	})
end