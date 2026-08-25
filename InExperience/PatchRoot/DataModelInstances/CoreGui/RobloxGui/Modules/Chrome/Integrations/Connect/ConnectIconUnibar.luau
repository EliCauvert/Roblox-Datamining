local corePackagesService = game:GetService("CorePackages")
local serviceModule = require(script:FindFirstAncestor("Chrome").Service)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local registerConnectIntegrationModule = require(script.Parent.registerConnectIntegration)
local isConnectUnibarEnabledModule = require(script.Parent.isConnectUnibarEnabled)
local isConnectDropdownEnabledModule = require(script.Parent.isConnectDropdownEnabled)
local getFFlagIsSquadEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local fIntSideSheetVariant = require(corePackagesService.Workspace.Packages.SharedFlags).FIntSideSheetVariant
local fFlagEnableSideSheet = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableSideSheet
local connectIconDropdownModule = require(script.Parent.ConnectIconDropdown)
local universalAppPolicyModule = require(corePackagesService.Workspace.Packages.UniversalAppPolicy)
local var8 = require(corePackagesService.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

local function _()
	-- upvalues: universalAppPolicyModule (ref)
	return universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty()
end

local _ = function()
	-- upvalues: getFFlagIsSquadEnabled (ref), universalAppPolicyModule (ref), isConnectDropdownEnabledModule (ref)
	return getFFlagIsSquadEnabled() and (universalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and isConnectDropdownEnabledModule())
end

local var9 = nil
local var10 = nil
local var11 = fFlagEnableSideSheet and (fIntSideSheetVariant == 0 and connectIconDropdownModule ~= nil)

local function updateConnectIntegration(p0)
	-- upvalues: var9 (write), registerConnectIntegrationModule (ref), serviceModule (ref), var10 (write), inExperienceAppChatModalModule (ref), var11 (ref), connectIconDropdownModule (ref)
	if not var9 then
		var9 = registerConnectIntegrationModule("connect_unibar", if p0 then serviceModule.AvailabilitySignal.Pinned else serviceModule.AvailabilitySignal.Unavailable)
	end
	if p0 then
		if inExperienceAppChatModalModule.default.currentSquadId ~= "" then
			var9.availability:pinned()
			
			if var11 then
				connectIconDropdownModule.availability:unavailable()
			end
		end
		if not var10 then
			local eventConnection = inExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p1)
				-- upvalues: var9 (copy), var11 (copy), connectIconDropdownModule (copy)
				if p1 == "" then
					var9.availability:unavailable()
					
					if var11 then
						connectIconDropdownModule.availability:available()
						
						return
					end
				else
					var9.availability:pinned()
					
					if var11 then
						connectIconDropdownModule.availability:unavailable()
					end
				end
			end)
			
			var10 = function()
				-- upvalues: eventConnection (ref)
				eventConnection:Disconnect()
			end
		end
	else
		var9.availability:unavailable()
		
		if var10 then
			var10()
			var10 = nil
			
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
	var8.onPolicyChanged(handlePolicyUpdate)
end
return var9