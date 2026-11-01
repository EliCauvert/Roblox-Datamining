local Leaderboards = script:FindFirstAncestor("Leaderboards")
local Parent = Leaderboards.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local SduiApiStorePostConfigContentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType
local SduiCapabilities = SduiSharedUtilitiesModule.SduiCapabilities
local GetExperienceLeaderboardSeeAllUrlModule = require(Leaderboards.ExperienceLeaderboardSeeAllPage.getExperienceLeaderboardSeeAllUrl)
local GetExperienceLeaderboardSeeAllPageKeyModule = require(Leaderboards.ExperienceLeaderboardSeeAllPage.getExperienceLeaderboardSeeAllPageKey)
local t = {}

return function(p1, Initial_tab, LoadTimer, p2)
	-- upvalues: GetExperienceLeaderboardSeeAllUrlModule (copy), GetExperienceLeaderboardSeeAllPageKeyModule (copy), t (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy), SduiApiStorePostConfigContentType (copy), SduiCapabilities (copy), GetSduiTemplateStoreFunction (copy)
	local ExperienceLeaderboardSeeAllUrlModule = GetExperienceLeaderboardSeeAllUrlModule()
	local ExperienceLeaderboardSeeAllPageKeyModule = GetExperienceLeaderboardSeeAllPageKeyModule(p1)
	local IsNotEntryMatch: boolean = Initial_tab ~= nil and t[ExperienceLeaderboardSeeAllPageKeyModule] ~= Initial_tab
	t[ExperienceLeaderboardSeeAllPageKeyModule] = Initial_tab or false
	local SeeAll = require(Parent.ServiceContractsProto).apppageplatform.experienceleaderboard.see_all
	GetSduiApiStoreFunction().fetchIfNeeded({
		enableTemplateCache = true,
		responseType = SduiResponseType.Protobuf,
		url = ExperienceLeaderboardSeeAllUrlModule,
		surfaceKey = AppPage.ExperienceLeaderboardSeeAll,
		configKey = ExperienceLeaderboardSeeAllPageKeyModule,
		loadTimer = LoadTimer,
		apiProto = SeeAll.ExperienceLeaderboardSeeAllResponse,
		postConfig = {
			contentType = SduiApiStorePostConfigContentType.Proto,
			protoMessage = SeeAll.ExperienceLeaderboardSeeAllRequest,
			body = SeeAll.ExperienceLeaderboardSeeAllRequest.new({
				universe_id = tonumber(p1),
				initial_tab = Initial_tab,
				client_capabilities = SduiCapabilities.buildClientCapabilities(),
				cached_roblox_component_to_template_id = GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.ExperienceLeaderboardSeeAll)
			})
		}
	}, p2 or IsNotEntryMatch)
	
	return ExperienceLeaderboardSeeAllUrlModule
end