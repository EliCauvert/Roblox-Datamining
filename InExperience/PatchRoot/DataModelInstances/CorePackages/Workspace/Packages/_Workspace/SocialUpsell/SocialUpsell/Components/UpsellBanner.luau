local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local appBloxModule = require(parent.AppBlox)
local foundationModule = require(parent.Foundation)
local useCallback = reactModule.useCallback
local cryoModule = require(parent.Cryo)
local _ = require(socialUpsell.Types)
local constantsModule = require(socialUpsell.Constants)
local _ = require(socialUpsell.Enum.SocialUpsellType)
local isCompactUpsellBannerModule = require(socialUpsell.Utils.isCompactUpsellBanner)
local getUpsellSignalStoreModule = require(socialUpsell.SignalStores.getUpsellSignalStore)
local socialUpsellAnalyticsModule = require(socialUpsell.Analytics.SocialUpsellAnalytics)
local upsellComponentModule = require(socialUpsell.Analytics.Enum.UpsellComponent)
local eventTypes = require(parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local fFlagAddUpsellEntryComponentToAnalyticsModule = require(socialUpsell.Flag.FFlagAddUpsellEntryComponentToAnalytics)
local fFlagAgeBasedUXHomepageVerificationBannerGreyButton = require(parent.SharedFlags).FFlagAgeBasedUXHomepageVerificationBannerGreyButton
local UPSELL_BUTTON_ACTION = constantsModule.UPSELL_BUTTON_ACTION
local buttonVariant = foundationModule.Enums.ButtonVariant
local banner = appBloxModule.Banner
local t = { isContained = true }

local function _(p0, p1)
	-- upvalues: fFlagAgeBasedUXHomepageVerificationBannerGreyButton (ref), isCompactUpsellBannerModule (ref), UPSELL_BUTTON_ACTION (ref), buttonVariant (ref)
	if fFlagAgeBasedUXHomepageVerificationBannerGreyButton and p0.variantOverride then
		return p0.variantOverride
	end
	local var14 = isCompactUpsellBannerModule(p1)
	
	if p0.action then
		return if p0.action == UPSELL_BUTTON_ACTION.Primary then if var14 then buttonVariant.SoftEmphasis else buttonVariant.Emphasis elseif p0.action == UPSELL_BUTTON_ACTION.Secondary then buttonVariant.Utility else nil
	end
end

local function getBannerPropsFromConfig(p2, p3)
	-- upvalues: fFlagAgeBasedUXHomepageVerificationBannerGreyButton (ref), isCompactUpsellBannerModule (ref), UPSELL_BUTTON_ACTION (ref), buttonVariant (ref), constantsModule (ref), foundationModule (ref)
	local t = {}
	local t_1 = {}
	
	if p2.buttons then
		for i, v in p2.buttons do
			local var19
			local t_2 = { text = v.text }
			
			if fFlagAgeBasedUXHomepageVerificationBannerGreyButton and v.variantOverride then
				var19 = v.variantOverride
			else
				local var18 = isCompactUpsellBannerModule(p2)
				
				if v.action then
					var19 = if v.action == UPSELL_BUTTON_ACTION.Primary then if var18 then buttonVariant.SoftEmphasis else buttonVariant.Emphasis elseif v.action == UPSELL_BUTTON_ACTION.Secondary then buttonVariant.Utility else nil
				end
			end
			t_2.variant = var19
			t_2.onActivated = p3[v.action]
			table.insert(t_1, t_2)
		end
	end
	if p2.labelItems then
		for i, v in p2.labelItems do
			if v.type == constantsModule.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN then
				table.insert(t, {
					text = v.text,
					icon = {
						variant = foundationModule.Enums.IconVariant.Filled,
						position = foundationModule.Enums.IconPosition.Left,
						name = foundationModule.Enums.IconName.Clock
					},
					variant = foundationModule.Enums.BadgeVariant.Neutral
				})
			end
		end
	end
	return {
		title = p2.title,
		body = p2.body,
		badges = t,
		buttons = t_1,
		onDismiss = if p2.isDismissable then p3[UPSELL_BUTTON_ACTION.Dismiss] else nil,
		image = p2.image,
		icon = if p2.image then nil else p2.icon
	}
end

return function(p4)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), httpService (ref), getUpsellSignalStoreModule (ref), socialUpsellAnalyticsModule (ref), upsellComponentModule (ref), useEffect (ref), eventTypes (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (ref), useCallback (ref), UPSELL_BUTTON_ACTION (ref), getBannerPropsFromConfig (ref), banner (ref)
	local var20 = cryoModule.Dictionary.union(t, p4)
	local var21 = reactModule.useMemo(function()
		-- upvalues: var20 (ref), httpService (copy)
		return var20.impressionId or httpService:GenerateGUID(false)
	end, { var20.impressionId, var20.config.type })
	local var22 = reactModule.useRef(nil)
	local var23 = getUpsellSignalStoreModule()
	local var24 = reactModule.useMemo(function()
		-- upvalues: socialUpsellAnalyticsModule (copy), var20 (ref), upsellComponentModule (copy)
		return socialUpsellAnalyticsModule.evaluateUpsellStage(var20.upsellEntrySurface, upsellComponentModule.Banner, var20.upsellEntryComponent)
	end, { var20.upsellEntrySurface, var20.upsellEntryComponent })
	useEffect(function()
		-- upvalues: var21 (ref), var22 (ref), socialUpsellAnalyticsModule (copy), eventTypes (copy), var20 (ref), var24 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		if var21 and var22.current ~= var21 then
			socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellShown, {
				upsellPurpose = var20.config.type,
				upsellEntrySurface = var20.upsellEntrySurface,
				upsellStage = var24,
				upsellImpressionId = var21,
				upsellComponent = upsellComponentModule.Banner,
				conversationId = var20.conversationId,
				upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then var20.upsellEntryComponent else nil
			})
			var22.current = var21
		end
	end, {
		var20.config.type,
		var20.upsellEntrySurface,
		var24,
		var21,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then var20.upsellEntryComponent else nil
	})
	useEffect(function()
		-- upvalues: var20 (ref), var23 (ref)
		local type = var20.config.type
		local upsellEntrySurface = var20.upsellEntrySurface
		var23.setUpsellBannerData(type, upsellEntrySurface, var20.config)
		
		return function()
			-- upvalues: var23 (copy), type (ref), upsellEntrySurface (ref)
			var23.setUpsellBannerData(type, upsellEntrySurface, nil)
		end
	end, { var20.upsellEntrySurface, var20.config, var23 })
	local var25 = useCallback(function(p5, p6)
		-- upvalues: socialUpsellAnalyticsModule (copy), eventTypes (copy), var20 (ref), var24 (ref), var21 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		return function()
			-- upvalues: socialUpsellAnalyticsModule (copy), eventTypes (copy), var20 (copy), var24 (copy), var21 (copy), upsellComponentModule (copy), p6 (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (copy), p5 (ref)
			socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellButtonClick, {
				upsellPurpose = var20.config.type,
				upsellEntrySurface = var20.upsellEntrySurface,
				upsellStage = var24,
				upsellImpressionId = var21,
				upsellComponent = upsellComponentModule.Banner,
				btn = p6,
				conversationId = var20.conversationId,
				upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then var20.upsellEntryComponent else nil
			})
			p5(var21)
		end
	end, {
		var20.upsellEntrySurface,
		var20.config.type,
		var24,
		var21,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then var20.upsellEntryComponent else nil
	})
	local var26 = useCallback(var25(var20.onPrimaryAction, UPSELL_BUTTON_ACTION.Primary), { var25, var20.onPrimaryAction })
	local var27 = useCallback(var25(var20.onSecondaryAction, UPSELL_BUTTON_ACTION.Secondary), { var25, var20.onSecondaryAction })
	local var28 = useCallback(var25(var20.onDismiss, "Dismiss"), { var25, var20.onDismiss })
	
	return reactModule.createElement(banner, cryoModule.Dictionary.join(reactModule.useMemo(function()
		-- upvalues: getBannerPropsFromConfig (copy), var20 (ref), UPSELL_BUTTON_ACTION (copy), var26 (ref), var27 (ref), var28 (ref)
		return getBannerPropsFromConfig(var20.config, {
			[UPSELL_BUTTON_ACTION.Primary] = var26,
			[UPSELL_BUTTON_ACTION.Secondary] = var27,
			[UPSELL_BUTTON_ACTION.Dismiss] = var28
		})
	end, { var20.config, var26, var27, var28 }), { isContained = var20.isContained }))
end