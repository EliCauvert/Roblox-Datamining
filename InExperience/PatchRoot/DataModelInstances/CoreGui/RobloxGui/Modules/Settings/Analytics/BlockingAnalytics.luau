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
function t.new(p0, p1)
	-- upvalues: localPlayer (write), rbxAnalyticsService (ref), t (ref)
	p0 = p0 or localPlayer.UserId
	assert(p0, "BlockingAnalytics must be passed the ID of the local user")
	p0 = {
		_eventStreamImpl = if p1 then p1.EventStream else rbxAnalyticsService,
		localUserId = p0
	}
	setmetatable(p0, t)
	
	return p0
end

function t:action(p2, p3, p4)
	-- upvalues: cryoModule (ref)
	self._eventStreamImpl:SendEventDeferred("AccountSettingsApi", p2, p3, cryoModule.Dictionary.join(p4 or {}, { blockerUserId = self.localUserId }))
end

return t