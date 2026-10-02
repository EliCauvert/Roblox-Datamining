local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local background2026 = require(authCommon.Common.AuthBackgroundConstants).Background2026

local function renderScrim(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("ImageLabel", {
		ZIndex = 2,
		BorderSizePixel = 0,
		Image = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = p1
	})
end

local function renderImage(p1)
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

local function renderGradientFrame(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = p3,
		Size = UDim2.fromScale(1, p2),
		BackgroundColor3 = p1
	}, {
		Gradient = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = p4 })
	})
end

local function renderMobileFade(p1, p2)
	-- upvalues: reactModule (ref), foundationModule (ref), renderGradientFrame (ref)
	return {
		Media = reactModule.createElement(foundationModule.Image, {
			BorderSizePixel = 0,
			Image = p1,
			Size = UDim2.fromScale(1, 0.8870657277),
			ScaleType = Enum.ScaleType.Crop,
			imageStyle = { Transparency = 0.2, Color3 = Color3.new(1, 1, 1) },
			backgroundStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) }
		}),
		BottomShadow = renderGradientFrame(p2, 0.931924882629, 2, NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.2418, 1),
			NumberSequenceKeypoint.new(0.8588, 0),
			NumberSequenceKeypoint.new(1, 0)
		})),
		NavCover = renderGradientFrame(Color3.new(0, 0, 0), 0.318075117371, 3, NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.3),
			NumberSequenceKeypoint.new(0.2447, 0.3),
			NumberSequenceKeypoint.new(1, 0.817)
		}))
	}
end

return function(value)
	-- upvalues: background2026 (ref), reactModule (ref), renderMobileFade (ref), renderImage (ref), renderScrim (ref)
	local var1 = background2026.SCRIM_TRANSPARENCY < 1
	local var2 = value.showImage ~= nil or value.showImage
	local var3 = if var2 then value.mobileFadeColor else nil
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = if var2 and not var3 then 1 else 0,
		BackgroundColor3 = var3 or value.fallbackBackgroundColor
	}, if var3 then renderMobileFade(background2026.IMAGE, var3) else {
		Background = if var2 then renderImage(background2026.IMAGE) else nil,
		Scrim = if var2 and var1 then renderScrim(background2026.SCRIM_TRANSPARENCY) else nil
	})
end