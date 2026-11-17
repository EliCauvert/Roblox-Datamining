local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TransientUIOverlayModule = require(Parent.TransientUIOverlay)
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)
local UseSecondsLeftModule = require(InExperienceCloudPlay.Hooks.useSecondsLeft)
local UseServicePropertyModule = require(InExperienceCloudPlay.Hooks.useServiceProperty)

return function()
	-- upvalues: ReactModule (copy), GetCloudClientServiceModule (copy), UseServicePropertyModule (copy), UseSecondsLeftModule (copy), UseLocalizationFunction (copy), TransientUIOverlayModule (copy)
	local UseMemoResult = ReactModule.useMemo(GetCloudClientServiceModule, {})
	local IsIsRobloxRealityEnvironment = UseServicePropertyModule(UseMemoResult, "IsRobloxRealityEnvironment") == true
	local SessionTimeLimit = UseServicePropertyModule(UseMemoResult, "SessionTimeLimit")
	local UseSecondsLeftModuleResult: number = UseSecondsLeftModule(if IsIsRobloxRealityEnvironment then UseMemoResult else nil, if typeof(SessionTimeLimit) == "number" then SessionTimeLimit else nil)
	local UseRefResult = ReactModule.useRef(false)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.CloudClient.Label.RobloxRealityEndingSoon"
	})
	local IsUseSecondsLeftModuleResultBelow: boolean = UseSecondsLeftModuleResult ~= nil and (UseSecondsLeftModuleResult > 0 and UseSecondsLeftModuleResult <= 60)
	ReactModule.useEffect(function()
		-- upvalues: IsUseSecondsLeftModuleResultBelow (copy), UseRefResult (copy), TransientUIOverlayModule (upval), UseLocalizationResult (copy)
		if IsUseSecondsLeftModuleResultBelow and not UseRefResult.current then
			UseRefResult.current = true
			TransientUIOverlayModule.displaySnackbar({ kind = "snackbar", title = UseLocalizationResult.title }, 7)
		end
	end, {
		IsUseSecondsLeftModuleResultBelow,
		UseLocalizationResult.title
	})
	
	return nil
end