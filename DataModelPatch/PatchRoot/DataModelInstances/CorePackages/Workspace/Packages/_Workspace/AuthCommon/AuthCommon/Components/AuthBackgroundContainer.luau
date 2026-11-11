local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Background2026 = require(AuthCommon.Common.AuthBackgroundConstants).Background2026

local function renderScrim(BackgroundTransparency)
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

local function renderImage(Image)
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

return function(p1)
	-- upvalues: Background2026 (copy), ReactModule (copy), renderImage (copy), renderScrim (copy)
	local IsSCRIMTRANSPARENCYBelow = Background2026.SCRIM_TRANSPARENCY < 1
	local NoShowImage = p1.showImage == nil or p1.showImage
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = if NoShowImage then 1 else 0,
		BackgroundColor3 = p1.fallbackBackgroundColor
	}, {
		Background = if NoShowImage then renderImage(Background2026.IMAGE) else nil,
		Scrim = if NoShowImage and IsSCRIMTRANSPARENCYBelow then renderScrim(Background2026.SCRIM_TRANSPARENCY) else nil
	})
end