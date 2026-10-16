local UrlBase = require(script:FindFirstAncestor("DataHydration").Parent.UrlBuilder).UrlBase
local MyStatsExperienceStatsPath = game:DefineFastString("MyStatsExperienceStatsPath", "/my-stats-service/v1")

return {
	ProtocolVersion = 2,
	CapRtnNamespace = "AssistantPlugin",
	acpUrl = function(): string --[[ Line: 12 ]]
		-- upvalues: UrlBase (copy), MyStatsExperienceStatsPath (copy)
		return UrlBase.APIS .. MyStatsExperienceStatsPath
	end,
	ACP_PATH = MyStatsExperienceStatsPath,
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
		AdCampaignCreate = "_roblox/ad_campaign/create",
		AdCampaignToolCallStatus = "_roblox/ad_campaign/tool_call_status"
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
	extractSessionNewProject = function(p1) --[[ Line: 56 ]]
		if typeof(p1) == "table" then
			local Roblox = p1._meta and p1._meta._roblox
			
			return if typeof(Roblox) == "table" and typeof(Roblox.universeId) == "number" and typeof(Roblox.placeId) == "number" then Roblox else nil
		else
			return nil
		end
	end,
	buildSessionNewWireParams = function(p1) --[[ Line: 67 ]]
		local config = {
			universeId = p1.project.universeId,
			placeId = p1.project.placeId
		}
		
		if p1.experiment ~= nil then
			config.experiment = p1.experiment
		end
		if p1.application ~= nil then
			config.application = p1.application
		end
		return {
			cwd = p1.cwd,
			mcpServers = p1.mcpServers,
			_meta = { _roblox = config }
		}
	end,
	buildSessionPromptWireParams = function(p1) --[[ Line: 101 ]]
		local config = { sessionId = p1.sessionId, prompt = p1.prompt }
		
		if p1.experiment == nil then
			if p1.meta ~= nil then
				config._meta = p1.meta
			end
			return config
		else
			local _roblox = {}
			
			if p1.meta ~= nil and p1.meta._roblox ~= nil then
				for i, value in p1.meta._roblox do
					_roblox[i] = value
				end
			end
			_roblox.experiment = p1.experiment
			config._meta = { _roblox = _roblox }
			
			return config
		end
	end
}