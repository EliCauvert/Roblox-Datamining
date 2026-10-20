local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(Schools.Common.Constants)
local _ = require(script.Parent.waitlistVariants)
local config = {
	Verified = BuilderIconsModule.Icon.CircleCheck,
	Pending = BuilderIconsModule.Icon.Clock,
	Badge = BuilderIconsModule.Icon.PersonGraduate,
	Classmates = BuilderIconsModule.Icon.ThreePeople,
	Trends = BuilderIconsModule.Icon.Flame
}

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Icon (copy), config (copy), IconSize (copy), Text (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Stage = Frame.stage
	local UseLocalizationResult = UseLocalizationFunction({
		title = if Stage.usesCount then { Stage.titleKey, count = Frame.remainingCount } else Stage.titleKey,
		body = Stage.bodyKey
	})
	local Emphasis = UseTokensResult.Color.Stroke.Emphasis
	local Element = ReactModule.createElement(View, {
		tag = "row flex-y-fill gap-medium size-full-0 auto-y padding-x-medium",
		LayoutOrder = Frame.LayoutOrder,
		sizeConstraint = { MinSize = Vector2.new(0, UseTokensResult.Size.Size_1500) }
	}, {
		Indicator = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center gap-xsmall",
			Size = UDim2.new(0, UseTokensResult.Size.Size_600, 0, 0)
		}, {
			TopConnector = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "grow",
				Size = UDim2.new(0, UseTokensResult.Size.Size_50, 0, 0),
				backgroundStyle = if Frame.isFirst then nil else Emphasis
			}),
			IconWrapper = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = config[Stage.icon],
				size = IconSize.Medium,
				style = UseTokensResult.Color.Content.Emphasis
			}),
			BottomConnector = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "grow",
				Size = UDim2.new(0, UseTokensResult.Size.Size_50, 0, 0),
				backgroundStyle = if Frame.isLast then nil else Emphasis
			})
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-left align-y-center grow gap-xxsmall size-0-0 auto-y padding-y-small"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = UseLocalizationResult.title
			}),
			Body = if Stage.bodyKey == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = UseLocalizationResult.body
			})
		})
	})
	
	return if Stage.dimmed then ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		GroupTransparency = ConstantsModule.Waitlist.DIMMED_GROUP_TRANSPARENCY
	}, { Row = Element }) else Element
end