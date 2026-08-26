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

return reactModule.memo(function(p1)
	-- upvalues: usePreferences (ref), reactModule (ref), reactOtterModule (ref), t (ref), t_1 (ref), controlState (ref), view (ref), stateLayerAffordance (ref), reaction (ref), reactionSize (ref)
	local reducedMotion = usePreferences().reducedMotion
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref)
		local current = var1.current
		p1.onSelect(p1.reaction, if current ~= nil then current.AbsolutePosition + current.AbsoluteSize / 2 else nil)
	end, { p1.onSelect, p1.reaction })
	local var3, var4 = reactOtterModule.useAnimatedBinding(0)
	local var5, var6 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: reducedMotion (ref), var4 (ref), reactOtterModule (copy), p1 (ref), t (copy)
		if reducedMotion then
			var4(reactOtterModule.instant(1))
			
			return
		end
		local delayedThread = task.delay((p1.index - 1) * 0.04, function()
			-- upvalues: var4 (copy), reactOtterModule (copy), t (copy)
			var4(reactOtterModule.spring(1, t))
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { p1.index, reducedMotion })
	local var7, var8 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), reducedMotion (ref), var6 (ref), reactOtterModule (copy), t_1 (copy)
		local var9 = if var7 then 1 else 0
		
		if reducedMotion then
			var6(reactOtterModule.instant(var9))
			
			return
		end
		var6(reactOtterModule.spring(var9, t_1))
	end, { var7, reducedMotion })
	
	return reactModule.createElement(view, {
		tag = "size-800-800",
		onActivated = var2,
		onStateChanged = reactModule.useCallback(function(p2)
			-- upvalues: var8 (ref), controlState (copy)
			var8(if p2 ~= controlState.Hover then if p2 ~= controlState.Pressed then if p2 ~= controlState.Selected then p2 == controlState.SelectedPressed else true else true else true)
		end, {}),
		LayoutOrder = p1.index,
		selection = { Selectable = true },
		stateLayer = { affordance = stateLayerAffordance.None },
		ref = var1
	}, {
		Glyph = reactModule.createElement(reaction, {
			reactionType = p1.reaction,
			size = reactionSize.Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = reactModule.joinBindings({ entry = var3, hover = var5 }):map(function(p2)
				return UDim2.new(0.5, 0, 0.5, (1 - p2.entry) * 12 - p2.hover * 8)
			end),
			scale = reactModule.joinBindings({ entry = var3, hover = var5 }):map(function(p2)
				return p2.entry * (p2.hover * 0.1 + 1)
			end)
		})
	})
end)