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

return reactModule.forwardRef(function(p0, p1) --[[ line: 30 ]]
	-- upvalues: useTokens (ref), reactModule (ref), localization (ref), localizationService (ref), useLocalization (ref), fFlagAXWearTimeListItemUnifiedLogging (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), httpService (ref), unifiedEventLogConstants (ref), view (ref), enums (ref), text (ref), foundationModule (ref), numberLocalization (ref)
	local var6 = useTokens()
	local var7 = reactModule.useMemo(function() --[[ line: 32 ]]
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	local var8 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = p0.days
		},
		xDays = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = p0.days
		}
	})
	local var9 = if p0.days == 0 then var8.infinite elseif p0.days == 1 then var8.xDay else var8.xDays
	
	if fFlagAXWearTimeListItemUnifiedLogging and not p1 then
		p1 = reactModule.createRef()
	end
	if fFlagAXWearTimeListItemUnifiedLogging then
		reactModule.useEffect(function() --[[ line: 55 ]]
			-- upvalues: addUnifiedEventLogging (copy), p1 (write), unifiedEventLogEnums (copy), httpService (copy), p0 (ref), unifiedEventLogConstants (copy)
			addUnifiedEventLogging(p1, {
				elementName = "TIMED_OPTION_LIST_ITEM",
				action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				elementMetadata = httpService:JSONEncode({
					days = if p0.days == 0 then "permanent" else tostring(p0.days),
					price = tostring(p0.price)
				})
			}, {
				sessionTagName = unifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
		end, { p0.days, p0.price })
	end
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium padding-medium radius-medium size-full-0 auto-y",
		ref = p1,
		onActivated = p0.onActivated,
		backgroundStyle = if p0.isActive then var6.Color.Shift.Shift_300 else nil,
		LayoutOrder = p0.LayoutOrder,
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
				Text = var9,
				textStyle = var6.Color.Content.Emphasis,
				fontStyle = {
					Font = var6.Typography.LabelMedium.Font,
					FontSize = var6.FontSize.FontSize_400
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
					style = var6.Color.Content.Default
				}),
				PriceText = reactModule.createElement(text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = numberLocalization.localize(p0.price, var7:GetLocale()),
					textStyle = var6.Color.Content.Default,
					fontStyle = {
						Font = var6.Typography.LabelMedium.Font,
						FontSize = var6.FontSize.FontSize_400
					},
					selection = { Selectable = false }
				})
			})
		})
	})
end)