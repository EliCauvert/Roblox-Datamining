local ProfileCTAStore = require(script:FindFirstAncestor("ProfileCtaService").Parent.DataHydration).Profile.ProfileCTAStore
local CreateProfileCTAEventListenerModule = require(script.Parent.createProfileCTAEventListener)

return ((function() --[[ Line: 20 | Named "createProfileCTAService" ]]
	-- upvalues: ProfileCTAStore (copy), CreateProfileCTAEventListenerModule (copy)
	local Count = 0
	local t = {}
	local GetResult = ProfileCTAStore.get()
	
	local function _(p1) --[[ Line: 25 | Named "refetchCTA" ]]
		-- upvalues: GetResult (copy)
		GetResult.getCTA(p1, true)
	end
	
	local _ = CreateProfileCTAEventListenerModule(function(Key) --[[ Line: 29 | Named "handleCTAUpdate" ]]
		-- upvalues: Count (ref), GetResult (copy), t (copy)
		if Count > 0 then
			GetResult.getCTA(Key, true)
			
			return
		else
			t[Key] = true
		end
	end)
	
	local _ = function() --[[ Line: 39 | Named "enableRealTimeUpdates" ]]
		-- upvalues: Count (ref)
		Count += 1
	end
	
	local _ = function() --[[ Line: 43 | Named "disableRealTimeUpdates" ]]
		-- upvalues: Count (ref)
		Count -= 1
		
		if Count < 0 then
			error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(Count))
		end
	end
	
	return {
		connectRealTimeUpdates = function() --[[ Line: 54 ]]
			-- upvalues: Count (ref)
			Count += 1
			local Flag = false
			
			return {
				Disconnect = function() --[[ Line: 60 ]]
					-- upvalues: Flag (ref), Count (upval)
					if Flag then return end
					Flag = true
					Count -= 1
					
					if Count < 0 then
						error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(Count))
					end
				end
			}
		end,
		getProfileCTA = function(Key) --[[ Line: 70 ]]
			-- upvalues: t (copy), GetResult (copy)
			local Flag = false
			
			if t[Key] then
				Flag = true
				t[Key] = nil
			end
			return GetResult.getCTA(Key, Flag)
		end,
		getProfileCTAs = function(List) --[[ Line: 79 ]]
			-- upvalues: t (copy), GetResult (copy)
			local t1 = {}
			
			for _, value in ipairs(List) do
				if t[value] then
					t1[value] = true
					t[value] = nil
				else
					t1[value] = false
				end
			end
			return GetResult.getBatchCTAs(List, t1)
		end
	}
end)())