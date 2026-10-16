local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ReactModule = require(Parent.React)
local MotionModule = require(Parent.Motion)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Progress = FoundationModule.Progress
local ProgressShape = FoundationModule.Enums.ProgressShape
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ComputeSpanModule = require(script.Parent.computeSpan)
local ConstantsModule = require(script.Parent.Constants)
local config = {
	visible = MotionModule.createState({ groupTransparency = 0, barScale = 1 }),
	hidden = MotionModule.createState({ groupTransparency = 1, barScale = 0 }, { default = MotionModule.transition({ duration = 0.1 }) })
}

return ReactModule.memo(function(p1) --[[ Line: 34 | Named "ProgressLoadingAssets" ]]
	-- upvalues: UseTokensFunction (copy), MotionModule (copy), config (copy), ReactModule (copy), ComputeSpanModule (copy), ConstantsModule (copy), View (copy), Progress (copy), ProgressShape (copy)
	local Scale = UseTokensFunction().Config.UI.Scale
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(config.visible)
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: p1 (copy), UseMotionResult2 (copy), config (upval)
		local Flag = false
		
		if p1.isVisible == false then
			UseMotionResult2(config.hidden, {
				onAnimationComplete = function(Enabled) --[[ Line: 44 ]]
					-- upvalues: Flag (ref), p1 (upval)
					if not Flag and Enabled == true and p1.onHideComplete then
						p1.onHideComplete()
					end
				end
			})
		else
			UseMotionResult2(config.visible)
		end
		return function() --[[ Line: 53 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1.isVisible, p1.onHideComplete })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(View, {
		tag = "size-full col align-x-center align-y-center bg-surface-0",
		GroupTransparency = UseMotionResult.groupTransparency,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 69 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize.X)
		end, {})
	}, {
		ProgressBarContainer = ReactModule.createElement(View, {
			tag = "auto-y",
			Size = ReactModule.joinBindings({
				width = UseBindingResult:map(function(p2) --[[ Line: 59 ]]
					-- upvalues: ComputeSpanModule (upval), Scale (copy), ConstantsModule (upval)
					return ComputeSpanModule(p2, Scale, ConstantsModule.PROGRESS_BAR_MARGIN, ConstantsModule.PROGRESS_BAR_MAX_WIDTH)
				end),
				barScale = UseMotionResult.barScale
			}):map(function(p2): UDim2 --[[ Line: 65 ]]
				return UDim2.fromOffset(p2.width * p2.barScale, 0)
			end)
		}, {
			ProgressBar = ReactModule.createElement(Progress, {
				testId = "progress-loading-assets-bar",
				shape = ProgressShape.Bar
			})
		})
	})
end)