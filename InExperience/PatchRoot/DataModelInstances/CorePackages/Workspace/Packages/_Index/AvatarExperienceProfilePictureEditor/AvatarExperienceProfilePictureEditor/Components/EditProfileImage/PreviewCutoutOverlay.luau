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
		BackgroundColor3 = p0.color,
		BackgroundTransparency = p0.transparency
	})
end

local function buildCompositionGridChildren(p1, p2, p3, p4) --[[ line: 38 ]]
	-- upvalues: reactModule (ref)
	local floored = math.floor(p1 / 3 + 0.5)
	local floored_1 = math.floor(p1 * 2 / 3 + 0.5)
	local floored_2 = math.floor(p2 / 2)
	local t = {}
	local t_1 = {
		size = UDim2.fromOffset(p2, p1),
		position = UDim2.fromOffset(floored - floored_2, 0),
		color = p3,
		transparency = p4
	}
	t.VerticalLine1 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_1.size,
		Position = t_1.position,
		BackgroundColor3 = t_1.color,
		BackgroundTransparency = t_1.transparency
	})
	local t_2 = {
		size = UDim2.fromOffset(p2, p1),
		position = UDim2.fromOffset(floored_1 - floored_2, 0),
		color = p3,
		transparency = p4
	}
	t.VerticalLine2 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_2.size,
		Position = t_2.position,
		BackgroundColor3 = t_2.color,
		BackgroundTransparency = t_2.transparency
	})
	local t_3 = {
		size = UDim2.fromOffset(p1, p2),
		position = UDim2.fromOffset(0, floored - floored_2),
		color = p3,
		transparency = p4
	}
	t.HorizontalLine1 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_3.size,
		Position = t_3.position,
		BackgroundColor3 = t_3.color,
		BackgroundTransparency = t_3.transparency
	})
	local t_4 = {
		size = UDim2.fromOffset(p1, p2),
		position = UDim2.fromOffset(0, floored_1 - floored_2),
		color = p3,
		transparency = p4
	}
	t.HorizontalLine2 = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Active = false,
		Size = t_4.size,
		Position = t_4.position,
		BackgroundColor3 = t_4.color,
		BackgroundTransparency = t_4.transparency
	})
	
	return t
end

return function(p5) --[[ line: 76 | named "PreviewCutoutOverlay" ]]
	-- upvalues: useTokens (ref), constantsModule (ref), reactModule (ref), buildCompositionGridChildren (ref)
	local var12 = useTokens()
	local maxValue = math.max(0, math.floor((p5.width - p5.cutoutSize) / 2 + 0.5))
	local maxValue_1 = math.max(0, p5.height - p5.cutoutTopOffset - p5.cutoutSize)
	local overMedia100 = var12.Color.OverMedia.OverMedia_100
	local color3 = overMedia100.Color3
	local transparency = overMedia100.Transparency or 0.35
	local emphasis = var12.Color.Stroke.Emphasis
	local color3_1 = emphasis.Color3
	local transparency_1 = emphasis.Transparency or 0.84
	local maxValue_2 = math.max(1, math.floor(var12.Stroke.Standard + 0.5))
	local floored = math.floor(p5.cutoutSize * constantsModule.CircleCutoutHoleDiameterFraction + 0.5)
	local maxValue_3 = math.max(0, math.floor((p5.cutoutSize - floored) / 2 + 0.5))
	local var20 = maxValue + maxValue_3
	local var21 = p5.cutoutTopOffset + maxValue_3
	local var22 = maxValue + p5.cutoutSize * 0.5
	local var23 = p5.cutoutTopOffset + p5.cutoutSize * 0.5
	local maxValue_4 = math.max(1, floored - maxValue_2)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		DimTop = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, p5.cutoutTopOffset),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		DimLeft = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(maxValue, p5.cutoutSize),
			Position = UDim2.fromOffset(0, p5.cutoutTopOffset),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		DimRight = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(maxValue, p5.cutoutSize),
			Position = UDim2.fromOffset(maxValue + p5.cutoutSize, p5.cutoutTopOffset),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		DimBottom = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, maxValue_1),
			Position = UDim2.fromOffset(0, p5.cutoutTopOffset + p5.cutoutSize),
			BackgroundColor3 = color3,
			BackgroundTransparency = transparency
		}),
		CompositionGrid = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Active = false,
			ZIndex = 2,
			Size = UDim2.fromOffset(floored, floored),
			Position = UDim2.fromOffset(var20, var21)
		}, buildCompositionGridChildren(floored, maxValue_2, color3_1, transparency_1)),
		Cutout = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 3,
			Image = constantsModule.CircleCutoutAsset,
			ImageColor3 = color3,
			ImageTransparency = transparency,
			Size = UDim2.fromOffset(p5.cutoutSize, p5.cutoutSize),
			Position = UDim2.fromOffset(maxValue, p5.cutoutTopOffset)
		}),
		CutoutBorder = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 4,
			Size = UDim2.fromOffset(maxValue_4, maxValue_4),
			Position = UDim2.fromOffset(var22, var23),
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
		ProfileFrame = if p5.frameImage then reactModule.createElement("ImageLabel", {
			Name = "ProfileFrame",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = false,
			ZIndex = 5,
			Image = p5.frameImage,
			Size = UDim2.fromOffset(floored, floored),
			Position = UDim2.fromOffset(var22, var23),
			AnchorPoint = Vector2.new(0.5, 0.5),
			ScaleType = Enum.ScaleType.Fit
		}) else nil
	})
end