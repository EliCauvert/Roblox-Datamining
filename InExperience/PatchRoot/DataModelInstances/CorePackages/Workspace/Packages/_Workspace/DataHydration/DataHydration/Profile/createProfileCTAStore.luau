local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local cryoModule = require(parent.Cryo)
local requestsModule = require(dataHydration.Profile.Requests)
local _ = require(dataHydration.Profile.Enums.ProfileCTAEnums)
local hydratePresenceFromProfileMetadataModule = require(dataHydration.Profile.hydratePresenceFromProfileMetadata)
local fFlagProfileCTAHydratePresenceFromMetadataModule = require(dataHydration.Flags.FFlagProfileCTAHydratePresenceFromMetadata)
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1)

local _ = function()
	return game:GetFastInt("ProfileCTAStoreProcessDelaySec")
end

local list = {
	{ component = "Actions", excludeContextualActions = true }
}

return function(p1)
	-- upvalues: createDataCacheModule (ref), fFlagJoinabilityCTARefactor (ref), list (ref), createDataResolverModule (ref), cryoModule (ref), requestsModule (ref), fFlagProfileCTAHydratePresenceFromMetadataModule (ref), hydratePresenceFromProfileMetadataModule (ref)
	local var1 = createDataCacheModule()
	local var2 = if fFlagJoinabilityCTARefactor and p1 and p1.components then p1.components else list
	local var3 = if fFlagJoinabilityCTARefactor and var2[1] then var2[1].component else "Actions"
	local var4 = createDataResolverModule({
		requestBatchSize = 25,
		cache = var1,
		queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"),
		fetchFn = function(p2)
			-- upvalues: cryoModule (copy), fFlagJoinabilityCTARefactor (copy), requestsModule (copy), var2 (ref), var3 (ref), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), hydratePresenceFromProfileMetadataModule (copy)
			local var5 = cryoModule.Dictionary.keys(p2)
			
			return (if fFlagJoinabilityCTARefactor then requestsModule.GetUserProfileCTA(var5, var2) else requestsModule.GetUserProfileCTA(var5)):andThen(function(p3)
				-- upvalues: var5 (ref), fFlagJoinabilityCTARefactor (copy), var3 (copy), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), hydratePresenceFromProfileMetadataModule (copy)
				local t = {}
				
				if p3.responseBody and p3.responseBody.profiles then
					for i, v in var5 do
						local var6 = tostring(v)
						local var7 = p3.responseBody.profiles[var6]
						
						if fFlagJoinabilityCTARefactor then
							t[var6] = var7 and (var7.components and (var7.components[var3] or {}))
						else
							t[var6] = var7 and (var7.components and (var7.components.Actions or {}))
						end
						if fFlagProfileCTAHydratePresenceFromMetadataModule then
							hydratePresenceFromProfileMetadataModule(var6, var7 and var7.metadata)
						end
					end
				end
				return t
			end):catch(function(_)
				return {}
			end)
		end
	})
	
	return {
		getCTA = function(p3, p4)
			-- upvalues: var4 (ref)
			local var6 = nil
			
			if p4 ~= nil then
				local var7 = p4 == true
				
				var6 = function(_)
					-- upvalues: var7 (ref)
					return var7
				end
			end
			return var4.getAndFetchItem(p3, var6)
		end,
		getBatchCTAs = function(p3, p4)
			-- upvalues: var4 (ref)
			local var6 = nil
			
			if p4 then
				local var7 = 0
				
				var6 = function(_)
					-- upvalues: var7 (write), p3 (ref), p4 (ref)
					var7 += 1
					local var8 = p3[var7]
					
					return if var8 then p4[var8] == true else false
				end
			end
			return var4.getAndFetchItems(p3, var6)
		end,
		clear = function()
			-- upvalues: var1 (ref), var4 (ref)
			var1.clear()
			var4.clear()
		end,
		dispose = function()
			-- upvalues: var4 (ref)
			var4.dispose()
		end
	}
end