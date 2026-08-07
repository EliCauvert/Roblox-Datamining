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
local var6 = false

local var7 = function(p0, p1) --[[ line: 18 ]]
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), roactModule (ref)
	return roactModule.mount(reactModule.createElement("Folder", nil, reactModule.createElement(coreScriptsRootProvider, {}, {
		RoactServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, p1)
	})), p0, "SelfieQRRoot")
end

function t.createFactory() --[[ line: 32 ]]
	-- upvalues: var6 (write), var7 (ref), reactModule (ref), selfieQRConnectionModule (ref)
	local t = {}
	
	function t.mountCoreUI(p2) --[[ line: 34 ]]
		-- upvalues: var6 (copy), t (ref), var7 (copy), reactModule (copy), selfieQRConnectionModule (copy)
		if var6 then
			return
		end
		var6 = true
		t._coreUiHandle = var7(p2, {
			SelfieQR = reactModule.createElement(selfieQRConnectionModule, {})
		})
	end
	
	return t
end

return t