local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local SocialStopwatchModule = require(CorePackages.Workspace.Packages.SocialStopwatch)
local HandleExperienceInviteLinkResponseModule = require(script.Parent.handleExperienceInviteLinkResponse)
local HandleInvalidLinkModule = require(script.Parent.handleInvalidLink)
local HandleOffNetworkFriendRequestModule = require(script.Parent.handleOffNetworkFriendRequest)
local HandleExperienceDetailsLinkModule = require(script.Parent.handleExperienceDetailsLink)
local HandleExperienceAffiliateLinkModule = require(script.Parent.handleExperienceAffiliateLink)
local HandleAvatarItemDetailsLinkModule = require(script.Parent.handleAvatarItemDetailsLink)
local HandleNotificationExperienceInviteLinkModule = require(script.Parent.handleNotificationExperienceInviteLink)
local HandleProfileLinkModule = require(script.Parent.handleProfileLink)
local HandleExperienceEventLinkModule = require(script.Parent.handleExperienceEventLink)
local HandleShareLinkV2Module = require(script.Parent.ShareLinksV2.handleShareLinkV2)
local LinkStatus = require(script.Parent.dependencies).ShareLinksRodux.Enums.LinkStatus
local ShareLinkTypesModule = require(script.Parent.ShareLinkTypes)
local _ = require(script.Parent.Types)
local CryoModule = require(CorePackages.Packages.Cryo)
local FFlagTCShareLinkReceiverUI = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkReceiverUI
local FFlagTCShareLinkErrorModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal

