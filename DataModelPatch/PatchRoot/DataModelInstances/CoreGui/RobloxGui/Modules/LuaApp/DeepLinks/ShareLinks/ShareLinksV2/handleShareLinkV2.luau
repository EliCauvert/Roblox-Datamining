local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local AppPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage)
local Default = require(CorePackages.Workspace.Packages.ExperienceService).GameProtocol.default
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local HandleTrustedConnectionShareLinkModule = require(script.Parent.handleTrustedConnectionShareLink)
local LinkStatusModule = require(script.Parent.Parent.LinkStatus)
local SendShareLinkLatencyEventModule = require(script.Parent.Parent.Analytics.sendShareLinkLatencyEvent)
local ShareLinkTypesV2Module = require(script.Parent.ShareLinkTypesV2)
local _ = require(script.Parent.Parent.Types)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagTCShareLinkReceiverUI = SharedFlagsModule.FFlagTCShareLinkReceiverUI
local FFlagTCUpdateProfileCTAButton = SharedFlagsModule.FFlagTCUpdateProfileCTAButton
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusFlyoutEntry = SharedFlagsModule.FFlagEnableArgusFlyoutEntry
local FFlagArgusTabImpliesFlyout = SharedFlagsModule.FFlagArgusTabImpliesFlyout
local FFlagEnableArgusTab = SharedFlagsModule.FFlagEnableArgusTab
local FFlagArgoEnableMoments = SharedFlagsModule.FFlagArgoEnableMoments
local MomentsShareLinkExperiencePlaceId = game:DefineFastString("MomentsShareLinkExperiencePlaceId", "119524072047648")
local MomentsFixShareDeeplink = game:DefineFastFlag("MomentsFixShareDeeplink", false)
local MomentsBlockIneligibleShareLink = game:DefineFastFlag("MomentsBlockIneligibleShareLink", false)

