local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FFlagBuildExperienceModelPickerData = require(Parent.SharedFlags).FFlagBuildExperienceModelPickerData
local _ = require(script.Parent.Parent.Types.model)
local MyStatsExperienceStatsPath = game:DefineFastString("MyStatsExperienceStatsPath", "/my-stats-service/v1")

return {
	ProtocolVersion = 2,
	CapRtnNamespace = "AssistantPlugin",
	acpUrl = function(): string
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
	extractSessionNewProject = function(p1)
		if typeof(p1) == "table" then
			local Roblox = p1._meta and p1._meta._roblox
			
			return if typeof(Roblox) == "table" and typeof(Roblox.universeId) == "number" and typeof(Roblox.placeId) == "number" then Roblox else nil
		else
			return nil
		end
	end,
	buildSessionNewWireParams = function(_roblox)
		-- upvalues: FFlagBuildExperienceModelPickerData (copy)
		local config = {
			universeId = _roblox.project.universeId,
			placeId = _roblox.project.placeId
		}
		
		if _roblox.experiment ~= nil then
			config.experiment = _roblox.experiment
		end
		if FFlagBuildExperienceModelPickerData and _roblox.model ~= nil then
			config.model = _roblox.model
		end
		if _roblox.application ~= nil then
			config.application = _roblox.application
		end
		return {
			cwd = _roblox.cwd,
			mcpServers = _roblox.mcpServers,
			_meta = { _roblox = config }
		}
	end,
	buildSessionPromptWireParams = function(p1)
		-- upvalues: FFlagBuildExperienceModelPickerData (copy)
		local config = { sessionId = p1.sessionId, prompt = p1.prompt }
		
		if FFlagBuildExperienceModelPickerData and (p1.model ~= nil or p1.experiment ~= nil) then
			local T = if p1.meta == nil then {} else table.clone(p1.meta)
			local T1 = if T._roblox == nil then {} else table.clone(T._roblox)
			
			if p1.model ~= nil then
				T1.model = p1.model
			end
			if p1.experiment ~= nil then
				T1.experiment = p1.experiment
			end
			T._roblox = T1
			config._meta = T
			
			return config
		elseif p1.experiment == nil then
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