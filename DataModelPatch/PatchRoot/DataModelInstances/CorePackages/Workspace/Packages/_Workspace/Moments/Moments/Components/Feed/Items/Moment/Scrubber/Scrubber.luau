local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ScrubberBarModule = require(script.Parent.ScrubberBar)
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local UseMomentProgressModule = require(script.Parent.Parent.Hooks.useMomentProgress)
local PreviewPopoverModule = require(script.Parent.PreviewPopover)
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding

return ReactModule.memo(function(Frame)
	-- upvalues: MomentContextModule (copy), ReactModule (copy), UseMomentProgressModule (copy), UseSignalBindingFunction (copy), View (copy), StateLayerAffordance (copy), ControlState (copy), ScrubberBarModule (copy), PreviewPopoverModule (copy)
	local UseMomentResult = MomentContextModule.useMoment()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p1): number
		-- upvalues: UseRefResult (copy), UseMomentResult (copy)
		local Current = UseRefResult.current
		
		if Current == nil then
			return 0
		else
			local ClampedValue = math.clamp((p1.X - Current.AbsolutePosition.X) / Current.AbsoluteSize.X, 0, 1)
			UseMomentResult.store.setScrubPosition(ClampedValue)
			
			return ClampedValue
		end
	end, { UseMomentResult.store.setScrubPosition })
	local MapResult = ReactModule.joinBindings({
		UseSignalBindingFunction(UseMomentResult.store.getScrubPosition),
		(UseSignalBindingFunction((UseMomentProgressModule())))
	}):map(function(Entry)
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		local Ratio = if Entry1 == nil then Entry2.ratio else Entry1
		
		return {
			time = Ratio * Entry2.duration,
			duration = Entry2.duration,
			ratio = Ratio
		}
	end)
	local MapResult1 = MapResult:map(function(p1)
		return p1.ratio
	end)
	
	return ReactModule.createElement(View, {
		tag = "size-full-300",
		LayoutOrder = Frame.LayoutOrder,
		stateLayer = { affordance = StateLayerAffordance.None },
		onStateChanged = function(Hover)
			-- upvalues: ControlState (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
			local IsHoverMatch: boolean = Hover == ControlState.Pressed or Hover == ControlState.SelectedPressed
			UseStateResult2(Hover == ControlState.Hover or Hover == ControlState.Selected)
			UseStateResult2_1(IsHoverMatch)
		end
	}, {
		DragContainer = ReactModule.createElement(View, { tag = "size-full", ZIndex = 2, ref = UseRefResult }, {
			DragDetector = ReactModule.createElement("UIDragDetector", {
				CursorIcon = "",
				DragAxis = Vector2.new(1, 0),
				DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
				ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
				[ReactModule.Event.DragStart] = function(_, p1)
					-- upvalues: UseStateResult2_2 (copy), UseMomentResult (copy), UseResult (copy)
					UseStateResult2_2(true)
					
					if UseMomentResult.controller then
						UseMomentResult.controller.pause(0)
					end
					UseResult(p1)
				end,
				[ReactModule.Event.DragContinue] = function(_, p1)
					-- upvalues: UseResult (copy)
					UseResult(p1)
				end,
				[ReactModule.Event.DragEnd] = function(_, p1)
					-- upvalues: UseResult (copy), UseMomentResult (copy), UseStateResult2_2 (copy)
					local UseResultResult = UseResult(p1)
					UseMomentResult.store.setScrubPosition(nil)
					UseStateResult2_2(false)
					
					if UseMomentResult.controller then
						UseMomentResult.controller.play()
						UseMomentResult.controller.seek(UseResultResult * UseMomentResult.controller.getState(false).duration)
					end
				end
			})
		}),
		ScrubberBar = ReactModule.createElement(ScrubberBarModule, {
			isHovering = UseStateResult,
			isPressed = UseStateResult1 or UseStateResult3,
			progressRatio = MapResult1
		}),
		PreviewPopover = ReactModule.createElement(PreviewPopoverModule, { progress = MapResult, progressRatio = MapResult1 })
	})
end)