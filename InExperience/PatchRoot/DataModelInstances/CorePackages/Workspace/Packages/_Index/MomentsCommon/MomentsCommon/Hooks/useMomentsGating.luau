local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = require(parent.Loggers).Logger:new("Moments.Gating")
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusFlyoutEntry = sharedFlagsModule.FFlagEnableArgusFlyoutEntry
local fFlagEnableArgusTab = sharedFlagsModule.FFlagEnableArgusTab
local fFlagArgoEnableMoments = sharedFlagsModule.FFlagArgoEnableMoments
local fFlagArgusTabImpliesFlyout = sharedFlagsModule.FFlagArgusTabImpliesFlyout
local debugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local argusExperimentModule = require(momentsCommon.Flags.ArgusExperiment)
local getMomentsCapabilitiesModule = require(momentsCommon.Stores.GetMomentsCapabilities)

return function()
	-- upvalues: fFlagEnableArgus (ref), fFlagGuacMomentsFeatureList (ref), getMomentsCapabilitiesModule (ref), useSignalState (ref), useAppPolicy (ref), argusExperimentModule (ref), reactModule (ref), fFlagArgoEnableMoments (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagArgusTabImpliesFlyout (ref), fFlagEnableArgusTab (ref), debugMomentsGating (ref), var1 (ref)
	local var2 = nil
	local var3 = nil
	
	if fFlagGuacMomentsFeatureList then
		local var4 = getMomentsCapabilitiesModule(false)
		var2 = useSignalState(var4.getHasMomentsAccess)
		var3 = useSignalState(var4.getIsInfluencerContentEnabled)
	end
	local var5 = if fFlagGuacMomentsFeatureList then var2 else useAppPolicy(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end)
	local var6 = fFlagEnableArgus and var5
	local var7 = argusExperimentModule.useExperimentConfig({ isExposureEnabled = false })
	local var8 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), fFlagArgoEnableMoments (copy), var6 (ref), fFlagEnableArgus (ref), var5 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagArgusTabImpliesFlyout (copy), fFlagEnableArgusTab (copy), fFlagGuacMomentsFeatureList (copy), var3 (write)
		local entryType = var7.entryType
		local isTab = entryType == "tab"
		local var10_1_1 = fFlagArgoEnableMoments and var6
		
		return {
			isMasterEnabled = fFlagEnableArgus,
			isAmpPolicyEnabled = var5,
			isMomentsEnabled = var6,
			isFlyoutEntryEnabled = var10_1_1 or (var6 and (if entryType ~= "flyout" then fFlagEnableArgusFlyoutEntry or fFlagArgusTabImpliesFlyout and isTab else true)),
			isTabEnabled = var10_1_1 or var6 and (isTab or fFlagEnableArgusTab),
			platformIntegrationEnabled = var10_1_1 or var6 and var7.platformIntegration,
			influencerUploadsEnabled = var6 and (var7.influencerUploads and (if fFlagGuacMomentsFeatureList then var3 else true)),
			experimentConfig = var7
		}
	end, {
		fFlagEnableArgus, var5, var6, var7, var2, var3
	})
	reactModule.useEffect(function()
		-- upvalues: debugMomentsGating (copy), var1 (copy), var8 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusTab (copy), fFlagArgoEnableMoments (copy)
		if debugMomentsGating then
			var1:debug("Moments.Gating master={} ampPolicy={} moments={} entryType={} platformIntegration={} influencerUploads={} flyout={} tab={} forceFlyout={} forceTab={} forceAll={}", tostring(var8.isMasterEnabled), tostring(var8.isAmpPolicyEnabled), tostring(var8.isMomentsEnabled), tostring(var8.experimentConfig.entryType), tostring(var8.platformIntegrationEnabled), tostring(var8.influencerUploadsEnabled), tostring(var8.isFlyoutEntryEnabled), tostring(var8.isTabEnabled), tostring(fFlagEnableArgusFlyoutEntry), tostring(fFlagEnableArgusTab), tostring(fFlagArgoEnableMoments))
			
			return
		end
	end, {
		debugMomentsGating,
		fFlagEnableArgusFlyoutEntry,
		fFlagEnableArgusTab,
		var8
	})
	
	return var8
end