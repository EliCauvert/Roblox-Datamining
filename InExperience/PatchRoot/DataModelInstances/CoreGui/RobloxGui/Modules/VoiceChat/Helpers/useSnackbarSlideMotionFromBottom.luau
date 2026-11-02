local CorePackages = game:GetService("CorePackages")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local MotionModule = require(CorePackages.Packages.Motion)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)

return function(p1)
	-- upvalues: FoundationModule (copy), ResponsiveModule (copy), ReactModule (copy), UserGameSettings (copy), MotionModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Current = ReactModule.useRef(UserGameSettings.ReducedMotion).current
	local Largest = math.max(p1 or UseTokensResult.Padding.XLarge, ResponsiveModule.useDeviceInsets().bottom)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MotionModule (upval), Current (copy), UseTokensResult (copy)
		return MotionModule.createState({
			anchorPoint = Vector2.new(0.5, 0),
			position = UDim2.fromScale(0.5, 1)
		}, {
			default = {
				duration = if Current then 0 else 0.15,
				easingStyle = UseTokensResult.Ease.StandardIn
			}
		})
	end, { UseTokensResult, Current })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: MotionModule (upval), Largest (copy), Current (copy), UseTokensResult (copy)
		return MotionModule.createState({
			anchorPoint = Vector2.new(0.5, 1),
			position = UDim2.new(0.5, 0, 1, -Largest)
		}, {
			default = {
				duration = if Current then 0 else UseTokensResult.Time.Time_200,
				easingStyle = UseTokensResult.Ease.StandardOut
			}
		})
	end, { UseTokensResult, Current, Largest })
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(if Current then UseMemoResult1 else UseMemoResult)
	local UseRefResult = ReactModule.useRef(UseMotionResult2)
	UseRefResult.current = UseMotionResult2
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(UseMemoResult1)
	UseRefResult2.current = UseMemoResult1
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseMemoResult1 (copy)
		if not UseRefResult1.current then
			UseRefResult.current(UseMemoResult1)
		end
	end, { UseMemoResult1 })
	
	return {
		anchorPoint = UseMotionResult.anchorPoint,
		position = UseMotionResult.position,
		enter = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy)
			if UseRefResult1.current then
				UseRefResult1.current = false
				UseRefResult.current(UseRefResult2.current)
			end
		end, {}),
		exit = ReactModule.useCallback(function(Callback)
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseMemoResult (copy)
			UseRefResult1.current = true
			UseRefResult.current(UseMemoResult, {
				onAnimationComplete = function(Enabled)
					-- upvalues: Callback (copy)
					if Enabled == true then
						Callback()
					end
				end
			})
		end, { UseMemoResult })
	}
end