return function(p1, p2)
	-- upvalues: ShareLinkTypesModule (copy), SocialStopwatchModule (copy), FFlagTCShareLinkReceiverUI (copy), FFlagTCShareLinkErrorModal (copy), CryoModule (copy), HandleShareLinkV2Module (copy), AppPage (copy), LinkStatus (copy), HandleInvalidLinkModule (copy), HandleExperienceInviteLinkResponseModule (copy), HandleOffNetworkFriendRequestModule (copy), HandleExperienceDetailsLinkModule (copy), HandleExperienceAffiliateLinkModule (copy), HandleAvatarItemDetailsLinkModule (copy), HandleProfileLinkModule (copy), HandleNotificationExperienceInviteLinkModule (copy), HandleExperienceEventLinkModule (copy)
	local Lowered = string.lower(p1.type or ShareLinkTypesModule.Unknown)
	local Code = p1.code
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.ShareLinkOpened)
	p2.closeCentralOverlay()
	
	if p1.v == "v2" or FFlagTCShareLinkReceiverUI and p1.v == "v2-filtered" then
		return if FFlagTCShareLinkErrorModal then p2.resolveLinkFromLinkIdV2(Code):andThen(function(Result)
			-- upvalues: ShareLinksAnalytics (copy), CryoModule (upval), p1 (copy), Code (copy), HandleShareLinkV2Module (upval), Lowered (copy), p2 (copy)
			ShareLinksAnalytics.openAppViaShareLink(CryoModule.Dictionary.union(p1, {
				code = CryoModule.None,
				linkId = Code,
				linkType = Result.responseBody.linkType,
				type = CryoModule.None
			}))
			
			return HandleShareLinkV2Module({
				linkId = Code,
				linkType = Lowered,
				responseBody = Result.responseBody,
				isViaAppsFlyer = p1.isViaAppsFlyer
			}, p2)
		end):catch(function()
			-- upvalues: SocialStopwatchModule (upval), AppPage (upval), ShareLinksAnalytics (copy), Code (copy), Lowered (copy), LinkStatus (upval)
			SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ShareLinkOpened)
			
			return {
				{
					{ name = AppPage.Home },
					{
						name = AppPage.ShareLinkInvalidModal,
						extraProps = {
							closeModal = function()
								-- upvalues: ShareLinksAnalytics (upval), Code (upval), Lowered (upval), LinkStatus (upval)
								ShareLinksAnalytics.errorJoinDialogButtonClick({
									linkId = Code,
									linkType = Lowered,
									linkStatus = LinkStatus.Invalid.rawValue()
								})
							end
						}
					}
				}
			}
		end) else p2.resolveLinkFromLinkIdV2(Code):andThen(function(Result)
			-- upvalues: ShareLinksAnalytics (copy), CryoModule (upval), p1 (copy), Code (copy), HandleShareLinkV2Module (upval), Lowered (copy), p2 (copy)
			ShareLinksAnalytics.openAppViaShareLink(CryoModule.Dictionary.union(p1, {
				code = CryoModule.None,
				linkId = Code,
				linkType = Result.responseBody.linkType,
				type = CryoModule.None
			}))
			
			return HandleShareLinkV2Module({
				linkId = Code,
				linkType = Lowered,
				responseBody = Result.responseBody,
				isViaAppsFlyer = p1.isViaAppsFlyer
			}, p2)
		end)
	end
	ShareLinksAnalytics.openAppViaShareLink(CryoModule.Dictionary.join(p1, {
		code = CryoModule.None,
		linkId = Code,
		linkType = Lowered,
		type = CryoModule.None
	}))
	
	if Lowered == string.lower(ShareLinkTypesModule.Home) then
		SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ShareLinkOpened)
		
		return { { { name = AppPage.Home } } }
	elseif Lowered == string.lower(ShareLinkTypesModule.Unknown) then
		SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ShareLinkOpened)
		
		return HandleInvalidLinkModule({
			type = Lowered,
			code = p1.code,
			isViaAppsFlyer = p1.isViaAppsFlyer,
			stamp = p1.stamp
		}, p2)
	else
		return p2.resolveLinkFromLinkId(Code, Lowered):andThen(function(Result)
			-- upvalues: CryoModule (upval), p1 (copy), Lowered (copy), Code (copy), ShareLinkTypesModule (upval), HandleExperienceInviteLinkResponseModule (upval), p2 (copy), HandleOffNetworkFriendRequestModule (upval), HandleExperienceDetailsLinkModule (upval), HandleExperienceAffiliateLinkModule (upval), HandleAvatarItemDetailsLinkModule (upval), HandleProfileLinkModule (upval), HandleNotificationExperienceInviteLinkModule (upval), HandleExperienceEventLinkModule (upval), SocialStopwatchModule (upval)
			local JoinResult = CryoModule.Dictionary.join(p1, {
				code = CryoModule.None,
				linkType = Lowered,
				linkId = Code,
				responseBody = Result.responseBody
			})
			
			if Lowered == string.lower(ShareLinkTypesModule.ExperienceInviteLinkType) or Lowered == string.lower(ShareLinkTypesModule.PrivateServerLinkType) then
				return (HandleExperienceInviteLinkResponseModule(JoinResult, p2))
			elseif Lowered == string.lower(ShareLinkTypesModule.ScreenshotInviteLinkType) then
				return HandleExperienceInviteLinkResponseModule(JoinResult, p2)
			elseif Lowered == string.lower(ShareLinkTypesModule.OffNetworkFriendRequestLinkType) then
				return HandleOffNetworkFriendRequestModule(JoinResult, p2)
			elseif Lowered == string.lower(ShareLinkTypesModule.ExperienceDetails) then
				return HandleExperienceDetailsLinkModule(JoinResult, p2)
			elseif Lowered == string.lower(ShareLinkTypesModule.ExperienceAffiliate) then
				return HandleExperienceAffiliateLinkModule(JoinResult, p2)
			elseif Lowered == string.lower(ShareLinkTypesModule.AvatarItemDetails) then
				return HandleAvatarItemDetailsLinkModule(JoinResult, p2)
			elseif Lowered == string.lower(ShareLinkTypesModule.Profile) then
				return HandleProfileLinkModule(JoinResult, p2, p1.source)
			elseif Lowered == string.lower(ShareLinkTypesModule.NotificationExperienceInviteLinkType) then
				return HandleNotificationExperienceInviteLinkModule(JoinResult, p2)
			elseif Lowered == string.lower(ShareLinkTypesModule.ExperienceEvent) then
				return HandleExperienceEventLinkModule(JoinResult, p2)
			else
				SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ShareLinkOpened)
				
				return nil
			end
		end):catch(function()
			-- upvalues: SocialStopwatchModule (upval), AppPage (upval), ShareLinksAnalytics (copy), Code (copy), Lowered (copy), LinkStatus (upval)
			SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ShareLinkOpened)
			
			return {
				{ { name = AppPage.Games } },
				{
					{ name = AppPage.Games },
					{
						name = AppPage.ShareLinkInvalidModal,
						extraProps = {
							closeModal = function()
								-- upvalues: ShareLinksAnalytics (upval), Code (upval), Lowered (upval), LinkStatus (upval)
								ShareLinksAnalytics.errorJoinDialogButtonClick({
									linkId = Code,
									linkType = Lowered,
									linkStatus = LinkStatus.Invalid.rawValue()
								})
							end
						}
					}
				}
			}
		end)
	end
end