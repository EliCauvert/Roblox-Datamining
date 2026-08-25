local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local aspectRatioModule = require(foundation.Components.AspectRatio)
local cornerRadiusModule = require(foundation.Components.CornerRadius)
local paddingModule = require(foundation.Components.Padding)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local _ = require(foundation.Components.Types)

return function(p0)
	-- upvalues: reactModule (ref), aspectRatioModule (ref), cornerRadiusModule (ref), getTestIdTagModule (ref), paddingModule (ref)
	local testId = p0.testId
	
	return {
		Children = reactModule.createElement(reactModule.Fragment, {}, p0.children),
		AspectRatio = if p0.aspectRatio ~= nil then nil else reactModule.createElement(aspectRatioModule, {
			value = p0.aspectRatio,
			testId = if testId then `{testId}--aspect-ratio` else nil
		}),
		CornerRadius = if p0.cornerRadius ~= nil then nil else reactModule.createElement(cornerRadiusModule, {
			value = p0.cornerRadius,
			testId = if testId then `{testId}--corner-radius` else nil
		}),
		FlexItem = if p0.flexItem ~= nil then nil else reactModule.createElement("UIFlexItem", {
			FlexMode = p0.flexItem.FlexMode,
			GrowRatio = p0.flexItem.GrowRatio,
			ShrinkRatio = p0.flexItem.ShrinkRatio,
			ItemLineAlignment = p0.flexItem.ItemLineAlignment,
			[reactModule.Tag] = getTestIdTagModule(testId, "flex-item")
		}),
		ListLayout = if p0.layout == nil or p0.layout.FillDirection == nil then nil else reactModule.createElement("UIListLayout", {
			FillDirection = p0.layout.FillDirection,
			ItemLineAlignment = p0.layout.ItemLineAlignment,
			HorizontalAlignment = p0.layout.HorizontalAlignment,
			HorizontalFlex = p0.layout.HorizontalFlex,
			VerticalAlignment = p0.layout.VerticalAlignment,
			VerticalFlex = p0.layout.VerticalFlex,
			Padding = p0.layout.Padding,
			SortOrder = p0.layout.SortOrder,
			Wraps = p0.layout.Wraps,
			[reactModule.Tag] = getTestIdTagModule(testId, "list-layout")
		}),
		SizeConstraint = if p0.sizeConstraint ~= nil then nil else reactModule.createElement("UISizeConstraint", {
			MaxSize = p0.sizeConstraint.MaxSize,
			MinSize = p0.sizeConstraint.MinSize,
			[reactModule.Tag] = getTestIdTagModule(testId, "size-constraint")
		}),
		Padding = if p0.padding ~= nil then nil else reactModule.createElement(paddingModule, {
			value = p0.padding,
			testId = if testId then `{testId}--padding` else nil
		}),
		Scale = if p0.scale ~= nil then nil else reactModule.createElement("UIScale", {
			Scale = p0.scale,
			[reactModule.Tag] = getTestIdTagModule(testId, "scale")
		}),
		Stroke = if p0.stroke ~= nil then nil else reactModule.createElement("UIStroke", {
			Color = p0.stroke.Color,
			Thickness = p0.stroke.Thickness,
			Transparency = p0.stroke.Transparency,
			LineJoinMode = p0.stroke.LineJoinMode,
			BorderStrokePosition = p0.stroke.BorderStrokePosition,
			[reactModule.Tag] = getTestIdTagModule(testId, "stroke")
		})
	}
end