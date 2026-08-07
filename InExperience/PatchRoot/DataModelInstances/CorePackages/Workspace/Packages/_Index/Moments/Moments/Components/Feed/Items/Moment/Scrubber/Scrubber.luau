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

return reactModule.memo(function(p0) --[[ line: 23 | named "Scrubber" ]]
	-- upvalues: momentContextModule (ref), reactModule (ref), useMomentProgressModule (ref), useSignalBinding (ref), view (ref), stateLayerAffordance (ref), controlState (ref), scrubberBarModule (ref), previewPopoverModule (ref)
	local var7 = momentContextModule.useMoment()
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useCallback(function(p1) --[[ line: 31 ]]
		-- upvalues: var14 (ref), var7 (ref)
		local current = var14.current
		
		if current == nil then
			return 0
		end
		local clampedValue = math.clamp((p1.X - current.AbsolutePosition.X) / current.AbsoluteSize.X, 0, 1)
		var7.store.setScrubPosition(clampedValue)
		
		return clampedValue
	end, { var7.store.setScrubPosition })
	local var16 = reactModule.joinBindings({
		useSignalBinding(var7.store.getScrubPosition),
		useSignalBinding(useMomentProgressModule())
	}):map(function(p2) --[[ line: 51 ]]
		local var19 = p2[1]
		local var20 = p2[2]
		local var21 = if var19 ~= nil then var20.ratio else var19
		
		return {
			time = var21 * var20.duration,
			duration = var20.duration,
			ratio = var21
		}
	end)
	local var17 = var16:map(function(p3) --[[ line: 63 ]]
		return p3.ratio
	end)
	
	return reactModule.createElement(view, {
		tag = "size-full-300",
		LayoutOrder = p0.LayoutOrder,
		stateLayer = { affordance = stateLayerAffordance.None },
		onStateChanged = function(p4) --[[ line: 71 ]]
			-- upvalues: controlState (copy), var9 (ref), var11 (ref)
			local var22 = if p4 ~= controlState.Pressed then p4 == controlState.SelectedPressed else true
			var9(if p4 ~= controlState.Hover then p4 == controlState.Selected else true)
			var11(var22)
		end
	}, {
		DragContainer = reactModule.createElement(view, { tag = "size-full", ZIndex = 2, ref = var14 }, {
			DragDetector = reactModule.createElement("UIDragDetector", {
				CursorIcon = "",
				DragAxis = Vector2.new(1, 0),
				DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
				[reactModule.Event.DragStart] = function(_, p5) --[[ line: 89 ]]
					-- upvalues: var13 (ref), var7 (ref), var15 (ref)
					var13(true)
					
					if var7.controller then
						var7.controller.pause(0)
					end
					var15(p5)
				end,
				[reactModule.Event.DragContinue] = function(_, p6) --[[ line: 97 ]]
					-- upvalues: var15 (ref)
					var15(p6)
				end,
				[reactModule.Event.DragEnd] = function(_, p7) --[[ line: 100 ]]
					-- upvalues: var15 (ref), var7 (ref), var13 (ref)
					local var23 = var15(p7)
					var7.store.setScrubPosition(nil)
					var13(false)
					
					if var7.controller then
						var7.controller.play()
						var7.controller.seek(var23 * var7.controller.getState(false).duration)
					end
				end
			})
		}),
		ScrubberBar = reactModule.createElement(scrubberBarModule, {
			isHovering = var8,
			isPressed = var10 or var12,
			progressRatio = var17
		}),
		PreviewPopover = reactModule.createElement(previewPopoverModule, { progress = var16, progressRatio = var17 })
	})
end)