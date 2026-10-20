local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local Reaction = MomentsCommonModule.Components.Reaction
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local config = { frequency = 4, dampingRatio = 0.65 }
local config1 = { frequency = 4, dampingRatio = 1 }

return ReactModule.memo(function(p1)
	-- upvalues: UsePreferencesFunction (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), config1 (copy), ControlState (copy), View (copy), StateLayerAffordance (copy), Reaction (copy), ReactionSize (copy)
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		p1.onSelect(p1.reaction, if Current == nil then nil else Current.AbsolutePosition + Current.AbsoluteSize / 2)
	end, { p1.onSelect, p1.reaction })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: ReducedMotion (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), p1 (copy), config (upval)
		if ReducedMotion then
			UseAnimatedBindingResult2(ReactOtterModule.instant(1))
			
			return
		end
		local DelayedThread = task.delay((p1.index - 1) * 0.04, function()
			-- upvalues: UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
			UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { p1.index, ReducedMotion })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), ReducedMotion (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), config1 (upval)
		local v1: number = if UseStateResult then 1 else 0
		
		if ReducedMotion then
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(v1))
			
			return
		else
			UseAnimatedBindingResult2_1((ReactOtterModule.spring(v1, config1)))
		end
	end, { UseStateResult, ReducedMotion })
	
	return ReactModule.createElement(View, {
		tag = "size-800-800",
		onActivated = UseResult,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover or (Hover == ControlState.Pressed or (Hover == ControlState.Selected or Hover == ControlState.SelectedPressed)))
		end, {}),
		LayoutOrder = p1.index,
		selection = { Selectable = true },
		stateLayer = { affordance = StateLayerAffordance.None },
		ref = UseRefResult
	}, {
		Glyph = ReactModule.createElement(Reaction, {
			reactionType = p1.reaction,
			size = ReactionSize.Medium,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = ReactModule.joinBindings({
				entry = UseAnimatedBindingResult,
				hover = UseAnimatedBindingResult1
			}):map(function(p2): UDim2
				return UDim2.new(0.5, 0, 0.5, (1 - p2.entry) * 12 - p2.hover * 8)
			end),
			scale = ReactModule.joinBindings({
				entry = UseAnimatedBindingResult,
				hover = UseAnimatedBindingResult1
			}):map(function(p2)
				return p2.entry * (p2.hover * 0.1 + 1)
			end)
		})
	})
end)