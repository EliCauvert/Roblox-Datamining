local Parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local InteractionFeedbackContext = require(Parent.InteractionFeedback).InteractionFeedbackContext
local SpatialConfigModule = require(script.Parent.SpatialConfig)
local DirectionalConfigModule = require(script.Parent.DirectionalConfig)
local PointerConfigModule = require(script.Parent.PointerConfig)
local TouchConfigModule = require(script.Parent.TouchConfig)
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local MobileSoundAndHapticsEnabledIXP = game:DefineFastFlag("MobileSoundAndHapticsEnabledIXP", false)
local MobileSoundAndHapticsIXPBypass = game:DefineFastFlag("MobileSoundAndHapticsIXPBypass", false)

return function(p1)
	-- upvalues: ResponsiveModule (copy), MobileSoundAndHapticsEnabledIXP (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), ReactModule (copy), SpatialConfigModule (copy), MobileSoundAndHapticsIXPBypass (copy), TouchConfigModule (copy), DirectionalConfigModule (copy), PointerConfigModule (copy), InteractionFeedbackContext (copy)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UseIsSpatialResult = ResponsiveModule.useIsSpatial()
	local UseUserExperimentResult = if MobileSoundAndHapticsEnabledIXP then UseUserExperimentFunction({ AppUserLayers.MobileSoundAndHapticsLayer }, function(p2)
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.MobileSoundAndHapticsLayer] or {}).mobileSoundAndHapticsEnabled
	end) else nil
	
	return ReactModule.createElement(InteractionFeedbackContext.Provider, {
		value = ReactModule.useMemo(function()
			-- upvalues: UseIsSpatialResult (copy), SpatialConfigModule (upval), UseLastInputResult (copy), ResponsiveModule (upval), MobileSoundAndHapticsIXPBypass (upval), MobileSoundAndHapticsEnabledIXP (upval), UseUserExperimentResult (ref), TouchConfigModule (upval), DirectionalConfigModule (upval), PointerConfigModule (upval)
			return if UseIsSpatialResult then SpatialConfigModule elseif UseLastInputResult == ResponsiveModule.Input.Touch then if MobileSoundAndHapticsIXPBypass or MobileSoundAndHapticsEnabledIXP and UseUserExperimentResult then TouchConfigModule else {} elseif UseLastInputResult == ResponsiveModule.Input.Directional then DirectionalConfigModule elseif UseLastInputResult == ResponsiveModule.Input.Pointer then PointerConfigModule else {}
		end, { UseIsSpatialResult, UseLastInputResult })
	}, p1.children)
end