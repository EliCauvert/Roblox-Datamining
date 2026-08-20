local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local useTokens = require(parent.Foundation).Hooks.useTokens

local function _(p0) --[[ line: 22 | named "createCompositionGridLine" ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = p0.size,
		Position = p0.position,
		AnchorPoint = p0.anchorPoint,
		BackgroundColor3 = p0.color,
		BackgroundTransparency = p0.transparency
	})
end

local function buildCompositionGridChildren(p1, p2, p3) --[[ line: 40 ]]
	-- upvalues: reactModule (ref)
	local vector2 = Vector2.new(0.5, 0)
	local vector2_1 = Vector2.new(0, 0.5)
	local uDim2 = UDim2.new(0, p1, 1, 0)
	local uDim2_1 = UDim2.new(1, 0, 0, p1)
	local t = {}
	local t_1 = {
		size = uDim2,
		position = UDim2.fromScale(0.333333333333, 0),
		anchorPoint = vector2,
		color = p2,
		transparency = p3
	}
	t.VerticalLine1 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_1.size,
		Position = t_1.position,
		AnchorPoint = t_1.anchorPoint,
		BackgroundColor3 = t_1.color,
		BackgroundTransparency = t_1.transparency
	})
	local t_2 = {
		size = uDim2,
		position = UDim2.fromScale(0.666666666667, 0),
		anchorPoint = vector2,
		color = p2,
		transparency = p3
	}
	t.VerticalLine2 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_2.size,
		Position = t_2.position,
		AnchorPoint = t_2.anchorPoint,
		BackgroundColor3 = t_2.color,
		BackgroundTransparency = t_2.transparency
	})
	local t_3 = {
		size = uDim2_1,
		position = UDim2.fromScale(0, 0.333333333333),
		anchorPoint = vector2_1,
		color = p2,
		transparency = p3
	}
	t.HorizontalLine1 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_3.size,
		Position = t_3.position,
		AnchorPoint = t_3.anchorPoint,
		BackgroundColor3 = t_3.color,
		BackgroundTransparency = t_3.transparency
	})
	local t_4 = {
		size = uDim2_1,
		position = UDim2.fromScale(0, 0.666666666667),
		anchorPoint = vector2_1,
		color = p2,
		transparency = p3
	}
	t.HorizontalLine2 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_4.size,
		Position = t_4.position,
		AnchorPoint = t_4.anchorPoint,
		BackgroundColor3 = t_4.color,
		BackgroundTransparency = t_4.transparency
	})
	
	return t
end

return function(p4) --[[ line: 81 | named "PreviewCutoutOverlay" ]]
	-- upvalues: useTokens (ref), constantsModule (ref), reactModule (ref), buildCompositionGridChildren (ref)
	local var13 = useTokens()
	local maxValue = math.max(0, math.floor((p4.width - p4.cutoutSize) / 2 + 0.5))
	local maxValue_1 = math.max(0, p4.height - p4.cutoutTopOffset - p4.cutoutSize)
	local overMedia100 = var13.Color.OverMedia.OverMedia_100
	local color3 = overMedia100.Color3
	local transparency = overMedia100.Transparency or 0.35
	local emphasis = var13.Color.Stroke.Emphasis
	local color3_1 = emphasis.Color3
	local transparency_1 = emphasis.Transparency or 0.84
	local maxValue_2 = math.max(1, math.floor(var13.Stroke.Standard + 0.5))
	local floored = math.floor(p4.cutoutSize * constantsModule.CircleCutoutHoleDiameterFraction + 0.5)
	local maxValue_3 = math.max(0, math.floor((p4.cutoutSize - floored) / 2 + 0.5))
	local var21 = maxValue + maxValue_3
	local var22 = p4.cutoutTopOffset + maxValue_3
	local var23 = maxValue + p4.cutoutSize * 0.5
	local var24 = p4.cutoutTopOffset + p4.cutoutSize * 0.5
	local maxValue_4 = math.max(1, floored - maxValue_2)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		DimTop = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, p4.cutoutTopOffset),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		DimLeft = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(maxValue, p4.cutoutSize),
			Position = UDim2.fromOffset(0, p4.cutoutTopOffset),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		DimRight = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(maxValue, p4.cutoutSize),
			Position = UDim2.fromOffset(maxValue + p4.cutoutSize, p4.cutoutTopOffset),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		DimBottom = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, maxValue_1),
			Position = UDim2.fromOffset(0, p4.cutoutTopOffset + p4.cutoutSize),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		CompositionGrid = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(floored, floored),
			Position = UDim2.fromOffset(var21, var22)
		}, buildCompositionGridChildren(maxValue_2, color3_1, transparency_1)),
		Cutout = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 3,
			Image = constantsModule.CircleCutoutAsset,
			ImageColor3 = color3,
			ImageTransparency = transparency,
			Size = UDim2.fromOffset(p4.cutoutSize, p4.cutoutSize),
			Position = UDim2.fromOffset(maxValue, p4.cutoutTopOffset)
		}),
		CutoutBorder = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 4,
			Size = UDim2.fromOffset(maxValue_4, maxValue_4),
			Position = UDim2.fromOffset(var23, var24),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			UIStroke = reactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = color3_1,
				Transparency = transparency_1,
				Thickness = maxValue_2
			})
		}),
		ProfileFrame = if p4.frameImage then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 5,
			Image = p4.frameImage,
			Size = UDim2.fromOffset(floored, floored),
			Position = UDim2.fromOffset(var23, var24),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ScaleType = Enum.ScaleType.Fit
		}) else nil
	})
end