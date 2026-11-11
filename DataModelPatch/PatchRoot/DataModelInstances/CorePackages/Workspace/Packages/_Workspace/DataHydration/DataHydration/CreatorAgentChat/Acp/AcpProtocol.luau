local UrlBase = require(script:FindFirstAncestor("DataHydration").Parent.UrlBuilder).UrlBase
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
		SessionReadTasks = "_roblox/session/read_tasks"
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
		Gone = -32005
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
	buildSessionNewWireParams = function(SessionNewWireParams)
		local config = {
			universeId = SessionNewWireParams.project.universeId,
			placeId = SessionNewWireParams.project.placeId
		}
		
		if SessionNewWireParams.experiment ~= nil then
			config.experiment = SessionNewWireParams.experiment
		end
		return {
			cwd = SessionNewWireParams.cwd,
			mcpServers = SessionNewWireParams.mcpServers,
			_meta = { _roblox = config }
		}
	end
}