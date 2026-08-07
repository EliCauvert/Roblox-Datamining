local profileCTAStore = require(script:FindFirstAncestor("ProfileCtaService").Parent.DataHydration).Profile.ProfileCTAStore
local createProfileCTAEventListenerModule = require(script.Parent.createProfileCTAEventListener)

return (function() --[[ line: 20 | named "createProfileCTAService" ]]
	-- upvalues: profileCTAStore (ref), createProfileCTAEventListenerModule (ref)
	local var1 = 0
	local t = {}
	local var3 = profileCTAStore.get()
	
	local function _(p0) --[[ line: 25 | named "refetchCTA" ]]
		-- upvalues: var3 (ref)
		var3.getCTA(p0, true)
	end
	
	local _ = createProfileCTAEventListenerModule(function(p1) --[[ line: 29 | named "handleCTAUpdate" ]]
		-- upvalues: var1 (write), var3 (ref), t (ref)
		if var1 > 0 then
			var3.getCTA(p1, true)
			
			return
		end
		t[p1] = true
	end)
	
	local _ = function() --[[ line: 39 | named "enableRealTimeUpdates" ]]
		-- upvalues: var1 (write)
		var1 += 1
	end
	
	local _ = function() --[[ line: 43 | named "disableRealTimeUpdates" ]]
		-- upvalues: var1 (write)
		var1 -= 1
		
		if var1 < 0 then
			error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(var1))
		end
	end
	
	return {
		connectRealTimeUpdates = function() --[[ line: 54 ]]
			-- upvalues: var1 (write)
			var1 += 1
			local var4 = false
			
			return {
				Disconnect = function() --[[ line: 60 ]]
					-- upvalues: var4 (write), var1 (copy)
					if var4 then return end
					var4 = true
					var1 -= 1
					
					if var1 < 0 then
						error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(var1))
					end
				end
			}
		end,
		getProfileCTA = function(p2) --[[ line: 70 ]]
			-- upvalues: t (ref), var3 (ref)
			local var5 = false
			
			if t[p2] then
				var5 = true
				t[p2] = nil
			end
			return var3.getCTA(p2, var5)
		end,
		getProfileCTAs = function(p3) --[[ line: 79 ]]
			-- upvalues: t (ref), var3 (ref)
			local t_1 = {}
			
			for i, v in ipairs(p3) do
				if t[v] then
					t_1[v] = true
					t[v] = nil
				else
					t_1[v] = false
				end
			end
			return var3.getBatchCTAs(p3, t_1)
		end
	}
end)()