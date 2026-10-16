return {
	SETTLE_SECONDS = 0.15,
	initialState = function() --[[ Line: 14 ]]
		return {
			canvasX = nil,
			canvasY = nil,
			idleSeconds = 0,
			interacting = false
		}
	end,
	advance = function(p1, CanvasX, p2: number, Enabled, CanvasY) --[[ Line: 38 ]]
		local CanvasY1 = if CanvasY == nil then p1.canvasY else CanvasY
		
		if p1.canvasX == nil then
			return {
				idleSeconds = 0.15,
				interacting = false,
				canvasX = CanvasX,
				canvasY = CanvasY1
			}
		end
		local IsNotCanvasYMatch: boolean = CanvasY ~= nil and CanvasY ~= p1.canvasY
		
		if CanvasX ~= p1.canvasX or IsNotCanvasYMatch then
			return {
				idleSeconds = 0,
				interacting = true,
				canvasX = CanvasX,
				canvasY = CanvasY1
			}
		elseif Enabled == true then
			return {
				interacting = true,
				canvasX = CanvasX,
				canvasY = CanvasY1,
				idleSeconds = p1.idleSeconds + math.max(p2, 0)
			}
		elseif p1.interacting then
			local NewIdleSeconds = p1.idleSeconds + math.max(p2, 0)
			
			return {
				canvasX = CanvasX,
				canvasY = CanvasY1,
				idleSeconds = NewIdleSeconds,
				interacting = NewIdleSeconds < 0.15
			}
		else
			return p1
		end
	end,
	isPointerHold = function(UserInputType): boolean --[[ Line: 23 ]]
		return UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch
	end,
	pointerIsInside = function(Vector, Vector1, Vector2): boolean --[[ Line: 28 ]]
		return Vector1.X > 0 and Vector1.Y > 0 and (Vector.X <= Vector2.X and (Vector.Y <= Vector2.Y and Vector2.X <= Vector.X + Vector1.X) and Vector2.Y <= Vector.Y + Vector1.Y)
	end
}