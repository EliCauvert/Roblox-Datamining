local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local NavigationModule = require(Parent.Navigation)
local ViewState = NavigationModule.ViewState
local UseEarlyIsFocusedFunction = NavigationModule.useEarlyIsFocused
local ConstantsModule = require(TenFootUiShell.ReactNavigationExtend.Views.Constants)
local TenFootUiSceneModule = require(TenFootUiShell.Hooks.TenFootUiScene)
local config = { FRONT_HIDDEN = -1, CENTER_VISIBLE = 0, BACK_HIDDEN = 1 }

local function _(p1): number
	return if p1 then 0 else 1
end

return function(p1)
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), ViewState (copy), config (copy), ConstantsModule (copy), UseEarlyIsFocusedFunction (copy), TenFootUiSceneModule (copy)
	local IsTopOfStack = p1.isTopOfStack
	local TotalInStack = p1.totalInStack
	local ViewState1 = p1.viewState
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local IsTopOfStack1 = IsTopOfStack or UseStateResult
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(-1, (ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		p1.onAnimationComplete()
		UseStateResult2(false)
	end, { p1.onAnimationComplete })))
	ReactModule.useEffect(function()
		-- upvalues: ViewState1 (copy), ViewState (upval), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), IsTopOfStack (copy), config (upval), ConstantsModule (upval)
		if ViewState1 == ViewState.Opening or ViewState1 == ViewState.Opened then
			UseStateResult2(true)
			UseAnimatedBindingResult2(ReactOtterModule.spring(if IsTopOfStack then config.CENTER_VISIBLE else config.BACK_HIDDEN, ConstantsModule.Z_DIRECTION_ANIMATION_SPRING_CONFIG))
			
			return
		end
		if ViewState1 == ViewState.Closing then
			UseStateResult2(true)
			UseAnimatedBindingResult2(ReactOtterModule.spring(-1, ConstantsModule.Z_DIRECTION_ANIMATION_SPRING_CONFIG))
		end
	end, { ViewState1, IsTopOfStack })
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseEarlyIsFocusedResult (copy), IsTopOfStack (copy), ConstantsModule (upval), TotalInStack (copy), TenFootUiSceneModule (upval)
		if UseEarlyIsFocusedResult and IsTopOfStack then
			TenFootUiSceneModule.updateZPosition(-((TotalInStack - 1) * (ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * ConstantsModule.Z_DIRECTION_ZOOM_FACTOR)))
		end
	end, { UseEarlyIsFocusedResult, IsTopOfStack, TotalInStack })
	
	return ReactModule.useMemo(function()
		-- upvalues: IsTopOfStack1 (copy), UseAnimatedBindingResult (copy), ConstantsModule (upval)
		return {
			isVisible = IsTopOfStack1,
			cFrame = UseAnimatedBindingResult:map(function(p2): CFrame
				-- upvalues: ConstantsModule (upval)
				return CFrame.new(0, 0, -(ConstantsModule.DEFAULT_SCREEN_DISTANCE_TO_CAMERA * ConstantsModule.Z_DIRECTION_ZOOM_FACTOR * p2))
			end),
			transparency = UseAnimatedBindingResult:map(function(Value: number): number
				return (math.abs(Value))
			end)
		}
	end, { IsTopOfStack1, UseAnimatedBindingResult })
end