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
local debugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local fFlagFlyoutRemoveMomentsForArgoEnabled = sharedFlagsModule.FFlagFlyoutRemoveMomentsForArgoEnabled
local argusExperimentModule = require(momentsCommon.Flags.ArgusExperiment)
local getMomentsCapabilitiesModule = require(momentsCommon.Stores.GetMomentsCapabilities)
local var2 = if fFlagFlyoutRemoveMomentsForArgoEnabled then require(momentsCommon.Utils.getIsSupportedOnPlatform) else nil

return function()
	-- upvalues: fFlagEnableArgus (ref), fFlagGuacMomentsFeatureList (ref), getMomentsCapabilitiesModule (ref), useSignalState (ref), useAppPolicy (ref), fFlagFlyoutRemoveMomentsForArgoEnabled (ref), var2 (ref), argusExperimentModule (ref), reactModule (ref), fFlagArgoEnableMoments (ref), fFlagEnableArgusFlyoutEntry (ref), fFlagEnableArgusTab (ref), debugMomentsGating (ref), var1 (ref)
	local var3 = nil
	local var4 = nil
	
	if fFlagGuacMomentsFeatureList then
		local var5 = getMomentsCapabilitiesModule(false)
		var3 = useSignalState(var5.getHasMomentsAccess)
		var4 = useSignalState(var5.getIsInfluencerContentEnabled)
	end
	local var6 = if fFlagGuacMomentsFeatureList then var3 else useAppPolicy(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end)
	local var7 = if fFlagFlyoutRemoveMomentsForArgoEnabled then var2() else false
	local var8 = fFlagEnableArgus and var6
	local var9 = argusExperimentModule.useExperimentConfig({ isExposureEnabled = false })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var9 (ref), fFlagArgoEnableMoments (copy), var8 (ref), fFlagEnableArgus (ref), var6 (ref), var7 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusTab (copy), fFlagGuacMomentsFeatureList (copy), var4 (write)
		local entryType = var9.entryType
		local isTab = entryType == "tab"
		local var11_1_1 = fFlagArgoEnableMoments and var8
		
		return {
			isMasterEnabled = fFlagEnableArgus,
			isAmpPolicyEnabled = var6,
			isMomentsEnabled = var8,
			isSupportedOnPlatform = var7,
			isFlyoutEntryEnabled = var11_1_1 or (var8 and (if entryType ~= "flyout" then fFlagEnableArgusFlyoutEntry or isTab else true)),
			isTabEnabled = var11_1_1 or var8 and (isTab or fFlagEnableArgusTab),
			platformIntegrationEnabled = var11_1_1 or var8 and var9.platformIntegration,
			influencerUploadsEnabled = var8 and (var9.influencerUploads and (if fFlagGuacMomentsFeatureList then var4 else true)),
			experimentConfig = var9
		}
	end, {
		fFlagEnableArgus, var6, var8, var7, var9, var3, var4
	})
	reactModule.useEffect(function()
		-- upvalues: debugMomentsGating (copy), var1 (copy), var10 (ref), fFlagEnableArgusFlyoutEntry (copy), fFlagEnableArgusTab (copy), fFlagArgoEnableMoments (copy)
		if debugMomentsGating then
			var1:debug("Moments.Gating master={} ampPolicy={} moments={} supportedOnPlatform={} entryType={} platformIntegration={} influencerUploads={} flyout={} tab={} forceFlyout={} forceTab={} forceAll={}", tostring(var10.isMasterEnabled), tostring(var10.isAmpPolicyEnabled), tostring(var10.isMomentsEnabled), tostring(var10.isSupportedOnPlatform), tostring(var10.experimentConfig.entryType), tostring(var10.platformIntegrationEnabled), tostring(var10.influencerUploadsEnabled), tostring(var10.isFlyoutEntryEnabled), tostring(var10.isTabEnabled), tostring(fFlagEnableArgusFlyoutEntry), tostring(fFlagEnableArgusTab), tostring(fFlagArgoEnableMoments))
			
			return
		end
	end, {
		debugMomentsGating,
		fFlagEnableArgusFlyoutEntry,
		fFlagEnableArgusTab,
		var10
	})
	
	return var10
end