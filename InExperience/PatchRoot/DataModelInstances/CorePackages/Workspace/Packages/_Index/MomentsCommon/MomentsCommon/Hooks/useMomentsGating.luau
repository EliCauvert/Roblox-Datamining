local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = require(parent.Loggers).Logger:new("Moments.Gating")
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusFlyoutEntry = sharedFlagsModule.FFlagEnableArgusFlyoutEntry
local fFlagEnableArgusTab = sharedFlagsModule.FFlagEnableArgusTab
local fFlagArgoEnableMoments = sharedFlagsModule.FFlagArgoEnableMoments
local fFlagArgusTabImpliesFlyout = sharedFlagsModule.FFlagArgusTabImpliesFlyout
local debugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local argusExperimentModule = require(momentsCommon.Flags.ArgusExperiment)

return function()
	-- upvalues: fFlagEnableArgus (ref), useAppPolicy (ref), argusExperimentModule (ref), reactModule (ref), fFlagArgoEnableMoments (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagArgusTabImpliesFlyout (ref), fFlagEnableArgusTab (ref), debugMomentsGating (ref), var1 (ref)
	local var2 = useAppPolicy(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end)
	local var3 = fFlagEnableArgus and var2
	local var4 = argusExperimentModule.useExperimentConfig({ isExposureEnabled = false })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), fFlagArgoEnableMoments (copy), var3 (ref), fFlagEnableArgus (ref), var2 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagArgusTabImpliesFlyout (copy), fFlagEnableArgusTab (copy)
		local entryType = var4.entryType
		local isTab = entryType == "tab"
		local var6_1_1 = fFlagArgoEnableMoments and var3
		
		return {
			isMasterEnabled = fFlagEnableArgus,
			isAmpPolicyEnabled = var2,
			isMomentsEnabled = var3,
			isFlyoutEntryEnabled = var6_1_1 or (var3 and (if entryType ~= "flyout" then fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout and isTab else true)),
			isTabEnabled = var6_1_1 or var3 and (isTab or fFlagEnableArgusTab),
			platformIntegrationEnabled = var6_1_1 or var3 and var4.platformIntegration,
			influencerUploadsEnabled = var3 and var4.influencerUploads,
			experimentConfig = var4
		}
	end, { fFlagEnableArgus, var2, var3, var4 })
	reactModule.useEffect(function()
		-- upvalues: debugMomentsGating (copy), var1 (copy), var5 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusTab (copy), fFlagArgoEnableMoments (copy)
		if debugMomentsGating then
			var1:debug("Moments.Gating master={} ampPolicy={} moments={} entryType={} platformIntegration={} influencerUploads={} flyout={} tab={} forceFlyout={} forceTab={} forceAll={}", tostring(var5.isMasterEnabled), tostring(var5.isAmpPolicyEnabled), tostring(var5.isMomentsEnabled), tostring(var5.experimentConfig.entryType), tostring(var5.platformIntegrationEnabled), tostring(var5.influencerUploadsEnabled), tostring(var5.isFlyoutEntryEnabled), tostring(var5.isTabEnabled), tostring(fFlagEnableArgusFlyoutEntry), tostring(fFlagEnableArgusTab), tostring(fFlagArgoEnableMoments))
			
			return
		end
	end, {
		debugMomentsGating,
		fFlagEnableArgusFlyoutEntry,
		fFlagEnableArgusTab,
		var5
	})
	
	return var5
end