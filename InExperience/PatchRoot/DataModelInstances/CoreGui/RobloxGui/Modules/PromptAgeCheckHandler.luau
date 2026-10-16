local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FStringLuaAppPlayButtonAgeCheckAmpFeatureName = SharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local FStringLuaAppPlayButtonAgeCheckAmpNameSpace = SharedFlagsModule.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local FFlagPioneerLeaveOnInExpFaeDownAge = SharedFlagsModule.FFlagPioneerLeaveOnInExpFaeDownAge
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local MaybeLeavePioneerOnFaeDownAgeModule = require(CorePackages.Workspace.Packages.PioneerUtils.maybeLeavePioneerOnFaeDownAge)

local function onPromptAgeCheckRequested(Player) --[[ Line: 25 ]]
	-- upvalues: Players (copy), CorePackages (copy), CoreGui (copy), FStringLuaAppPlayButtonAgeCheckAmpFeatureName (copy), Logging (copy), FFlagPioneerLeaveOnInExpFaeDownAge (copy), MaybeLeavePioneerOnFaeDownAgeModule (copy), FStringLuaAppPlayButtonAgeCheckAmpNameSpace (copy)
	local LocalPlayer = Players.LocalPlayer
	
	if Player ~= LocalPlayer then return end
	local Success, Result = pcall(require, CorePackages.Workspace.Packages.AmpUpsell)
	
	if not Success or not Result or not Result.InExpAmpWizardController then return end
	local Success1, Result1 = pcall(require, CoreGui.RobloxGui.Modules.ApolloClient)
	
	if Success1 and Result1 then
		Result.InExpAmpWizardController.OpenAmpWizardContainerInExp(FStringLuaAppPlayButtonAgeCheckAmpFeatureName, function(p1, p2) --[[ Line: 43 ]]
			-- upvalues: LocalPlayer (copy), Logging (upval), FFlagPioneerLeaveOnInExpFaeDownAge (upval), Result (copy), MaybeLeavePioneerOnFaeDownAgeModule (upval)
			local function notifyIfGranted() --[[ Line: 44 ]]
				-- upvalues: p1 (copy), LocalPlayer (upval), Logging (upval)
				if p1 == "Granted" then
					local Success, Result = pcall(function() --[[ Line: 46 ]]
						-- upvalues: LocalPlayer (upval)
						LocalPlayer:NotifyAgeCheckPassed()
					end)
					
					if not Success then
						Logging.warn("PromptAgeCheckRequested: NotifyAgeCheckPassed failed: " .. tostring(Result))
					end
				end
			end
			
			if FFlagPioneerLeaveOnInExpFaeDownAge then
				local AmpEnums = Result.AmpEnums
				MaybeLeavePioneerOnFaeDownAgeModule(p2 ~= nil and p2[AmpEnums.ActionTypeEnum.AgeEstimation] == AmpEnums.ActionStatusEnum.Success, notifyIfGranted)
				
				return
			end
			if p1 == "Granted" then
				local Success, Result1 = pcall(function() --[[ Line: 46 ]]
					-- upvalues: LocalPlayer (upval)
					LocalPlayer:NotifyAgeCheckPassed()
				end)
				
				if not Success then
					Logging.warn("PromptAgeCheckRequested: NotifyAgeCheckPassed failed: " .. tostring(Result1))
				end
			end
		end, nil, "PromptAgeCheckRequested", nil, FStringLuaAppPlayButtonAgeCheckAmpNameSpace, Result1)
		
		return
	end
end

return {
	init = function() --[[ Line: 72 ]]
		-- upvalues: Players (copy), onPromptAgeCheckRequested (copy)
		Players.PromptAgeCheckRequested:Connect(onPromptAgeCheckRequested)
	end
}