return {
	SETTLE_SECONDS = 0.15,
	initialState = function()
		return {
			canvasX = nil,
			canvasY = nil,
			idleSeconds = 0,
			interacting = false
		}
	end,
	advance = function(p1, p2, p3, p4, p5)
		local var1 = if p5 ~= nil then p1.canvasY else p5
		
		if p1.canvasX == nil then
			return {
				idleSeconds = 0.15,
				interacting = false,
				canvasX = p2,
				canvasY = var1
			}
		elseif p2 ~= p1.canvasX or (p5 ~= nil and p5 ~= p1.canvasY) then
			return {
				idleSeconds = 0,
				interacting = true,
				canvasX = p2,
				canvasY = var1
			}
		elseif p4 == true then
			return {
				interacting = true,
				canvasX = p2,
				canvasY = var1,
				idleSeconds = p1.idleSeconds + math.max(p3, 0)
			}
		elseif p1.interacting then
			local var2 = p1.idleSeconds + math.max(p3, 0)
			
			return {
				canvasX = p2,
				canvasY = var1,
				idleSeconds = var2,
				interacting = var2 < 0.15
			}
		end
		return p1
	end,
	isPointerHold = function(p1)
		return if p1 ~= Enum.UserInputType.MouseButton1 then p1 == Enum.UserInputType.Touch else true
	end,
	pointerIsInside = function(p1, p2, p3)
		return if p2.X <= 0 or p2.Y <= 0 then false else p1.X <= p3.X and (p1.Y <= p3.Y and (p3.X <= p1.X + p2.X and p3.Y <= p1.Y + p2.Y))
	end
}