local CorePackages = game:GetService("CorePackages")
local Packages = CorePackages.Packages
local ReactModule = require(Packages.React)
local LuauPolyfillModule = require(Packages.LuauPolyfill)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local UseTrackerModeModule = require(script.Parent.useTrackerMode)
local FaceChatUtilsModule = require(script.Parent.Parent.Utils.FaceChatUtils)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local TrackerMode = Enum.TrackerMode

return function()
	-- upvalues: ReactModule (copy), FaceChatUtilsModule (copy), UseTrackerModeModule (copy), UseLocalizationFunction (copy), TrackerMode (copy), ClearTimeoutFunction (copy), SetTimeoutFunction (copy)
	local UseRefResult = ReactModule.useRef(FaceChatUtilsModule.getTrackerMode())
	local UseTrackerModeModuleResult = UseTrackerModeModule()
	local UseLocalizationResult = UseLocalizationFunction({
		controlMessageSound = "CoreScripts.TopBar.ControlMessageSound",
		controlMessageMotion = "CoreScripts.TopBar.ControlMessageMotion",
		controlMessageOn = "CoreScripts.TopBar.ControlMessageOn",
		controlMessageOff = "CoreScripts.TopBar.ControlMessageOff"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		visible = false,
		text = UseLocalizationResult.controlMessageMotion,
		status = UseLocalizationResult.controlMessageOff
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	
	local function v13()
		-- upvalues: UseLocalizationResult (copy), UseTrackerModeModuleResult (copy), TrackerMode (upval), UseRefResult (copy)
		local _ = UseLocalizationResult.controlMessageMotion
		local _ = UseLocalizationResult.controlMessageOff
		local ControlMessageOn = nil
		local ControlMessageMotion = nil
		
		if UseTrackerModeModuleResult == TrackerMode.None then
			ControlMessageOn = UseLocalizationResult.controlMessageOff
			ControlMessageMotion = if UseRefResult.current == TrackerMode.Audio then UseLocalizationResult.controlMessageSound else UseLocalizationResult.controlMessageMotion
		else
			ControlMessageOn = UseLocalizationResult.controlMessageOn
			ControlMessageMotion = if UseTrackerModeModuleResult == TrackerMode.AudioVideo or UseTrackerModeModuleResult == TrackerMode.Video then UseLocalizationResult.controlMessageMotion else UseLocalizationResult.controlMessageSound
		end
		UseRefResult.current = UseTrackerModeModuleResult
		
		return {
			visible = true,
			text = ControlMessageMotion,
			status = ControlMessageOn
		}
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), ClearTimeoutFunction (upval), UseStateResult2 (copy), v13 (copy), SetTimeoutFunction (upval), UseStateResult (copy)
		if UseRefResult1.current then
			ClearTimeoutFunction(UseRefResult1.current)
		end
		UseStateResult2((v13()))
		UseRefResult1.current = SetTimeoutFunction(function()
			-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
			UseStateResult2({
				visible = false,
				text = UseStateResult.text,
				status = UseStateResult.status
			})
		end, 2000)
	end, { UseTrackerModeModuleResult })
	
	return UseStateResult
end