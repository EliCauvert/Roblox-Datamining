local function _(p1, p2, p3)
	local t = {}
	
	for i, v in pairs(p1) do
		t[i] = v
	end
	t[p2] = p3
	
	return t
end

local _ = function(p4, p5)
	local t = {}
	
	for i, v in pairs(p4) do
		if i ~= p5 then
			t[i] = v
		end
	end
	return t
end

return function()
	local t = {}
	
	return {
		subscribe = function(_, p6)
			-- upvalues: t (write)
			assert(typeof(p6) == "function", "Can only subscribe to signals with a function.")
			local t_1 = { callback = p6 }
			local t_2 = {}
			
			for i, v in pairs(t) do
				t_2[i] = v
			end
			t_2[p6] = t_1
			t = t_2
			
			return function()
				-- upvalues: t_1 (ref), t (copy), p6 (ref)
				assert(not t_1.disconnected, "Listeners can only be disconnected once.")
				t_1.disconnected = true
				local t_2 = {}
				
				for i, v in pairs(t) do
					if i ~= p6 then
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