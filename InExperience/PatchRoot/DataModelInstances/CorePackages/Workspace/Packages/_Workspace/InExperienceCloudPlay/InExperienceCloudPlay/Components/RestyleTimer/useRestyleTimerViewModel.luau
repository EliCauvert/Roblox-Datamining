local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local Parent = InExperienceCloudPlay.Parent
local ReactModule = require(Parent.React)
local _ = require(InExperienceCloudPlay.CloudPlayTelemetry)
local RestyleSessionTelemetryModule = require(script.Parent.RestyleSessionTelemetry)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.RestyleTimerView)
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)
local UseSecondsLeftModule = require(InExperienceCloudPlay.Hooks.useSecondsLeft)
local UseServicePropertyModule = require(InExperienceCloudPlay.Hooks.useServiceProperty)
local FFlagLuaAppCloudClientRobloxRealityNameParamModule = require(InExperienceCloudPlay.Flags.FFlagLuaAppCloudClientRobloxRealityNameParam)
local FStringLuaAppCloudClientRobloxRealityNameModule = require(InExperienceCloudPlay.Flags.FStringLuaAppCloudClientRobloxRealityName)

local function _(p1: number): string
	return string.format("%02d:%02d", p1 // 60, p1 % 60)
end

return function(p1)
	-- upvalues: ReactModule (copy), GetCloudClientServiceModule (copy), UseServicePropertyModule (copy), UseSecondsLeftModule (copy), FFlagLuaAppCloudClientRobloxRealityNameParamModule (copy), UseLocalizationFunction (copy), FStringLuaAppCloudClientRobloxRealityNameModule (copy), RestyleSessionTelemetryModule (copy)
	local UseMemoResult = ReactModule.useMemo(GetCloudClientServiceModule, {})
	local IsRobloxRealityEnvironment = UseServicePropertyModule(UseMemoResult, "IsRobloxRealityEnvironment")
	local RobloxRealityFilterEnabled = UseServicePropertyModule(UseMemoResult, "RobloxRealityFilterEnabled")
	local SessionTimeLimit = UseServicePropertyModule(UseMemoResult, "SessionTimeLimit")
	local NoIsHidden: boolean = IsRobloxRealityEnvironment == true and not p1.isHidden
	local UseSecondsLeftModuleResult: number = UseSecondsLeftModule(if NoIsHidden then UseMemoResult else nil, if typeof(SessionTimeLimit) == "number" then SessionTimeLimit else nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalizationResult = if FFlagLuaAppCloudClientRobloxRealityNameParamModule then UseLocalizationFunction(if NoIsHidden then {
		timeLeft = "Feature.CloudClient.Label.TimeLeft",
		description = {
			"Feature.CloudClient.Description.RobloxRealityPreviewV2",
			productName = FStringLuaAppCloudClientRobloxRealityNameModule
		}
	} else {}) else UseLocalizationFunction(if NoIsHidden then {
		restyle = "Feature.CloudClient.Label.RobloxReality",
		timeLeft = "Feature.CloudClient.Label.TimeLeft",
		description = "Feature.CloudClient.Description.RobloxRealityPreview"
	} else {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseRefResult.current = "chip"
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseRefResult.current = "outside"
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(RobloxRealityFilterEnabled)
		-- upvalues: UseMemoResult (copy), RestyleSessionTelemetryModule (upval)
		if UseMemoResult then
			UseMemoResult.RobloxRealityFilterEnabled = RobloxRealityFilterEnabled
		end
		RestyleSessionTelemetryModule.toggled(RobloxRealityFilterEnabled)
	end, { UseMemoResult })
	local OnAreaChangedFunction = p1.onAreaChanged
	local UseResult3 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: OnAreaChangedFunction (copy)
		if OnAreaChangedFunction then
			OnAreaChangedFunction("restyle-timer", Frame.AbsolutePosition, Frame.AbsoluteSize)
		end
	end, { OnAreaChangedFunction })
	local UseRefResult1 = ReactModule.useRef(p1.onAreaRemoved)
	UseRefResult1.current = p1.onAreaRemoved
	ReactModule.useEffect(function()
		-- upvalues: NoIsHidden (copy), UseRefResult (copy), UseStateResult2 (copy), UseRefResult1 (copy)
		if NoIsHidden then
			return function()
				-- upvalues: UseRefResult1 (upval)
				local CurrentFunction: (any) -> () = UseRefResult1.current
				
				if CurrentFunction then
					CurrentFunction("restyle-timer")
				end
			end
		else
			UseRefResult.current = "hidden"
			UseStateResult2(false)
			
			return nil
		end
	end, { NoIsHidden })
	ReactModule.useEffect(function()
		-- upvalues: RestyleSessionTelemetryModule (upval)
		return RestyleSessionTelemetryModule.mount()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: NoIsHidden (copy), p1 (copy), RestyleSessionTelemetryModule (upval)
		if NoIsHidden and p1.isTopBarVisible ~= false then
			RestyleSessionTelemetryModule.chipShown()
		end
	end, { NoIsHidden, p1.isTopBarVisible })
	ReactModule.useEffect(function()
		-- upvalues: IsRobloxRealityEnvironment (copy), RestyleSessionTelemetryModule (upval), RobloxRealityFilterEnabled (copy)
		if IsRobloxRealityEnvironment == true then
			RestyleSessionTelemetryModule.filterChanged(RobloxRealityFilterEnabled == true)
		end
	end, { IsRobloxRealityEnvironment, RobloxRealityFilterEnabled })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), RestyleSessionTelemetryModule (upval), UseRefResult (copy)
		if UseStateResult then
			RestyleSessionTelemetryModule.popoverOpened()
			
			return
		else
			RestyleSessionTelemetryModule.popoverClosed(UseRefResult.current or "outside")
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSecondsLeftModuleResult (copy), RestyleSessionTelemetryModule (upval)
		if UseSecondsLeftModuleResult == 0 then
			RestyleSessionTelemetryModule.timerExpired()
		end
	end, { UseSecondsLeftModuleResult })
	
	return if NoIsHidden then {
		text = {
			restyle = if FFlagLuaAppCloudClientRobloxRealityNameParamModule then FStringLuaAppCloudClientRobloxRealityNameModule else UseLocalizationResult.restyle,
			timeLeft = UseLocalizationResult.timeLeft,
			description = UseLocalizationResult.description
		},
		timeLeft = if UseSecondsLeftModuleResult then string.format("%02d:%02d", UseSecondsLeftModuleResult // 60, UseSecondsLeftModuleResult % 60) else nil,
		isPopoverOpen = UseStateResult,
		isRestyleEnabled = RobloxRealityFilterEnabled == true,
		buttonSize = p1.buttonSize,
		layoutOrder = p1.layoutOrder,
		onChipActivated = UseResult,
		onPopoverClosed = UseResult1,
		onRestyleToggled = UseResult2,
		onAreaChanged = UseResult3
	} else nil
end