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

local function _(p1, p2)
	-- upvalues: fFlagAgeBasedUXHomepageVerificationBannerGreyButton (ref), isCompactUpsellBannerModule (ref), UPSELL_BUTTON_ACTION (ref), buttonVariant (ref)
	if fFlagAgeBasedUXHomepageVerificationBannerGreyButton and p1.variantOverride then
		return p1.variantOverride
	end
	local var1 = isCompactUpsellBannerModule(p2)
	
	if p1.action then
		return if p1.action == UPSELL_BUTTON_ACTION.Primary then if var1 then buttonVariant.SoftEmphasis else buttonVariant.Emphasis elseif p1.action == UPSELL_BUTTON_ACTION.Secondary then buttonVariant.Utility else nil
	end
end

local function getBannerPropsFromConfig(p1, p2)
	-- upvalues: fFlagAgeBasedUXHomepageVerificationBannerGreyButton (ref), isCompactUpsellBannerModule (ref), UPSELL_BUTTON_ACTION (ref), buttonVariant (ref), constantsModule (ref), foundationModule (ref)
	local t = {}
	local t_1 = {}
	
	if p1.buttons then
		for i, v in p1.buttons do
			local var1
			local t_2 = { text = v.text }
			
			if fFlagAgeBasedUXHomepageVerificationBannerGreyButton and v.variantOverride then
				var1 = v.variantOverride
			else
				local var2 = isCompactUpsellBannerModule(p1)
				
				if v.action then
					var1 = if v.action == UPSELL_BUTTON_ACTION.Primary then if var2 then buttonVariant.SoftEmphasis else buttonVariant.Emphasis elseif v.action == UPSELL_BUTTON_ACTION.Secondary then buttonVariant.Utility else nil
				end
			end
			t_2.variant = var1
			t_2.onActivated = p2[v.action]
			table.insert(t_1, t_2)
		end
	end
	if p1.labelItems then
		for i, v in p1.labelItems do
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
		title = p1.title,
		body = p1.body,
		badges = t,
		buttons = t_1,
		onDismiss = if p1.isDismissable then p2[UPSELL_BUTTON_ACTION.Dismiss] else nil,
		image = p1.image,
		icon = if p1.image then nil else p1.icon
	}
end

return function(p3)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), httpService (ref), getUpsellSignalStoreModule (ref), socialUpsellAnalyticsModule (ref), upsellComponentModule (ref), useEffect (ref), eventTypes (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (ref), useCallback (ref), UPSELL_BUTTON_ACTION (ref), getBannerPropsFromConfig (ref), banner (ref)
	local var3 = cryoModule.Dictionary.union(t, p3)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), httpService (copy)
		return var3.impressionId or httpService:GenerateGUID(false)
	end, { var3.impressionId, var3.config.type })
	local var5 = reactModule.useRef(nil)
	local var6 = getUpsellSignalStoreModule()
	local var7 = reactModule.useMemo(function()
		-- upvalues: socialUpsellAnalyticsModule (copy), var3 (ref), upsellComponentModule (copy)
		return socialUpsellAnalyticsModule.evaluateUpsellStage(var3.upsellEntrySurface, upsellComponentModule.Banner, var3.upsellEntryComponent)
	end, { var3.upsellEntrySurface, var3.upsellEntryComponent })
	useEffect(function()
		-- upvalues: var4 (ref), var5 (ref), socialUpsellAnalyticsModule (copy), eventTypes (copy), var3 (ref), var7 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		if var4 and var5.current ~= var4 then
			socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellShown, {
				upsellPurpose = var3.config.type,
				upsellEntrySurface = var3.upsellEntrySurface,
				upsellStage = var7,
				upsellImpressionId = var4,
				upsellComponent = upsellComponentModule.Banner,
				conversationId = var3.conversationId,
				upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then var3.upsellEntryComponent else nil
			})
			var5.current = var4
		end
	end, {
		var3.config.type,
		var3.upsellEntrySurface,
		var7,
		var4,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then var3.upsellEntryComponent else nil
	})
	useEffect(function()
		-- upvalues: var3 (ref), var6 (ref)
		local type = var3.config.type
		local upsellEntrySurface = var3.upsellEntrySurface
		var6.setUpsellBannerData(type, upsellEntrySurface, var3.config)
		
		return function()
			-- upvalues: var6 (copy), type (ref), upsellEntrySurface (ref)
			var6.setUpsellBannerData(type, upsellEntrySurface, nil)
		end
	end, { var3.upsellEntrySurface, var3.config, var6 })
	local var8 = useCallback(function(p4, p5)
		-- upvalues: socialUpsellAnalyticsModule (copy), eventTypes (copy), var3 (ref), var7 (ref), var4 (ref), upsellComponentModule (copy), fFlagAddUpsellEntryComponentToAnalyticsModule (copy)
		return function()
			-- upvalues: socialUpsellAnalyticsModule (copy), eventTypes (copy), var3 (copy), var7 (copy), var4 (copy), upsellComponentModule (copy), p5 (ref), fFlagAddUpsellEntryComponentToAnalyticsModule (copy), p4 (ref)
			socialUpsellAnalyticsModule.logUpsellEvent(eventTypes.SocialUpsellButtonClick, {
				upsellPurpose = var3.config.type,
				upsellEntrySurface = var3.upsellEntrySurface,
				upsellStage = var7,
				upsellImpressionId = var4,
				upsellComponent = upsellComponentModule.Banner,
				btn = p5,
				conversationId = var3.conversationId,
				upsellEntryComponent = if fFlagAddUpsellEntryComponentToAnalyticsModule then var3.upsellEntryComponent else nil
			})
			p4(var4)
		end
	end, {
		var3.upsellEntrySurface,
		var3.config.type,
		var7,
		var4,
		if fFlagAddUpsellEntryComponentToAnalyticsModule then var3.upsellEntryComponent else nil
	})
	local var9 = useCallback(var8(var3.onPrimaryAction, UPSELL_BUTTON_ACTION.Primary), { var8, var3.onPrimaryAction })
	local var10 = useCallback(var8(var3.onSecondaryAction, UPSELL_BUTTON_ACTION.Secondary), { var8, var3.onSecondaryAction })
	local var11 = useCallback(var8(var3.onDismiss, "Dismiss"), { var8, var3.onDismiss })
	
	return reactModule.createElement(banner, cryoModule.Dictionary.join(reactModule.useMemo(function()
		-- upvalues: getBannerPropsFromConfig (copy), var3 (ref), UPSELL_BUTTON_ACTION (copy), var9 (ref), var10 (ref), var11 (ref)
		return getBannerPropsFromConfig(var3.config, {
			[UPSELL_BUTTON_ACTION.Primary] = var9,
			[UPSELL_BUTTON_ACTION.Secondary] = var10,
			[UPSELL_BUTTON_ACTION.Dismiss] = var11
		})
	end, { var3.config, var9, var10, var11 }), { isContained = var3.isContained }))
end