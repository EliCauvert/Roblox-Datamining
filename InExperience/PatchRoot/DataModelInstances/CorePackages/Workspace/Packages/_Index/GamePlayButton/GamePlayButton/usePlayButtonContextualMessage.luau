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

local var3 = function(p0, p1, p2) --[[ line: 23 ]]
	-- upvalues: playabilityStatusEnum (ref), getAppFeaturePolicies (ref), launchErrorLocalizationKeys (ref)
	if not p1 then
		return nil
	elseif p0 == nil or (p1.playabilityStatus == playabilityStatusEnum.PurchaseRequired or p1.playabilityStatus == playabilityStatusEnum.FiatPurchaseRequired) and (p2 == nil or p2.isForSale == false) then
		return "Feature.ExperienceDetails.UnplayableError.UnplayableOther"
	elseif p1.playabilityStatus == playabilityStatusEnum.DeviceRestricted then
		local var4 = getAppFeaturePolicies().getPlatformDisplayName() or ""
		
		if var4 == "" then
			return launchErrorLocalizationKeys[p1.playabilityStatus]
		else
			return "Feature.ExperienceDetails.UnplayableError.DeviceRestrictedCustom", { device = var4 }
		end
	end
end

local _ = function(p3, p4, p5) --[[ line: 60 ]]
	-- upvalues: var3 (ref)
	local var5, var6 = var3(p3, p4, p5)
	
	if var5 == nil then
		return nil
	elseif var6 then
		local cloned = table.clone(var6)
		cloned[1] = var5
		
		return cloned
	end
	return var5
end

return function(p6, p7, p8) --[[ line: 79 ]]
	-- upvalues: useAppPolicy (ref), useSelector (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useGameInfosSelector (ref), useGameProductInfoSelector (ref), useLocalization (ref), playButtonStatesModule (ref), var3 (ref), experienceDetailsNoticeType (ref)
	local var8 = useAppPolicy(function(p9) --[[ line: 80 ]]
		return {
			experienceDetailsNoticeType = p9.getExperienceDetailsNoticeType()
		}
	end)
	local var9 = useSelector(function(p10) --[[ line: 86 ]]
		-- upvalues: p6 (ref)
		return p10.PlayabilityStatus and (p10.PlayabilityStatus[p6] and (p10.PlayabilityStatus[p6].unplayableDisplayText or nil))
	end)
	local var10 = useSelector(function(p11) --[[ line: 93 ]]
		-- upvalues: p6 (ref)
		return p11.GameDetails[p6]
	end)
	local var11 = nil
	local var12 = nil
	
	if fFlagMigrateGameInfoToStore then
		var12 = gameHydrationReactModule.useGameInfo(p6)
	else
		var11 = useGameInfosSelector(p6)
	end
	local rootPlaceId
	if var10 then
		rootPlaceId = var10.rootPlaceId
		
		if not rootPlaceId then
			rootPlaceId = if fFlagMigrateGameInfoToStore then var12 and var12.rootPlaceId else var11 and var11.placeId
			rootPlaceId = rootPlaceId or nil
		end
		local var17
		local var13 = useGameProductInfoSelector(p6)
		local t = {
			agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
		}
		
		if p7 == playButtonStatesModule.UnplayableOther then
			local var15, var16 = var3(rootPlaceId, p8, var13)
			
			if var15 == nil then
				var17 = nil
			elseif var16 then
				local cloned = table.clone(var16)
				cloned[1] = var15
				var17 = cloned
			else
				var17 = var15
			end
		else
			var17 = nil
		end
		t.unplayableOtherFallback = var17
		local var19 = useLocalization(t)
		
		return if (p7 == playButtonStatesModule.Playable or p7 == playButtonStatesModule.PlayableWithParty or p7 == playButtonStatesModule.WaitingForParty) and var8.experienceDetailsNoticeType == experienceDetailsNoticeType.InExperiencePurchase then var19.agreeToNotice elseif var9 and var9 ~= "" then var9 elseif p7 == playButtonStatesModule.UnplayableOther then var19.unplayableOtherFallback else nil
	end
end