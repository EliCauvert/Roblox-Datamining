local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Background2026 = require(AuthCommon.Common.AuthBackgroundConstants).Background2026

local function renderScrim(BackgroundTransparency) --[[ Line: 44 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("ImageLabel", {
		ZIndex = 2,
		BorderSizePixel = 0,
		Image = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = BackgroundTransparency
	})
end

local function renderImage(Image) --[[ Line: 57 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Image, {
		BorderSizePixel = 0,
		Image = Image,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ScaleType = Enum.ScaleType.Crop
	})
end

local function renderGradientFrame(BackgroundColor3, YScale, ZIndex, NumberSequence1) --[[ Line: 68 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = ZIndex,
		Size = UDim2.fromScale(1, YScale),
		BackgroundColor3 = BackgroundColor3
	}, {
		Gradient = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence1 })
	})
end

local function renderMobileFade(Image, BackgroundColor) --[[ Line: 82 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), renderGradientFrame (copy)
	return {
		Media = ReactModule.createElement(FoundationModule.Image, {
			BorderSizePixel = 0,
			Image = Image,
			Size = UDim2.fromScale(1, 0.8870657276995305),
			ScaleType = Enum.ScaleType.Crop,
			imageStyle = { Transparency = 0.2, Color3 = Color3.new(1, 1, 1) },
			backgroundStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) }
		}),
		BottomShadow = renderGradientFrame(BackgroundColor, 0.931924882629108, 2, NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.2418, 1),
			NumberSequenceKeypoint.new(0.8588, 0),
			NumberSequenceKeypoint.new(1, 0)
		})),
		NavCover = renderGradientFrame(Color3.new(0, 0, 0), 0.318075117370892, 3, NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.3),
			NumberSequenceKeypoint.new(0.2447, 0.3),
			NumberSequenceKeypoint.new(1, 0.817)
		}))
	}
end

return function(p1) --[[ Line: 116 | Named "AuthBackgroundContainer" ]]
	-- upvalues: Background2026 (copy), ReactModule (copy), renderMobileFade (copy), renderImage (copy), renderScrim (copy)
	local IsSCRIMTRANSPARENCYBelow = Background2026.SCRIM_TRANSPARENCY < 1
	local NoShowImage = p1.showImage == nil or p1.showImage
	local MobileFadeColor = if NoShowImage then p1.mobileFadeColor else nil
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = if NoShowImage and not MobileFadeColor then 1 else 0,
		BackgroundColor3 = MobileFadeColor or p1.fallbackBackgroundColor
	}, if MobileFadeColor then renderMobileFade(Background2026.IMAGE, MobileFadeColor) else {
		Background = if NoShowImage then renderImage(Background2026.IMAGE) else nil,
		Scrim = if NoShowImage and IsSCRIMTRANSPARENCYBelow then renderScrim(Background2026.SCRIM_TRANSPARENCY) else nil
	})
end