local starterGuiService = game:GetService("StarterGui")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local eventStream = require(game:GetService("CorePackages").Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local t = {}
t.__index = t

function t.new()
	-- upvalues: eventStream (ref), rbxAnalyticsService (ref), t (ref)
	local t_1 = { evenStream = eventStream.new(rbxAnalyticsService) }
	setmetatable(t_1, t)
	
	return t_1
end

function t:sendCoreGuiFinalAnalytic()
	-- upvalues: rbxAnalyticsService (ref), starterGuiService (ref)
	local t = {
		placeid = tostring(game.PlaceId),
		universeid = tostring(game.GameId),
		sessionid = rbxAnalyticsService:GetSessionId()
	}
	
	for i, v in Enum.CoreGuiType:GetEnumItems() do
		t[v.Name] = tostring(starterGuiService:GetCoreGuiEnabled(v))
	end
	local var5 = ""
	pcall(function()
		-- upvalues: var5 (write), starterGuiService (copy)
		var5 = tostring(starterGuiService:GetCore("ResetButtonCallback"))
	end)
	t.ResetButtonCallback = var5
	self.evenStream:sendEventDeferred("core_gui_final_state", "core_gui_final_state", t)
end

return t