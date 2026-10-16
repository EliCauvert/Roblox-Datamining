local HttpService = game:GetService("HttpService")
local SelfieQr = script:FindFirstAncestor("SelfieQr")
local Parent = SelfieQr.Parent
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactServices = require(Parent.RoactServices).RoactServices
local SelfieQRConnectionModule = require(SelfieQr.SelfieQRConnection)
local RequestInternalWrapperFunction = require(Parent.Http).NetworkLayers.requestInternalWrapper
local Flag = false

local function v10(p1, p2) --[[ Line: 18 ]]
	-- upvalues: ReactModule (copy), CoreScriptsRootProvider (copy), RoactServices (copy), RoactNetworking (copy), RequestInternalWrapperFunction (copy), HttpService (copy), RoactModule (copy)
	return RoactModule.mount(ReactModule.createElement("Folder", nil, (ReactModule.createElement(CoreScriptsRootProvider, {}, {
		RoactServicesProvider = ReactModule.createElement(RoactServices.ServiceProvider, {
			services = {
				[RoactNetworking] = RequestInternalWrapperFunction(HttpService)
			}
		}, p2)
	}))), p1, "SelfieQRRoot")
end

return {
	createFactory = function() --[[ Line: 32 ]]
		-- upvalues: Flag (ref), v10 (copy), ReactModule (copy), SelfieQRConnectionModule (copy)
		local t = {}
		
		function t.mountCoreUI(p1) --[[ Line: 34 ]]
			-- upvalues: Flag (upval), t (copy), v10 (upval), ReactModule (upval), SelfieQRConnectionModule (upval)
			if not Flag then
				Flag = true
				t._coreUiHandle = v10(p1, {
					SelfieQR = ReactModule.createElement(SelfieQRConnectionModule, {})
				})
				
				return
			end
		end
		
		return t
	end
}