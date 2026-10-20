local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local GamePlayIntentModule = require(Modules.LuaApp.Analytics.Events.Games.gamePlayIntent)
local GetPlatformTargetFunction = require(CorePackages.Workspace.Packages.Analytics).getPlatformTarget
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local Pages = SocialLuaAnalyticsModule.Analytics.Enums.Pages
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(Modules.LuaApp.DeepLinks.ShareLinks.Types)
game:DefineFastString("ShareLinkAppOpen", "ShareLinkAppOpen")
game:DefineFastString("ShareLinkResolved", "ShareLinkResolved")
game:DefineFastString("ShareLinkErrorDialogCancelButtonClick", "ShareLinkErrorDialogCancelButtonClick")
game:DefineFastString("ShareLinkErrorDialogJoinButtonClick", "ShareLinkErrorDialogJoinButtonClick")
game:DefineFastString("ShareLinkLaunchGame", "ShareLinkLaunchGame")

local function _()
	return game:GetFastString("ShareLinkAppOpen")
end

local _ = function()
	return game:GetFastString("ShareLinkResolved")
end

local _ = function()
	return game:GetFastString("ShareLinkErrorDialogCancelButtonClick")
end

local _ = function()
	return game:GetFastString("ShareLinkErrorDialogJoinButtonClick")
end

local _ = function()
	return game:GetFastString("ShareLinkLaunchGame")
end

return {
	get = function(p1)
		-- upvalues: RoactAnalyticsModule (copy), Contexts (copy), EventTypes (copy), CryoModule (copy), GetPlatformTargetFunction (copy), Pages (copy), GamePlayIntentModule (copy)
		local GetResult = RoactAnalyticsModule.get(p1)
		
		return {
			openAppViaShareLink = function(p2)
				-- upvalues: GetResult (copy), Contexts (upval), EventTypes (upval), CryoModule (upval), GetPlatformTargetFunction (upval)
				GetResult.EventStream:setRBXEventStream(Contexts.ShareLinks, EventTypes.AppOpenViaShareLink, CryoModule.Dictionary.join({ target = GetPlatformTargetFunction() }, p2))
				GetResult.Diag:reportCounter(`{game:GetFastString("ShareLinkAppOpen")}{p2.linkType}{if p2.isViaAppsFlyer then "AppsFlyer" else ""}`, 1)
			end,
			resolveLink = function(p3)
				-- upvalues: GetResult (copy), Contexts (upval), EventTypes (upval), CryoModule (upval), GetPlatformTargetFunction (upval)
				GetResult.EventStream:setRBXEventStream(Contexts.ShareLinks, EventTypes.LinkResolved, CryoModule.Dictionary.join({ target = GetPlatformTargetFunction() }, p3))
				GetResult.Diag:reportCounter(game:GetFastString("ShareLinkResolved") .. p3.linkStatus .. p3.linkType, 1)
			end,
			errorDialogButtonClick = function(p3)
				-- upvalues: GetResult (copy), Contexts (upval), EventTypes (upval), CryoModule (upval), GetPlatformTargetFunction (upval), Pages (upval)
				GetResult.EventStream:setRBXEventStream(Contexts.ShareLinks, EventTypes.ButtonClick, CryoModule.Dictionary.join({
					btn = "cancel",
					target = GetPlatformTargetFunction(),
					page = Pages.ShareLinkErrorDialog
				}, p3))
				GetResult.Diag:reportCounter(game:GetFastString("ShareLinkErrorDialogCancelButtonClick") .. p3.linkType, 1)
			end,
			errorJoinDialogButtonClick = function(p3)
				-- upvalues: GetResult (copy), Contexts (upval), EventTypes (upval), CryoModule (upval), GetPlatformTargetFunction (upval), Pages (upval)
				GetResult.EventStream:setRBXEventStream(Contexts.ShareLinks, EventTypes.ButtonClick, CryoModule.Dictionary.join({
					btn = "join",
					target = GetPlatformTargetFunction(),
					page = Pages.ShareLinkErrorDialog
				}, p3))
				GetResult.Diag:reportCounter(game:GetFastString("ShareLinkErrorDialogJoinButtonClick") .. p3.linkType, 1)
			end,
			gameLaunch = function(p3)
				-- upvalues: GamePlayIntentModule (upval), GetResult (copy), Contexts (upval)
				GamePlayIntentModule(GetResult.EventStream, Contexts.ShareLinks, {
					placeId = p3.placeId,
					rootPlaceId = tonumber(p3.placeId),
					linkId = p3.linkId,
					linkType = p3.linkType,
					linkStatus = p3.linkStatus,
					joinAttemptId = p3.joinAttemptId
				})
				GetResult.Diag:reportCounter(game:GetFastString("ShareLinkLaunchGame") .. p3.linkType, 1)
			end
		}
	end
}