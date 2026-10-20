local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsGating = require(Parent.Loggers).Logger:new("Moments.Gating")
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusTab = SharedFlagsModule.FFlagEnableArgusTab
local FFlagArgoEnableMoments = SharedFlagsModule.FFlagArgoEnableMoments
local FFlagMomentsCreationFeatureGate = SharedFlagsModule.FFlagMomentsCreationFeatureGate
local DebugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local FFlagFlyoutRemoveMomentsForArgoEnabled = SharedFlagsModule.FFlagFlyoutRemoveMomentsForArgoEnabled
local GetMomentsCapabilitiesModule = require(MomentsCommon.Stores.GetMomentsCapabilities)
local GetIsSupportedOnPlatformModule = if FFlagFlyoutRemoveMomentsForArgoEnabled then require(MomentsCommon.Utils.getIsSupportedOnPlatform) else nil

return function()
	-- upvalues: FFlagEnableArgus (copy), GetMomentsCapabilitiesModule (copy), UseSignalStateFunction (copy), FFlagMomentsCreationFeatureGate (copy), FFlagFlyoutRemoveMomentsForArgoEnabled (copy), GetIsSupportedOnPlatformModule (copy), ReactModule (copy), FFlagArgoEnableMoments (copy), FFlagEnableArgusTab (copy), DebugMomentsGating (copy), MomentsGating (copy)
	local MomentsCapabilitiesModule = GetMomentsCapabilitiesModule(false)
	local UseSignalStateResult = UseSignalStateFunction(MomentsCapabilitiesModule.getHasMomentsAccess)
	local UseSignalStateResult1 = UseSignalStateFunction(MomentsCapabilitiesModule.getIsInfluencerContentEnabled)
	local UseSignalStateResult2 = if FFlagMomentsCreationFeatureGate then UseSignalStateFunction(MomentsCapabilitiesModule.getCanCreateMoments) else nil
	local IsSupportedOnPlatformModule = if FFlagFlyoutRemoveMomentsForArgoEnabled then GetIsSupportedOnPlatformModule() else false
	local UseSignalStateResult3 = FFlagEnableArgus and UseSignalStateResult
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagArgoEnableMoments (upval), UseSignalStateResult3 (copy), FFlagEnableArgus (copy), UseSignalStateResult (copy), IsSupportedOnPlatformModule (copy), FFlagEnableArgusTab (upval), FFlagMomentsCreationFeatureGate (upval), UseSignalStateResult2 (copy), UseSignalStateResult1 (copy)
		return {
			isMasterEnabled = FFlagEnableArgus,
			isAmpPolicyEnabled = UseSignalStateResult,
			isMomentsEnabled = UseSignalStateResult3,
			isSupportedOnPlatform = IsSupportedOnPlatformModule,
			isFlyoutEntryEnabled = UseSignalStateResult3,
			isTabEnabled = FFlagArgoEnableMoments and UseSignalStateResult3 or UseSignalStateResult3 and FFlagEnableArgusTab,
			isCreationEnabled = UseSignalStateResult3 and (not FFlagMomentsCreationFeatureGate or UseSignalStateResult2),
			platformIntegrationEnabled = UseSignalStateResult3,
			influencerUploadsEnabled = UseSignalStateResult3 and UseSignalStateResult1
		}
	end, {
		FFlagEnableArgus, UseSignalStateResult, UseSignalStateResult3,
		IsSupportedOnPlatformModule, UseSignalStateResult, UseSignalStateResult1,
		if FFlagMomentsCreationFeatureGate then UseSignalStateResult2 else false
	})
	ReactModule.useEffect(function()
		-- upvalues: DebugMomentsGating (upval), MomentsGating (upval), UseMemoResult (copy), FFlagEnableArgusTab (upval), FFlagArgoEnableMoments (upval)
		if DebugMomentsGating then
			MomentsGating:debug("Moments.Gating master={} ampPolicy={} moments={} supportedOnPlatform={} platformIntegration={} influencerUploads={} creation={} flyout={} tab={} forceTab={} forceAll={}", tostring(UseMemoResult.isMasterEnabled), tostring(UseMemoResult.isAmpPolicyEnabled), tostring(UseMemoResult.isMomentsEnabled), tostring(UseMemoResult.isSupportedOnPlatform), tostring(UseMemoResult.platformIntegrationEnabled), tostring(UseMemoResult.influencerUploadsEnabled), tostring(UseMemoResult.isCreationEnabled), tostring(UseMemoResult.isFlyoutEntryEnabled), tostring(UseMemoResult.isTabEnabled), tostring(FFlagEnableArgusTab), (tostring(FFlagArgoEnableMoments)))
			
			return
		end
	end, { DebugMomentsGating, FFlagEnableArgusTab, UseMemoResult })
	
	return UseMemoResult
end