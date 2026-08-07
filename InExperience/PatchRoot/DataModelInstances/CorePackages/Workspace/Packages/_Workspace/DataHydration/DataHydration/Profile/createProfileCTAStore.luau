local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local cryoModule = require(parent.Cryo)
local requestsModule = require(dataHydration.Profile.Requests)
local _ = require(dataHydration.Profile.Enums.ProfileCTAEnums)
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1)

local _ = function() --[[ line: 36 ]]
	return game:GetFastInt("ProfileCTAStoreProcessDelaySec")
end

return function() --[[ line: 40 | named "createProfileCTAStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), cryoModule (ref), requestsModule (ref)
	local var5 = createDataCacheModule()
	local var6 = createDataResolverModule({
		requestBatchSize = 25,
		cache = var5,
		queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"),
		fetchFn = function(p0) --[[ line: 47 ]]
			-- upvalues: cryoModule (copy), requestsModule (copy)
			local var7 = cryoModule.Dictionary.keys(p0)
			
			return requestsModule.GetUserProfileCTA(var7):andThen(function(p1) --[[ line: 50 ]]
				-- upvalues: var7 (ref)
				local t = {}
				
				if p1.responseBody and p1.responseBody.profiles then
					for i, v in var7 do
						local var9 = tostring(v)
						local var10 = p1.responseBody.profiles[var9]
						t[var9] = var10 and (var10.components and (var10.components.Actions or {}))
					end
				end
				return t
			end):catch(function(_) --[[ line: 64 ]]
				return {}
			end)
		end
	})
	
	return {
		getCTA = function(p2, p3) --[[ line: 70 ]]
			-- upvalues: var6 (ref)
			local var11 = nil
			
			if p3 ~= nil then
				local var12 = p3 == true
				
				var11 = function(_) --[[ line: 74 ]]
					-- upvalues: var12 (ref)
					return var12
				end
			end
			return var6.getAndFetchItem(p2, var11)
		end,
		getBatchCTAs = function(p4, p5) --[[ line: 81 ]]
			-- upvalues: var6 (ref)
			local var13 = nil
			
			if p5 then
				local var14 = 0
				
				var13 = function(_) --[[ line: 88 ]]
					-- upvalues: var14 (write), p4 (ref), p5 (ref)
					var14 += 1
					local var15 = p4[var14]
					
					return if var15 then p5[var15] == true else false
				end
			end
			return var6.getAndFetchItems(p4, var13)
		end,
		clear = function() --[[ line: 100 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.clear()
			var6.clear()
		end,
		dispose = function() --[[ line: 105 ]]
			-- upvalues: var6 (ref)
			var6.dispose()
		end
	}
end