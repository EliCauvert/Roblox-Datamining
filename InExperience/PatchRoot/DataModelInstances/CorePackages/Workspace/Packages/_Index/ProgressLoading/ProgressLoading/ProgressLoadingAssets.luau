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
	local var6, var7 = motionModule.useMotion(t.visible)
	reactModule.useEffect(function()
		-- upvalues: value (ref), var7 (ref), t (copy)
		local var10 = false
		
		if value.isVisible == false then
			var7(t.hidden, {
				onAnimationComplete = function(p0)
					-- upvalues: var10 (write), value (copy)
					if not var10 and p0 == true and value.onHideComplete then
						value.onHideComplete()
					end
				end
			})
		else
			var7(t.visible)
		end
		return function()
			-- upvalues: var10 (write)
			var10 = true
		end
	end, { value.isVisible, value.onHideComplete })
	local var8, var9 = reactModule.useBinding(0)
	
	return reactModule.createElement(view, {
		tag = "size-full col align-x-center align-y-center bg-surface-0",
		GroupTransparency = var6.groupTransparency,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
			-- upvalues: var9 (ref)
			var9(p1.AbsoluteSize.X)
		end, {})
	}, {
		ProgressBarContainer = reactModule.createElement(view, {
			tag = "auto-y",
			Size = reactModule.joinBindings({
				width = var8:map(function(p3)
					-- upvalues: computeSpanModule (copy), scale (ref), constantsModule (copy)
					return computeSpanModule(p3, scale, constantsModule.PROGRESS_BAR_MARGIN, constantsModule.PROGRESS_BAR_MAX_WIDTH)
				end),
				barScale = var6.barScale
			}):map(function(p2)
				return UDim2.fromOffset(p2.width * p2.barScale, 0)
			end)
		}, {
			ProgressBar = reactModule.createElement(progress, {
				testId = "progress-loading-assets-bar",
				shape = progressShape.Bar
			})
		})
	})
end)