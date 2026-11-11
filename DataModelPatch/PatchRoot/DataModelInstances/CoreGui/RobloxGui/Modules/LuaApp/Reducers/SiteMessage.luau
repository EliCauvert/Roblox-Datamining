local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ProcessSiteAlertInfoPayloadModule = require(Modules.LuaApp.Actions.ProcessSiteAlertInfoPayload)
local RefreshSiteAlertInfoModule = require(Modules.LuaApp.Actions.RefreshSiteAlertInfo)
local ApplySetNavigationLockedModule = require(Modules.LuaApp.Actions.ApplySetNavigationLocked)
local ApplyRoactNavigationHistoryModule = require(Modules.LuaApp.Actions.ApplyRoactNavigationHistory)
local FFlagSignalsNavP3Final = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Final

return function(p1, p2)
	-- upvalues: ProcessSiteAlertInfoPayloadModule (copy), RefreshSiteAlertInfoModule (copy), CryoModule (copy), FFlagSignalsNavP3Final (copy), ApplySetNavigationLockedModule (copy), ApplyRoactNavigationHistoryModule (copy)
	local P0 = p1 or {}
	
	if p2.type == ProcessSiteAlertInfoPayloadModule.name then
		return {
			updateRequested = false,
			Text = p2.visible and p2.text or nil,
			Link = p2.visible and p2.link or nil,
			timestamp = p2.timestamp or nil
		}
	end
	if p2.type == RefreshSiteAlertInfoModule.name then
		return CryoModule.Dictionary.join(P0, { updateRequested = p2.updateRequested })
	end
	if not FFlagSignalsNavP3Final then
		for _, value in ipairs({
			ApplySetNavigationLockedModule,
			ApplyRoactNavigationHistoryModule
		}) do
			if p2.type == value.name then
				return CryoModule.Dictionary.join(P0, { updateRequested = true })
			end
		end
	end
	return P0
end