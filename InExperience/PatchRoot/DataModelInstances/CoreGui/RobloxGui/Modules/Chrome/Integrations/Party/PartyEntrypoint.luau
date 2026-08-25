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
local var9 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")

local function _()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty()
end

local _ = function()
	-- upvalues: getFFlagIsSquadEnabled (ref), universalAppPolicyModule (ref), isConnectDropdownEnabledModule (ref)
	return getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule())
end

local var10 = nil
local var11 = nil

local function updatePartyIntegration(p0)
	-- upvalues: var10 (write), registerPartyIntegrationModule (ref), serviceModule (ref), var11 (write), inExperienceAppChatModalModule (ref)
	if not var10 then
		var10 = registerPartyIntegrationModule("party_entrypoint", if p0 then serviceModule.AvailabilitySignal.Pinned else serviceModule.AvailabilitySignal.Unavailable)
	end
	if p0 then
		if inExperienceAppChatModalModule.default.currentSquadId ~= "" then
			var10.availability:pinned()
		end
		if not var11 then
			local eventConnection = inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p1)
				-- upvalues: var10 (copy)
				if p1 == "" then
					var10.availability:unavailable()
					
					return
				end
				var10.availability:pinned()
			end)
			
			var11 = function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
	else
		var10.availability:unavailable()
		
		if var11 then
			var11()
			var11 = nil
			
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
	var9.onPolicyChanged(handlePolicyUpdate)
end
return var10