return function(p1, p2)
	-- upvalues: ShareLinkTypesV2Module (copy), HttpService (copy), SendShareLinkLatencyEventModule (copy), LinkStatusModule (copy), Default (copy), FFlagTCShareLinkReceiverUI (copy), HandleTrustedConnectionShareLinkModule (copy), FFlagTCUpdateProfileCTAButton (copy), MomentsFixShareDeeplink (copy), FFlagEnableArgus (copy), FFlagEnableArgusTab (copy), FFlagEnableArgusFlyoutEntry (copy), FFlagArgoEnableMoments (copy), FFlagArgusTabImpliesFlyout (copy), UniversalAppPolicyModule (copy), MomentsBlockIneligibleShareLink (copy), CorePackages (copy), AppPageModule (copy), MomentsShareLinkExperiencePlaceId (copy)
	local ResponseBody = p1.responseBody or {}
	local LinkType = ResponseBody.linkType or ShareLinkTypesV2Module.Unknown
	local CustomData = ResponseBody.customData or {}
	local Text = tostring(ResponseBody.status)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	local config = {
		linkStatus = Text,
		linkId = p1.linkId,
		linkType = LinkType,
		isViaAppsFlyer = p1.isViaAppsFlyer,
		placeId = ResponseBody.targetId,
		joinAttemptId = HttpService:GenerateGUID(false)
	}
	ShareLinksAnalytics.resolveLink(config)
	
	local function _(PlaceId)
		-- upvalues: ShareLinksAnalytics (copy), p1 (copy), LinkType (copy), Text (copy), SendShareLinkLatencyEventModule (upval)
		return function(JoinAttemptId)
			-- upvalues: ShareLinksAnalytics (upval), p1 (upval), LinkType (upval), Text (upval), PlaceId (copy), SendShareLinkLatencyEventModule (upval)
			ShareLinksAnalytics.gameLaunch({
				linkId = p1.linkId,
				linkType = LinkType,
				linkStatus = Text,
				placeId = PlaceId,
				joinAttemptId = JoinAttemptId
			})
			SendShareLinkLatencyEventModule(LinkType, Text)
		end
	end
	
	if LinkType ~= ShareLinkTypesV2Module.Experience then
		if FFlagTCShareLinkReceiverUI and (LinkType == ShareLinkTypesV2Module.UserTrustedConnection or LinkType == ShareLinkTypesV2Module.StudioTrustedConnection) then
			return HandleTrustedConnectionShareLinkModule(Text, ResponseBody.targetId, HttpService:JSONDecode(CustomData).FriendRequestTokenIds, function()
				-- upvalues: ShareLinksAnalytics (copy), config (copy)
				ShareLinksAnalytics.errorDialogButtonClick(config)
			end, if FFlagTCUpdateProfileCTAButton then p2 else nil)
		end
		if LinkType == ShareLinkTypesV2Module.Moments and Text == LinkStatusModule.Valid then
			local Success, Result = pcall(function()
				-- upvalues: CustomData (copy), HttpService (upval)
				return if type(CustomData) == "string" and CustomData ~= "" then HttpService:JSONDecode(CustomData) else {}
			end)
			
			if not Success then
				Result = {}
			end
			local Result1 = if type(Result) == "table" then Result else {}
			local PostCreatorId = Result1.postCreatorId
			local Flag = true
			
			if MomentsFixShareDeeplink then
				Flag = false
				
				if FFlagEnableArgus and (FFlagEnableArgusTab or FFlagEnableArgusFlyoutEntry or FFlagArgoEnableMoments or FFlagArgusTabImpliesFlyout) then
					if UniversalAppPolicyModule.getAppFeaturePolicies().getDisplayMomentsMoreTabTile() then
						Flag = true
					elseif MomentsBlockIneligibleShareLink then
						return nil
					end
				end
			elseif FFlagEnableArgus then
				Flag = false
				
				if UniversalAppPolicyModule.getAppFeaturePolicies().getDisplayMomentsMoreTabTile() then
					if FFlagArgoEnableMoments then
						Flag = true
					else
						local CurrentExperimentConfig = require(CorePackages.Workspace.Packages.MomentsCommon).Flags.ArgusExperiment.getCurrentExperimentConfig()
						local IsFlyout = CurrentExperimentConfig.entryType == "flyout" or (FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout)
						Flag = CurrentExperimentConfig.entryType == "tab" or FFlagEnableArgusTab or IsFlyout and CurrentExperimentConfig.platformIntegration
					end
				end
			end
			if Flag then
				SendShareLinkLatencyEventModule(LinkType, Text)
				
				return {
					{
						{
							name = AppPageModule.Moments,
							extraProps = {
								source = "deeplink",
								postId = ResponseBody.targetId,
								userId = PostCreatorId
							}
						}
					}
				}
			else
				local Copy = table.clone(Result1)
				Copy.postId = ResponseBody.targetId
				Copy.postCreatorId = PostCreatorId
				Copy.source = "deeplink"
				p2.launchGame(MomentsShareLinkExperiencePlaceId, LinkType, { launchData = HttpService:JSONEncode(Copy) }, Default, "ExperienceValidLink", function(JoinAttemptId)
					-- upvalues: ShareLinksAnalytics (copy), p1 (copy), LinkType (copy), Text (copy), MomentsShareLinkExperiencePlaceId (copy), SendShareLinkLatencyEventModule (upval)
					ShareLinksAnalytics.gameLaunch({
						linkId = p1.linkId,
						linkType = LinkType,
						linkStatus = Text,
						placeId = MomentsShareLinkExperiencePlaceId,
						joinAttemptId = JoinAttemptId
					})
					SendShareLinkLatencyEventModule(LinkType, Text)
				end)
				
				return nil
			end
		end
	elseif Text == LinkStatusModule.Valid then
		local TargetId = ResponseBody.targetId
		p2.launchGame(ResponseBody.targetId, LinkType, { launchData = CustomData }, Default, "ExperienceValidLink", function(JoinAttemptId)
			-- upvalues: ShareLinksAnalytics (copy), p1 (copy), LinkType (copy), Text (copy), TargetId (copy), SendShareLinkLatencyEventModule (upval)
			ShareLinksAnalytics.gameLaunch({
				linkId = p1.linkId,
				linkType = LinkType,
				linkStatus = Text,
				placeId = TargetId,
				joinAttemptId = JoinAttemptId
			})
			SendShareLinkLatencyEventModule(LinkType, Text)
		end)
		
		return nil
	end
	return {
		{
			{ name = AppPageModule.Games },
			{
				name = AppPageModule.ShareLinkInvalidModal,
				extraProps = {
					closeModal = function()
						-- upvalues: ShareLinksAnalytics (copy), config (copy)
						ShareLinksAnalytics.errorDialogButtonClick(config)
					end
				}
			}
		}
	}
end