-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local function _(p0, p1, p2) --[[ line: 15 | named "addToMap" ]]
	local t = {}
	
	for i, v in pairs(p0) do
		t[i] = v
	end
	t[p1] = p2
	
	return t
end

local _ = function(p3, p4) --[[ line: 27 | named "removeFromMap" ]]
	local t = {}
	
	for i, v in pairs(p3) do
		if i ~= p4 then
			t[i] = v
		end
	end
	return t
end

return function() --[[ line: 39 | named "createSignal" ]]
	local t = {}
	
	return {
		subscribe = function(_, p5) --[[ line: 42 ]]
			-- upvalues: t (write)
			assert(typeof(p5) == "function", "Can only subscribe to signals with a function.")
			local t_1 = { disconnected = false, callback = p5 }
			local t_2 = {}
			
			for i, v in pairs(t) do
				t_2[i] = v
			end
			t_2[p5] = t_1
			t = t_2
			
			return function() --[[ line: 52 | named "disconnect" ]]
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
		fire = function(_, ...) --[[ line: 62 ]]
			-- upvalues: t (write)
			for i, v in pairs(t) do
				if not v.disconnected then
					i(...)
				end
			end
		end
	}
end