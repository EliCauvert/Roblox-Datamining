local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local PlayButtonReferralSource = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonReferralSource
local LinkStatusModule = require(script.Parent.LinkStatus)
local GetDeepValueFunction = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local CryoModule = require(CorePackages.Packages.Cryo)
local LogGameDetailsDeepLinkEventModule = require(script.Parent.Parent.logGameDetailsDeepLinkEvent)
local _ = require(script.Parent.Types)
local FFlagEnableShareLinksInGameDetailEvent = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent

return function(p1, p2)
	-- upvalues: GetDeepValueFunction (copy), CryoModule (copy), LinkStatusModule (copy), FFlagEnableShareLinksInGameDetailEvent (copy), LogGameDetailsDeepLinkEventModule (copy), AppPage (copy), PlayButtonReferralSource (copy)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	local Text = tostring((GetDeepValueFunction(p1, "responseBody.experienceDetailsInviteData") or {}).universeId)
	ShareLinksAnalytics.resolveLink((CryoModule.Dictionary.join(p1, {
		responseBody = CryoModule.None,
		type = CryoModule.None,
		linkStatus = LinkStatusModule.Valid,
		universeId = Text
	})))
	
	if FFlagEnableShareLinksInGameDetailEvent then
		LogGameDetailsDeepLinkEventModule(Text, "GameDetailsShareLink", {})
	else
		LogGameDetailsDeepLinkEventModule(Text, "GameDetailsShareLink")
	end
	return {
		{ { name = AppPage.Games } },
		{
			{ name = AppPage.Games },
			{
				name = AppPage.GameDetail,
				detail = Text,
				extraProps = {
					mountAsFullView = true,
					mountAnimation = false,
					referralSource = PlayButtonReferralSource.ExperienceDetailsLink
				}
			}
		}
	}
end