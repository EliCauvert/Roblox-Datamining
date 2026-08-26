local httpService = game:GetService("HttpService")
local selfieQr = script:FindFirstAncestor("SelfieQr")
local parent = selfieQr.Parent
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local roactServices = require(parent.RoactServices).RoactServices
local selfieQRConnectionModule = require(selfieQr.SelfieQRConnection)
local requestInternalWrapper = require(parent.Http).NetworkLayers.requestInternalWrapper
local t = {}
local var1 = false

local var2 = function(p1, p2)
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), roactModule (ref)
	return roactModule.mount(reactModule.createElement("Folder", nil, reactModule.createElement(coreScriptsRootProvider, {}, {
		RoactServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, p2)
	})), p1, "SelfieQRRoot")
end

function t.createFactory()
	-- upvalues: var1 (write), var2 (ref), reactModule (ref), selfieQRConnectionModule (ref)
	local t = {}
	
	function t.mountCoreUI(p1)
		-- upvalues: var1 (copy), t (ref), var2 (copy), reactModule (copy), selfieQRConnectionModule (copy)
		if var1 then
			return
		end
		var1 = true
		t._coreUiHandle = var2(p1, {
			SelfieQR = reactModule.createElement(selfieQRConnectionModule, {})
		})
	end
	
	return t
end

return t