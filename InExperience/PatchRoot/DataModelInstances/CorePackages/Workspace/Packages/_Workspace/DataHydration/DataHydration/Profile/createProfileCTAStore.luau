local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local cryoModule = require(parent.Cryo)
local requestsModule = require(dataHydration.Profile.Requests)
local _ = require(dataHydration.Profile.Enums.ProfileCTAEnums)
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1)

local _ = function()
	return game:GetFastInt("ProfileCTAStoreProcessDelaySec")
end

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), cryoModule (ref), requestsModule (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		requestBatchSize = 25,
		cache = var1,
		queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var3 = cryoModule.Dictionary.keys(p1)
			
			return requestsModule.GetUserProfileCTA(var3):andThen(function(p2)
				-- upvalues: var3 (ref)
				local t = {}
				
				if p2.responseBody and p2.responseBody.profiles then
					for i, v in var3 do
						local var4 = tostring(v)
						local var5 = p2.responseBody.profiles[var4]
						t[var4] = var5 and (var5.components and (var5.components.Actions or {}))
					end
				end
				return t
			end):catch(function(_)
				return {}
			end)
		end
	})
	
	return {
		getCTA = function(p2, p3)
			-- upvalues: var2 (ref)
			local var4 = nil
			
			if p3 ~= nil then
				local var5 = p3 == true
				
				var4 = function(_)
					-- upvalues: var5 (ref)
					return var5
				end
			end
			return var2.getAndFetchItem(p2, var4)
		end,
		getBatchCTAs = function(p2, p3)
			-- upvalues: var2 (ref)
			local var4 = nil
			
			if p3 then
				local var5 = 0
				
				var4 = function(_)
					-- upvalues: var5 (write), p2 (ref), p3 (ref)
					var5 += 1
					local var6 = p2[var5]
					
					return if var6 then p3[var6] == true else false
				end
			end
			return var2.getAndFetchItems(p2, var4)
		end,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.clear()
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref)
			var2.dispose()
		end
	}
end