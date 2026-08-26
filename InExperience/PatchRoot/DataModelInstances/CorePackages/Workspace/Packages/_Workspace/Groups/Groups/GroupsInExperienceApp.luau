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

local var1 = function(p1, p2)
	-- upvalues: roactCompatModule (ref), reactModule (ref), coreScriptsRootProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref)
	return roactCompatModule.mount(reactModule.createElement(coreScriptsRootProvider, {}, {
		RoactServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, p2)
	}), p1, "GroupsInExperienceRoot")
end

function t.createApp()
	-- upvalues: var1 (ref), reactModule (ref), groupInExperiencePromptsModule (ref), roactCompatModule (ref)
	local t = { _coreUiHandle = nil }
	
	function t.mountCoreUI(p1)
		-- upvalues: t (ref), var1 (copy), reactModule (copy), groupInExperiencePromptsModule (copy)
		t._coreUiHandle = var1(p1, {
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