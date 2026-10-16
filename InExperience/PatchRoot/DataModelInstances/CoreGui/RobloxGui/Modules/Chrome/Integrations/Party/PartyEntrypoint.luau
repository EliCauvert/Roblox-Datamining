local CorePackages = game:GetService("CorePackages")
local Chrome = script:FindFirstAncestor("Chrome")
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local RegisterPartyIntegrationModule = require(script.Parent.registerPartyIntegration)
local ServiceModule = require(Chrome.Service)
local IsConnectDropdownEnabledModule = require(Chrome.Integrations.Connect.isConnectDropdownEnabled)
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local AppPolicy = require(CorePackages.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

local function _() --[[ Line: 18 | Named "canAccessParty" ]]
	-- upvalues: UniversalAppPolicyModule (copy)
	return UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty()
end

local _ = function() --[[ Line: 22 | Named "shouldEnableIntegrationForParty" ]]
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), UniversalAppPolicyModule (copy), IsConnectDropdownEnabledModule (copy)
	return GetFFlagIsSquadEnabledFunction() and (UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and IsConnectDropdownEnabledModule())
end

local PartyEntrypoint = nil
local Callback = nil

local function updatePartyIntegration(p1) --[[ Line: 29 ]]
	-- upvalues: PartyEntrypoint (ref), RegisterPartyIntegrationModule (copy), ServiceModule (copy), Callback (ref), InExperienceAppChatModalModule (copy)
	if not PartyEntrypoint then
		PartyEntrypoint = RegisterPartyIntegrationModule("party_entrypoint", if p1 then ServiceModule.AvailabilitySignal.Pinned else ServiceModule.AvailabilitySignal.Unavailable)
	end
	if p1 then
		if InExperienceAppChatModalModule.default.currentSquadId ~= "" then
			PartyEntrypoint.availability:pinned()
		end
		if not Callback then
			local EventConnection = InExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p2) --[[ Line: 55 ]]
				-- upvalues: PartyEntrypoint (upval)
				if p2 == "" then
					PartyEntrypoint.availability:unavailable()
					
					return
				else
					PartyEntrypoint.availability:pinned()
				end
			end)
			
			Callback = function() --[[ Line: 62 ]]
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end
	else
		PartyEntrypoint.availability:unavailable()
		
		if Callback then
			Callback()
			Callback = nil
			
			return
		end
	end
end

local function handlePolicyUpdate() --[[ Line: 69 ]]
	-- upvalues: updatePartyIntegration (copy), GetFFlagIsSquadEnabledFunction (copy), UniversalAppPolicyModule (copy), IsConnectDropdownEnabledModule (copy)
	updatePartyIntegration(GetFFlagIsSquadEnabledFunction() and (UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and IsConnectDropdownEnabledModule()))
end

if require(Chrome.Integrations.Connect.isConnectUnibarEnabled)() then
	updatePartyIntegration(GetFFlagIsSquadEnabledFunction() and (UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and IsConnectDropdownEnabledModule()))
	AppPolicy.onPolicyChanged(handlePolicyUpdate)
end
return PartyEntrypoint