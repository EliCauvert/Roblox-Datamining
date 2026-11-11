local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local ReactModule = require(Parent.React)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local SharedFlagsModule = require(Parent.SharedFlags)
local MomentsGating = require(Parent.Loggers).Logger:new("Moments.Gating")
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusFlyoutEntry = SharedFlagsModule.FFlagEnableArgusFlyoutEntry
local FFlagEnableArgusTab = SharedFlagsModule.FFlagEnableArgusTab
local FFlagArgoEnableMoments = SharedFlagsModule.FFlagArgoEnableMoments
local FFlagArgusTabImpliesFlyout = SharedFlagsModule.FFlagArgusTabImpliesFlyout
local DebugMomentsGating = game:DefineFastFlag("DebugMomentsGating", false)
local ArgusExperimentModule = require(MomentsCommon.Flags.ArgusExperiment)

return function()
	-- upvalues: FFlagEnableArgus (copy), UseAppPolicyFunction (copy), ArgusExperimentModule (copy), ReactModule (copy), FFlagArgoEnableMoments (copy), FFlagEnableArgusFlyoutEntry (copy), FFlagArgusTabImpliesFlyout (copy), FFlagEnableArgusTab (copy), DebugMomentsGating (copy), MomentsGating (copy)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getDisplayMomentsMoreTabTile()
	end)
	local UseAppPolicyResult1 = FFlagEnableArgus and UseAppPolicyResult
	local UseExperimentConfigResult = ArgusExperimentModule.useExperimentConfig({ isExposureEnabled = false })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseExperimentConfigResult (copy), FFlagArgoEnableMoments (upval), UseAppPolicyResult1 (copy), FFlagEnableArgus (copy), UseAppPolicyResult (copy), FFlagEnableArgusFlyoutEntry (upval), FFlagArgusTabImpliesFlyout (upval), FFlagEnableArgusTab (upval)
		local EntryType = UseExperimentConfigResult.entryType
		local IsTab = EntryType == "tab"
		local UseAppPolicyResult1_1 = FFlagArgoEnableMoments and UseAppPolicyResult1
		
		return {
			isMasterEnabled = FFlagEnableArgus,
			isAmpPolicyEnabled = UseAppPolicyResult,
			isMomentsEnabled = UseAppPolicyResult1,
			isFlyoutEntryEnabled = UseAppPolicyResult1_1 or UseAppPolicyResult1 and (EntryType == "flyout" or (FFlagEnableArgusFlyoutEntry or FFlagArgusTabImpliesFlyout and IsTab)),
			isTabEnabled = UseAppPolicyResult1_1 or UseAppPolicyResult1 and (IsTab or FFlagEnableArgusTab),
			platformIntegrationEnabled = UseAppPolicyResult1_1 or UseAppPolicyResult1 and UseExperimentConfigResult.platformIntegration,
			influencerUploadsEnabled = UseAppPolicyResult1 and UseExperimentConfigResult.influencerUploads,
			experimentConfig = UseExperimentConfigResult
		}
	end, {
		FFlagEnableArgus,
		UseAppPolicyResult,
		UseAppPolicyResult1,
		UseExperimentConfigResult
	})
	ReactModule.useEffect(function()
		-- upvalues: DebugMomentsGating (upval), MomentsGating (upval), UseMemoResult (copy), FFlagEnableArgusFlyoutEntry (upval), FFlagEnableArgusTab (upval), FFlagArgoEnableMoments (upval)
		if DebugMomentsGating then
			MomentsGating:debug("Moments.Gating master={} ampPolicy={} moments={} entryType={} platformIntegration={} influencerUploads={} flyout={} tab={} forceFlyout={} forceTab={} forceAll={}", tostring(UseMemoResult.isMasterEnabled), tostring(UseMemoResult.isAmpPolicyEnabled), tostring(UseMemoResult.isMomentsEnabled), tostring(UseMemoResult.experimentConfig.entryType), tostring(UseMemoResult.platformIntegrationEnabled), tostring(UseMemoResult.influencerUploadsEnabled), tostring(UseMemoResult.isFlyoutEntryEnabled), tostring(UseMemoResult.isTabEnabled), tostring(FFlagEnableArgusFlyoutEntry), tostring(FFlagEnableArgusTab), (tostring(FFlagArgoEnableMoments)))
			
			return
		end
	end, {
		DebugMomentsGating,
		FFlagEnableArgusFlyoutEntry,
		FFlagEnableArgusTab,
		UseMemoResult
	})
	
	return UseMemoResult
end