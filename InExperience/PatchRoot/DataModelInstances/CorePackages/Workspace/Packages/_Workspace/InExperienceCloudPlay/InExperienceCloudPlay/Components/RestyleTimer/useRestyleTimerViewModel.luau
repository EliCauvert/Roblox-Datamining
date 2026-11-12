local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local ReactModule = require(InExperienceCloudPlay.Parent.React)
local _ = require(script.Parent.RestyleTimerView)
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)
local UseSecondsLeftModule = require(InExperienceCloudPlay.Hooks.useSecondsLeft)
local UseServicePropertyModule = require(InExperienceCloudPlay.Hooks.useServiceProperty)

local function _(p1: number): string
	return string.format("%02d:%02d", p1 // 60, p1 % 60)
end

return function(p1)
	-- upvalues: ReactModule (copy), GetCloudClientServiceModule (copy), UseServicePropertyModule (copy), UseSecondsLeftModule (copy)
	local UseMemoResult = ReactModule.useMemo(GetCloudClientServiceModule, {})
	local IsRobloxRealityEnvironment = UseServicePropertyModule(UseMemoResult, "IsRobloxRealityEnvironment")
	local RobloxRealityFilterEnabled = UseServicePropertyModule(UseMemoResult, "RobloxRealityFilterEnabled")
	local SessionTimeLimit = UseServicePropertyModule(UseMemoResult, "SessionTimeLimit")
	local NoIsHidden: boolean = IsRobloxRealityEnvironment == true and not p1.isHidden
	local UseSecondsLeftModuleResult: number = UseSecondsLeftModule(if NoIsHidden then UseMemoResult else nil, if typeof(SessionTimeLimit) == "number" then SessionTimeLimit else nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(RobloxRealityFilterEnabled)
		-- upvalues: UseMemoResult (copy)
		if UseMemoResult then
			UseMemoResult.RobloxRealityFilterEnabled = RobloxRealityFilterEnabled
		end
	end, { UseMemoResult })
	local OnAreaChangedFunction = p1.onAreaChanged
	local UseResult3 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: OnAreaChangedFunction (copy)
		if OnAreaChangedFunction then
			OnAreaChangedFunction("restyle-timer", Frame.AbsolutePosition, Frame.AbsoluteSize)
		end
	end, { OnAreaChangedFunction })
	local UseRefResult = ReactModule.useRef(p1.onAreaRemoved)
	UseRefResult.current = p1.onAreaRemoved
	ReactModule.useEffect(function()
		-- upvalues: NoIsHidden (copy), UseStateResult2 (copy), UseRefResult (copy)
		if NoIsHidden then
			return function()
				-- upvalues: UseRefResult (upval)
				local CurrentFunction: (any) -> () = UseRefResult.current
				
				if CurrentFunction then
					CurrentFunction("restyle-timer")
				end
			end
		else
			UseStateResult2(false)
			
			return nil
		end
	end, { NoIsHidden })
	
	return if NoIsHidden then {
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