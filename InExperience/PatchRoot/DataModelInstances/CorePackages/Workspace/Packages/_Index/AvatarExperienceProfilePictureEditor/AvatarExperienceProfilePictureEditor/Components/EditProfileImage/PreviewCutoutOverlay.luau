local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function _(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = p1.size,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		BackgroundColor3 = p1.color,
		BackgroundTransparency = p1.transparency
	})
end

local function buildCompositionGridChildren(XOffset, Color, Transparency)
	-- upvalues: ReactModule (copy)
	local _Vector2 = Vector2.new(0.5, 0)
	local _Vector2_1 = Vector2.new(0, 0.5)
	local _UDim2 = UDim2.new(0, XOffset, 1, 0)
	local _UDim2_1 = UDim2.new(1, 0, 0, XOffset)
	local config = {
		size = _UDim2,
		position = UDim2.fromScale(0.3333333333333333, 0),
		anchorPoint = _Vector2,
		color = Color,
		transparency = Transparency
	}
	local Frame = ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = config.size,
		Position = config.position,
		AnchorPoint = config.anchorPoint,
		BackgroundColor3 = config.color,
		BackgroundTransparency = config.transparency
	})
	local config1 = {
		size = _UDim2,
		position = UDim2.fromScale(0.6666666666666666, 0),
		anchorPoint = _Vector2,
		color = Color,
		transparency = Transparency
	}
	local Frame1 = ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = config1.size,
		Position = config1.position,
		AnchorPoint = config1.anchorPoint,
		BackgroundColor3 = config1.color,
		BackgroundTransparency = config1.transparency
	})
	local config2 = {
		size = _UDim2_1,
		position = UDim2.fromScale(0, 0.3333333333333333),
		anchorPoint = _Vector2_1,
		color = Color,
		transparency = Transparency
	}
	local Frame2 = ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = config2.size,
		Position = config2.position,
		AnchorPoint = config2.anchorPoint,
		BackgroundColor3 = config2.color,
		BackgroundTransparency = config2.transparency
	})
	local config3 = {
		size = _UDim2_1,
		position = UDim2.fromScale(0, 0.6666666666666666),
		anchorPoint = _Vector2_1,
		color = Color,
		transparency = Transparency
	}
	
	return {
		VerticalLine1 = Frame,
		VerticalLine2 = Frame1,
		HorizontalLine1 = Frame2,
		HorizontalLine2 = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			Size = config3.size,
			Position = config3.position,
			AnchorPoint = config3.anchorPoint,
			BackgroundColor3 = config3.color,
			BackgroundTransparency = config3.transparency
		})
	}
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ConstantsModule (copy), ReactModule (copy), buildCompositionGridChildren (copy)
	local UseTokensResult = UseTokensFunction()
	local Largest = math.max(0, (math.floor((p1.width - p1.cutoutSize) / 2 + 0.5)))
	local OverMedia100 = UseTokensResult.Color.OverMedia.OverMedia_100
	local OverMediaColor3 = OverMedia100.Color3
	local Transparency = OverMedia100.Transparency or 0.35
	local Emphasis = UseTokensResult.Color.Stroke.Emphasis
	local EmphasisColor3 = Emphasis.Color3
	local Transparency1 = Emphasis.Transparency or 0.84
	local Largest1 = math.max(1, (math.floor(UseTokensResult.Stroke.Standard + 0.5)))
	local Floored = math.floor(p1.cutoutSize * ConstantsModule.CircleCutoutHoleDiameterFraction + 0.5)
	local Largest2 = math.max(0, (math.floor((p1.cutoutSize - Floored) / 2 + 0.5)))
	local NewLargest = Largest + p1.cutoutSize * 0.5
	local NewCutoutTopOffset = p1.cutoutTopOffset + p1.cutoutSize * 0.5
	local Largest3 = math.max(1, Floored - Largest1)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		DimTop = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, p1.cutoutTopOffset),
			BackgroundColor3 = OverMediaColor3,
			BackgroundTransparency = Transparency
		}),
		DimLeft = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(Largest, p1.cutoutSize),
			Position = UDim2.fromOffset(0, p1.cutoutTopOffset),
			BackgroundColor3 = OverMediaColor3,
			BackgroundTransparency = Transparency
		}),
		DimRight = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(Largest, p1.cutoutSize),
			Position = UDim2.fromOffset(Largest + p1.cutoutSize, p1.cutoutTopOffset),
			BackgroundColor3 = OverMediaColor3,
			BackgroundTransparency = Transparency
		}),
		DimBottom = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, (math.max(0, p1.height - p1.cutoutTopOffset - p1.cutoutSize))),
			Position = UDim2.fromOffset(0, p1.cutoutTopOffset + p1.cutoutSize),
			BackgroundColor3 = OverMediaColor3,
			BackgroundTransparency = Transparency
		}),
		CompositionGrid = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(Floored, Floored),
			Position = UDim2.fromOffset(Largest + Largest2, p1.cutoutTopOffset + Largest2)
		}, (buildCompositionGridChildren(Largest1, EmphasisColor3, Transparency1))),
		Cutout = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 3,
			Image = ConstantsModule.CircleCutoutAsset,
			ImageColor3 = OverMediaColor3,
			ImageTransparency = Transparency,
			Size = UDim2.fromOffset(p1.cutoutSize, p1.cutoutSize),
			Position = UDim2.fromOffset(Largest, p1.cutoutTopOffset)
		}),
		CutoutBorder = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 4,
			Size = UDim2.fromOffset(Largest3, Largest3),
			Position = UDim2.fromOffset(NewLargest, NewCutoutTopOffset),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			UIStroke = ReactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = EmphasisColor3,
				Transparency = Transparency1,
				Thickness = Largest1
			})
		}),
		ProfileFrame = if p1.frameImage then ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 5,
			Image = p1.frameImage,
			Size = UDim2.fromOffset(Floored, Floored),
			Position = UDim2.fromOffset(NewLargest, NewCutoutTopOffset),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ScaleType = Enum.ScaleType.Fit
		}) else nil
	})
end