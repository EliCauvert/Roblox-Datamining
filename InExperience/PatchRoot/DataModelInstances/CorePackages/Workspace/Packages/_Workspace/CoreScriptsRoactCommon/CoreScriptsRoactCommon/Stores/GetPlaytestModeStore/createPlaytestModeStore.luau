local RunService = game:GetService("RunService")
local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local Parent = CoreScriptsRoactCommon.Parent
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local GetIsPrivatePlaytesterStoreFunction = require(Parent.DataHydration.IsPrivatePlaytester).getIsPrivatePlaytesterStore
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GetUniverseConfigurationStoreFunction = UniverseConfigurationModule.getUniverseConfigurationStore
local PrivacyType = UniverseConfigurationModule.PrivacyType
local PlaytestModeAnalyticsModule = require(CoreScriptsRoactCommon.Analytics.PlaytestModeAnalytics)
local BuildModeLaunchModule = require(Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local DebugEnablePlaytestMode = game:DefineFastFlag("DebugEnablePlaytestMode", false)
local FFlagAddPlaytestModeAnalyticsModule = require(CoreScriptsRoactCommon.Flags.FFlagAddPlaytestModeAnalytics)
local FFlagPlaytestModeExcludeBuildModeModule = require(CoreScriptsRoactCommon.Flags.FFlagPlaytestModeExcludeBuildMode)
local FFlagPlaytestModeExcludeStudioModule = require(CoreScriptsRoactCommon.Flags.FFlagPlaytestModeExcludeStudio)
local FFlagPlaytestModeIncludeTeamTestModule = require(CoreScriptsRoactCommon.Flags.FFlagPlaytestModeIncludeTeamTest)

return function()
	-- upvalues: CreateSignalFunction (copy), SignalsModule (copy), GetIsPrivatePlaytesterStoreFunction (copy), GetUniverseConfigurationStoreFunction (copy), PrivacyType (copy), DebugEnablePlaytestMode (copy), FFlagPlaytestModeExcludeBuildModeModule (copy), BuildModeLaunchModule (copy), FFlagPlaytestModeIncludeTeamTestModule (copy), RunService (copy), FFlagAddPlaytestModeAnalyticsModule (copy), PlaytestModeAnalyticsModule (copy), FFlagPlaytestModeExcludeStudioModule (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: GetIsPrivatePlaytesterStoreFunction (upval)
		local DataResult = GetIsPrivatePlaytesterStoreFunction(p1).getAndFetch(game.GameId).data(p1)
		
		return DataResult ~= nil and DataResult.isPlaytester == true
	end)
	local Computed1 = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: GetUniverseConfigurationStoreFunction (upval), PrivacyType (upval)
		local DataResult = GetUniverseConfigurationStoreFunction(p1).getAndFetchSummary(game.GameId).data(p1)
		
		return DataResult ~= nil and DataResult.privacyType == PrivacyType.Private
	end)
	
	return {
		getIsPlaytestMode = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: DebugEnablePlaytestMode (upval), FFlagPlaytestModeExcludeBuildModeModule (upval), BuildModeLaunchModule (upval), FFlagPlaytestModeIncludeTeamTestModule (upval), RunService (upval), FFlagAddPlaytestModeAnalyticsModule (upval), PlaytestModeAnalyticsModule (upval), Computed (copy), Signal (copy), Computed1 (copy), FFlagPlaytestModeExcludeStudioModule (upval)
			if DebugEnablePlaytestMode then
				return true
			end
			if FFlagPlaytestModeExcludeBuildModeModule and BuildModeLaunchModule:hasBuildMode() then
				return false
			end
			if FFlagPlaytestModeIncludeTeamTestModule and RunService:IsTeamTest() then
				if FFlagAddPlaytestModeAnalyticsModule then
					if RunService:IsStudio() then
						PlaytestModeAnalyticsModule.logPlaytestModeEnabled("studio_team_test")
					else
						PlaytestModeAnalyticsModule.logPlaytestModeEnabled("team_test_server")
					end
				end
				return true
			elseif Computed(p1) then
				if FFlagAddPlaytestModeAnalyticsModule then
					PlaytestModeAnalyticsModule.logPlaytestModeEnabled("private_playtester")
				end
				return true
			else
				if not Signal(p1) or not Computed1(p1) or FFlagPlaytestModeExcludeStudioModule and RunService:IsStudio() then
					return false
				end
				if FFlagAddPlaytestModeAnalyticsModule then
					PlaytestModeAnalyticsModule.logPlaytestModeEnabled("private_game")
				end
				return true
			end
		end),
		setHasEditAccess = Signal2
	}
end