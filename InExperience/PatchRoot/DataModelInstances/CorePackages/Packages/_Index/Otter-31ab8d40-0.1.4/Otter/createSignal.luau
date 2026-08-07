local function _(p0, p1, p2) --[[ line: 1 | named "addToMap" ]]
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = v
	end
	t[p1] = p2
	
	return t
end

local _ = function(p3, p4) --[[ line: 13 | named "removeFromMap" ]]
	local t = {}
	
	for i, v in pairs(p3) do
		if i ~= p4 then
			t[i] = v
		end
	end
	return t
end

return function() --[[ line: 25 | named "createSignal" ]]
	local t = {}
	
	return {
		subscribe = function(_, p5) --[[ line: 28 ]]
			-- upvalues: t (write)
			assert(typeof(p5) == "function", "Can only subscribe to signals with a function.")
			local t_1 = { callback = p5 }
			local t_2 = {}
			
			for i, v in pairs(t) do
				t_2[i] = v
			end
			t_2[p5] = t_1
			t = t_2
			
			return function() --[[ line: 37 | named "disconnect" ]]
				-- upvalues: t_1 (ref), t (copy), p5 (ref)
				assert(not t_1.disconnected, "Listeners can only be disconnected once.")
				t_1.disconnected = true
				local t_2 = {}
				
				for i, v in pairs(t) do
					if i ~= p5 then
						t_2[i] = v
					end
				end
				t = t_2
			end
		end,
		fire = function(_, ...) --[[ line: 47 ]]
			-- upvalues: t (write)
			for i, v in pairs(t) do
				if not v.disconnected then
					i(...)
				end
			end
		end
	}
end