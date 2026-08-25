local parent = script.Parent
local parent_1 = parent.Parent
local httpService = game:GetService("HttpService")
local reactModule = require(parent_1.React)
local roactCompatModule = require(parent_1.RoactCompat)
local roactNetworking = require(parent_1.RoactServiceTags).RoactNetworking
local roactServices = require(parent_1.RoactServices).RoactServices
local requestInternalWrapper = require(parent_1.Http).NetworkLayers.requestInternalWrapper
local coreScriptsRootProvider = require(parent_1.CoreScriptsRoactCommon).CoreScriptsRootProvider
local groupInExperiencePromptsModule = require(parent.Components.CoreUI.GroupInExperiencePrompts)
local t = {}

local var5 = function(p0, p1)
	-- upvalues: roactCompatModule (ref), reactModule (ref), coreScriptsRootProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref)
	return roactCompatModule.mount(reactModule.createElement(coreScriptsRootProvider, {}, {
		RoactServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, p1)
	}), p0, "GroupsInExperienceRoot")
end

function t.createApp()
	-- upvalues: var5 (ref), reactModule (ref), groupInExperiencePromptsModule (ref), roactCompatModule (ref)
	local t = { _coreUiHandle = nil }
	
	function t.mountCoreUI(p2)
		-- upvalues: t (ref), var5 (copy), reactModule (copy), groupInExperiencePromptsModule (copy)
		t._coreUiHandle = var5(p2, {
			GroupInExperiencePrompts = reactModule.createElement(groupInExperiencePromptsModule)
		})
	end
	
	function t.unMountCoreUI()
		-- upvalues: t (ref), roactCompatModule (copy)
		if t._coreUiHandle then
			roactCompatModule.unmount(t._coreUiHandle)
			t._coreUiHandle = nil
		end
	end
	
	return t
end

return t