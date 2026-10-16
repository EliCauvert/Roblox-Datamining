local StarterGui = game:GetService("StarterGui")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local EventStream = require(game:GetService("CorePackages").Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local CoreScriptsCoreGuiEnableAnalyticsModule = {}
CoreScriptsCoreGuiEnableAnalyticsModule.__index = CoreScriptsCoreGuiEnableAnalyticsModule

function CoreScriptsCoreGuiEnableAnalyticsModule.new() --[[ Line: 19 ]]
	-- upvalues: EventStream (copy), RbxAnalyticsService (copy), StarterGui (copy), CoreScriptsCoreGuiEnableAnalyticsModule (copy)
	local config = {
		evenStream = EventStream.new(RbxAnalyticsService),
		playSessionStart = os.clock()
	}
	
	function config.sendCoreGuiAnalytic(p1, p2) --[[ Line: 25 ]]
		-- upvalues: config (copy), RbxAnalyticsService (upval)
		config.evenStream:sendEventDeferred("core_gui_type", "core_gui_type", {
			placeid = tostring(game.PlaceId),
			universeid = tostring(game.GameId),
			type = tostring(p1.Name),
			enabled = tostring(p2),
			sessionid = RbxAnalyticsService:GetSessionId(),
			playSessionDurationMs = tostring((math.round((os.clock() - config.playSessionStart) * 1000)))
		})
	end
	
	config.signalConnection = StarterGui.CoreGuiChangedSignal:Connect(function(CoreGuiType, Enabled) --[[ Line: 42 ]]
		-- upvalues: config (copy)
		config.sendCoreGuiAnalytic(CoreGuiType, Enabled)
	end)
	setmetatable(config, CoreScriptsCoreGuiEnableAnalyticsModule)
	
	return config
end

function CoreScriptsCoreGuiEnableAnalyticsModule:DisconnectSignal() --[[ Line: 50 ]]
	self.signalConnection:Disconnect()
end

local _ = CoreScriptsCoreGuiEnableAnalyticsModule.new()

return CoreScriptsCoreGuiEnableAnalyticsModule