local urlBase = require(script:FindFirstAncestor("DataHydration").Parent.UrlBuilder).UrlBase
local myStatsExperienceStatsPath = game:DefineFastString("MyStatsExperienceStatsPath", "/my-stats-service/v1")

return {
	ProtocolVersion = 2,
	CapRtnNamespace = "AssistantPlugin",
	acpUrl = function()
		-- upvalues: urlBase (ref), myStatsExperienceStatsPath (ref)
		return urlBase.APIS .. myStatsExperienceStatsPath
	end,
	ACP_PATH = myStatsExperienceStatsPath,
	Methods = {
		Initialize = "initialize",
		SessionNew = "session/new",
		SessionList = "session/list",
		SessionLoad = "session/load",
		SessionPrompt = "session/prompt",
		SessionCancel = "session/cancel",
		SessionFindByUniverse = "_roblox/session/find_by_universe",
		SessionDelete = "_roblox/session/delete",
		SessionUpdateInfo = "_roblox/session/update_info",
		SessionReadTasks = "_roblox/session/read_tasks",
		SessionSaveAndPublish = "_roblox/session/save_and_publish",
		AdCampaignEligibility = "_roblox/ad_campaign/eligibility",
		AdCampaignCheckFunds = "_roblox/ad_campaign/check_funds",
		AdCampaignCreate = "_roblox/ad_campaign/create"
	},
	Notifications = { SessionUpdate = "session/update" },
	ErrorCodes = {
		ParseError = -32700,
		InvalidRequest = -32600,
		MethodNotFound = -32601,
		InvalidParams = -32602,
		InternalError = -32603,
		Unauthorized = -32000,
		Forbidden = -32001,
		NotFound = -32002,
		Conflict = -32003,
		UpstreamUnavailable = -32004,
		Gone = -32005,
		OutOfCredits = -32006,
		PayloadTooLarge = -32007,
		InsufficientFunds = -32008,
		MissingThumbnail = -32009
	},
	AskTool = { Name = "ask_tool" },
	extractSessionNewProject = function(p1)
		if typeof(p1) ~= "table" then
			return nil
		end
		local roblox = p1._meta and p1._meta._roblox
		
		return if typeof(roblox) == "table" and typeof(roblox.universeId) == "number" and typeof(roblox.placeId) == "number" then roblox else nil
	end,
	buildSessionNewWireParams = function(p1)
		local t = {
			universeId = p1.project.universeId,
			placeId = p1.project.placeId
		}
		
		if p1.experiment ~= nil then
			t.experiment = p1.experiment
		end
		if p1.application ~= nil then
			t.application = p1.application
		end
		return {
			cwd = p1.cwd,
			mcpServers = p1.mcpServers,
			_meta = { _roblox = t }
		}
	end,
	buildSessionPromptWireParams = function(p1)
		local t = { sessionId = p1.sessionId, prompt = p1.prompt }
		
		if p1.experiment == nil then
			if p1.meta ~= nil then
				t._meta = p1.meta
			end
			return t
		else
			local t_1 = {}
			
			if p1.meta ~= nil and p1.meta._roblox ~= nil then
				for i, v in p1.meta._roblox do
					t_1[i] = v
				end
			end
			t_1.experiment = p1.experiment
			t._meta = { _roblox = t_1 }
			
			return t
		end
	end
}