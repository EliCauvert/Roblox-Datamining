return function(p1, p2)
	return {
		await = function()
			-- upvalues: p1 (copy), p2 (copy)
			return p1, p2
		end,
		andThen = function(p3, Callback: (any) -> ())
			-- upvalues: p1 (copy), p2 (copy)
			if p1 then
				Callback(p2)
			end
			return p3
		end,
		catch = function(p3, Callback: (any) -> ())
			-- upvalues: p1 (copy), p2 (copy)
			if not p1 then
				Callback(p2)
			end
			return p3
		end
	}
end