local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local DividerModule = require(Foundation.Components.Divider)
local IconModule = require(Foundation.Components.Icon)
local OrientationModule = require(Foundation.Enums.Orientation)
local RatingValueModule = require(Foundation.Enums.RatingValue)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseRatingVariantsModule = require(script.Parent.useRatingVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local Icon = BuilderIconsModule.Icon
local IconVariant = BuilderIconsModule.IconVariant
local config = {
	Selectable = true,
	testId = "--foundation-rating",
	size = require(Foundation.Enums.ChipSize).Medium,
	value = RatingValueModule.None
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 41 | Named "Rating" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseRatingVariantsModule (copy), ReactModule (copy), RatingValueModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), Icon (copy), IconVariant (copy), TextModule (copy), DividerModule (copy), OrientationModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseRatingVariantsModuleResult = UseRatingVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 49 ]]
		-- upvalues: UseTokensModuleResult (copy)
		local Floored = math.floor(UseTokensModuleResult.Stroke.Thicker)
		
		return {
			radius = UDim.new(0, UseTokensModuleResult.Radius.Circle),
			offset = Floored * 2,
			borderWidth = Floored
		}
	end, { UseTokensModuleResult })
	local IsValueMatch = WithDefaultsModuleResult.value == RatingValueModule.ThumbUp
	local IsValueMatch1 = WithDefaultsModuleResult.value == RatingValueModule.ThumbDown
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseRatingVariantsModuleResult.container.tag,
		backgroundStyle = UseRatingVariantsModuleResult.container.backgroundStyle,
		ref = Ref
	}), {
		ThumbUp = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = UseRatingVariantsModuleResult.thumbUpSegment.tag,
			ref = UseRefResult,
			onActivated = WithDefaultsModuleResult.onThumbUp,
			cursor = UseMemoResult,
			selection = {
				Selectable = WithDefaultsModuleResult.Selectable,
				NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
				NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
				NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
				NextSelectionRight = UseRefResult1
			},
			testId = `{WithDefaultsModuleResult.testId}--thumb-up`
		}, {
			Icon = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = UseRatingVariantsModuleResult.thumbUpIcon.tag
			}, {
				Icon = ReactModule.createElement(IconModule, {
					name = Icon.ThumbUp,
					variant = if IsValueMatch then IconVariant.Filled else IconVariant.Regular,
					size = UseRatingVariantsModuleResult.iconSize,
					style = UseRatingVariantsModuleResult.text.contentStyle,
					testId = `{WithDefaultsModuleResult.testId}--thumb-up-icon`
				})
			}),
			Text = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				Text = WithDefaultsModuleResult.text,
				textStyle = UseRatingVariantsModuleResult.text.contentStyle,
				tag = UseRatingVariantsModuleResult.text.tag,
				testId = `{WithDefaultsModuleResult.testId}--text`
			})
		}),
		Divider = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseRatingVariantsModuleResult.dividerContainer.tag,
			testId = `{WithDefaultsModuleResult.testId}--divider`
		}, {
			Line = ReactModule.createElement(DividerModule, { orientation = OrientationModule.Vertical })
		}),
		ThumbDown = ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			tag = UseRatingVariantsModuleResult.thumbDownSegment.tag,
			ref = UseRefResult1,
			onActivated = WithDefaultsModuleResult.onThumbDown,
			cursor = UseMemoResult,
			selection = {
				Selectable = WithDefaultsModuleResult.Selectable,
				NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
				NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
				NextSelectionLeft = UseRefResult,
				NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
			},
			testId = `{WithDefaultsModuleResult.testId}--thumb-down`
		}, {
			Icon = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = UseRatingVariantsModuleResult.thumbDownIcon.tag
			}, {
				Icon = ReactModule.createElement(IconModule, {
					name = Icon.ThumbDown,
					variant = if IsValueMatch1 then IconVariant.Filled else IconVariant.Regular,
					size = UseRatingVariantsModuleResult.iconSize,
					style = UseRatingVariantsModuleResult.text.contentStyle,
					testId = `{WithDefaultsModuleResult.testId}--thumb-down-icon`
				})
			})
		})
	})
end))