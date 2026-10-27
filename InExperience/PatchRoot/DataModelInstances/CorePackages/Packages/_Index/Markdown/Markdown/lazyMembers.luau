return function(p1, p2)
	local function _(p3)
		-- upvalues: p2 (copy), p1 (copy)
		local v1 = p2[p3]()
		rawset(p1, p3, v1)
		
		return v1
	end
	
	setmetatable(p1, {
		__index = function(_, p3)
			-- upvalues: p2 (copy), p1 (copy)
			if p2[p3] == nil then
				return nil
			else
				local v1 = p2[p3]()
				rawset(p1, p3, v1)
				
				return v1
			end
		end,
		__iter = function(p3)
			-- upvalues: p2 (copy), p1 (copy)
			for i in p2 do
				if rawget(p3, i) == nil then
					rawset(p1, i, (p2[i]()))
				end
			end
			return next, p3
		end
	})
end