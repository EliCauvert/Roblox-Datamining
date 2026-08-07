local parent = script.Parent
local parent_1 = parent.Parent
local httpService = game:GetService("HttpService")
local coreScriptsRootProvider = require(parent_1.CoreScriptsRoactCommon).CoreScriptsRootProvider
local reactModule = require(parent_1.React)
local roactCompatModule = require(parent_1.RoactCompat)
local roactNetworking = require(parent_1.RoactServiceTags).RoactNetworking
local roactServices = require(parent_1.RoactServices).RoactServices
local selfieConsentConnectionModule = require(parent.SelfieConsentConnection)
local requestInternalWrapper = require(parent_1.Http).NetworkLayers.requestInternalWrapper
local t = {}

local var5 = function(p0, p1) --[[ line: 18 ]]
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), roactServices (ref), roactNetworking (ref), requestInternalWrapper (ref), httpService (ref), roactCompatModule (ref)
	return roactCompatModule.mount(reactModule.createElement("Folder", nil, reactModule.createElement(coreScriptsRootProvider, {}, {
		RoactServicesProvider = reactModule.createElement(roactServices.ServiceProvider, {
			services = { [roactNetworking] = requestInternalWrapper(httpService) }
		}, p1)
	})), p0, "SelfieConsentRoot")
end

function t.createDialog() --[[ line: 30 ]]
	-- upvalues: var5 (ref), reactModule (ref), selfieConsentConnectionModule (ref)
	local t = {}
	
	function t.mountCoreUI(p2) --[[ line: 33 ]]
		-- upvalues: t (ref), var5 (copy), reactModule (copy), selfieConsentConnectionModule (copy)
		t._coreUiHandle = var5(p2, {
			SelfieConsent = reactModule.createElement(selfieConsentConnectionModule, {})
		})
	end
	
	return t
end

return t