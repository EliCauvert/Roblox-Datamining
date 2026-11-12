local Foundation = script:FindFirstAncestor("Foundation")
local DragIntentModule = require(Foundation.Enums.DragIntent)
local _ = require(Foundation.Enums.InternalDrawerSide)
local GestureInputModule = require(script.Parent.gestureInput)
local SwipeMathModule = require(script.Parent.swipeMath)

return {
	onInputBegan = function(p1, p2): boolean
		-- upvalues: GestureInputModule (copy)
		if not GestureInputModule.canBegin(p1.gesture, p2) then
			return false
		end
		local Current = p1.latest.current
		
		if Current.isOpen then
			return false
		end
		local Current1 = p1.edgeRef.current
		
		if Current1 == nil then
			return false
		end
		local Position = p2.Position
		
		if not GestureInputModule.isInside(Current1, Position) then
			return false
		elseif GestureInputModule.isForeignHit(Current1, GestureInputModule.topGuiAt(Current1, Position), nil) then
			return false
		else
			p1.gesture = GestureInputModule.beginGesture(p2, os.clock())
			Current.onPress()
			
			return true
		end
	end,
	onInputChanged = function(p1, p2)
		-- upvalues: GestureInputModule (copy), SwipeMathModule (copy)
		local Gesture = p1.gesture
		
		if Gesture == nil or not GestureInputModule.matchesMove(p2, Gesture.input) then return end
		local Current = p1.latest.current
		local MoveResult, MoveResult2, MoveResult3 = GestureInputModule.move(Gesture, p2, SwipeMathModule.openSign(Current.side))
		
		if MoveResult then
			Current.onClaim()
		end
		if MoveResult2 then
			GestureInputModule.setProgressIfChanged(Gesture, Current.setDrag, SwipeMathModule.progress(SwipeMathModule.distanceAlong(SwipeMathModule.openSign(Current.side), Gesture.startX, MoveResult3), Current.travel))
			
			return
		end
	end,
	onInputEnded = function(p1, p2): boolean
		-- upvalues: GestureInputModule (copy), DragIntentModule (copy), SwipeMathModule (copy)
		local Gesture = p1.gesture
		
		if Gesture == nil or not GestureInputModule.matchesRelease(p2, Gesture.input) then
			return false
		end
		p1.gesture = nil
		local Current = p1.latest.current
		
		if Gesture.intent ~= DragIntentModule.Claim then
			Current.onPressEnd()
			
			return true
		end
		if SwipeMathModule.shouldCommit(Gesture, SwipeMathModule.openSign(Current.side), Current.travel, Current.distanceFraction, Current.velocityThreshold, os.clock()) then
			Current.onCommit()
		else
			Current.onDragCancel()
		end
		return true
	end,
	reset = function(p1)
		-- upvalues: DragIntentModule (copy)
		local Gesture = p1.gesture
		p1.gesture = nil
		
		if Gesture == nil then return end
		local Current = p1.latest.current
		
		if Gesture.intent == DragIntentModule.Claim then
			Current.onDragCancel()
			
			return
		else
			Current.onPressEnd()
		end
	end
}