local runService = game:GetService("RunService")
local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local parent = coreScriptsRoactCommon.Parent
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local getIsPrivatePlaytesterStore = require(parent.DataHydration.IsPrivatePlaytester).getIsPrivatePlaytesterStore
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local getUniverseConfigurationStore = universeConfigurationModule.getUniverseConfigurationStore
local privacyType = universeConfigurationModule.PrivacyType
local playtestModeAnalyticsModule = require(coreScriptsRoactCommon.Analytics.PlaytestModeAnalytics)
local buildModeLaunchModule = require(parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local debugEnablePlaytestMode = game:DefineFastFlag("DebugEnablePlaytestMode", false)
local fFlagAddPlaytestModeAnalyticsModule = require(coreScriptsRoactCommon.Flags.FFlagAddPlaytestModeAnalytics)
local fFlagPlaytestModeExcludeBuildModeModule = require(coreScriptsRoactCommon.Flags.FFlagPlaytestModeExcludeBuildMode)
local fFlagPlaytestModeExcludeStudioModule = require(coreScriptsRoactCommon.Flags.FFlagPlaytestModeExcludeStudio)
local fFlagPlaytestModeIncludeTeamTestModule = require(coreScriptsRoactCommon.Flags.FFlagPlaytestModeIncludeTeamTest)

return function()
	-- upvalues: createSignal (ref), signalsModule (ref), getIsPrivatePlaytesterStore (ref), getUniverseConfigurationStore (ref), privacyType (ref), debugEnablePlaytestMode (ref), fFlagPlaytestModeExcludeBuildModeModule (ref), buildModeLaunchModule (ref), fFlagPlaytestModeIncludeTeamTestModule (ref), runService (ref), fFlagAddPlaytestModeAnalyticsModule (ref), playtestModeAnalyticsModule (ref), fFlagPlaytestModeExcludeStudioModule (ref)
	local var1, var2 = createSignal(false)
	local var3 = signalsModule.createComputed(function(p1)
		-- upvalues: getIsPrivatePlaytesterStore (copy)
		local var4 = getIsPrivatePlaytesterStore(p1).getAndFetch(game.GameId).data(p1)
		
		return var4 ~= nil and var4.isPlaytester == true
	end)
	local var4 = signalsModule.createComputed(function(p1)
		-- upvalues: getUniverseConfigurationStore (copy), privacyType (copy)
		local var5 = getUniverseConfigurationStore(p1).getAndFetchSummary(game.GameId).data(p1)
		
		return var5 ~= nil and var5.privacyType == privacyType.Private
	end)
	
	return {
		getIsPlaytestMode = signalsModule.createComputed(function(p1)
			-- upvalues: debugEnablePlaytestMode (copy), fFlagPlaytestModeExcludeBuildModeModule (copy), buildModeLaunchModule (copy), fFlagPlaytestModeIncludeTeamTestModule (copy), runService (copy), fFlagAddPlaytestModeAnalyticsModule (copy), playtestModeAnalyticsModule (copy), var3 (ref), var1 (ref), var4 (ref), fFlagPlaytestModeExcludeStudioModule (copy)
			if debugEnablePlaytestMode then
				return true
			elseif fFlagPlaytestModeExcludeBuildModeModule and buildModeLaunchModule:hasBuildMode() then
				return false
			elseif fFlagPlaytestModeIncludeTeamTestModule and runService:IsTeamTest() then
				if fFlagAddPlaytestModeAnalyticsModule then
					if runService:IsStudio() then
						playtestModeAnalyticsModule.logPlaytestModeEnabled("studio_team_test")
					else
						playtestModeAnalyticsModule.logPlaytestModeEnabled("team_test_server")
					end
				end
				return true
			elseif var3(p1) then
				if fFlagAddPlaytestModeAnalyticsModule then
					playtestModeAnalyticsModule.logPlaytestModeEnabled("private_playtester")
				end
				return true
			elseif not var1(p1) or not var4(p1) or fFlagPlaytestModeExcludeStudioModule and runService:IsStudio() then
				return false
			elseif fFlagAddPlaytestModeAnalyticsModule then
				playtestModeAnalyticsModule.logPlaytestModeEnabled("private_game")
			end
			return true
		end),
		setHasEditAccess = var2
	}
end