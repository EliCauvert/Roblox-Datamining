local Parent = script.Parent
local Parent1 = Parent.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent1.React)
local RoactCompatModule = require(Parent1.RoactCompat)
local RoactNetworking = require(Parent1.RoactServiceTags).RoactNetworking
local RoactServices = require(Parent1.RoactServices).RoactServices
local RequestInternalWrapperFunction = require(Parent1.Http).NetworkLayers.requestInternalWrapper
local CoreScriptsRootProvider = require(Parent1.CoreScriptsRoactCommon).CoreScriptsRootProvider
local EventInExperiencePromptsModule = require(Parent.Components.CoreUI.EventInExperiencePrompts)

local function v9(p1, p2)
	-- upvalues: ReactModule (copy), CoreScriptsRootProvider (copy), RoactServices (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy), RoactCompatModule (copy)
	return RoactCompatModule.mount(ReactModule.createElement("Folder", nil, (ReactModule.createElement(CoreScriptsRootProvider, {}, {
		RoactServicesProvider = ReactModule.createElement(RoactServices.ServiceProvider, {
			services = {
				[RoactNetworking] = RequestInternalWrapperFunction(HttpService)
			}
		}, p2)
	}))), p1, "EventsInExperienceRoot")
end

return {
	createApp = function()
		-- upvalues: v9 (copy), ReactModule (copy), EventInExperiencePromptsModule (copy), RoactCompatModule (copy)
		local config = { _coreUiHandle = nil }
		
		function config.mountCoreUI(p1)
			-- upvalues: config (copy), v9 (upval), ReactModule (upval), EventInExperiencePromptsModule (upval)
			config._coreUiHandle = v9(p1, {
				EventInExperiencePrompts = ReactModule.createElement(EventInExperiencePromptsModule)
			})
		end
		
		function config.unMountCoreUI()
			-- upvalues: config (copy), RoactCompatModule (upval)
			if config._coreUiHandle then
				RoactCompatModule.unmount(config._coreUiHandle)
				config._coreUiHandle = nil
			end
		end
		
		return config
	end
}