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
local buildModeLaunchModule = require(parent.BuildExperience.BuildModeLaunch)
local debugEnablePlaytestMode = game:DefineFastFlag("DebugEnablePlaytestMode", false)
local fFlagAddPlaytestModeAnalyticsModule = require(coreScriptsRoactCommon.Flags.FFlagAddPlaytestModeAnalytics)
local fFlagPlaytestModeExcludeBuildModeModule = require(coreScriptsRoactCommon.Flags.FFlagPlaytestModeExcludeBuildMode)
local fFlagPlaytestModeExcludeStudioModule = require(coreScriptsRoactCommon.Flags.FFlagPlaytestModeExcludeStudio)
local fFlagPlaytestModeIncludeTeamTestModule = require(coreScriptsRoactCommon.Flags.FFlagPlaytestModeIncludeTeamTest)

return function()
	-- upvalues: createSignal (ref), signalsModule (ref), getIsPrivatePlaytesterStore (ref), getUniverseConfigurationStore (ref), privacyType (ref), debugEnablePlaytestMode (ref), fFlagPlaytestModeExcludeBuildModeModule (ref), buildModeLaunchModule (ref), fFlagPlaytestModeIncludeTeamTestModule (ref), runService (ref), fFlagAddPlaytestModeAnalyticsModule (ref), playtestModeAnalyticsModule (ref), fFlagPlaytestModeExcludeStudioModule (ref)
	local var11, var12 = createSignal(false)
	local var13 = signalsModule.createComputed(function(p0)
		-- upvalues: getIsPrivatePlaytesterStore (copy)
		local var15 = getIsPrivatePlaytesterStore(p0).getAndFetch(game.GameId).data(p0)
		
		return var15 ~= nil and var15.isPlaytester == true
	end)
	local var14 = signalsModule.createComputed(function(p1)
		-- upvalues: getUniverseConfigurationStore (copy), privacyType (copy)
		local var16 = getUniverseConfigurationStore(p1).getAndFetchSummary(game.GameId).data(p1)
		
		return var16 ~= nil and var16.privacyType == privacyType.Private
	end)
	
	return {
		getIsPlaytestMode = signalsModule.createComputed(function(p2)
			-- upvalues: debugEnablePlaytestMode (copy), fFlagPlaytestModeExcludeBuildModeModule (copy), buildModeLaunchModule (copy), fFlagPlaytestModeIncludeTeamTestModule (copy), runService (copy), fFlagAddPlaytestModeAnalyticsModule (copy), playtestModeAnalyticsModule (copy), var13 (ref), var11 (ref), var14 (ref), fFlagPlaytestModeExcludeStudioModule (copy)
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
			elseif var13(p2) then
				if fFlagAddPlaytestModeAnalyticsModule then
					playtestModeAnalyticsModule.logPlaytestModeEnabled("private_playtester")
				end
				return true
			elseif not var11(p2) or not var14(p2) or fFlagPlaytestModeExcludeStudioModule and runService:IsStudio() then
				return false
			elseif fFlagAddPlaytestModeAnalyticsModule then
				playtestModeAnalyticsModule.logPlaytestModeEnabled("private_game")
			end
			return true
		end),
		setHasEditAccess = var12
	}
end