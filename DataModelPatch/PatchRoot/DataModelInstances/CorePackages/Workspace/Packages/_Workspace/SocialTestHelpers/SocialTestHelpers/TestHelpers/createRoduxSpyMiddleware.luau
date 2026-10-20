return function(Callback)
	return function(Callback1)
		-- upvalues: Callback (copy)
		return function(p1)
			-- upvalues: Callback (upval), Callback1 (copy)
			Callback(p1)
			
			return Callback1(p1)
		end
	end
end