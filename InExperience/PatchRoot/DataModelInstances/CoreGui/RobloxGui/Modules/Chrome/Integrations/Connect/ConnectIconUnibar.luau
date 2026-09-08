local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(script:FindFirstAncestor("Chrome").Service)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local registerConnectIntegrationModule = require(script.Parent.registerConnectIntegration)
local isConnectUnibarEnabledModule = require(script.Parent.isConnectUnibarEnabled)
local isConnectDropdownEnabledModule = require(script.Parent.isConnectDropdownEnabled)
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local var1 = require(corePackagesService.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

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

local function updateConnectIntegration(p1)
	-- upvalues: var2 (write), registerConnectIntegrationModule (ref), serviceModule (ref), var3 (write), inExperienceAppChatModalModule (ref)
	if not var2 then
		var2 = registerConnectIntegrationModule("connect_unibar", if p1 then serviceModule.AvailabilitySignal.Pinned else serviceModule.AvailabilitySignal.Unavailable)
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
	-- upvalues: updateConnectIntegration (ref), getFFlagIsSquadEnabled (ref), universalAppPolicyModule (ref), isConnectDropdownEnabledModule (ref)
	updateConnectIntegration(getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule()))
end

if isConnectUnibarEnabledModule() then
	updateConnectIntegration(getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule()))
	var1.onPolicyChanged(handlePolicyUpdate)
end
return var2