local starterGuiService = game:GetService("StarterGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local eventStream = require(game:GetService("CorePackages").Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local t = {}
t.__index = t

function t.new()
	-- upvalues: eventStream (ref), rbxAnalyticsService (ref), starterGuiService (ref), t (ref)
	local t_1 = {
		evenStream = eventStream.new(rbxAnalyticsService),
		playSessionStart = os.clock()
	}
	
	function t_1.sendCoreGuiAnalytic(p1, p2)
		-- upvalues: t_1 (ref), rbxAnalyticsService (copy)
		local _ = nil
		t_1.evenStream:sendEventDeferred("core_gui_type", "core_gui_type", {
			placeid = tostring(game.PlaceId),
			universeid = tostring(game.GameId),
			type = tostring(p1.Name),
			enabled = tostring(p2),
			sessionid = rbxAnalyticsService:GetSessionId(),
			playSessionDurationMs = tostring(math.round((os.clock() - t_1.playSessionStart) * 1000))
		})
	end
	
	t_1.signalConnection = starterGuiService.CoreGuiChangedSignal:Connect(function(p1, p2)
		-- upvalues: t_1 (ref)
		t_1.sendCoreGuiAnalytic(p1, p2)
	end)
	setmetatable(t_1, t)
	
	return t_1
end

function t:DisconnectSignal()
	self.signalConnection:Disconnect()
end

local _ = t.new()

return t