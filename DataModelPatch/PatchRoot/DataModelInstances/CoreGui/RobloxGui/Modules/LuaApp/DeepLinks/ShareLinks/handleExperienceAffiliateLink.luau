local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local PlayButtonReferralSource = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonReferralSource
local ExperienceJoinDataHelperModule = require(script.Parent.Parent.Utils.ExperienceJoinDataHelper)
local LinkStatusModule = require(script.Parent.LinkStatus)
local GetDeepValueFunction = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local CryoModule = require(CorePackages.Packages.Cryo)
local LogGameDetailsDeepLinkEventModule = require(script.Parent.Parent.logGameDetailsDeepLinkEvent)
local _ = require(script.Parent.Types)
local ExperienceAffiliateDeepLinkFallbackTypeModule = require(script.Parent.Enums.ExperienceAffiliateDeepLinkFallbackType)
local FFlagEnableShareLinksInGameDetailEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent

function shouldResolveToProfileFallbackType(p1): boolean
	-- upvalues: ExperienceAffiliateDeepLinkFallbackTypeModule (copy)
	local FromRawValueResult = ExperienceAffiliateDeepLinkFallbackTypeModule.fromRawValue(p1)
	
	return FromRawValueResult ~= nil and FromRawValueResult == ExperienceAffiliateDeepLinkFallbackTypeModule.EXPERIENCE_AFFILIATE_DEEP_LINK_FALLBACK_TYPE_PROFILE
end

return function(p1, p2)
	-- upvalues: GetDeepValueFunction (copy), AppPage (copy), CryoModule (copy), LinkStatusModule (copy), FFlagEnableShareLinksInGameDetailEvent (copy), LogGameDetailsDeepLinkEventModule (copy), PlayButtonReferralSource (copy), ExperienceJoinDataHelperModule (copy)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	local ResponseBodyExperienceAffiliateData = GetDeepValueFunction(p1, "responseBody.experienceAffiliateData") or {}
	
	if ResponseBodyExperienceAffiliateData.universeId == nil or ResponseBodyExperienceAffiliateData.universeId == 0 then
		ShareLinksAnalytics.resolveLink((CryoModule.Dictionary.join(p1, {
			responseBody = CryoModule.None,
			type = CryoModule.None,
			linkStatus = LinkStatusModule.Valid
		})))
		
		return if shouldResolveToProfileFallbackType(ResponseBodyExperienceAffiliateData.fallbackType) then {
			{
				{ name = AppPage.Home },
				{
					name = AppPage.ProfilePlatform,
					detail = tostring(ResponseBodyExperienceAffiliateData.fallbackId)
				}
			}
		} else { { { name = AppPage.Home } } }
	end
	local GameDetail = AppPage.GameDetail
	local Text = tostring(ResponseBodyExperienceAffiliateData.universeId)
	ShareLinksAnalytics.resolveLink((CryoModule.Dictionary.join(p1, {
		responseBody = CryoModule.None,
		type = CryoModule.None,
		linkStatus = LinkStatusModule.Valid,
		universeId = Text
	})))
	
	if FFlagEnableShareLinksInGameDetailEvent then
		LogGameDetailsDeepLinkEventModule(Text, "ExperienceAffiliateShareLink", { linkType = p1.linkType, linkId = p1.linkId })
	else
		LogGameDetailsDeepLinkEventModule(Text, "ExperienceAffiliateShareLink")
	end
	local config = {
		mountAsFullView = true,
		mountAnimation = false,
		referralSource = PlayButtonReferralSource.ExperienceAffiliateLink
	}
	local JoinData = ResponseBodyExperienceAffiliateData.joinData
	
	return {
		{ { name = AppPage.Games } },
		{
			{ name = AppPage.Games },
			{
				name = GameDetail,
				detail = Text,
				extraProps = if JoinData then ExperienceJoinDataHelperModule.mergeExperienceJoinData(config, JoinData) else config
			}
		}
	}
end