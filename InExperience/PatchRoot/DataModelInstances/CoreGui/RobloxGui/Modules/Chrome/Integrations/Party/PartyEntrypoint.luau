local corePackagesService = game:GetService("CorePackages")
local chrome = script:FindFirstAncestor("Chrome")
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local policyProviderModule = require(corePackagesService.Packages.PolicyProvider)
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local registerPartyIntegrationModule = require(script.Parent.registerPartyIntegration)
local serviceModule = require(chrome.Service)
local isConnectUnibarEnabledModule = require(chrome.Integrations.Connect.isConnectUnibarEnabled)
local isConnectDropdownEnabledModule = require(chrome.Integrations.Connect.isConnectDropdownEnabled)
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local var1 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")

local function _()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty()
end

local _ = function()
	-- upvalues: getFFlagIsSquadEnabled (ref), universalAppPolicyModule (ref), isConnectDropdownEnabledModule (ref)
	return getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule())
end

local var2 = nil
local var3 = nil

local function updatePartyIntegration(p1)
	-- upvalues: var2 (write), registerPartyIntegrationModule (ref), serviceModule (ref), var3 (write), inExperienceAppChatModalModule (ref)
	if not var2 then
		var2 = registerPartyIntegrationModule("party_entrypoint", if p1 then serviceModule.AvailabilitySignal.Pinned else serviceModule.AvailabilitySignal.Unavailable)
	end
	if p1 then
		if inExperienceAppChatModalModule.default.currentSquadId ~= "" then
			var2.availability:pinned()
		end
		if not var3 then
			local eventConnection = inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p2)
				-- upvalues: var2 (copy)
				if p2 == "" then
					var2.availability:unavailable()
					
					return
				end
				var2.availability:pinned()
			end)
			
			var3 = function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
	else
		var2.availability:unavailable()
		
		if var3 then
			var3()
			var3 = nil
			
			return
		end
	end
end

local function handlePolicyUpdate()
	-- upvalues: updatePartyIntegration (ref), getFFlagIsSquadEnabled (ref), universalAppPolicyModule (ref), isConnectDropdownEnabledModule (ref)
	updatePartyIntegration(getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule()))
end

if isConnectUnibarEnabledModule() then
	updatePartyIntegration(getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule()))
	var1.onPolicyChanged(handlePolicyUpdate)
end
return var2