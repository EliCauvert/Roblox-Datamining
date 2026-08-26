local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local t = {}
	local t_1 = {
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false
	}
	
	local function _(p1)
		return tostring(p1)
	end
	
	return {
		getUserProximityState = function(p1)
			-- upvalues: t (ref), createSignal (copy), t_1 (ref)
			local var1 = tostring(p1)
			
			if not t[var1] then
				local var2, var3 = createSignal(t_1)
				t[var1] = { getter = var2, setter = var3 }
			end
			return t[var1].getter
		end,
		updateProximity = function(p1, p2, p3)
			-- upvalues: t (ref), createSignal (copy), t_1 (ref)
			local var1 = tostring(p1)
			
			if not t[var1] then
				local var2 = tostring(p1)
				
				if not t[var2] then
					local var3, var4 = createSignal(t_1)
					t[var2] = { getter = var3, setter = var4 }
				end
				local _ = t[var2].getter
			end
			t[var1].setter({
				isInsideRenderDistance = p2,
				isInsideMaximizeDistance = p3
			})
		end,
		removeUser = function(p1)
			-- upvalues: t (ref), t_1 (ref)
			local var1 = tostring(p1)
			
			if t[var1] then
				t[var1].setter(t_1)
				t[var1] = nil
			end
		end
	}
end