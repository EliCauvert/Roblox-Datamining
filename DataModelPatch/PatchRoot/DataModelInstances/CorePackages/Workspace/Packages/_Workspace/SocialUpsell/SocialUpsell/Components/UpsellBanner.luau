local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local FoundationModule = require(Parent.Foundation)
local UseCallbackFunction = ReactModule.useCallback
local CryoModule = require(Parent.Cryo)
local _ = require(SocialUpsell.Types)
local ConstantsModule = require(SocialUpsell.Constants)
local _ = require(SocialUpsell.Enum.SocialUpsellType)
local IsCompactUpsellBannerModule = require(SocialUpsell.Utils.isCompactUpsellBanner)
local GetUpsellSignalStoreModule = require(SocialUpsell.SignalStores.getUpsellSignalStore)
local SocialUpsellAnalyticsModule = require(SocialUpsell.Analytics.SocialUpsellAnalytics)
local UpsellComponentModule = require(SocialUpsell.Analytics.Enum.UpsellComponent)
local EventTypes = require(Parent.SocialLuaAnalytics).Analytics.Enums.EventTypes
local FFlagAddUpsellEntryComponentToAnalyticsModule = require(SocialUpsell.Flag.FFlagAddUpsellEntryComponentToAnalytics)
local FFlagAgeBasedUXHomepageVerificationBannerGreyButton = require(Parent.SharedFlags).FFlagAgeBasedUXHomepageVerificationBannerGreyButton
local UPSELLBUTTONACTION = ConstantsModule.UPSELL_BUTTON_ACTION
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Banner = require(Parent.AppBlox).Banner
local config = { isContained = true }

local function _(p1, p2)
	-- upvalues: FFlagAgeBasedUXHomepageVerificationBannerGreyButton (copy), IsCompactUpsellBannerModule (copy), UPSELLBUTTONACTION (copy), ButtonVariant (copy)
	if FFlagAgeBasedUXHomepageVerificationBannerGreyButton and p1.variantOverride then
		return p1.variantOverride
	end
	local IsCompactUpsellBannerModule1 = IsCompactUpsellBannerModule(p2)
	
	if p1.action then
		if p1.action == UPSELLBUTTONACTION.Primary then
			return if IsCompactUpsellBannerModule1 then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis
		elseif p1.action == UPSELLBUTTONACTION.Secondary then
			return ButtonVariant.Utility
		end
	end
	return nil
end

local function getBannerPropsFromConfig(BannerPropsFromConfig, p1)
	-- upvalues: FFlagAgeBasedUXHomepageVerificationBannerGreyButton (copy), IsCompactUpsellBannerModule (copy), UPSELLBUTTONACTION (copy), ButtonVariant (copy), ConstantsModule (copy), FoundationModule (copy)
	local Badges = {}
	local Buttons = {}
	
	if BannerPropsFromConfig.buttons then
		for _, button in BannerPropsFromConfig.buttons do
			local config = { text = button.text }
			local SoftEmphasis = nil
			
			if FFlagAgeBasedUXHomepageVerificationBannerGreyButton and button.variantOverride then
				SoftEmphasis = button.variantOverride
			else
				local IsCompactUpsellBannerModule1 = IsCompactUpsellBannerModule(BannerPropsFromConfig)
				SoftEmphasis = if button.action then if button.action == UPSELLBUTTONACTION.Primary then if IsCompactUpsellBannerModule1 then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis elseif button.action == UPSELLBUTTONACTION.Secondary then ButtonVariant.Utility else nil else nil
			end
			config.variant = SoftEmphasis
			config.onActivated = p1[button.action]
			table.insert(Buttons, config)
		end
	end
	if BannerPropsFromConfig.labelItems then
		for _, labelItem in BannerPropsFromConfig.labelItems do
			if labelItem.type == ConstantsModule.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN then
				table.insert(Badges, {
					text = labelItem.text,
					icon = {
						variant = FoundationModule.Enums.IconVariant.Filled,
						position = FoundationModule.Enums.IconPosition.Left,
						name = FoundationModule.Enums.IconName.Clock
					},
					variant = FoundationModule.Enums.BadgeVariant.Neutral
				})
			end
		end
	end
	return {
		title = BannerPropsFromConfig.title,
		body = BannerPropsFromConfig.body,
		badges = Badges,
		buttons = Buttons,
		onDismiss = if BannerPropsFromConfig.isDismissable then p1[UPSELLBUTTONACTION.Dismiss] else nil,
		image = BannerPropsFromConfig.image,
		icon = if BannerPropsFromConfig.image then nil else BannerPropsFromConfig.icon
	}
end

