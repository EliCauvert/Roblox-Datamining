local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local usePreferences = foundationModule.Hooks.usePreferences
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local t = { frequency = 4, dampingRatio = 0.65 }
local t_1 = { frequency = 4, dampingRatio = 1 }

return reactModule.memo(function(p0)
	-- upvalues: usePreferences (ref), reactModule (ref), reactOtterModule (ref), t (ref), t_1 (ref), controlState (ref), view (ref), stateLayerAffordance (ref), reaction (ref), reactionSize (ref)
	local reducedMotion = usePreferences().reducedMotion
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), p0 (ref)
		local current = var6.current
		p0.onSelect(p0.reaction, if current ~= nil then current.AbsolutePosition + current.AbsoluteSize / 2 else nil)
	end, { p0.onSelect, p0.reaction })
	local var8, var9 = reactOtterModule.useAnimatedBinding(0)
	local var10, var11 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var9 (ref), reactOtterModule (copy), p0 (ref), t (copy)
		if reducedMotion then
			var9(reactOtterModule.instant(1))
			
			return
		end
		local delayedThread = task.delay((p0.index - 1) * 0.04, function()
			-- upvalues: var9 (copy), reactOtterModule (copy), t (copy)
			var9(reactOtterModule.spring(1, t))
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p0.index, reducedMotion })
	local var12, var13 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), reducedMotion (ref), var11 (ref), reactOtterModule (copy), t_1 (copy)
		local var15 = if var12 then 1 else 0
		
		if reducedMotion then
			var11(reactOtterModule.instant(var15))
			
			return
		end
		var11(reactOtterModule.spring(var15, t_1))
	end, { var12, reducedMotion })
	
	return reactModule.createElement(view, {
		tag = "size-800-800",
		onActivated = var7,
		onStateChanged = reactModule.useCallback(function(p1)
			-- upvalues: var13 (ref), controlState (copy)
			var13(if p1 ~= controlState.Hover then if p1 ~= controlState.Pressed then if p1 ~= controlState.Selected then p1 == controlState.SelectedPressed else true else true else true)
		end, {}),
		LayoutOrder = p0.index,
		selection = { Selectable = true },
		stateLayer = { affordance = stateLayerAffordance.None },
		ref = var6
	}, {
		Glyph = reactModule.createElement(reaction, {
			reactionType = p0.reaction,
			size = reactionSize.Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = reactModule.joinBindings({ entry = var8, hover = var10 }):map(function(p2)
				return UDim2.new(0.5, 0, 0.5, (1 - p2.entry) * 12 - p2.hover * 8)
			end),
			scale = reactModule.joinBindings({ entry = var8, hover = var10 }):map(function(p3)
				return p3.entry * (p3.hover * 0.1 + 1)
			end)
		})
	})
end)