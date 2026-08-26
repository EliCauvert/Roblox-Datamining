local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local progress = foundationModule.Progress
local progressShape = foundationModule.Enums.ProgressShape
local useTokens = foundationModule.Hooks.useTokens
local computeSpanModule = require(script.Parent.computeSpan)
local constantsModule = require(script.Parent.Constants)
local t = {
	visible = motionModule.createState({ groupTransparency = 0, barScale = 1 }),
	hidden = motionModule.createState({ groupTransparency = 1, barScale = 0 }, { default = motionModule.transition({ duration = 0.1 }) })
}

return reactModule.memo(function(value)
	-- upvalues: useTokens (ref), motionModule (ref), t (ref), reactModule (ref), computeSpanModule (ref), constantsModule (ref), view (ref), progress (ref), progressShape (ref)
	local scale = useTokens().Config.UI.Scale
	local var1, var2 = motionModule.useMotion(t.visible)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var2 (ref), t (copy)
		local var3 = false
		
		if value.isVisible == false then
			var2(t.hidden, {
				onAnimationComplete = function(p1)
					-- upvalues: var3 (write), value (copy)
					if not var3 and p1 == true and value.onHideComplete then
						value.onHideComplete()
					end
				end
			})
		else
			var2(t.visible)
		end
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, { value.isVisible, value.onHideComplete })
	local var3, var4 = reactModule.useBinding(0)
	
	return reactModule.createElement(view, {
		tag = "size-full col align-x-center align-y-center bg-surface-0",
		GroupTransparency = var1.groupTransparency,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
			-- upvalues: var4 (ref)
			var4(p1.AbsoluteSize.X)
		end, {})
	}, {
		ProgressBarContainer = reactModule.createElement(view, {
			tag = "auto-y",
			Size = reactModule.joinBindings({
				width = var3:map(function(p1)
					-- upvalues: computeSpanModule (copy), scale (ref), constantsModule (copy)
					return computeSpanModule(p1, scale, constantsModule.PROGRESS_BAR_MARGIN, constantsModule.PROGRESS_BAR_MAX_WIDTH)
				end),
				barScale = var1.barScale
			}):map(function(p1)
				return UDim2.fromOffset(p1.width * p1.barScale, 0)
			end)
		}, {
			ProgressBar = reactModule.createElement(progress, {
				testId = "progress-loading-assets-bar",
				shape = progressShape.Bar
			})
		})
	})
end)