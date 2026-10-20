local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AspectRatioModule = require(Foundation.Components.AspectRatio)
local CornerRadiusModule = require(Foundation.Components.CornerRadius)
local PaddingModule = require(Foundation.Components.Padding)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local _ = require(Foundation.Components.Types)

return function(p1)
	-- upvalues: ReactModule (copy), AspectRatioModule (copy), CornerRadiusModule (copy), GetTestIdTagModule (copy), PaddingModule (copy)
	local TestId = p1.testId
	
	return {
		Children = ReactModule.createElement(ReactModule.Fragment, {}, p1.children),
		AspectRatio = if p1.aspectRatio == nil then nil else ReactModule.createElement(AspectRatioModule, {
			value = p1.aspectRatio,
			testId = if TestId then `{TestId}--aspect-ratio` else nil
		}),
		CornerRadius = if p1.cornerRadius == nil then nil else ReactModule.createElement(CornerRadiusModule, {
			value = p1.cornerRadius,
			testId = if TestId then `{TestId}--corner-radius` else nil
		}),
		FlexItem = if p1.flexItem == nil then nil else ReactModule.createElement("UIFlexItem", {
			FlexMode = p1.flexItem.FlexMode,
			GrowRatio = p1.flexItem.GrowRatio,
			ShrinkRatio = p1.flexItem.ShrinkRatio,
			ItemLineAlignment = p1.flexItem.ItemLineAlignment,
			[ReactModule.Tag] = GetTestIdTagModule(TestId, "flex-item")
		}),
		ListLayout = if p1.layout == nil or p1.layout.FillDirection == nil then nil else ReactModule.createElement("UIListLayout", {
			FillDirection = p1.layout.FillDirection,
			ItemLineAlignment = p1.layout.ItemLineAlignment,
			HorizontalAlignment = p1.layout.HorizontalAlignment,
			HorizontalFlex = p1.layout.HorizontalFlex,
			VerticalAlignment = p1.layout.VerticalAlignment,
			VerticalFlex = p1.layout.VerticalFlex,
			Padding = p1.layout.Padding,
			SortOrder = p1.layout.SortOrder,
			Wraps = p1.layout.Wraps,
			[ReactModule.Tag] = GetTestIdTagModule(TestId, "list-layout")
		}),
		SizeConstraint = if p1.sizeConstraint == nil then nil else ReactModule.createElement("UISizeConstraint", {
			MaxSize = p1.sizeConstraint.MaxSize,
			MinSize = p1.sizeConstraint.MinSize,
			[ReactModule.Tag] = GetTestIdTagModule(TestId, "size-constraint")
		}),
		Padding = if p1.padding == nil then nil else ReactModule.createElement(PaddingModule, {
			value = p1.padding,
			testId = if TestId then `{TestId}--padding` else nil
		}),
		Scale = if p1.scale == nil then nil else ReactModule.createElement("UIScale", {
			Scale = p1.scale,
			[ReactModule.Tag] = GetTestIdTagModule(TestId, "scale")
		}),
		Stroke = if p1.stroke == nil then nil else ReactModule.createElement("UIStroke", {
			Color = p1.stroke.Color,
			Thickness = p1.stroke.Thickness,
			Transparency = p1.stroke.Transparency,
			LineJoinMode = p1.stroke.LineJoinMode,
			BorderStrokePosition = p1.stroke.BorderStrokePosition,
			[ReactModule.Tag] = GetTestIdTagModule(TestId, "stroke")
		})
	}
end