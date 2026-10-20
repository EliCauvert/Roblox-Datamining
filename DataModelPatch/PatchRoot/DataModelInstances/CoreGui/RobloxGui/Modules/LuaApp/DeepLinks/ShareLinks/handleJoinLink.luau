local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local AffiliateJoinLinkResolver = require(CorePackages.Workspace.Packages.AffiliateLinks).AffiliateJoinLinkResolver
local PlayButtonReferralSource = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonReferralSource
local ExperienceJoinDataHelperModule = require(script.Parent.Parent.Utils.ExperienceJoinDataHelper)
local LinkStatusModule = require(script.Parent.LinkStatus)
local LogGameDetailsDeepLinkEventModule = require(script.Parent.Parent.logGameDetailsDeepLinkEvent)
local _ = require(script.Parent.Types)
local ShareLinkTypesModule = require(script.Parent.ShareLinkTypes)
local FFlagEnableShareLinksInGameDetailEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent

return function(p1, _, p2)
	-- upvalues: AffiliateJoinLinkResolver (copy), AppPage (copy), LinkStatusModule (copy), ShareLinkTypesModule (copy), FFlagEnableShareLinksInGameDetailEvent (copy), LogGameDetailsDeepLinkEventModule (copy), PlayButtonReferralSource (copy), ExperienceJoinDataHelperModule (copy)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	
	return AffiliateJoinLinkResolver.resolveReferralCode(p2.network, p1):andThen(function(Result)
		-- upvalues: AppPage (upval), LinkStatusModule (upval), ShareLinkTypesModule (upval), ShareLinksAnalytics (copy), FFlagEnableShareLinksInGameDetailEvent (upval), LogGameDetailsDeepLinkEventModule (upval), PlayButtonReferralSource (upval), ExperienceJoinDataHelperModule (upval)
		local Detail: string? = nil
		local ResponseBody = Result.responseBody
		local GameDetail = AppPage.GameDetail
		local Text = tostring(ResponseBody.linkId)
		
		if ResponseBody.universeId ~= nil and ResponseBody.universeId ~= 0 then
			Detail = tostring(ResponseBody.universeId)
		end
		ShareLinksAnalytics.resolveLink({
			isViaAppsFlyer = false,
			linkStatus = LinkStatusModule.Valid,
			linkType = ShareLinkTypesModule.ExperienceAffiliate,
			linkId = Text,
			universeId = Detail
		})
		
		if ResponseBody.universeId == nil or ResponseBody.universeId == 0 then
			return if ResponseBody.fallbackType == "Profile" then {
				{
					{ name = AppPage.Home },
					{
						name = AppPage.ProfilePlatform,
						detail = tostring(ResponseBody.fallbackId)
					}
				}
			} else { { { name = AppPage.Home } } }
		end
		if FFlagEnableShareLinksInGameDetailEvent then
			LogGameDetailsDeepLinkEventModule(Detail, "ExperienceAffiliateShareLink", {
				linkType = ShareLinkTypesModule.ExperienceAffiliate,
				linkId = Text
			})
		else
			LogGameDetailsDeepLinkEventModule(Detail, "ExperienceAffiliateShareLink")
		end
		local config = {
			mountAsFullView = true,
			mountAnimation = false,
			referralSource = PlayButtonReferralSource.ExperienceAffiliateLink
		}
		local JoinData = ResponseBody.joinData
		
		return {
			{ { name = AppPage.Games } },
			{
				{ name = AppPage.Games },
				{
					name = GameDetail,
					detail = Detail,
					extraProps = if JoinData then ExperienceJoinDataHelperModule.mergeExperienceJoinData(config, JoinData) else config
				}
			}
		}
	end):catch(function()
		-- upvalues: LinkStatusModule (upval), ShareLinkTypesModule (upval), ShareLinksAnalytics (copy), AppPage (upval)
		local config = {
			linkId = "",
			isViaAppsFlyer = false,
			linkStatus = LinkStatusModule.Invalid,
			linkType = ShareLinkTypesModule.ExperienceAffiliate
		}
		ShareLinksAnalytics.resolveLink(config)
		
		return {
			{
				{ name = AppPage.Home },
				{
					name = AppPage.ShareLinkInvalidModal,
					extraProps = {
						closeModal = function()
							-- upvalues: ShareLinksAnalytics (upval), config (copy)
							ShareLinksAnalytics.errorJoinDialogButtonClick(config)
						end
					}
				}
			}
		}
	end)
end