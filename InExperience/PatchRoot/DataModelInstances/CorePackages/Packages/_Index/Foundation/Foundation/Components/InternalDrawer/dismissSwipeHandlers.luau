local Foundation = script:FindFirstAncestor("Foundation")
local DragIntentModule = require(Foundation.Enums.DragIntent)
local _ = require(Foundation.Enums.InternalDrawerSide)
local ContentLockModule = require(script.Parent.contentLock)
local GestureInputModule = require(script.Parent.gestureInput)
local SwipeMathModule = require(script.Parent.swipeMath)

local function _(p1, Visible)
	local Current = p1.captureRef.current
	
	if Current ~= nil then
		Current.Visible = Visible
	end
end

local _ = function(p1)
	local Unlock = p1.unlock
	p1.unlock = nil
	task.defer(function()
		-- upvalues: Unlock (copy), p1 (copy)
		if Unlock ~= nil then
			Unlock()
		end
		local Current = p1.captureRef.current
		
		if Current ~= nil then
			Current.Visible = false
		end
	end)
end

local _ = function(p1)
	-- upvalues: ContentLockModule (copy)
	p1.latest.current.onClaim()
	p1.unlock = ContentLockModule.lock(p1.panelRef.current, p1.backdropRef.current, p1.scrollingFrameRef.current)
	local Current = p1.captureRef.current
	
	if Current ~= nil then
		Current.Visible = true
	end
end

return {
	onInputBegan = function(p1, p2): boolean
		-- upvalues: GestureInputModule (copy)
		if not GestureInputModule.canBegin(p1.gesture, p2) then
			return false
		end
		local Current = p1.panelRef.current
		
		if Current == nil then
			return false
		end
		local Current1 = p1.backdropRef.current
		local Position = p2.Position
		local IsInside = Current1 ~= nil and GestureInputModule.isInside(Current1, Position)
		
		if not GestureInputModule.isInside(Current, Position) and not IsInside then
			return false
		elseif GestureInputModule.isForeignHit(Current, GestureInputModule.topGuiAt(Current, Position, Current1), Current1) then
			return false
		else
			p1.gesture = GestureInputModule.beginGesture(p2, os.clock())
			
			return true
		end
	end,
	onInputChanged = function(p1, p2)
		-- upvalues: GestureInputModule (copy), SwipeMathModule (copy), ContentLockModule (copy)
		local Gesture = p1.gesture
		
		if Gesture == nil or not GestureInputModule.matchesMove(p2, Gesture.input) then return end
		local Current = p1.latest.current
		local MoveResult, MoveResult2, MoveResult3 = GestureInputModule.move(Gesture, p2, SwipeMathModule.closeSign(Current.side))
		
		if MoveResult then
			p1.latest.current.onClaim()
			p1.unlock = ContentLockModule.lock(p1.panelRef.current, p1.backdropRef.current, p1.scrollingFrameRef.current)
			local Current1 = p1.captureRef.current
			
			if Current1 ~= nil then
				Current1.Visible = true
			end
		end
		if MoveResult2 then
			GestureInputModule.setProgressIfChanged(Gesture, Current.setDrag, 1 - SwipeMathModule.progress(SwipeMathModule.distanceAlong(SwipeMathModule.closeSign(Current.side), Gesture.startX, MoveResult3), Current.travel))
			
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
		
		if Gesture.intent ~= DragIntentModule.Claim then
			return true
		end
		local Unlock = p1.unlock
		p1.unlock = nil
		task.defer(function()
			-- upvalues: Unlock (copy), p1 (copy)
			if Unlock ~= nil then
				Unlock()
			end
			local Current = p1.captureRef.current
			
			if Current ~= nil then
				Current.Visible = false
			end
		end)
		local Current = p1.latest.current
		
		if Current.isOpen then
			Current.onRelease((SwipeMathModule.shouldCommit(Gesture, SwipeMathModule.closeSign(Current.side), Current.travel, Current.distanceFraction, Current.velocityThreshold, os.clock())))
			
			return true
		else
			return true
		end
	end,
	reset = function(p1)
		-- upvalues: DragIntentModule (copy)
		local Gesture = p1.gesture
		p1.gesture = nil
		
		if Gesture ~= nil and Gesture.intent == DragIntentModule.Claim then
			local UnlockFunction = p1.unlock
			p1.unlock = nil
			task.defer(function()
				-- upvalues: UnlockFunction (copy), p1 (copy)
				if UnlockFunction ~= nil then
					UnlockFunction()
				end
				local Current = p1.captureRef.current
				
				if Current ~= nil then
					Current.Visible = false
				end
			end)
			p1.latest.current.onCancel()
		end
	end
}