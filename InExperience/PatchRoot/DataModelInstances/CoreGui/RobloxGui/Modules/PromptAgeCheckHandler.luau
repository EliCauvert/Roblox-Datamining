local playersService = game:GetService("Players")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fStringLuaAppPlayButtonAgeCheckAmpFeatureName = sharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local fStringLuaAppPlayButtonAgeCheckAmpNameSpace = sharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local logging = require(corePackagesService.Workspace.Packages.AppCommonLib).Logging
local t = {}

local function onPromptAgeCheckRequested(p1)
	-- upvalues: playersService (ref), corePackagesService (ref), coreGuiService (ref), fStringLuaAppPlayButtonAgeCheckAmpFeatureName (ref), logging (ref), fStringLuaAppPlayButtonAgeCheckAmpNameSpace (ref)
	local localPlayer = playersService.LocalPlayer
	
	if p1 ~= localPlayer then return end
	local ok, status = pcall(require, corePackagesService.Workspace.Packages.AmpUpsell)
	
	if not ok or not status or not status.InExpAmpWizardController then return end
	local ok_1, status_1 = pcall(require, coreGuiService.RobloxGui.Modules.ApolloClient)
	
	if ok_1 and status_1 then
		status.InExpAmpWizardController.OpenAmpWizardContainerInExp(fStringLuaAppPlayButtonAgeCheckAmpFeatureName, function(p2, _)
			-- upvalues: localPlayer (ref), logging (copy)
			if p2 == "Granted" then
				local ok, status = pcall(function()
					-- upvalues: localPlayer (copy)
					localPlayer:NotifyAgeCheckPassed()
				end)
				
				if not ok then
					logging.warn("PromptAgeCheckRequested: NotifyAgeCheckPassed failed: " .. tostring(status))
				end
			end
		end, nil, "PromptAgeCheckRequested", nil, fStringLuaAppPlayButtonAgeCheckAmpNameSpace, status_1)
		
		return
	end
end

function t.init()
	-- upvalues: playersService (ref), onPromptAgeCheckRequested (ref)
	playersService.PromptAgeCheckRequested:Connect(onPromptAgeCheckRequested)
end

return t