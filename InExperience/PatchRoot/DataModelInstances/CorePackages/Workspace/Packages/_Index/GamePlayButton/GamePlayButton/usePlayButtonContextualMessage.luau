local GamePlayButton = script:FindFirstAncestor("GamePlayButton")
local Parent = GamePlayButton.Parent
local PlayButtonStatesModule = require(GamePlayButton.PlayButtonStates)
local _ = require(Parent.PlayabilityRodux)
local PlayabilityStatusEnum = require(Parent.DiscoveryTypes).PlayabilityStatusEnum
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local LaunchErrorLocalizationKeys = require(Parent.GameLaunch).LaunchErrorLocalizationKeys
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GameHydrationReactModule = require(Parent.GameHydrationReact)
local FFlagEnableGameJoinEarlyAccess = require(Parent.SharedFlags).FFlagEnableGameJoinEarlyAccess
local UseGameProductInfoSelectorFunction = require(Parent.GameProductInfoRodux).useGameProductInfoSelector
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ExperienceDetailsNoticeType = require(Parent.DiscoveryTypes).ExperienceDetailsNoticeType

local function v9(RootPlaceId, p1, p2)
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

local function _(p1, p2, p3)
	-- upvalues: v9 (copy)
	local v1, Tbl = v9(p1, p2, p3)
	
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
	-- upvalues: UseAppPolicyFunction (copy), UseSelectorFunction (copy), GameHydrationReactModule (copy), UseGameProductInfoSelectorFunction (copy), UseLocalizationFunction (copy), PlayButtonStatesModule (copy), v9 (copy), ExperienceDetailsNoticeType (copy), FFlagEnableGameJoinEarlyAccess (copy), PlayabilityStatusEnum (copy)
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
	local UseGameInfoResult = GameHydrationReactModule.useGameInfo(p1)
	local RootPlaceId = UseSelectorResult1 and UseSelectorResult1.rootPlaceId or (UseGameInfoResult and UseGameInfoResult.rootPlaceId or nil)
	local UseGameProductInfoSelectorResult = UseGameProductInfoSelectorFunction(p1)
	local config = {
		agreeToNotice = "Feature.ExperienceDetails.PlayButtonMessage.AgreeToNotice"
	}
	local UnplayableOtherFallback = nil
	
	if UnplayableOther == PlayButtonStatesModule.UnplayableOther then
		local v1, Tbl = v9(RootPlaceId, p2, UseGameProductInfoSelectorResult)
		
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
		return if FFlagEnableGameJoinEarlyAccess and p2 ~= nil and p2.playabilityStatus == PlayabilityStatusEnum.PlusSubscriptionRequired then nil elseif UseSelectorResult and UseSelectorResult ~= "" then UseSelectorResult elseif UnplayableOther == PlayButtonStatesModule.UnplayableOther then UseLocalizationResult.unplayableOtherFallback else nil
	end
end