local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local scrubberBarModule = require(script.Parent.ScrubberBar)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local useMomentProgressModule = require(script.Parent.Parent.Hooks.useMomentProgress)
local previewPopoverModule = require(script.Parent.PreviewPopover)
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useSignalBinding = signalsReactModule.useSignalBinding

return reactModule.memo(function(p1)
	-- upvalues: momentContextModule (ref), reactModule (ref), useMomentProgressModule (ref), useSignalBinding (ref), view (ref), stateLayerAffordance (ref), controlState (ref), scrubberBarModule (ref), previewPopoverModule (ref)
	local var1 = momentContextModule.useMoment()
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var1 (ref)
		local current = var8.current
		
		if current == nil then
			return 0
		end
		local clampedValue = math.clamp((p2.X - current.AbsolutePosition.X) / current.AbsoluteSize.X, 0, 1)
		var1.store.setScrubPosition(clampedValue)
		
		return clampedValue
	end, { var1.store.setScrubPosition })
	local var10 = reactModule.joinBindings({
		useSignalBinding(var1.store.getScrubPosition),
		useSignalBinding(useMomentProgressModule())
	}):map(function(p2)
		local var11 = p2[1]
		local var12 = p2[2]
		local var13 = if var11 ~= nil then var12.ratio else var11
		
		return {
			time = var13 * var12.duration,
			duration = var12.duration,
			ratio = var13
		}
	end)
	local var11 = var10:map(function(p2)
		return p2.ratio
	end)
	
	return reactModule.createElement(view, {
		tag = "size-full-300",
		LayoutOrder = p1.LayoutOrder,
		stateLayer = { affordance = stateLayerAffordance.None },
		onStateChanged = function(p2)
			-- upvalues: controlState (copy), var3 (ref), var5 (ref)
			local var12 = if p2 ~= controlState.Pressed then p2 == controlState.SelectedPressed else true
			var3(if p2 ~= controlState.Hover then p2 == controlState.Selected else true)
			var5(var12)
		end
	}, {
		DragContainer = reactModule.createElement(view, { tag = "size-full", ZIndex = 2, ref = var8 }, {
			DragDetector = reactModule.createElement("UIDragDetector", {
				CursorIcon = "",
				DragAxis = Vector2.new(1, 0),
				DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
				[reactModule.Event.DragStart] = function(_, p2)
					-- upvalues: var7 (ref), var1 (ref), var9 (ref)
					var7(true)
					
					if var1.controller then
						var1.controller.pause(0)
					end
					var9(p2)
				end,
				[reactModule.Event.DragContinue] = function(_, p2)
					-- upvalues: var9 (ref)
					var9(p2)
				end,
				[reactModule.Event.DragEnd] = function(_, p2)
					-- upvalues: var9 (ref), var1 (ref), var7 (ref)
					local var12 = var9(p2)
					var1.store.setScrubPosition(nil)
					var7(false)
					
					if var1.controller then
						var1.controller.play()
						var1.controller.seek(var12 * var1.controller.getState(false).duration)
					end
				end
			})
		}),
		ScrubberBar = reactModule.createElement(scrubberBarModule, {
			isHovering = var2,
			isPressed = var4 or var6,
			progressRatio = var11
		}),
		PreviewPopover = reactModule.createElement(previewPopoverModule, { progress = var10, progressRatio = var11 })
	})
end)