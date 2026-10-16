local Parent = script.Parent
local Parent1 = Parent.Parent
local HttpService = game:GetService("HttpService")
local CoreScriptsRootProvider = require(Parent1.CoreScriptsRoactCommon).CoreScriptsRootProvider
local ReactModule = require(Parent1.React)
local RoactCompatModule = require(Parent1.RoactCompat)
local RoactNetworking = require(Parent1.RoactServiceTags).RoactNetworking
local RoactServices = require(Parent1.RoactServices).RoactServices
local SelfieConsentConnectionModule = require(Parent.SelfieConsentConnection)
local RequestInternalWrapperFunction = require(Parent1.Http).NetworkLayers.requestInternalWrapper

local function v9(p1, p2) --[[ Line: 18 ]]
	-- upvalues: ReactModule (copy), CoreScriptsRootProvider (copy), RoactServices (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy), RoactCompatModule (copy)
	return RoactCompatModule.mount(ReactModule.createElement("Folder", nil, (ReactModule.createElement(CoreScriptsRootProvider, {}, {
		RoactServicesProvider = ReactModule.createElement(RoactServices.ServiceProvider, {
			services = {
				[RoactNetworking] = RequestInternalWrapperFunction(HttpService)
			}
		}, p2)
	}))), p1, "SelfieConsentRoot")
end

return {
	createDialog = function() --[[ Line: 30 ]]
		-- upvalues: v9 (copy), ReactModule (copy), SelfieConsentConnectionModule (copy)
		local t = {}
		
		function t.mountCoreUI(p1) --[[ Line: 33 ]]
			-- upvalues: t (copy), v9 (upval), ReactModule (upval), SelfieConsentConnectionModule (upval)
			t._coreUiHandle = v9(p1, {
				SelfieConsent = ReactModule.createElement(SelfieConsentConnectionModule, {})
			})
		end
		
		return t
	end
}