local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local cryoModule = require(parent.Cryo)
local promiseModule = require(parent.Promise)
local name = require(parent.Loggers).Logger:new(script.Name)
local requestsModule = require(dataHydration.Profile.Requests)
local _ = require(dataHydration.Profile.Enums.ProfileCTAEnums)
local hydratePresenceFromProfileMetadataModule = require(dataHydration.Profile.hydratePresenceFromProfileMetadata)
local fFlagProfileCTAHydratePresenceFromMetadataModule = require(dataHydration.Flags.FFlagProfileCTAHydratePresenceFromMetadata)
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
game:DefineFastInt("ProfileCTAStoreProcessDelaySec", 1)

local _ = function()
	return game:GetFastInt("ProfileCTAStoreProcessDelaySec")
end

local profileJoinUserActionsProcessDelaySec = game:DefineFastInt("ProfileJoinUserActionsProcessDelaySec", 0)
local list = {
	{ component = "Actions", excludeContextualActions = true }
}
local list_1 = { { component = "JoinUserActions" } }

return function(p1)
	-- upvalues: createDataCacheModule (ref), fFlagJoinabilityCTARefactor (ref), list (ref), cryoModule (ref), requestsModule (ref), fFlagProfileCTAHydratePresenceFromMetadataModule (ref), hydratePresenceFromProfileMetadataModule (ref), createDataResolverModule (ref), profileJoinUserActionsProcessDelaySec (ref), name (ref), list_1 (ref), dataHydration (ref), promiseModule (ref)
	local var1 = createDataCacheModule()
	local var2 = if fFlagJoinabilityCTARefactor then createDataCacheModule() else nil
	local var3 = if fFlagJoinabilityCTARefactor and p1 and p1.components then p1.components else list
	local var4 = if fFlagJoinabilityCTARefactor and var3[1] then var3[1].component else "Actions"
	
	local function fetchComponent(p2, p3, p4, p5)
		-- upvalues: cryoModule (copy), requestsModule (copy), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), hydratePresenceFromProfileMetadataModule (copy)
		local var5 = cryoModule.Dictionary.keys(p2)
		
		return requestsModule.GetUserProfileCTA(var5, p3):andThen(function(p6)
			-- upvalues: var5 (ref), p4 (ref), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), p5 (ref), hydratePresenceFromProfileMetadataModule (copy)
			local t = {}
			
			if p6.responseBody and p6.responseBody.profiles then
				for i, v in var5 do
					local var6 = tostring(v)
					local var7 = p6.responseBody.profiles[var6]
					t[var6] = var7 and (var7.components and (var7.components[p4] or {}))
					
					if fFlagProfileCTAHydratePresenceFromMetadataModule and p5 then
						hydratePresenceFromProfileMetadataModule(var6, var7 and var7.metadata)
					end
				end
			end
			return t
		end)
	end
	
	local var6 = createDataResolverModule({
		requestBatchSize = 25,
		cache = var1,
		queueProcessDelaySec = game:GetFastInt("ProfileCTAStoreProcessDelaySec"),
		fetchFn = function(p6)
			-- upvalues: fFlagJoinabilityCTARefactor (copy), fetchComponent (ref), var3 (ref), var4 (ref), cryoModule (copy), requestsModule (copy), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), hydratePresenceFromProfileMetadataModule (copy)
			if fFlagJoinabilityCTARefactor then
				return fetchComponent(p6, var3, var4, true)
			end
			local var7 = cryoModule.Dictionary.keys(p6)
			
			return requestsModule.GetUserProfileCTA(var7):andThen(function(p7)
				-- upvalues: var7 (ref), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), hydratePresenceFromProfileMetadataModule (copy)
				local t = {}
				
				if p7.responseBody and p7.responseBody.profiles then
					for i, v in var7 do
						local var8 = tostring(v)
						local var9 = p7.responseBody.profiles[var8]
						t[var8] = var9 and (var9.components and (var9.components.Actions or {}))
						
						if fFlagProfileCTAHydratePresenceFromMetadataModule then
							hydratePresenceFromProfileMetadataModule(var8, var9 and var9.metadata)
						end
					end
				end
				return t
			end):catch(function(_)
				return {}
			end)
		end
	})
	local var8 = if fFlagJoinabilityCTARefactor then createDataResolverModule({
		requestBatchSize = 25,
		replaceItems = true,
		cache = var2,
		queueProcessDelaySec = profileJoinUserActionsProcessDelaySec,
		logError = function(p7)
			-- upvalues: name (copy)
			name:warning(`Failed to fetch JoinUserActions: {tostring(p7)}`)
		end,
		fetchFn = function(p7)
			-- upvalues: list_1 (copy), cryoModule (copy), requestsModule (copy), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), hydratePresenceFromProfileMetadataModule (copy), dataHydration (copy), promiseModule (copy)
			local component = list_1[1].component
			local var9 = cryoModule.Dictionary.keys(p7)
			local var10 = true
			local joinUserActionsTelemetryModule = require(dataHydration.Profile.JoinUserActionsTelemetry)
			
			return requestsModule.GetUserProfileCTA(var9, list_1):andThen(function(p8)
				-- upvalues: var9 (ref), component (ref), fFlagProfileCTAHydratePresenceFromMetadataModule (copy), var10 (ref), hydratePresenceFromProfileMetadataModule (copy)
				local t = {}
				
				if p8.responseBody and p8.responseBody.profiles then
					for i, v in var9 do
						local var11 = tostring(v)
						local var12 = p8.responseBody.profiles[var11]
						t[var11] = var12 and (var12.components and (var12.components[component] or {}))
						
						if fFlagProfileCTAHydratePresenceFromMetadataModule and var10 then
							hydratePresenceFromProfileMetadataModule(var11, var12 and var12.metadata)
						end
					end
				end
				return t
			end):andThen(function(p9)
				-- upvalues: joinUserActionsTelemetryModule (ref)
				joinUserActionsTelemetryModule.logFetchResult("Success")
				
				return p9
			end):catch(function(p9)
				-- upvalues: joinUserActionsTelemetryModule (ref), promiseModule (copy)
				joinUserActionsTelemetryModule.logFetchResult("Failed")
				
				return promiseModule.reject(p9)
			end)
		end
	}) else nil
	
	return {
		getCTA = function(p8, p9)
			-- upvalues: var6 (ref)
			local var11 = nil
			
			if p9 ~= nil then
				local var12 = p9 == true
				
				var11 = function(_)
					-- upvalues: var12 (ref)
					return var12
				end
			end
			return var6.getAndFetchItem(p8, var11)
		end,
		getBatchCTAs = function(p8, p9)
			-- upvalues: var6 (ref)
			local var11 = nil
			
			if p9 then
				local var12 = 0
				
				var11 = function(_)
					-- upvalues: var12 (write), p8 (ref), p9 (ref)
					var12 += 1
					local var13 = p8[var12]
					
					return if var13 then p9[var13] == true else false
				end
			end
			return var6.getAndFetchItems(p8, var11)
		end,
		getJoinUserActions = if fFlagJoinabilityCTARefactor then function(p8, p9)
			-- upvalues: var8 (ref)
			local var11 = nil
			
			if p9 ~= nil then
				local var12 = p9 == true
				
				var11 = function(_)
					-- upvalues: var12 (ref)
					return var12
				end
			end
			return var8.getAndFetchItem(p8, var11)
		end else nil,
		clear = function()
			-- upvalues: var1 (ref), var6 (ref), fFlagJoinabilityCTARefactor (copy), var2 (ref), var8 (ref)
			var1.clear()
			var6.clear()
			
			if fFlagJoinabilityCTARefactor then
				var2.clear()
				var8.clear()
			end
		end,
		dispose = function()
			-- upvalues: var6 (ref), fFlagJoinabilityCTARefactor (copy), var8 (ref)
			var6.dispose()
			
			if fFlagJoinabilityCTARefactor then
				var8.dispose()
			end
		end
	}
end