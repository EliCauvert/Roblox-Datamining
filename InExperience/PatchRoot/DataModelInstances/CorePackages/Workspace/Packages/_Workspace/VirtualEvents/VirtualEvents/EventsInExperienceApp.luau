local parent = script.Parent
local parent_1 = parent.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent_1.React)
local roactCompatModule = require(parent_1.RoactCompat)
local roactNetworking = require(parent_1.RoactServiceTags).RoactNetworking
local roactServices = require(parent_1.RoactServices).RoactServices
local requestInternalWrapper = require(parent_1.Http).NetworkLayers.requestInternalWrapper
local coreScriptsRootProvider = require(parent_1.CoreScriptsRoactCommon).CoreScriptsRootProvider
local eventInExperiencePromptsModule = require(parent.Components.CoreUI.EventInExperiencePrompts)
local eventsInExperienceAppFixStyleLink = game:DefineFastFlag("EventsInExperienceAppFixStyleLink", false)
local t = {}

local var6 = function(p0, p1) --[[ line: 29 ]]
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), eventsInExperienceAppFixStyleLink (ref), roactCompatModule (ref)
	local var7 = reactModule.createElement(coreScriptsRootProvider, {}, {
		RoactServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, p1)
	})
	
	if eventsInExperienceAppFixStyleLink then
		var7 = reactModule.createElement("Folder", nil, var7)
	end
	return roactCompatModule.mount(var7, p0, "EventsInExperienceRoot")
end

function t.createApp() --[[ line: 43 ]]
	-- upvalues: var6 (ref), reactModule (ref), eventInExperiencePromptsModule (ref), roactCompatModule (ref)
	local t = { _coreUiHandle = nil }
	
	function t.mountCoreUI(p2) --[[ line: 48 ]]
		-- upvalues: t (ref), var6 (copy), reactModule (copy), eventInExperiencePromptsModule (copy)
		t._coreUiHandle = var6(p2, {
			EventInExperiencePrompts = reactModule.createElement(eventInExperiencePromptsModule)
		})
	end
	
	function t.unMountCoreUI() --[[ line: 54 ]]
		-- upvalues: t (ref), roactCompatModule (copy)
		if t._coreUiHandle then
			roactCompatModule.unmount(t._coreUiHandle)
			t._coreUiHandle = nil
		end
	end
	
	return t
end

return t