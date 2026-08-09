local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local localizationService = game:GetService("LocalizationService")
local parent = gamePlayButton.Parent
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local _ = require(parent.PlayabilityRodux)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local launchErrorLocalizationKeys = require(parent.GameLaunch).LaunchErrorLocalizationKeys
local localization = require(parent.RobloxAppLocales).Localization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useGameInfosSelector = require(parent.GameInfosRodux).useGameInfosSelector
local useGameProductInfoSelector = require(parent.GameProductInfoRodux).useGameProductInfoSelector
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalization = require(parent.Localization).Hooks.useLocalization
local experienceDetailsNoticeType = require(parent.DiscoveryTypes).ExperienceDetailsNoticeType
local fFlagLuaAppPlayabilityMessageUpdate = require(parent.SharedFlags).FFlagLuaAppPlayabilityMessageUpdate
local var3 = nil
local var4 = ""

local function _(p0, p1) --[[ line: 27 | named "translateString" ]]
	-- upvalues: localizationService (ref), var3 (write), localization (ref), var4 (write)
	local robloxLocaleId = localizationService.RobloxLocaleId
	
	if var3 == nil then
		var3 = localization.new(robloxLocaleId)
		var4 = robloxLocaleId
	end
	if var4 ~= robloxLocaleId then
		var3:SetLocale(robloxLocaleId)
		var4 = robloxLocaleId
	end
	return var3:Format(p0, p1)
end

local var5 = function(p2, p3, p4) --[[ line: 40 ]]
	-- upvalues: playabilityStatusEnum (ref), getAppFeaturePolicies (ref), launchErrorLocalizationKeys (ref)
	if not p3 then
		return nil
	elseif p2 == nil or (p3.playabilityStatus == playabilityStatusEnum.PurchaseRequired or p3.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired) and (p4 == nil or p4.isForSale == false) then
		return "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
	elseif p3.playabilityStatus == playabilityStatusEnum.DeviceRestricted then
		local var6 = getAppFeaturePolicies().getPlatformDisplayName() or ""
		
		if var6 == "" then
			return launchErrorLocalizationKeys[p3.playabilityStatus]
		else
			return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", { device = var6 }
		end
	end
end

local _ = function(p5, p6, p7) --[[ line: 77 ]]
	-- upvalues: var5 (ref)
	local var7, var8 = var5(p5, p6, p7)
	
	if var7 == nil then
		return nil
	elseif var8 then
		local cloned = table.clone(var8)
		cloned[1] = var7
		
		return cloned
	end
	return var7
end

return function(p8, p9, p10) --[[ line: 96 ]]
	-- upvalues: useAppPolicy (ref), useSelector (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), fFlagLuaAppPlayabilityMessageUpdate (ref), useLocalization (ref), playButtonStatesModule (ref), var5 (ref), experienceDetailsNoticeType (ref), localizationService (ref), var3 (write), localization (ref), var4 (write)
	local var10 = useAppPolicy(function(p11) --[[ line: 97 ]]
		return {
			experienceDetailsNoticeType = p11.getExperienceDetailsNoticeType()
		}
	end)
	local var11 = useSelector(function(p12) --[[ line: 103 ]]
		-- upvalues: p8 (ref)
		return p12.PlayabilityStatus and (p12.PlayabilityStatus[p8] and (p12.PlayabilityStatus[p8].unplayableDisplayText or nil))
	end)
	local var12 = useSelector(function(p13) --[[ line: 110 ]]
		-- upvalues: p8 (ref)
		return p13.GameDetails[p8]
	end)
	local var13 = useGameInfosSelector(p8)
	local var14 = if var12 then var12.rootPlaceId elseif var13 then var13.placeId else nil
	local var15 = useGameProductInfoSelector(p8)
	
	if fFlagLuaAppPlayabilityMessageUpdate then
		local var26
		local t = {
			agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		}
		
		if p9 == playButtonStatesModule.UnplayableOther then
			local var24, var25 = var5(var14, p10, var15)
			
			if var24 == nil then
				var26 = nil
			elseif var25 then
				local cloned = table.clone(var25)
				cloned[1] = var24
				var26 = cloned
			else
				var26 = var24
			end
		else
			var26 = nil
		end
		t.unplayableOtherFallback = var26
		local var28 = useLocalization(t)
		
		return if (p9 == playButtonStatesModule.Playable or p9 == playButtonStatesModule.PlayableWithParty or p9 == playButtonStatesModule.WaitingForParty) and var10.experienceDetailsNoticeType == experienceDetailsNoticeType.InExperiencePurchase then var28.agreeToNotice elseif var11 and var11 ~= "" then var11 elseif p9 == playButtonStatesModule.UnplayableOther then var28.unplayableOtherFallback else nil
	else
		local var22
		local var16 = nil
		local var17 = nil
		
		if p9 == playButtonStatesModule.UnplayableOther then
			if var11 and var11 ~= "" then
				return var11
			end
			local var18, var19 = var5(var14, p10, var15)
			var16 = var18
			var17 = var19
		elseif (p9 == playButtonStatesModule.Playable or p9 == playButtonStatesModule.PlayableWithParty or p9 == playButtonStatesModule.WaitingForParty) and var10.experienceDetailsNoticeType == experienceDetailsNoticeType.InExperiencePurchase then
			var16 = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		end
		if var16 then
			local var20 = var16
			local var21 = var17
			local robloxLocaleId = localizationService.RobloxLocaleId
			
			if var3 == nil then
				var3 = localization.new(robloxLocaleId)
				var4 = robloxLocaleId
			end
			if var4 ~= robloxLocaleId then
				var3:SetLocale(robloxLocaleId)
				var4 = robloxLocaleId
			end
			var22 = var3:Format(var20, var21) or nil
		end
		return var22
	end
end