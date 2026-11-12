local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local MetadataAccessoryModule = require(script.Parent.MetadataAccessory)
local _ = require(script.Parent.useMetadataVariants)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), AccessoryTypeModule (copy), ViewModule (copy), MetadataAccessoryModule (copy), TextModule (copy)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: AccessoryTypeModule (upval), Frame (copy)
		return if p1 == nil then 0 else (if type(p1) == "string" or p1.type ~= AccessoryTypeModule.Avatar then Frame.variantProps.accessory.width else Frame.variantProps.accessory.avatarWidth) + Frame.variantProps.item.gap
	end, {
		Frame.variantProps.accessory,
		Frame.variantProps.item.gap
	})
	local NewMinTextWidth = if Frame.minTextWidth then Frame.minTextWidth + UseResult(Frame.leading) + UseResult(Frame.trailing) else nil
	
	return ReactModule.createElement(ViewModule, {
		tag = Frame.variantProps.item.tag,
		flexItem = if Frame.shrinkRatio then {
			GrowRatio = 0,
			FlexMode = Enum.UIFlexMode.Custom,
			ShrinkRatio = Frame.shrinkRatio
		} else nil,
		sizeConstraint = if NewMinTextWidth then { MinSize = Vector2.new(NewMinTextWidth, 0) } else nil,
		LayoutOrder = Frame.LayoutOrder,
		testId = `{Frame.testId}--item-{Frame.index}`
	}, {
		Leading = if Frame.leading then ReactModule.createElement(MetadataAccessoryModule, {
			LayoutOrder = 1,
			config = Frame.leading,
			variant = Frame.variantProps.accessory,
			testId = `{Frame.testId}--item-{Frame.index}--leading`
		}) else nil,
		Text = ReactModule.createElement(TextModule, {
			LayoutOrder = 3,
			Text = Frame.text,
			OpenTypeFeatures = Frame.variantProps.text.openTypeFeatures,
			tag = if Frame.isWrapped then Frame.variantProps.wrappedText.tag elseif Frame.shrinkRatio then Frame.variantProps.truncatedText.tag else Frame.variantProps.text.tag,
			sizeConstraint = if Frame.isWrapped then { MaxSize = Vector2.new(1e999, Frame.textHeight) } else nil,
			onAbsoluteSizeChanged = Frame.onTextSizeChanged,
			testId = `{Frame.testId}--text-{Frame.index}`
		}),
		Trailing = if Frame.trailing then ReactModule.createElement(MetadataAccessoryModule, {
			LayoutOrder = 4,
			config = Frame.trailing,
			variant = Frame.variantProps.accessory,
			testId = `{Frame.testId}--trailing`
		}) else nil
	})
end)