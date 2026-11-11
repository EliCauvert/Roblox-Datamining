local CorePackages = game:GetService("CorePackages")
local EventIngestService = game:GetService("EventIngestService")
local SessionService = game:GetService("SessionService")
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local GameDetailReferralModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Analytics.Events.Games.gameDetailReferral)
local SetGamePlaySessionFunction = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType

local function logGameDetailsDeepLinkEvent(UniverseId, p1, p2)
	-- upvalues: EventIngest (copy), EventIngestService (copy), SetGamePlaySessionFunction (copy), SessionService (copy), SessionType (copy), GameDetailReferralModule (copy)
	local config = {
		pg = "deepLink",
		universeId = UniverseId,
		shareLinkType = p2.linkType,
		shareLinkId = p2.linkId
	}
	local NewEventIngest = EventIngest.new(EventIngestService)
	SetGamePlaySessionFunction(SessionService, SessionType.StructuralIdentifier.GameDetailSource, false)
	GameDetailReferralModule(NewEventIngest, p1, config)
end

local function DEPRECATED_logGameDetailsDeepLinkEvent(UniverseId, p1)
	-- upvalues: EventIngest (copy), EventIngestService (copy), GameDetailReferralModule (copy)
	GameDetailReferralModule(EventIngest.new(EventIngestService), p1, { pg = "deepLink", universeId = UniverseId })
end

return if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent then logGameDetailsDeepLinkEvent else DEPRECATED_logGameDetailsDeepLinkEvent