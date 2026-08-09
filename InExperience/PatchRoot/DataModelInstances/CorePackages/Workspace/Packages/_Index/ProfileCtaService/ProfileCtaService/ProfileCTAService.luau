local profileCTAStore = require(script:FindFirstAncestor("ProfileCtaService").Parent.DataHydration).Profile.ProfileCTAStore
local createProfileCTAEventListenerModule = require(script.Parent.createProfileCTAEventListener)

return (function() --[[ line: 19 | named "createProfileCTAService" ]]
	-- upvalues: profileCTAStore (ref), createProfileCTAEventListenerModule (ref)
	local var1 = 0
	local t = {}
	local var3 = profileCTAStore.get()
	
	local function _(p0) --[[ line: 24 | named "refetchCTA" ]]
		-- upvalues: var3 (ref)
		var3.getCTA(p0, true)
	end
	
	local _ = createProfileCTAEventListenerModule(function(p1) --[[ line: 28 | named "handleCTAUpdate" ]]
		-- upvalues: var1 (write), var3 (ref), t (ref)
		if var1 > 0 then
			var3.getCTA(p1, true)
			
			return
		end
		t[p1] = true
	end)
	
	local _ = function() --[[ line: 38 | named "enableRealTimeUpdates" ]]
		-- upvalues: var1 (write)
		var1 += 1
	end
	
	local _ = function() --[[ line: 42 | named "disableRealTimeUpdates" ]]
		-- upvalues: var1 (write)
		var1 -= 1
		
		if var1 < 0 then
			error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(var1))
		end
	end
	
	return {
		connectRealTimeUpdates = function() --[[ line: 53 ]]
			-- upvalues: var1 (write)
			var1 += 1
			local var4 = false
			
			return {
				Disconnect = function() --[[ line: 59 ]]
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
		getProfileCTAs = function(p2) --[[ line: 69 ]]
			-- upvalues: t (ref), var3 (ref)
			local t_1 = {}
			
			for i, v in ipairs(p2) do
				if t[v] then
					t_1[v] = true
					t[v] = nil
				else
					t_1[v] = false
				end
			end
			return var3.getBatchCTAs(p2, t_1)
		end
	}
end)()