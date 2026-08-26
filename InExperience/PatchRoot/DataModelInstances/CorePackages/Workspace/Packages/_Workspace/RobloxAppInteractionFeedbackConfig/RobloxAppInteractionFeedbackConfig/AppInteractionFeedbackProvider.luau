local parent = script:FindFirstAncestor("RobloxAppInteractionFeedbackConfig").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local interactionFeedbackContext = require(parent.InteractionFeedback).InteractionFeedbackContext
local spatialConfigModule = require(script.Parent.SpatialConfig)
local directionalConfigModule = require(script.Parent.DirectionalConfig)
local pointerConfigModule = require(script.Parent.PointerConfig)
local touchConfigModule = require(script.Parent.TouchConfig)
local useUserExperiment = roactAppExperimentModule.useUserExperiment
local mobileSoundAndHapticsEnabledIXP = game:DefineFastFlag("MobileSoundAndHapticsEnabledIXP", false)
local mobileSoundAndHapticsIXPBypass = game:DefineFastFlag("MobileSoundAndHapticsIXPBypass", false)

return function(p1)
	-- upvalues: responsiveModule (ref), mobileSoundAndHapticsEnabledIXP (ref), useUserExperiment (ref), appUserLayers (ref), reactModule (ref), spatialConfigModule (ref), mobileSoundAndHapticsIXPBypass (ref), touchConfigModule (ref), directionalConfigModule (ref), pointerConfigModule (ref), interactionFeedbackContext (ref)
	local var1 = responsiveModule.useLastInput()
	local var2 = responsiveModule.useIsSpatial()
	local var3 = if mobileSoundAndHapticsEnabledIXP then useUserExperiment({ appUserLayers.MobileSoundAndHapticsLayer }, function(p2)
		-- upvalues: appUserLayers (copy)
		return (p2[appUserLayers.MobileSoundAndHapticsLayer] or {}).mobileSoundAndHapticsEnabled
	end) else nil
	
	return reactModule.createElement(interactionFeedbackContext.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var2 (ref), spatialConfigModule (copy), var1 (ref), responsiveModule (copy), mobileSoundAndHapticsIXPBypass (copy), mobileSoundAndHapticsEnabledIXP (copy), var3 (write), touchConfigModule (copy), directionalConfigModule (copy), pointerConfigModule (copy)
			return if var2 then spatialConfigModule elseif var1 == responsiveModule.Input.Touch then if mobileSoundAndHapticsIXPBypass or mobileSoundAndHapticsEnabledIXP and var3 then touchConfigModule else {} elseif var1 == responsiveModule.Input.Directional then directionalConfigModule elseif var1 == responsiveModule.Input.Pointer then pointerConfigModule else {}
		end, { var2, var1 })
	}, p1.children)
end