return function(p2)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), HttpService (copy), GetUpsellSignalStoreModule (copy), SocialUpsellAnalyticsModule (copy), UpsellComponentModule (copy), UseEffectFunction (copy), EventTypes (copy), FFlagAddUpsellEntryComponentToAnalyticsModule (copy), UseCallbackFunction (copy), UPSELLBUTTONACTION (copy), getBannerPropsFromConfig (copy), Banner (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p2)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UnionResult (copy), HttpService (upval)
		return UnionResult.impressionId or HttpService:GenerateGUID(false)
	end, { UnionResult.impressionId, UnionResult.config.type })
	local UseRefResult = ReactModule.useRef(nil)
	local UpsellSignalStoreModule = GetUpsellSignalStoreModule()
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SocialUpsellAnalyticsModule (upval), UnionResult (copy), UpsellComponentModule (upval)
		return SocialUpsellAnalyticsModule.evaluateUpsellStage(UnionResult.upsellEntrySurface, UpsellComponentModule.Banner, UnionResult.upsellEntryComponent)
	end, {
		UnionResult.upsellEntrySurface,
		UnionResult.upsellEntryComponent
	})
	UseEffectFunction(function()
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), SocialUpsellAnalyticsModule (upval), EventTypes (upval), UnionResult (copy), UseMemoResult1 (copy), UpsellComponentModule (upval), FFlagAddUpsellEntryComponentToAnalyticsModule (upval)
		if UseMemoResult and UseRefResult.current ~= UseMemoResult then
			SocialUpsellAnalyticsModule.logUpsellEvent(EventTypes.SocialUpsellShown, {
				upsellPurpose = UnionResult.config.type,
				upsellEntrySurface = UnionResult.upsellEntrySurface,
				upsellStage = UseMemoResult1,
				upsellImpressionId = UseMemoResult,
				upsellComponent = UpsellComponentModule.Banner,
				conversationId = UnionResult.conversationId,
				upsellEntryComponent = if FFlagAddUpsellEntryComponentToAnalyticsModule then UnionResult.upsellEntryComponent else nil
			})
			UseRefResult.current = UseMemoResult
		end
	end, {
		UnionResult.config.type,
		UnionResult.upsellEntrySurface,
		UseMemoResult1,
		UseMemoResult,
		if FFlagAddUpsellEntryComponentToAnalyticsModule then UnionResult.upsellEntryComponent else nil
	})
	UseEffectFunction(function()
		-- upvalues: UnionResult (copy), UpsellSignalStoreModule (copy)
		local Type = UnionResult.config.type
		local UpsellEntrySurface = UnionResult.upsellEntrySurface
		UpsellSignalStoreModule.setUpsellBannerData(Type, UpsellEntrySurface, UnionResult.config)
		
		return function()
			-- upvalues: UpsellSignalStoreModule (upval), Type (copy), UpsellEntrySurface (copy)
			UpsellSignalStoreModule.setUpsellBannerData(Type, UpsellEntrySurface, nil)
		end
	end, {
		UnionResult.upsellEntrySurface,
		UnionResult.config,
		UpsellSignalStoreModule
	})
	local UseCallbackResult = UseCallbackFunction(function(Callback, Btn)
		-- upvalues: SocialUpsellAnalyticsModule (upval), EventTypes (upval), UnionResult (copy), UseMemoResult1 (copy), UseMemoResult (copy), UpsellComponentModule (upval), FFlagAddUpsellEntryComponentToAnalyticsModule (upval)
		return function()
			-- upvalues: SocialUpsellAnalyticsModule (upval), EventTypes (upval), UnionResult (upval), UseMemoResult1 (upval), UseMemoResult (upval), UpsellComponentModule (upval), Btn (copy), FFlagAddUpsellEntryComponentToAnalyticsModule (upval), Callback (copy)
			SocialUpsellAnalyticsModule.logUpsellEvent(EventTypes.SocialUpsellButtonClick, {
				upsellPurpose = UnionResult.config.type,
				upsellEntrySurface = UnionResult.upsellEntrySurface,
				upsellStage = UseMemoResult1,
				upsellImpressionId = UseMemoResult,
				upsellComponent = UpsellComponentModule.Banner,
				btn = Btn,
				conversationId = UnionResult.conversationId,
				upsellEntryComponent = if FFlagAddUpsellEntryComponentToAnalyticsModule then UnionResult.upsellEntryComponent else nil
			})
			Callback(UseMemoResult)
		end
	end, {
		UnionResult.upsellEntrySurface,
		UnionResult.config.type,
		UseMemoResult1,
		UseMemoResult,
		if FFlagAddUpsellEntryComponentToAnalyticsModule then UnionResult.upsellEntryComponent else nil
	})
	local UseCallbackResult1 = UseCallbackFunction(UseCallbackResult(UnionResult.onPrimaryAction, UPSELLBUTTONACTION.Primary), { UseCallbackResult, UnionResult.onPrimaryAction })
	local UseCallbackResult2 = UseCallbackFunction(UseCallbackResult(UnionResult.onSecondaryAction, UPSELLBUTTONACTION.Secondary), { UseCallbackResult, UnionResult.onSecondaryAction })
	local UseCallbackResult3 = UseCallbackFunction(UseCallbackResult(UnionResult.onDismiss, "Dismiss"), { UseCallbackResult, UnionResult.onDismiss })
	
	return ReactModule.createElement(Banner, CryoModule.Dictionary.join(ReactModule.useMemo(function()
		-- upvalues: getBannerPropsFromConfig (upval), UnionResult (copy), UPSELLBUTTONACTION (upval), UseCallbackResult1 (copy), UseCallbackResult2 (copy), UseCallbackResult3 (copy)
		return (getBannerPropsFromConfig(UnionResult.config, {
			[UPSELLBUTTONACTION.Primary] = UseCallbackResult1,
			[UPSELLBUTTONACTION.Secondary] = UseCallbackResult2,
			[UPSELLBUTTONACTION.Dismiss] = UseCallbackResult3
		}))
	end, {
		UnionResult.config,
		UseCallbackResult1,
		UseCallbackResult2,
		UseCallbackResult3
	}), { isContained = UnionResult.isContained }))
end