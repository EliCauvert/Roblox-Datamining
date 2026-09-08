local gamePlayButton = script:FindFirstAncestor("GamePlayButton")
local parent = gamePlayButton.Parent
local playButtonStatesModule = require(gamePlayButton.PlayButtonStates)
local _ = require(parent.PlayabilityRodux)
local playabilityStatusEnum = require(parent.DiscoveryTypes).PlayabilityStatusEnum
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local launchErrorLocalizationKeys = require(parent.GameLaunch).LaunchErrorLocalizationKeys
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useGameInfosSelector = require(parent.GameInfosRodux).useGameInfosSelector
local gameHydrationReactModule = require(parent.GameHydrationReact)
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
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
	-- upvalues: useAppPolicy (ref), useSelector (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), useLocalization (ref), playButtonStatesModule (ref), var1 (ref), experienceDetailsNoticeType (ref)
	local var2 = useAppPolicy(function(p4)
		return {
			experienceDetailsNoticeType = p4.getExperienceDetailsNoticeType()
		}
	end)
	local var3 = useSelector(function(p4)
		-- upvalues: p1 (ref)
		return p4.PlayabilityStatus and (p4.PlayabilityStatus[p1] and (p4.PlayabilityStatus[p1].unplayableDisplayText or nil))
	end)
	local var4 = useSelector(function(p4)
		-- upvalues: p1 (ref)
		return p4.GameDetails[p1]
	end)
	local var5 = nil
	local var6 = nil
	
	if fFlagMigrateGameInfoToStore then
		var6 = gameHydrationReactModule.useGameInfo(p1)
	else
		var5 = useGameInfosSelector(p1)
	end
	local rootPlaceId
	if var4 then
		rootPlaceId = var4.rootPlaceId
		
		if not rootPlaceId then
			rootPlaceId = if fFlagMigrateGameInfoToStore then var6 and var6.rootPlaceId else var5 and var5.placeId
			rootPlaceId = rootPlaceId or nil
		end
		local var7
		local var8 = useGameProductInfoSelector(p1)
		local t = {
			agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		}
		
		if p2 == playButtonStatesModule.UnplayableOther then
			local var9, var10 = var1(rootPlaceId, p3, var8)
			
			if var9 == nil then
				var7 = nil
			elseif var10 then
				local cloned = table.clone(var10)
				cloned[1] = var9
				var7 = cloned
			else
				var7 = var9
			end
		else
			var7 = nil
		end
		t.unplayableOtherFallback = var7
		local var11 = useLocalization(t)
		
		return if (p2 == playButtonStatesModule.Playable or p2 == playButtonStatesModule.PlayableWithParty or p2 == playButtonStatesModule.WaitingForParty) and var2.experienceDetailsNoticeType == experienceDetailsNoticeType.InExperiencePurchase then var11.agreeToNotice elseif var3 and var3 ~= "" then var3 elseif p2 == playButtonStatesModule.UnplayableOther then var11.unplayableOtherFallback else nil
	end
end