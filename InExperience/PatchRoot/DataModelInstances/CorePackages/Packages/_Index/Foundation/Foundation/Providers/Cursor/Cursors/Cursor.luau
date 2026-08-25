local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local images = require(parent.FoundationImages).Images
local cursorComponentModule = require(script.Parent.Parent.CursorComponent)
local cursorTypeModule = require(foundation.Enums.CursorType)
local _ = require(foundation.Enums.ColorNamespace)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local getScaledSliceModule = require(script.Parent.Parent.Parent.Parent.Components.Image.ImageSet.getScaledSlice)
local t = {
	[cursorTypeModule.BulletUp] = {
		Tag = "SlicedImage",
		Image = "component_assets/bulletUp_17_stroke_3",
		SliceCenter = Rect.new(8, 8, 9, 9),
		InsetAdjustment = Vector2.new(2, 2)
	},
	[cursorTypeModule.BulletDown] = {
		Tag = "SlicedImage",
		Image = "component_assets/bulletDown_17_stroke_3",
		SliceCenter = Rect.new(8, 8, 9, 9),
		InsetAdjustment = Vector2.new(2, 2)
	},
	[cursorTypeModule.InputFields] = {
		Tag = "SlicedImage",
		Image = "component_assets/circle_22_stroke_3",
		SliceCenter = Rect.new(11, 11, 12, 12),
		InsetAdjustment = Vector2.new(7, 0)
	},
	[cursorTypeModule.SelectionCell] = {
		Tag = "SlicedImage",
		Image = "component_assets/square_7_stroke_3",
		Padding = 50,
		SliceCenter = Rect.new(3.5, 3.5, 3.5, 3.5),
		InsetAdjustment = Vector2.new(2, 2)
	},
	[cursorTypeModule.SelectedKnob] = {
		Tag = "FixedSizeImage",
		Image = "component_assets/circle_42_stroke_3",
		Size = 42
	},
	[cursorTypeModule.UnselectedKnob] = {
		Tag = "FixedSizeImage",
		Image = "component_assets/circle_52_stroke_3",
		Size = 52
	},
	[cursorTypeModule.InputButton] = {
		Tag = "RoundedImage",
		Offset = 11,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 11)
	},
	[cursorTypeModule.RoundedRect] = {
		Tag = "RoundedImage",
		Offset = 9,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 8)
	},
	[cursorTypeModule.RoundedRectNoInset] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 8)
	},
	[cursorTypeModule.RoundedSlot] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 7)
	},
	[cursorTypeModule.SkinToneCircle] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0.5, 0)
	},
	[cursorTypeModule.SmallPill] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 15)
	},
	[cursorTypeModule.LargePill] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 26)
	},
	[cursorTypeModule.Square] = {
		Tag = "RoundedImage",
		Offset = 2,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 0)
	},
	[cursorTypeModule.Toggle] = {
		Tag = "RoundedImage",
		Offset = 0,
		BorderWidth = 3,
		CornerRadius = UDim.new(0, 13)
	}
}

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokensModule (ref), cursorTypeModule (ref), reactModule (ref), t (ref), images (ref), getScaledSliceModule (ref), cursorComponentModule (ref)
	local var7 = useTokensModule()
	local colorNamespace = p0.colorNamespace
	
	if p0.cursorType == cursorTypeModule.NavHighlight then
		return reactModule.createElement("Frame", {
			BorderSizePixel = 1,
			BackgroundTransparency = 0,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, -3),
			Size = UDim2.new(1, 0, 0, 3),
			BackgroundColor3 = var7[colorNamespace].Selection.Start.Color3,
			BorderColor3 = var7[colorNamespace].Selection.Start.Color3,
			ref = p1
		})
	elseif p0.cursorType == cursorTypeModule.Invisible then
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = p1
		})
	end
	local cursorType = t[p0.cursorType]
	
	if cursorType.Tag == "FixedSizeImage" then
		local uDim2 = UDim2.fromOffset(cursorType.Size, cursorType.Size)
		
		return reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = images[cursorType.Image].Image,
			ImageRectOffset = images[cursorType.Image].ImageRectOffset,
			ImageRectSize = images[cursorType.Image].ImageRectSize,
			Size = uDim2,
			Position = UDim2.new(0.5, -uDim2.X.Offset / 2, 0.5, -uDim2.Y.Offset / 2),
			ImageColor3 = var7[colorNamespace].Selection.Start.Color3,
			ImageTransparency = var7[colorNamespace].Selection.Start.Transparency,
			ref = p1
		})
	elseif cursorType.Tag == "SlicedImage" then
		local insetAdjustment = cursorType.InsetAdjustment
		local var9 = getScaledSliceModule(cursorType.SliceCenter)
		
		return reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = images[cursorType.Image].Image,
			ImageRectOffset = images[cursorType.Image].ImageRectOffset,
			ImageRectSize = images[cursorType.Image].ImageRectSize,
			SliceCenter = var9.center,
			SliceScale = var9.scale,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, insetAdjustment.X * 2, 1, insetAdjustment.Y * 2),
			Position = UDim2.fromOffset(-insetAdjustment.X, -insetAdjustment.Y),
			ImageColor3 = var7[colorNamespace].Selection.Start.Color3,
			ImageTransparency = var7[colorNamespace].Selection.Start.Transparency,
			ref = p1
		}, {
			Padding = if cursorType.Padding then reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, cursorType.Padding),
				PaddingBottom = UDim.new(0, cursorType.Padding),
				PaddingLeft = UDim.new(0, cursorType.Padding),
				PaddingRight = UDim.new(0, cursorType.Padding)
			}) else nil
		})
	end
	return if cursorType.Tag == "RoundedImage" then reactModule.createElement(cursorComponentModule, {
		isVisible = p0.isVisible,
		cornerRadius = cursorType.CornerRadius,
		offset = cursorType.Offset - cursorType.BorderWidth,
		borderWidth = cursorType.BorderWidth,
		colorNamespace = p0.colorNamespace,
		ref = p1
	}) else nil
end)