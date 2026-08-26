local function _(p1, p2, p3)
	local _ = {}
	local cloned = table.clone(p1)
	cloned[p2] = p3
	
	return cloned
end

local _ = function(p1, p2)
	local t = {}
	
	for i, v in pairs(p1) do
		if i ~= p2 then
			t[i] = v
		end
	end
	return t
end

return function()
	local t = {}
	
	return {
		subscribe = function(_, p3)
			-- upvalues: t (write)
			assert(typeof(p3) == "function", "Can only subscribe to signals with a function.")
			local t_1 = { disconnected = false, callback = p3 }
			local _ = {}
			local cloned = table.clone(t)
			cloned[p3] = t_1
			t = cloned
			
			return function()
				-- upvalues: t_1 (ref), t (copy), p3 (ref)
				assert(not t_1.disconnected, "Listeners can only be disconnected once.")
				t_1.disconnected = true
				local t_2 = {}
				
				for i, v in pairs(t) do
					if i ~= p3 then
						t_2[i] = v
					end
				end
				t = t_2
			end
		end,
		fire = function(_, ...)
			-- upvalues: t (write)
			for i, v in pairs(t) do
				if not v.disconnected then
					i(...)
				end
			end
		end
	}
end