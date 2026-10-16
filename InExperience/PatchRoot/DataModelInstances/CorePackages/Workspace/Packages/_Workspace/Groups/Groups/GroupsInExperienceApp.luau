local Parent = script.Parent
local Parent1 = Parent.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent1.React)
local RoactCompatModule = require(Parent1.RoactCompat)
local RoactNetworking = require(Parent1.RoactServiceTags).RoactNetworking
local RoactServices = require(Parent1.RoactServices).RoactServices
local RequestInternalWrapperFunction = require(Parent1.Http).NetworkLayers.requestInternalWrapper
local CoreScriptsRootProvider = require(Parent1.CoreScriptsRoactCommon).CoreScriptsRootProvider
local GroupInExperiencePromptsModule = require(Parent.Components.CoreUI.GroupInExperiencePrompts)

local function v9(p1, p2) --[[ Line: 27 ]]
	-- upvalues: RoactCompatModule (copy), ReactModule (copy), CoreScriptsRootProvider (copy), RoactServices (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy)
	return RoactCompatModule.mount(ReactModule.createElement(CoreScriptsRootProvider, {}, {
		RoactServicesProvider = ReactModule.createElement(RoactServices.ServiceProvider, {
			services = {
				[RoactNetworking] = RequestInternalWrapperFunction(HttpService)
			}
		}, p2)
	}), p1, "GroupsInExperienceRoot")
end

return {
	createApp = function() --[[ Line: 41 ]]
		-- upvalues: v9 (copy), ReactModule (copy), GroupInExperiencePromptsModule (copy), RoactCompatModule (copy)
		local config = { _coreUiHandle = nil }
		
		function config.mountCoreUI(p1) --[[ Line: 46 ]]
			-- upvalues: config (copy), v9 (upval), ReactModule (upval), GroupInExperiencePromptsModule (upval)
			config._coreUiHandle = v9(p1, {
				GroupInExperiencePrompts = ReactModule.createElement(GroupInExperiencePromptsModule)
			})
		end
		
		function config.unMountCoreUI() --[[ Line: 52 ]]
			-- upvalues: config (copy), RoactCompatModule (upval)
			if config._coreUiHandle then
				RoactCompatModule.unmount(config._coreUiHandle)
				config._coreUiHandle = nil
			end
		end
		
		return config
	end
}