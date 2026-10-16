local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Module = {}
Module.__index = Module
local LocalPlayer = nil
LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
function Module.new(p1, p2) --[[ Line: 20 ]]
	-- upvalues: LocalPlayer (ref), RbxAnalyticsService (copy), Module (copy)
	local P0 = p1 or LocalPlayer.UserId
	assert(P0, "BlockingAnalytics must be passed the ID of the local user")
	local config = {
		_eventStreamImpl = p2 and p2.EventStream or RbxAnalyticsService,
		localUserId = P0
	}
	setmetatable(config, Module)
	
	return config
end

function Module:action(EventContext, EventName, p1) --[[ Line: 37 ]]
	-- upvalues: CryoModule (copy)
	self._eventStreamImpl:SendEventDeferred("AccountSettingsApi", EventContext, EventName, (CryoModule.Dictionary.join(p1 or {}, { blockerUserId = self.localUserId })))
end

return Module