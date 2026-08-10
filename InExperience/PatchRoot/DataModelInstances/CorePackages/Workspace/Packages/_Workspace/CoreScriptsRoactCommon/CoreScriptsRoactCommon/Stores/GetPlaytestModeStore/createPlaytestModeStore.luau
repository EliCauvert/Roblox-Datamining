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

return function() --[[ line: 31 ]]
	-- upvalues: createSignal (ref), signalsModule (ref), getIsPrivatePlaytesterStore (ref), getUniverseConfigurationStore (ref), privacyType (ref), debugEnablePlaytestMode (ref), fFlagPlaytestModeExcludeStudioModule (ref), runService (ref), fFlagPlaytestModeExcludeBuildModeModule (ref), buildModeLaunchModule (ref), fFlagAddPlaytestModeAnalyticsModule (ref), playtestModeAnalyticsModule (ref)
	local var10, var11 = createSignal(false)
	local var12 = signalsModule.createComputed(function(p0) --[[ line: 34 ]]
		-- upvalues: getIsPrivatePlaytesterStore (copy)
		local var14 = getIsPrivatePlaytesterStore(p0).getAndFetch(game.GameId).data(p0)
		
		return var14 ~= nil and var14.isPlaytester == true
	end)
	local var13 = signalsModule.createComputed(function(p1) --[[ line: 40 ]]
		-- upvalues: getUniverseConfigurationStore (copy), privacyType (copy)
		local var15 = getUniverseConfigurationStore(p1).getAndFetchSummary(game.GameId).data(p1)
		
		return var15 ~= nil and var15.privacyType == privacyType.Private
	end)
	
	return {
		getIsPlaytestMode = signalsModule.createComputed(function(p2) --[[ line: 46 ]]
			-- upvalues: debugEnablePlaytestMode (copy), fFlagPlaytestModeExcludeStudioModule (copy), runService (copy), fFlagPlaytestModeExcludeBuildModeModule (copy), buildModeLaunchModule (copy), var12 (ref), fFlagAddPlaytestModeAnalyticsModule (copy), playtestModeAnalyticsModule (copy), var10 (ref), var13 (ref)
			if debugEnablePlaytestMode then
				return true
			elseif fFlagPlaytestModeExcludeStudioModule and runService:IsStudio() then
				return false
			elseif fFlagPlaytestModeExcludeBuildModeModule and buildModeLaunchModule:hasBuildMode() then
				return false
			elseif var12(p2) then
				if fFlagAddPlaytestModeAnalyticsModule then
					playtestModeAnalyticsModule.logPlaytestModeEnabled("private_playtester")
				end
				return true
			elseif not var10(p2) or not var13(p2) then
				return false
			elseif fFlagAddPlaytestModeAnalyticsModule then
				playtestModeAnalyticsModule.logPlaytestModeEnabled("private_game")
			end
			return true
		end),
		setHasEditAccess = var11
	}
end