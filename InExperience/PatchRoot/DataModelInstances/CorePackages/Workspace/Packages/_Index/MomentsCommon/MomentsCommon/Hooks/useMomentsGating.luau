local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = require(parent.Loggers).Logger:new("Moments.Gating")
local fFlagEnableArgus = sharedFlagsModule.FFlagEnableArgus
local fFlagEnableArgusTab = sharedFlagsModule.FFlagEnableArgusTab
local fFlagArgoEnableMoments = sharedFlagsModule.FFlagArgoEnableMoments
local debugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local fFlagFlyoutRemoveMomentsForArgoEnabled = sharedFlagsModule.FFlagFlyoutRemoveMomentsForArgoEnabled
local getMomentsCapabilitiesModule = require(momentsCommon.Stores.GetMomentsCapabilities)
local var2 = if fFlagFlyoutRemoveMomentsForArgoEnabled then require(momentsCommon.Utils.getIsSupportedOnPlatform) else nil

return function()
	-- upvalues: fFlagEnableArgus (ref), getMomentsCapabilitiesModule (ref), useSignalState (ref), fFlagFlyoutRemoveMomentsForArgoEnabled (ref), var2 (ref), reactModule (ref), fFlagArgoEnableMoments (ref), fFlagEnableArgusTab (ref), debugMomentsGating (ref), var1 (ref)
	local var3 = getMomentsCapabilitiesModule(false)
	local var4 = useSignalState(var3.getHasMomentsAccess)
	local var5 = useSignalState(var3.getIsInfluencerContentEnabled)
	local var6 = if fFlagFlyoutRemoveMomentsForArgoEnabled then var2() else false
	local var7 = fFlagEnableArgus and var4
	local var8 = reactModule.useMemo(function()
		-- upvalues: fFlagArgoEnableMoments (copy), var7 (ref), fFlagEnableArgus (ref), var4 (ref), var6 (ref), fFlagEnableArgusTab (copy), var5 (ref)
		return {
			isMasterEnabled = fFlagEnableArgus,
			isAmpPolicyEnabled = var4,
			isMomentsEnabled = var7,
			isSupportedOnPlatform = var6,
			isFlyoutEntryEnabled = var7,
			isTabEnabled = fFlagArgoEnableMoments and var7 or var7 and fFlagEnableArgusTab,
			platformIntegrationEnabled = var7,
			influencerUploadsEnabled = var7 and var5
		}
	end, {
		fFlagEnableArgus, var4, var7, var6, var4, var5
	})
	reactModule.useEffect(function()
		-- upvalues: debugMomentsGating (copy), var1 (copy), var8 (ref), fFlagEnableArgusTab (copy), fFlagArgoEnableMoments (copy)
		if debugMomentsGating then
			var1:debug("Moments.Gating master={} ampPolicy={} moments={} supportedOnPlatform={} platformIntegration={} influencerUploads={} flyout={} tab={} forceTab={} forceAll={}", tostring(var8.isMasterEnabled), tostring(var8.isAmpPolicyEnabled), tostring(var8.isMomentsEnabled), tostring(var8.isSupportedOnPlatform), tostring(var8.platformIntegrationEnabled), tostring(var8.influencerUploadsEnabled), tostring(var8.isFlyoutEntryEnabled), tostring(var8.isTabEnabled), tostring(fFlagEnableArgusTab), tostring(fFlagArgoEnableMoments))
			
			return
		end
	end, { debugMomentsGating, fFlagEnableArgusTab, var8 })
	
	return var8
end