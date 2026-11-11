local Default = require(game:GetService("CorePackages").Workspace.Packages.ExperienceService).GameProtocol.default
local HttpService = game:GetService("HttpService")
local AppPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage)
local LinkStatusModule = require(script.Parent.LinkStatus)
local GetDeepValueFunction = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local SendShareLinkLatencyEventModule = require(script.Parent.Analytics.sendShareLinkLatencyEvent)
local ShareLinkTypesModule = require(script.Parent.ShareLinkTypes)
local _ = require(script.Parent.Types)
local FFlagShareLinkAddReferredByPlayerIdLaunchParamModule = require(script.Parent.Flags.FFlagShareLinkAddReferredByPlayerIdLaunchParam)
local config = {
	[string.lower(ShareLinkTypesModule.ExperienceInviteLinkType)] = {
		expiredLinkStr = "ExperienceInviteExpiredLink",
		responseInviteDataPath = "responseBody.experienceInviteData",
		validLinkStr = "ExperienceInviteValidLink",
		linkType = ShareLinkTypesModule.ExperienceInviteLinkType,
		invalidLinkPage = AppPageModule.InviteLinkExpiredModal
	},
	[string.lower(ShareLinkTypesModule.ScreenshotInviteLinkType)] = {
		expiredLinkStr = "ScreenshotInviteExpiredLink",
		responseInviteDataPath = "responseBody.screenshotInviteData",
		validLinkStr = "ScreenshotInviteValidLink",
		linkType = ShareLinkTypesModule.ScreenshotInviteLinkType,
		invalidLinkPage = AppPageModule.InviteLinkExpiredModal
	},
	[string.lower(ShareLinkTypesModule.PrivateServerLinkType)] = {
		expiredLinkStr = "PrivateServerExpiredLink",
		responseInviteDataPath = "responseBody.privateServerInviteData",
		validLinkStr = "PrivateServerValidLink",
		linkType = ShareLinkTypesModule.PrivateServerLinkType,
		invalidLinkPage = AppPageModule.ShareLinkInvalidModal
	}
}

return function(p1, p2)
	-- upvalues: config (copy), HttpService (copy), GetDeepValueFunction (copy), SendShareLinkLatencyEventModule (copy), LinkStatusModule (copy), FFlagShareLinkAddReferredByPlayerIdLaunchParamModule (copy), Default (copy), AppPageModule (copy), ShareLinkTypesModule (copy)
	local Entry = config[string.lower(p1.linkType)]
	local LinkType = Entry.linkType
	local ExpiredLinkStr = Entry.expiredLinkStr
	local ValidLinkStr = Entry.validLinkStr
	local InvalidLinkPage = Entry.invalidLinkPage
	local Guid = HttpService:GenerateGUID(false)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	local DeepValue = GetDeepValueFunction(p1, Entry.responseInviteDataPath) or {}
	local Text = tostring(DeepValue.status)
	local config1 = {
		linkStatus = Text,
		linkId = p1.linkId,
		linkType = p1.linkType,
		isViaAppsFlyer = p1.isViaAppsFlyer,
		placeId = DeepValue.placeId,
		joinAttemptId = Guid
	}
	ShareLinksAnalytics.resolveLink(config1)
	
	local function v19(JoinAttemptId)
		-- upvalues: ShareLinksAnalytics (copy), p1 (copy), Text (copy), DeepValue (copy), SendShareLinkLatencyEventModule (upval), LinkType (copy)
		ShareLinksAnalytics.gameLaunch({
			linkId = p1.linkId,
			linkType = p1.linkType,
			linkStatus = Text,
			placeId = DeepValue.placeId,
			joinAttemptId = JoinAttemptId
		})
		SendShareLinkLatencyEventModule(LinkType, Text)
	end
	
	local IsNotLaunchDataMatch: boolean = DeepValue.launchData and DeepValue.launchData ~= ""
	local LaunchData = DeepValue.launchData
	local InviterId = FFlagShareLinkAddReferredByPlayerIdLaunchParamModule and DeepValue.inviterId
	
	if Text == LinkStatusModule.Valid then
		p2.launchGame(DeepValue.placeId, LinkType, {
			gameInstanceId = if DeepValue.inviterId then nil else DeepValue.instanceId,
			userId = if DeepValue.inviterId then DeepValue.inviterId else nil,
			joinAttemptId = Guid,
			linkCode = DeepValue.linkCode,
			launchData = if IsNotLaunchDataMatch then LaunchData else nil,
			referredByPlayerId = if InviterId then DeepValue.inviterId else nil
		}, Default, ValidLinkStr, v19)
		
		return nil
	end
	local function LaunchGame()
		-- upvalues: IsNotLaunchDataMatch (copy), LaunchData (copy), InviterId (copy), DeepValue (copy), p2 (copy), LinkType (copy), Default (upval), ExpiredLinkStr (copy), v19 (copy)
		p2.launchGame(DeepValue.placeId, LinkType, {
			launchData = if IsNotLaunchDataMatch then LaunchData else nil,
			referredByPlayerId = if InviterId then DeepValue.inviterId else nil
		}, Default, ExpiredLinkStr, v19)
	end
	
	local List = { { name = AppPageModule.Games } }
	
	if LinkType == ShareLinkTypesModule.ExperienceInviteLinkType or LinkType == ShareLinkTypesModule.ScreenshotInviteLinkType then
		table.insert(List, {
			name = AppPageModule.GameDetail,
			detail = tostring(DeepValue.universeId),
			extraProps = { mountAsFullView = true, mountAnimation = false }
		})
	end
	table.insert(List, {
		name = InvalidLinkPage,
		extraProps = {
			launchGame = LaunchGame,
			closeModal = function(p3)
				-- upvalues: ShareLinksAnalytics (copy), config1 (copy)
				if p3 then
					ShareLinksAnalytics.errorJoinDialogButtonClick(config1)
					
					return
				else
					ShareLinksAnalytics.errorDialogButtonClick(config1)
				end
			end,
			universeId = tostring(DeepValue.universeId),
			linkStatus = Text
		}
	})
	
	return { { { name = AppPageModule.Games } }, List }
end