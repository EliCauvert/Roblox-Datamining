local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local cryoModule = require(corePackagesService.Packages.Cryo)
local t = {}
t.__index = t
local _ = nil
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
function t.new(p1, p2)
	-- upvalues: localPlayer (write), rbxAnalyticsService (ref), t (ref)
	p1 = p1 or localPlayer.UserId
	assert(p1, "BlockingAnalytics must be passed the ID of the local user")
	p1 = {
		_eventStreamImpl = if p2 then p2.EventStream else rbxAnalyticsService,
		localUserId = p1
	}
	setmetatable(p1, t)
	
	return p1
end

function t:action(p1, p2, p3)
	-- upvalues: cryoModule (ref)
	self._eventStreamImpl:SendEventDeferred("AccountSettingsApi", p1, p2, cryoModule.Dictionary.join(p3 or {}, { blockerUserId = self.localUserId }))
end

return t