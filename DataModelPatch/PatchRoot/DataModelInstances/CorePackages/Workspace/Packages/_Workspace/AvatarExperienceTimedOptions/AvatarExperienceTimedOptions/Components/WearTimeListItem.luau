local LocalizationService = game:GetService("LocalizationService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local Localization = require(Parent.RobloxAppLocales).Localization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local NumberLocalization = LocalizationModule.NumberLocalization
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View
local Enums = FoundationModule.Enums
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local FFlagAXWearTimeListItemUnifiedLogging = require(Parent.AvatarExperienceFlags).FFlagAXWearTimeListItemUnifiedLogging

return (ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Localization (copy), LocalizationService (copy), UseLocalizationFunction (copy), FFlagAXWearTimeListItemUnifiedLogging (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), HttpService (copy), UnifiedEventLogConstants (copy), View (copy), Enums (copy), Text (copy), FoundationModule (copy), NumberLocalization (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Localization (upval), LocalizationService (upval)
		return Localization.new(LocalizationService.RobloxLocaleId)
	end, {})
	local UseLocalizationResult = UseLocalizationFunction({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = Frame.days
		},
		xDays = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = Frame.days
		}
	})
	local Infinite = if Frame.days == 0 then UseLocalizationResult.infinite elseif Frame.days == 1 then UseLocalizationResult.xDay else UseLocalizationResult.xDays
	
	if FFlagAXWearTimeListItemUnifiedLogging and not Ref then
		Ref = ReactModule.createRef()
	end
	if FFlagAXWearTimeListItemUnifiedLogging then
		ReactModule.useEffect(function()
			-- upvalues: AddUnifiedEventLoggingFunction (upval), Ref (ref), UnifiedEventLogEnums (upval), HttpService (upval), Frame (copy), UnifiedEventLogConstants (upval)
			AddUnifiedEventLoggingFunction(Ref, {
				elementName = "TIMED_OPTION_LIST_ITEM",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				elementMetadata = HttpService:JSONEncode({
					days = if Frame.days == 0 then "permanent" else tostring(Frame.days),
					price = tostring(Frame.price)
				})
			}, {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
		end, { Frame.days, Frame.price })
	end
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium padding-medium radius-medium size-full-0 auto-y",
		ref = Ref,
		onActivated = Frame.onActivated,
		backgroundStyle = if Frame.isActive then UseTokensResult.Color.Shift.Shift_300 else nil,
		LayoutOrder = Frame.LayoutOrder,
		stateLayer = { affordance = Enums.StateLayerAffordance.None },
		selection = { Selectable = true }
	}, {
		ContentContainer = ReactModule.createElement(View, {
			tag = "row align-y-center size-full-0 auto-y flex-x-between",
			LayoutOrder = 1
		}, {
			DurationText = ReactModule.createElement(Text, {
				tag = "auto-xy",
				LayoutOrder = 1,
				Text = Infinite,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = {
					Font = UseTokensResult.Typography.LabelMedium.Font,
					FontSize = UseTokensResult.FontSize.FontSize_400
				},
				selection = { Selectable = false }
			}),
			PriceContainer = ReactModule.createElement(View, {
				tag = "row align-y-center gap-xsmall auto-xy",
				LayoutOrder = 2
			}, {
				RobuxIcon = ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 1,
					name = Enums.IconName.Robux,
					variant = Enums.IconVariant.Regular,
					size = Enums.IconSize.Medium,
					style = UseTokensResult.Color.Content.Default
				}),
				PriceText = ReactModule.createElement(Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = NumberLocalization.localize(Frame.price, UseMemoResult:GetLocale()),
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = {
						Font = UseTokensResult.Typography.LabelMedium.Font,
						FontSize = UseTokensResult.FontSize.FontSize_400
					},
					selection = { Selectable = false }
				})
			})
		})
	})
end))