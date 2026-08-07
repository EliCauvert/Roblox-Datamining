-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 41 | named "Rating" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useRatingVariantsModule (ref), reactModule (ref), ratingValueModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), icon (ref), iconVariant (ref), textModule (ref), dividerModule (ref), orientationModule (ref)
	local var15 = withDefaultsModule(p0, t)
	local var16 = useTokensModule()
	local var17 = useRatingVariantsModule(var16, var15.size)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useMemo(function() --[[ line: 49 ]]
		-- upvalues: var16 (ref)
		local floored = math.floor(var16.Stroke.Thicker)
		
		return {
			radius = UDim.new(0, var16.Radius.Circle),
			offset = floored * 2,
			borderWidth = floored
		}
	end, { var16 })
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var15, {
		tag = var17.container.tag,
		backgroundStyle = var17.container.backgroundStyle,
		ref = p1
	}), {
		ThumbUp = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = var17.thumbUpSegment.tag,
			ref = var18,
			onActivated = var15.onThumbUp,
			cursor = var20,
			selection = {
				Selectable = var15.Selectable,
				NextSelectionUp = var15.NextSelectionUp,
				NextSelectionDown = var15.NextSelectionDown,
				NextSelectionLeft = var15.NextSelectionLeft,
				NextSelectionRight = var19
			},
			testId = `{var15.testId}--thumb-up`
		}, {
			Icon = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = var17.thumbUpIcon.tag }, {
				Icon = reactModule.createElement(iconModule, {
					name = icon.ThumbUp,
					variant = if var15.value == ratingValueModule.ThumbUp then iconVariant.Filled else iconVariant.Regular,
					size = var17.iconSize,
					style = var17.text.contentStyle,
					testId = `{var15.testId}--thumb-up-icon`
				})
			}),
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = var15.text,
				textStyle = var17.text.contentStyle,
				tag = var17.text.tag,
				testId = `{var15.testId}--text`
			})
		}),
		Divider = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var17.dividerContainer.tag,
			testId = `{var15.testId}--divider`
		}, {
			Line = reactModule.createElement(dividerModule, { orientation = orientationModule.Vertical })
		}),
		ThumbDown = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			tag = var17.thumbDownSegment.tag,
			ref = var19,
			onActivated = var15.onThumbDown,
			cursor = var20,
			selection = {
				Selectable = var15.Selectable,
				NextSelectionUp = var15.NextSelectionUp,
				NextSelectionDown = var15.NextSelectionDown,
				NextSelectionLeft = var18,
				NextSelectionRight = var15.NextSelectionRight
			},
			testId = `{var15.testId}--thumb-down`
		}, {
			Icon = reactModule.createElement(viewModule, { LayoutOrder = 1, tag = var17.thumbDownIcon.tag }, {
				Icon = reactModule.createElement(iconModule, {
					name = icon.ThumbDown,
					variant = if var15.value == ratingValueModule.ThumbDown then iconVariant.Filled else iconVariant.Regular,
					size = var17.iconSize,
					style = var17.text.contentStyle,
					testId = `{var15.testId}--thumb-down-icon`
				})
			})
		})
	})
end))