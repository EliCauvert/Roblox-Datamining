local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local OpenYouTubeVideoEventFunction = require(game:GetService("CorePackages").Workspace.Packages.DiscoveryAnalytics).Events.openYouTubeVideoEvent
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local Query = {
	autoplay = 1,
	controls = 0,
	modestbranding = 1,
	rel = 0,
	loop = 0,
	cc_load_policy = 0,
	playsinline = 0
}

return function(GuiService, Id, Title, p1, p2, p3, p4)
	-- upvalues: UrlBuilderModule (copy), Query (copy), OpenYouTubeVideoEventFunction (copy), HttpService (copy), NotificationTypeModule (copy)
	return function(_)
		-- upvalues: UrlBuilderModule (upval), Query (upval), Id (copy), OpenYouTubeVideoEventFunction (upval), p2 (copy), p1 (copy), Title (copy), p3 (copy), p4 (copy), HttpService (upval), GuiService (copy), NotificationTypeModule (upval)
		local Url = UrlBuilderModule.new({
			base = "https://www.youtube-nocookie.com",
			path = "/embed/{id}",
			query = Query
		})({ id = Id })
		OpenYouTubeVideoEventFunction(p2, p1, Title, Id, p3, p4)
		GuiService:BroadcastNotification(HttpService:JSONEncode({ animated = true, url = Url, title = Title }), NotificationTypeModule.OPEN_YOUTUBE_VIDEO)
	end
end