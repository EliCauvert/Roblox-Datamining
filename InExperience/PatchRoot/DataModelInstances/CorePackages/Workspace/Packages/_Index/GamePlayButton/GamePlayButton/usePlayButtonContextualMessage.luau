local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local parent = gamePlayButton.Parent
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local _ = require(parent.PlayabilityRodux)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local launchErrorLocalizationKeys = require(parent.GameLaunch).LaunchErrorLocalizationKeys
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useGameInfosSelector = require(parent.GameInfosRodux).useGameInfosSelector
local useGameProductInfoSelector = require(parent.GameProductInfoRodux).useGameProductInfoSelector
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useLocalization = require(parent.Localization).Hooks.useLocalization
local experienceDetailsNoticeType = require(parent.DiscoveryTypes).ExperienceDetailsNoticeType

local var2 = function(p0, p1, p2)
	-- upvalues: playabilityStatusEnum (ref), getAppFeaturePolicies (ref), launchErrorLocalizationKeys (ref)
	if not p1 then
		return nil
	elseif p0 == nil or (p1.playabilityStatus == playabilityStatusEnum.PurchaseRequired or p1.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired) and (p2 == nil or p2.isForSale == false) then
		return "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
	elseif p1.playabilityStatus == playabilityStatusEnum.DeviceRestricted then
		local var3 = getAppFeaturePolicies().getPlatformDisplayName() or ""
		
		if var3 == "" then
			return launchErrorLocalizationKeys[p1.playabilityStatus]
		else
			return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", { device = var3 }
		end
	end
end

local _ = function(p3, p4, p5)
	-- upvalues: var2 (ref)
	local var4, var5 = var2(p3, p4, p5)
	
	if var4 == nil then
		return nil
	elseif var5 then
		local cloned = table.clone(var5)
		cloned[1] = var4
		
		return cloned
	end
	return var4
end

return function(p6, p7, p8)
	-- upvalues: useAppPolicy (ref), useSelector (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), useLocalization (ref), playButtonStatesModule (ref), var2 (ref), experienceDetailsNoticeType (ref)
	local var16
	local var7 = useAppPolicy(function(p9)
		return {
			experienceDetailsNoticeType = p9.getExperienceDetailsNoticeType()
		}
	end)
	local var8 = useSelector(function(p10)
		-- upvalues: p6 (ref)
		return p10.PlayabilityStatus and (p10.PlayabilityStatus[p6] and (p10.PlayabilityStatus[p6].unplayableDisplayText or nil))
	end)
	local var9 = useSelector(function(p11)
		-- upvalues: p6 (ref)
		return p11.GameDetails[p6]
	end)
	local var10 = useGameInfosSelector(p6)
	local var11 = if var9 then var9.rootPlaceId elseif var10 then var10.placeId else nil
	local var12 = useGameProductInfoSelector(p6)
	local t = {
		agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
	}
	
	if p7 == playButtonStatesModule.UnplayableOther then
		local var14, var15 = var2(var11, p8, var12)
		
		if var14 == nil then
			var16 = nil
		elseif var15 then
			local cloned = table.clone(var15)
			cloned[1] = var14
			var16 = cloned
		else
			var16 = var14
		end
	else
		var16 = nil
	end
	t.unplayableOtherFallback = var16
	local var18 = useLocalization(t)
	
	return if (p7 == playButtonStatesModule.Playable or p7 == playButtonStatesModule.PlayableWithParty or p7 == playButtonStatesModule.WaitingForParty) and var7.experienceDetailsNoticeType == experienceDetailsNoticeType.InExperiencePurchase then var18.agreeToNotice elseif var8 and var8 ~= "" then var8 elseif p7 == playButtonStatesModule.UnplayableOther then var18.unplayableOtherFallback else nil
end