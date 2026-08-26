local profileCTAStore = require(script:FindFirstAncestor("ProfileCtaService").Parent.DataHydration).Profile.ProfileCTAStore
local createProfileCTAEventListenerModule = require(script.Parent.createProfileCTAEventListener)

return (function()
	-- upvalues: profileCTAStore (ref), createProfileCTAEventListenerModule (ref)
	local var1 = 0
	local t = {}
	local var2 = profileCTAStore.get()
	
	local function _(p1)
		-- upvalues: var2 (ref)
		var2.getCTA(p1, true)
	end
	
	local _ = createProfileCTAEventListenerModule(function(p1)
		-- upvalues: var1 (write), var2 (ref), t (ref)
		if var1 > 0 then
			var2.getCTA(p1, true)
			
			return
		end
		t[p1] = true
	end)
	
	local _ = function()
		-- upvalues: var1 (write)
		var1 += 1
	end
	
	local _ = function()
		-- upvalues: var1 (write)
		var1 -= 1
		
		if var1 < 0 then
			error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(var1))
		end
	end
	
	return {
		connectRealTimeUpdates = function()
			-- upvalues: var1 (write)
			var1 += 1
			local var3 = false
			
			return {
				Disconnect = function()
					-- upvalues: var3 (write), var1 (copy)
					if var3 then return end
					var3 = true
					var1 -= 1
					
					if var1 < 0 then
						error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(var1))
					end
				end
			}
		end,
		getProfileCTA = function(p1)
			-- upvalues: t (ref), var2 (ref)
			local var3 = false
			
			if t[p1] then
				var3 = true
				t[p1] = nil
			end
			return var2.getCTA(p1, var3)
		end,
		getProfileCTAs = function(p1)
			-- upvalues: t (ref), var2 (ref)
			local t_1 = {}
			
			for i, v in ipairs(p1) do
				if t[v] then
					t_1[v] = true
					t[v] = nil
				else
					t_1[v] = false
				end
			end
			return var2.getBatchCTAs(p1, t_1)
		end
	}
end)()