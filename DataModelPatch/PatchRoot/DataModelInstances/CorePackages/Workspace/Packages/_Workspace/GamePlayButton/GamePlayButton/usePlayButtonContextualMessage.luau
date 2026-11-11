local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local LocalizationService = game:GetService("LocalizationService")
local Parent = GamePlayButton.Parent
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local _ = require(Parent.PlayabilityRodux)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local LaunchErrorLocalizationKeys = require(Parent.GameLaunch).LaunchErrorLocalizationKeys
local Localization = require(Parent.RobloxAppLocales).Localization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseGameInfosSelectorFunction = require(Parent.GameInfosRodux).useGameInfosSelector
local UseGameProductInfoSelectorFunction = require(Parent.GameProductInfoRodux).useGameProductInfoSelector
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ExperienceDetailsNoticeType = require(Parent.DiscoveryTypes).ExperienceDetailsNoticeType
local FFlagLuaAppPlayabilityMessageUpdate = require(Parent.SharedFlags).FFlagLuaAppPlayabilityMessageUpdate
local NewResult = nil
local RobloxLocaleId = ""

local function _(p1, p2)
	-- upvalues: LocalizationService (copy), NewResult (ref), Localization (copy), RobloxLocaleId (ref)
	local RobloxLocaleId1 = LocalizationService.RobloxLocaleId
	
	if NewResult == nil then
		NewResult = Localization.new(RobloxLocaleId1)
		RobloxLocaleId = RobloxLocaleId1
	end
	if RobloxLocaleId ~= RobloxLocaleId1 then
		NewResult:SetLocale(RobloxLocaleId1)
		RobloxLocaleId = RobloxLocaleId1
	end
	return NewResult:Format(p1, p2)
end

local function v13(RootPlaceId, p1, p2)
	-- upvalues: PlayabilityStatusEnum (copy), GetAppFeaturePoliciesFunction (copy), LaunchErrorLocalizationKeys (copy)
	if not p1 then
		return nil
	end
	if RootPlaceId == nil or (p1.playabilityStatus == PlayabilityStatusEnum.PurchaseRequired or p1.playabilityStatus == PlayabilityStatusEnum.FiatPurchaseRequired) and (p2 == nil or p2.isForSale == false) then
		return "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
	end
	if p1.playabilityStatus == PlayabilityStatusEnum.DeviceRestricted then
		local PlatformDisplayName = GetAppFeaturePoliciesFunction().getPlatformDisplayName() or ""
		
		if PlatformDisplayName ~= "" then
			return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", { device = PlatformDisplayName }
		end
	end
	return LaunchErrorLocalizationKeys[p1.playabilityStatus]
end

local _ = function(p1, p2, p3)
	-- upvalues: v13 (copy)
	local v1, Tbl = v13(p1, p2, p3)
	
	if v1 == nil then
		return nil
	elseif Tbl then
		local Copy = table.clone(Tbl)
		Copy[1] = v1
		
		return Copy
	else
		return v1
	end
end

return function(p1, UnplayableOther, p2)
	-- upvalues: UseAppPolicyFunction (copy), UseSelectorFunction (copy), UseGameInfosSelectorFunction (copy), UseGameProductInfoSelectorFunction (copy), FFlagLuaAppPlayabilityMessageUpdate (copy), UseLocalizationFunction (copy), PlayButtonStatesModule (copy), v13 (copy), ExperienceDetailsNoticeType (copy), LocalizationService (copy), NewResult (ref), Localization (copy), RobloxLocaleId (ref)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return {
			experienceDetailsNoticeType = p3.getExperienceDetailsNoticeType()
		}
	end)
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: p1 (copy)
		return p3.PlayabilityStatus and p3.PlayabilityStatus[p1] and p3.PlayabilityStatus[p1].unplayableDisplayText or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p3)
		-- upvalues: p1 (copy)
		return p3.GameDetails[p1]
	end)
	local UseGameInfosSelectorResult = UseGameInfosSelectorFunction(p1)
	local RootPlaceId = UseSelectorResult1 and UseSelectorResult1.rootPlaceId or (UseGameInfosSelectorResult and UseGameInfosSelectorResult.placeId or nil)
	local UseGameProductInfoSelectorResult = UseGameProductInfoSelectorFunction(p1)
	
	if FFlagLuaAppPlayabilityMessageUpdate then
		local config = {
			agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		}
		local UnplayableOtherFallback = nil
		
		if UnplayableOther == PlayButtonStatesModule.UnplayableOther then
			local v1, Tbl = v13(RootPlaceId, p2, UseGameProductInfoSelectorResult)
			
			if v1 == nil then
				UnplayableOtherFallback = nil
			elseif Tbl then
				local Copy = table.clone(Tbl)
				Copy[1] = v1
				UnplayableOtherFallback = Copy
			else
				UnplayableOtherFallback = v1
			end
		else
			UnplayableOtherFallback = nil
		end
		config.unplayableOtherFallback = UnplayableOtherFallback
		local UseLocalizationResult = UseLocalizationFunction(config)
		
		if (UnplayableOther == PlayButtonStatesModule.Playable or UnplayableOther == PlayButtonStatesModule.PlayableWithParty or UnplayableOther == PlayButtonStatesModule.WaitingForParty) and UseAppPolicyResult.experienceDetailsNoticeType == ExperienceDetailsNoticeType.InExperiencePurchase then
			return UseLocalizationResult.agreeToNotice
		else
			return if UseSelectorResult and UseSelectorResult ~= "" then UseSelectorResult elseif UnplayableOther == PlayButtonStatesModule.UnplayableOther then UseLocalizationResult.unplayableOtherFallback else nil
		end
	else
		local v2: string? = nil
		local v3 = nil
		
		if UnplayableOther == PlayButtonStatesModule.UnplayableOther then
			if UseSelectorResult and UseSelectorResult ~= "" then
				return UseSelectorResult
			end
			v2, v28 = v13(RootPlaceId, p2, UseGameProductInfoSelectorResult)
		elseif (UnplayableOther == PlayButtonStatesModule.Playable or UnplayableOther == PlayButtonStatesModule.PlayableWithParty or UnplayableOther == PlayButtonStatesModule.WaitingForParty) and UseAppPolicyResult.experienceDetailsNoticeType == ExperienceDetailsNoticeType.InExperiencePurchase then
			v2 = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		end
		local FormatResult = nil
		if v2 then
			local v4: string = v2
			local v5 = v3
			local RobloxLocaleId1 = LocalizationService.RobloxLocaleId
			
			if NewResult == nil then
				NewResult = Localization.new(RobloxLocaleId1)
				RobloxLocaleId = RobloxLocaleId1
			end
			if RobloxLocaleId ~= RobloxLocaleId1 then
				NewResult:SetLocale(RobloxLocaleId1)
				RobloxLocaleId = RobloxLocaleId1
			end
			FormatResult = NewResult:Format(v4, v5) or nil
		else
			FormatResult = nil
		end
		return FormatResult
	end
end