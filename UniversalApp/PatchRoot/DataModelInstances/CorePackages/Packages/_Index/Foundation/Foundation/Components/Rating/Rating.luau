local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local chipSizeModule = require(foundation.Enums.ChipSize)
local dividerModule = require(foundation.Components.Divider)
local iconModule = require(foundation.Components.Icon)
local orientationModule = require(foundation.Enums.Orientation)
local ratingValueModule = require(foundation.Enums.RatingValue)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useRatingVariantsModule = require(script.Parent.useRatingVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local icon = builderIconsModule.Icon
local iconVariant = builderIconsModule.IconVariant
local t = {
	Selectable = true,
	testId = "--foundation-rating",
	size = chipSizeModule.Medium,
	value = ratingValueModule.None
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useRatingVariantsModule (ref), reactModule (ref), ratingValueModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), icon (ref), iconVariant (ref), textModule (ref), dividerModule (ref), orientationModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3 = useRatingVariantsModule(var2, var1.size)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		local floored = math.floor(var2.Stroke.Thicker)
		
		return {
			radius = UDim.new(0, var2.Radius.Circle),
			offset = floored * 2,
			borderWidth = floored
		}
	end, { var2 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = var3.container.tag,
		backgroundStyle = var3.container.backgroundStyle,
		ref = p2
	}), {
		ThumbUp = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var3.thumbUpSegment.tag,
			ref = var4,
			onActivated = var1.onThumbUp,
			cursor = var6,
			selection = {
				Selectable = var1.Selectable,
				NextSelectionUp = var1.NextSelectionUp,
				NextSelectionDown = var1.NextSelectionDown,
				NextSelectionLeft = var1.NextSelectionLeft,
				NextSelectionRight = var5
			},
			testId = `{var1.testId}--thumb-up`
		}, {
			Icon = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = var3.thumbUpIcon.tag }, {
				Icon = reactModule.createElement(iconModule, {
					name = icon.ThumbUp,
					variant = if var1.value == ratingValueModule.ThumbUp then iconVariant.Filled else iconVariant.Regular,
					size = var3.iconSize,
					style = var3.text.contentStyle,
					testId = `{var1.testId}--thumb-up-icon`
				})
			}),
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = var1.text,
				textStyle = var3.text.contentStyle,
				tag = var3.text.tag,
				testId = `{var1.testId}--text`
			})
		}),
		Divider = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var3.dividerContainer.tag,
			testId = `{var1.testId}--divider`
		}, {
			Line = reactModule.createElement(dividerModule, { orientation = orientationModule.Vertical })
		}),
		ThumbDown = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			tag = var3.thumbDownSegment.tag,
			ref = var5,
			onActivated = var1.onThumbDown,
			cursor = var6,
			selection = {
				Selectable = var1.Selectable,
				NextSelectionUp = var1.NextSelectionUp,
				NextSelectionDown = var1.NextSelectionDown,
				NextSelectionLeft = var4,
				NextSelectionRight = var1.NextSelectionRight
			},
			testId = `{var1.testId}--thumb-down`
		}, {
			Icon = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = var3.thumbDownIcon.tag }, {
				Icon = reactModule.createElement(iconModule, {
					name = icon.ThumbDown,
					variant = if var1.value == ratingValueModule.ThumbDown then iconVariant.Filled else iconVariant.Regular,
					size = var3.iconSize,
					style = var3.text.contentStyle,
					testId = `{var1.testId}--thumb-down-icon`
				})
			})
		})
	})
end))