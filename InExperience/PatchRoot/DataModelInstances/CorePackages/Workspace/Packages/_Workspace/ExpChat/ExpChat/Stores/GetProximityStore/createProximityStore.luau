local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 26 | named "createProximityStore" ]]
	-- upvalues: createSignal (ref)
	local t = {}
	local t_1 = {
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false
	}
	
	local function _(p0) --[[ line: 38 | named "getKey" ]]
		return tostring(p0)
	end
	
	return {
		getUserProximityState = function(p1) --[[ line: 42 ]]
			-- upvalues: t (ref), createSignal (copy), t_1 (ref)
			local var2 = tostring(p1)
			
			if not t[var2] then
				local var3, var4 = createSignal(t_1)
				t[var2] = { getter = var3, setter = var4 }
			end
			return t[var2].getter
		end,
		updateProximity = function(p2, p3, p4) --[[ line: 51 ]]
			-- upvalues: t (ref), createSignal (copy), t_1 (ref)
			local var5 = tostring(p2)
			
			if not t[var5] then
				local var6 = tostring(p2)
				
				if not t[var6] then
					local var7, var8 = createSignal(t_1)
					t[var6] = { getter = var7, setter = var8 }
				end
				local _ = t[var6].getter
			end
			t[var5].setter({
				isInsideRenderDistance = p3,
				isInsideMaximizeDistance = p4
			})
		end,
		removeUser = function(p5) --[[ line: 67 ]]
			-- upvalues: t (ref), t_1 (ref)
			local var9 = tostring(p5)
			
			if t[var9] then
				t[var9].setter(t_1)
				t[var9] = nil
			end
		end
	}
end