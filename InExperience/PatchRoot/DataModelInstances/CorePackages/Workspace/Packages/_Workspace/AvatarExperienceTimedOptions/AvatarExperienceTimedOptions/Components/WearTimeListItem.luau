local localizationService = game:GetService("LocalizationService")
local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local localization = require(parent.RobloxAppLocales).Localization
local useLocalization = localizationModule.Hooks.useLocalization
local numberLocalization = localizationModule.NumberLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View
local enums = foundationModule.Enums
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local unifiedEventLogConstants = avatarExperienceAnalyticsModule.UnifiedEventLogConstants
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local fFlagAXWearTimeListItemUnifiedLogging = require(parent.AvatarExperienceFlags).FFlagAXWearTimeListItemUnifiedLogging

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), localization (ref), localizationService (ref), useLocalization (ref), fFlagAXWearTimeListItemUnifiedLogging (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), httpService (ref), unifiedEventLogConstants (ref), view (ref), enums (ref), text (ref), foundationModule (ref), numberLocalization (ref)
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	local var3 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = p1.days
		},
		xDays = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = p1.days
		}
	})
	local var4 = if p1.days == 0 then var3.infinite elseif p1.days == 1 then var3.xDay else var3.xDays
	
	if fFlagAXWearTimeListItemUnifiedLogging and not p2 then
		p2 = reactModule.createRef()
	end
	if fFlagAXWearTimeListItemUnifiedLogging then
		reactModule.useEffect(function()
			-- upvalues: addUnifiedEventLogging (copy), p2 (write), unifiedEventLogEnums (copy), httpService (copy), p1 (ref), unifiedEventLogConstants (copy)
			addUnifiedEventLogging(p2, {
				elementName = "TIMED_OPTION_LIST_ITEM",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				elementMetadata = httpService:JSONEncode({
					days = if p1.days == 0 then "permanent" else tostring(p1.days),
					price = tostring(p1.price)
				})
			}, {
				sessionTagName = unifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
		end, { p1.days, p1.price })
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium padding-medium radius-medium size-full-0 auto-y",
		ref = p2,
		onActivated = p1.onActivated,
		backgroundStyle = if p1.isActive then var1.Color.Shift.Shift_300 else nil,
		LayoutOrder = p1.LayoutOrder,
		stateLayer = { affordance = enums.StateLayerAffordance.None },
		selection = { Selectable = true }
	}, {
		ContentContainer = reactModule.createElement(view, {
			tag = "row align-y-center size-full-0 auto-y flex-x-between",
			LayoutOrder = 1
		}, {
			DurationText = reactModule.createElement(text, {
				tag = "auto-xy",
				LayoutOrder = 1,
				Text = var4,
				textStyle = var1.Color.Content.Emphasis,
				fontStyle = {
					Font = var1.Typography.LabelMedium.Font,
					FontSize = var1.FontSize.FontSize_400
				},
				selection = { Selectable = false }
			}),
			PriceContainer = reactModule.createElement(view, {
				tag = "row align-y-center gap-xsmall auto-xy",
				LayoutOrder = 2
			}, {
				RobuxIcon = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 1,
					name = enums.IconName.Robux,
					variant = enums.IconVariant.Regular,
					size = enums.IconSize.Medium,
					style = var1.Color.Content.Default
				}),
				PriceText = reactModule.createElement(text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = numberLocalization.localize(p1.price, var2:GetLocale()),
					textStyle = var1.Color.Content.Default,
					fontStyle = {
						Font = var1.Typography.LabelMedium.Font,
						FontSize = var1.FontSize.FontSize_400
					},
					selection = { Selectable = false }
				})
			})
		})
	})
end)