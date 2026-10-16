local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = require(parent.Loggers).Logger:new("Moments.Gating")
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusTab = sharedFlagsModule.FFlagEnableArgusTab
local fFlagArgoEnableMoments = sharedFlagsModule.FFlagArgoEnableMoments
local debugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local fFlagGuacMomentsFeatureList = sharedFlagsModule.FFlagGuacMomentsFeatureList
local fFlagFlyoutRemoveMomentsForArgoEnabled = sharedFlagsModule.FFlagFlyoutRemoveMomentsForArgoEnabled
local getMomentsCapabilitiesModule = require(momentsCommon.Stores.GetMomentsCapabilities)
local var2 = if fFlagFlyoutRemoveMomentsForArgoEnabled then require(momentsCommon.Utils.getIsSupportedOnPlatform) else nil

return function()
	-- upvalues: fFlagEnableArgus (ref), fFlagGuacMomentsFeatureList (ref), getMomentsCapabilitiesModule (ref), useSignalState (ref), useAppPolicy (ref), fFlagFlyoutRemoveMomentsForArgoEnabled (ref), var2 (ref), reactModule (ref), fFlagArgoEnableMoments (ref), fFlagEnableArgusTab (ref), debugMomentsGating (ref), var1 (ref)
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
	local var9 = reactModule.useMemo(function()
		-- upvalues: fFlagArgoEnableMoments (copy), var8 (ref), fFlagEnableArgus (ref), var6 (ref), var7 (ref), fFlagEnableArgusTab (copy), fFlagGuacMomentsFeatureList (copy), var4 (write)
		return {
			isMasterEnabled = fFlagEnableArgus,
			isAmpPolicyEnabled = var6,
			isMomentsEnabled = var8,
			isSupportedOnPlatform = var7,
			isFlyoutEntryEnabled = var8,
			isTabEnabled = fFlagArgoEnableMoments and var8 or var8 and fFlagEnableArgusTab,
			platformIntegrationEnabled = var8,
			influencerUploadsEnabled = var8 and (if fFlagGuacMomentsFeatureList then var4 else true)
		}
	end, {
		fFlagEnableArgus, var6, var8, var7, var3, var4
	})
	reactModule.useEffect(function()
		-- upvalues: debugMomentsGating (copy), var1 (copy), var9 (ref), fFlagEnableArgusTab (copy), fFlagArgoEnableMoments (copy)
		if debugMomentsGating then
			var1:debug("Moments.Gating master={} ampPolicy={} moments={} supportedOnPlatform={} platformIntegration={} influencerUploads={} flyout={} tab={} forceTab={} forceAll={}", tostring(var9.isMasterEnabled), tostring(var9.isAmpPolicyEnabled), tostring(var9.isMomentsEnabled), tostring(var9.isSupportedOnPlatform), tostring(var9.platformIntegrationEnabled), tostring(var9.influencerUploadsEnabled), tostring(var9.isFlyoutEntryEnabled), tostring(var9.isTabEnabled), tostring(fFlagEnableArgusTab), tostring(fFlagArgoEnableMoments))
			
			return
		end
	end, { debugMomentsGating, fFlagEnableArgusTab, var9 })
	
	return var9
end