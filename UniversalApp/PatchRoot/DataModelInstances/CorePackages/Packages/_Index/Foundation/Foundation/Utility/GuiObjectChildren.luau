local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local aspectRatioModule = require(foundation.Components.AspectRatio)
local cornerRadiusModule = require(foundation.Components.CornerRadius)
local paddingModule = require(foundation.Components.Padding)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local _ = require(foundation.Components.Types)

return function(p1)
	-- upvalues: reactModule (ref), aspectRatioModule (ref), cornerRadiusModule (ref), getTestIdTagModule (ref), paddingModule (ref)
	local testId = p1.testId
	
	return {
		Children = reactModule.createElement(reactModule.Fragment, {}, p1.children),
		AspectRatio = if p1.aspectRatio ~= nil then nil else reactModule.createElement(aspectRatioModule, {
			value = p1.aspectRatio,
			testId = if testId then `{testId}--aspect-ratio` else nil
		}),
		CornerRadius = if p1.cornerRadius ~= nil then nil else reactModule.createElement(cornerRadiusModule, {
			value = p1.cornerRadius,
			testId = if testId then `{testId}--corner-radius` else nil
		}),
		FlexItem = if p1.flexItem ~= nil then nil else reactModule.createElement("UIFlexItem", {
			FlexMode = p1.flexItem.FlexMode,
			GrowRatio = p1.flexItem.GrowRatio,
			ShrinkRatio = p1.flexItem.ShrinkRatio,
			ItemLineAlignment = p1.flexItem.ItemLineAlignment,
			[reactModule.Tag] = getTestIdTagModule(testId, "flex-item")
		}),
		ListLayout = if p1.layout == nil or p1.layout.FillDirection == nil then nil else reactModule.createElement("UIListLayout", {
			FillDirection = p1.layout.FillDirection,
			ItemLineAlignment = p1.layout.ItemLineAlignment,
			HorizontalAlignment = p1.layout.HorizontalAlignment,
			HorizontalFlex = p1.layout.HorizontalFlex,
			VerticalAlignment = p1.layout.VerticalAlignment,
			VerticalFlex = p1.layout.VerticalFlex,
			Padding = p1.layout.Padding,
			SortOrder = p1.layout.SortOrder,
			Wraps = p1.layout.Wraps,
			[reactModule.Tag] = getTestIdTagModule(testId, "list-layout")
		}),
		SizeConstraint = if p1.sizeConstraint ~= nil then nil else reactModule.createElement("UISizeConstraint", {
			MaxSize = p1.sizeConstraint.MaxSize,
			MinSize = p1.sizeConstraint.MinSize,
			[reactModule.Tag] = getTestIdTagModule(testId, "size-constraint")
		}),
		Padding = if p1.padding ~= nil then nil else reactModule.createElement(paddingModule, {
			value = p1.padding,
			testId = if testId then `{testId}--padding` else nil
		}),
		Scale = if p1.scale ~= nil then nil else reactModule.createElement("UIScale", {
			Scale = p1.scale,
			[reactModule.Tag] = getTestIdTagModule(testId, "scale")
		}),
		Stroke = if p1.stroke ~= nil then nil else reactModule.createElement("UIStroke", {
			Color = p1.stroke.Color,
			Thickness = p1.stroke.Thickness,
			Transparency = p1.stroke.Transparency,
			LineJoinMode = p1.stroke.LineJoinMode,
			BorderStrokePosition = p1.stroke.BorderStrokePosition,
			[reactModule.Tag] = getTestIdTagModule(testId, "stroke")
		})
	}
end