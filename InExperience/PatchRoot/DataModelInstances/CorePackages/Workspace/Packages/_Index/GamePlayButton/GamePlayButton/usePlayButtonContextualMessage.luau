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

local var1 = function(p1, p2, p3)
	-- upvalues: playabilityStatusEnum (ref), getAppFeaturePolicies (ref), launchErrorLocalizationKeys (ref)
	if not p2 then
		return nil
	elseif p1 == nil or (p2.playabilityStatus == playabilityStatusEnum.PurchaseRequired or p2.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired) and (p3 == nil or p3.isForSale == false) then
		return "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
	elseif p2.playabilityStatus == playabilityStatusEnum.DeviceRestricted then
		local var2 = getAppFeaturePolicies().getPlatformDisplayName() or ""
		
		if var2 == "" then
			return launchErrorLocalizationKeys[p2.playabilityStatus]
		else
			return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", { device = var2 }
		end
	end
end

local _ = function(p1, p2, p3)
	-- upvalues: var1 (ref)
	local var2, var3 = var1(p1, p2, p3)
	
	if var2 == nil then
		return nil
	elseif var3 then
		local cloned = table.clone(var3)
		cloned[1] = var2
		
		return cloned
	end
	return var2
end

return function(p1, p2, p3)
	-- upvalues: useAppPolicy (ref), useSelector (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), useLocalization (ref), playButtonStatesModule (ref), var1 (ref), experienceDetailsNoticeType (ref)
	local var2
	local var3 = useAppPolicy(function(p4)
		return {
			experienceDetailsNoticeType = p4.getExperienceDetailsNoticeType()
		}
	end)
	local var4 = useSelector(function(p4)
		-- upvalues: p1 (ref)
		return p4.PlayabilityStatus and (p4.PlayabilityStatus[p1] and (p4.PlayabilityStatus[p1].unplayableDisplayText or nil))
	end)
	local var5 = useSelector(function(p4)
		-- upvalues: p1 (ref)
		return p4.GameDetails[p1]
	end)
	local var6 = useGameInfosSelector(p1)
	local var7 = if var5 then var5.rootPlaceId elseif var6 then var6.placeId else nil
	local var8 = useGameProductInfoSelector(p1)
	local t = {
		agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
	}
	
	if p2 == playButtonStatesModule.UnplayableOther then
		local var9, var10 = var1(var7, p3, var8)
		
		if var9 == nil then
			var2 = nil
		elseif var10 then
			local cloned = table.clone(var10)
			cloned[1] = var9
			var2 = cloned
		else
			var2 = var9
		end
	else
		var2 = nil
	end
	t.unplayableOtherFallback = var2
	local var11 = useLocalization(t)
	
	return if (p2 == playButtonStatesModule.Playable or p2 == playButtonStatesModule.PlayableWithParty or p2 == playButtonStatesModule.WaitingForParty) and var3.experienceDetailsNoticeType == experienceDetailsNoticeType.InExperiencePurchase then var11.agreeToNotice elseif var4 and var4 ~= "" then var4 elseif p2 == playButtonStatesModule.UnplayableOther then var11.unplayableOtherFallback else nil
end