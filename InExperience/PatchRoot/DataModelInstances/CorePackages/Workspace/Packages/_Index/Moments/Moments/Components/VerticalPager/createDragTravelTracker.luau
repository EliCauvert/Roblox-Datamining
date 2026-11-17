local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(Vector2.zero)
	local v1 = nil
	local ZeroVector = Vector2.zero
	
	return {
		getTravel = Signal,
		began = function(Input)
			-- upvalues: v1 (ref), ZeroVector (ref)
			if Input.UserInputType == Enum.UserInputType.Touch then
				v1 = Input
				ZeroVector = Vector2.new(Input.Position.X, Input.Position.Y)
				
				return
			end
		end,
		moved = function(p1)
			-- upvalues: v1 (ref), Signal2 (copy), ZeroVector (ref)
			if p1 == v1 then
				Signal2(Vector2.new(p1.Position.X, p1.Position.Y) - ZeroVector)
				
				return
			end
		end,
		ended = function(p1)
			-- upvalues: v1 (ref), Signal2 (copy)
			if p1 == v1 then
				v1 = nil
				Signal2(Vector2.zero)
				
				return
			end
		end,
		reset = function()
			-- upvalues: v1 (ref), Signal2 (copy)
			v1 = nil
			Signal2(Vector2.zero)
		end
	}
end