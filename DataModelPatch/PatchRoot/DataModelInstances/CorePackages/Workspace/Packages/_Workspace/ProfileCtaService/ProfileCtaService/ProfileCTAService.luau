local ProfileCTAStore = require(script:FindFirstAncestor("ProfileCtaService").Parent.DataHydration).Profile.ProfileCTAStore
local CreateProfileCTAEventListenerModule = require(script.Parent.createProfileCTAEventListener)

return ((function()
	-- upvalues: ProfileCTAStore (copy), CreateProfileCTAEventListenerModule (copy)
	local Count = 0
	local t = {}
	local GetResult = ProfileCTAStore.get()
	
	local function _(p1)
		-- upvalues: GetResult (copy)
		GetResult.getCTA(p1, true)
	end
	
	local _ = CreateProfileCTAEventListenerModule(function(Key)
		-- upvalues: Count (ref), GetResult (copy), t (copy)
		if Count > 0 then
			GetResult.getCTA(Key, true)
			
			return
		else
			t[Key] = true
		end
	end)
	
	local _ = function()
		-- upvalues: Count (ref)
		Count += 1
	end
	
	local _ = function()
		-- upvalues: Count (ref)
		Count -= 1
		
		if Count < 0 then
			error("ProfileCTAService: disableRealTimeUpdates called more times than enableRealTimeUpdates. consumerConnectionCount: " .. tostring(Count))
		end
	end
	
	return {
		connectRealTimeUpdates = function()
			-- upvalues: Count (ref)
			Count += 1
			local Flag = false
			
			return {
				Disconnect = function()
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
		getProfileCTAs = function(List)
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