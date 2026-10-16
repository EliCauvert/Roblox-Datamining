local CorePackages = game:GetService("CorePackages")
local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local RegisterConnectIntegrationModule = require(script.Parent.registerConnectIntegration)
local IsConnectDropdownEnabledModule = require(script.Parent.isConnectDropdownEnabled)
local GetFFlagIsSquadEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local UniversalAppPolicyModule = require(CorePackages.Workspace.Packages.UniversalAppPolicy)
local AppPolicy = require(CorePackages.Packages.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

local function _() --[[ Line: 22 | Named "canAccessParty" ]]
	-- upvalues: UniversalAppPolicyModule (copy)
	return UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty()
end

local _ = function() --[[ Line: 26 | Named "shouldEnableIntegrationForParty" ]]
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), UniversalAppPolicyModule (copy), IsConnectDropdownEnabledModule (copy)
	return GetFFlagIsSquadEnabledFunction() and (UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and IsConnectDropdownEnabledModule())
end

local ConnectUnibar = nil
local Callback = nil

local function updateConnectIntegration(p1) --[[ Line: 34 ]]
	-- upvalues: ConnectUnibar (ref), RegisterConnectIntegrationModule (copy), ServiceModule (copy), Callback (ref), InExperienceAppChatModalModule (copy)
	if not ConnectUnibar then
		ConnectUnibar = RegisterConnectIntegrationModule("connect_unibar", if p1 then ServiceModule.AvailabilitySignal.Pinned else ServiceModule.AvailabilitySignal.Unavailable)
	end
	if p1 then
		if InExperienceAppChatModalModule.default.currentSquadId ~= "" then
			ConnectUnibar.availability:pinned()
		end
		if not Callback then
			local EventConnection = InExperienceAppChatModalModule.default.currentSquadIdSignal.Event:Connect(function(p2) --[[ Line: 62 ]]
				-- upvalues: ConnectUnibar (upval)
				if p2 == "" then
					ConnectUnibar.availability:unavailable()
					
					return
				else
					ConnectUnibar.availability:pinned()
				end
			end)
			
			Callback = function() --[[ Line: 69 ]]
				-- upvalues: EventConnection (copy)
				EventConnection:Disconnect()
			end
		end
	else
		ConnectUnibar.availability:unavailable()
		
		if Callback then
			Callback()
			Callback = nil
			
			return
		end
	end
end

local function handlePolicyUpdate() --[[ Line: 76 ]]
	-- upvalues: updateConnectIntegration (copy), GetFFlagIsSquadEnabledFunction (copy), UniversalAppPolicyModule (copy), IsConnectDropdownEnabledModule (copy)
	updateConnectIntegration(GetFFlagIsSquadEnabledFunction() and (UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and IsConnectDropdownEnabledModule()))
end

if require(script.Parent.isConnectUnibarEnabled)() then
	updateConnectIntegration(GetFFlagIsSquadEnabledFunction() and (UniversalAppPolicyModule.getAppFeaturePolicies().getCanAccessParty() and IsConnectDropdownEnabledModule()))
	AppPolicy.onPolicyChanged(handlePolicyUpdate)
end
return ConnectUnibar