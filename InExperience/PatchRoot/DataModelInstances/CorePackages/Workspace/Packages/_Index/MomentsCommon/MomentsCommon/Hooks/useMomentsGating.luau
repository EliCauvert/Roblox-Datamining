local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local sharedFlagsModule = require(parent.SharedFlags)
local var3 = require(parent.Loggers).Logger:new("Moments.Gating")
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusFlyoutEntry = sharedFlagsModule.FFlagEnableArgusFlyoutEntry
local fFlagEnableArgusTab = sharedFlagsModule.FFlagEnableArgusTab
local debugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local argusExperimentModule = require(momentsCommon.Flags.ArgusExperiment)

return function() --[[ line: 47 | named "useMomentsGating" ]]
	-- upvalues: fFlagEnableArgus (ref), useAppPolicy (ref), argusExperimentModule (ref), reactModule (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagEnableArgusTab (ref), debugMomentsGating (ref), var3 (ref)
	local var6 = useAppPolicy(function(p0) --[[ line: 50 ]]
		return p0.getDisplayMomentsMoreTabTile()
	end)
	local var6_1 = fFlagEnableArgus and var6
	local var8 = argusExperimentModule.useExperimentConfig({ isExposureEnabled = false })
	local var9 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var8 (ref), fFlagEnableArgus (ref), var6 (ref), var6_1 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusTab (copy)
		local entryType = var8.entryType
		
		return {
			isMasterEnabled = fFlagEnableArgus,
			isAmpPolicyEnabled = var6,
			isMomentsEnabled = var6_1,
			isFlyoutEntryEnabled = var6_1 and (if entryType ~= "flyout" then fFlagEnableArgusFlyoutEntry else true),
			isTabEnabled = var6_1 and (if entryType ~= "tab" then fFlagEnableArgusTab else true),
			platformIntegrationEnabled = var6_1 and var8.platformIntegration,
			influencerUploadsEnabled = var6_1 and var8.influencerUploads,
			experimentConfig = var8
		}
	end, { fFlagEnableArgus, var6, var6_1, var8 })
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: debugMomentsGating (copy), var3 (copy), var9 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusTab (copy)
		if debugMomentsGating then
			var3:debug("Moments.Gating master={} ampPolicy={} moments={} entryType={} platformIntegration={} influencerUploads={} flyout={} tab={} forceFlyout={} forceTab={}", tostring(var9.isMasterEnabled), tostring(var9.isAmpPolicyEnabled), tostring(var9.isMomentsEnabled), tostring(var9.experimentConfig.entryType), tostring(var9.platformIntegrationEnabled), tostring(var9.influencerUploadsEnabled), tostring(var9.isFlyoutEntryEnabled), tostring(var9.isTabEnabled), tostring(fFlagEnableArgusFlyoutEntry), tostring(fFlagEnableArgusTab))
			
			return
		end
	end, {
		debugMomentsGating,
		fFlagEnableArgusFlyoutEntry,
		fFlagEnableArgusTab,
		var9
	})
	
	return var9
end