return function()
	local ZeroVector = Vector2.zero
	local ClampedValue = 0
	
	return {
		getMove = function()
			-- upvalues: ZeroVector (ref)
			return ZeroVector
		end,
		setMove = function(Value)
			-- upvalues: ZeroVector (ref)
			ZeroVector = Value
		end,
		getElevate = function()
			-- upvalues: ClampedValue (ref)
			return ClampedValue
		end,
		setElevate = function(Value: number)
			-- upvalues: ClampedValue (ref)
			ClampedValue = math.clamp(Value, -1, 1)
		end,
		reset = function()
			-- upvalues: ZeroVector (ref), ClampedValue (ref)
			ZeroVector = Vector2.zero
			ClampedValue = 0
		end
	}
end