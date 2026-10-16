local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local StatusCodes = HttpModule.StatusCodes
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local UrlBuilderModule = require(Parent.UrlBuilder)
local CreatorApiHttpModule = require(DataHydration.creatorApiHttp)
local _ = require(script.Parent.MonetizationOptionsTypes)
local FetchGamePassConfigModule = require(DataHydration.GamePassConfig.fetchGamePassConfig)
local _ = require(DataHydration.GamePassConfig.GamePassConfigTypes)
local InterfaceResult = TModule.interface({
	status = TModule.union(TModule.literal("Disabled"), TModule.literal("Pending"), TModule.literal("Accepted"))
})
local InterfaceResult1 = TModule.interface({
	errorCode = TModule.optional(TModule.string),
	errorMessage = TModule.optional(TModule.string),
	field = TModule.optional(TModule.string),
	hint = TModule.optional(TModule.string)
})
local InterfaceResult2 = TModule.interface({
	errors = TModule.array((TModule.interface({ productId = TModule.integer, error = InterfaceResult1 })))
})
local InterfaceResult3 = TModule.interface({
	errors = TModule.array((TModule.interface({ gamePassId = TModule.integer, error = InterfaceResult1 })))
})
local InterfaceResult4 = TModule.interface({
	shopId = TModule.integer,
	status = TModule.union(TModule.literal("Draft"), TModule.literal("Active"))
})
local InterfaceResult5 = TModule.interface({
	shops = TModule.array((TModule.interface({
		shopId = TModule.integer,
		entryPoints = TModule.array((TModule.interface({ name = TModule.string, isEnabled = TModule.boolean })))
	})))
})
local InterfaceResult6 = TModule.interface({ createdCategories = TModule.array(TModule.table) })
local InterfaceResult7 = TModule.interface({ monetizeExperience = TModule.boolean })
local InterfaceResult8 = TModule.interface({
	status = TModule.union(TModule.literal("Invalid"), TModule.literal("NotMigrated"), TModule.literal("Migrating"), TModule.literal("Migrated"))
})
local InterfaceResult9 = TModule.interface({
	permissions = TModule.optional(TModule.map(TModule.string, TModule.boolean))
})

local function _(p1, Callback, p2) --[[ Line: 87 | Named "validateResponse" ]]
	local CallbackResult, CallbackResult2 = Callback(p2)
	assert(CallbackResult, `Invalid {p1} response: {tostring(CallbackResult2)}`)
	
	return p2
end

local function decodeManagedPricingResponse(p1) --[[ Line: 93 ]]
	-- upvalues: InterfaceResult (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(p1)
	assert(InterfaceResultResult, `Invalid Managed Pricing response: {tostring(InterfaceResultResult2)}`)
	
	return p1
end

local function decodeBulkDeveloperProductUpdateResponse(p1) --[[ Line: 97 ]]
	-- upvalues: InterfaceResult2 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult2(p1)
	assert(InterfaceResultResult, `Invalid bulk developer product update response: {tostring(InterfaceResultResult2)}`)
	
	return p1
end

local function decodeBulkGamePassUpdateResponse(p1, p2) --[[ Line: 105 ]]
	-- upvalues: InterfaceResult3 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult3(p2)
	assert(InterfaceResultResult, `Invalid bulk Game Pass update response: {tostring(InterfaceResultResult2)}`)
	local t = {}
	
	for _, _error in p2.errors do
		assert(p1[_error.gamePassId], "Bulk Game Pass update error has an unexpected ID")
		assert(not t[_error.gamePassId], "Bulk Game Pass update error has a duplicate ID")
		t[_error.gamePassId] = true
	end
	return p2
end

local function decodeCreatedShop(p3) --[[ Line: 120 ]]
	-- upvalues: InterfaceResult4 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult4(p3)
	assert(InterfaceResultResult, `Invalid created Shop response: {tostring(InterfaceResultResult2)}`)
	
	return p3
end

local function decodeShopListResponse(p3) --[[ Line: 124 ]]
	-- upvalues: InterfaceResult5 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult5(p3)
	assert(InterfaceResultResult, `Invalid Shop list response: {tostring(InterfaceResultResult2)}`)
	
	return p3
end

local function decodeUniversePermissionResponse(p3) --[[ Line: 128 ]]
	-- upvalues: InterfaceResult7 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult7(p3)
	assert(InterfaceResultResult, `Invalid universe permission response: {tostring(InterfaceResultResult2)}`)
	
	return { canMonetize = p3.monetizeExperience }
end

local function decodeGroupMigrationResponse(p3) --[[ Line: 133 ]]
	-- upvalues: InterfaceResult8 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult8(p3)
	assert(InterfaceResultResult, `Invalid group migration response: {tostring(InterfaceResultResult2)}`)
	
	return p3
end

local function decodeGroupPermissionResponse(p3) --[[ Line: 137 ]]
	-- upvalues: InterfaceResult9 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult9(p3)
	assert(InterfaceResultResult, `Invalid group permission response: {tostring(InterfaceResultResult2)}`)
	
	return {
		canMonetize = p3.permissions ~= nil and p3.permissions.canMonetize == true
	}
end

local function decodeBatchUpdateShopItemsResponse(p3) --[[ Line: 142 ]]
	-- upvalues: InterfaceResult6 (copy)
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult6(p3)
	assert(InterfaceResultResult, `Invalid Shop item update response: {tostring(InterfaceResultResult2)}`)
	
	return p3
end

local function decodeEmptyResponse(_) --[[ Line: 146 ]]
	return nil
end

local function transportOptions(p3) --[[ Line: 150 ]]
	local P13 = p3 or {}
	
	return {
		retryReads = false,
		network = P13.network,
		readNetwork = P13.readNetwork,
		mutatingNetwork = P13.mutatingNetwork,
		baseUrl = P13.baseUrl
	}
end

local _ = function(p3) --[[ Line: 161 | Named "resolveBase" ]]
	-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy)
	return CreatorApiHttpModule.baseUrl((transportOptions(p3)))
end

local function get(PermissionsName, p3, p4, DecodeUniversePermissionResponse) --[[ Line: 165 ]]
	-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy)
	return CreatorApiHttpModule.get(transportOptions(p4), PermissionsName, p3, DecodeUniversePermissionResponse)
end

local function mutate(p3, ShopsName, p4, p5, p6, DecodeBatchUpdateShopItemsResponse) --[[ Line: 169 ]]
	-- upvalues: transportOptions (copy), CreatorApiHttpModule (copy)
	return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork((transportOptions(p6))), p3, ShopsName, p4, p5, CreatorApiHttpModule.jsonDecoder(DecodeBatchUpdateShopItemsResponse))
end

local function bulkUpdateGamePasses(p3, Tbl, p4, ChangedProperties, Callback, p5, p6) --[[ Line: 255 ]]
	-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), PromiseModule (copy), FetchGamePassConfigModule (copy), decodeBulkGamePassUpdateResponse (copy), StatusCodes (copy)
	local BaseUrlResult = CreatorApiHttpModule.baseUrl((transportOptions(p6)))
	local Copy = table.clone(Tbl)
	local config = {
		baseUrl = BaseUrlResult,
		network = CreatorApiHttpModule.readNetwork((transportOptions(p6)))
	}
	local Errors = {}
	local List = {}
	local Total = 1
	local Frozen = table.freeze({
		errorMessage = "The local user changed while the bulk Game Pass request was running"
	})
	
	local function _() --[[ Line: 273 | Named "isRequestCurrent" ]]
		-- upvalues: p6 (copy)
		return p6 == nil or (p6.isRequestCurrent == nil or p6.isRequestCurrent())
	end
	
	local function appendSessionChanged(GamePassIds, p7) --[[ Line: 276 ]]
		-- upvalues: List (copy), Frozen (copy)
		for _, gamePassId in GamePassIds do
			local v1 = if p7 == nil then nil else p7[gamePassId]
			table.insert(List, if v1 == nil then {
				status = "unverified",
				reason = "session_changed",
				gamePassId = gamePassId,
				error = Frozen
			} else {
				status = "failed",
				reason = "service_error",
				gamePassId = gamePassId,
				error = v1.error
			})
		end
	end
	
	local function updateNextBatch() --[[ Line: 300 ]]
		-- upvalues: p6 (copy), Total (ref), Copy (copy), appendSessionChanged (copy), PromiseModule (upval), Errors (copy), List (copy), p4 (copy), ChangedProperties (copy), updateNextBatch (copy), FetchGamePassConfigModule (upval), p3 (copy), config (copy), Callback (copy), BaseUrlResult (copy), p5 (copy), decodeBulkGamePassUpdateResponse (upval), transportOptions (upval), CreatorApiHttpModule (upval), StatusCodes (upval)
		if p6 == nil or (p6.isRequestCurrent == nil or p6.isRequestCurrent()) then
			local GamePassUpdates = {}
			local List2 = {}
			
			for i1 = Total, math.min(Total + 30 - 1, #Copy) do
				table.insert(List2, Copy[i1])
				table.insert(GamePassUpdates, {
					gamePassId = Copy[i1],
					changedPropertyNames = { p4 },
					changedProperties = ChangedProperties
				})
			end
			if #GamePassUpdates == 0 then
				return PromiseModule.resolve({ errors = Errors, results = List })
			end
			Total += #GamePassUpdates
			local t = {}
			
			for _, gamePassUpdate in GamePassUpdates do
				t[gamePassUpdate.gamePassId] = true
			end
			local function readBack(p8, MutationError) --[[ Line: 328 ]]
				-- upvalues: Errors (upval), GamePassUpdates (copy), p6 (upval), appendSessionChanged (upval), List2 (copy), updateNextBatch (upval), FetchGamePassConfigModule (upval), p3 (upval), config (upval), List (upval), Callback (upval)
				local t = {}
				local GamePassIds = {}
				
				if p8 ~= nil then
					for _, _error in p8.errors do
						table.insert(Errors, _error)
						t[_error.gamePassId] = _error
					end
				end
				for _, gamePassUpdate in GamePassUpdates do
					if t[gamePassUpdate.gamePassId] == nil then
						table.insert(GamePassIds, gamePassUpdate.gamePassId)
					end
				end
				if p6 == nil or (p6.isRequestCurrent == nil or p6.isRequestCurrent()) then
					return FetchGamePassConfigModule.batchGet(p3, GamePassIds, config):andThen(function(Result) --[[ Line: 346 ]]
						-- upvalues: p6 (upval), appendSessionChanged (upval), List2 (upval), t (copy), updateNextBatch (upval), GamePassUpdates (upval), List (upval), MutationError (copy), Callback (upval)
						if p6 ~= nil and (p6.isRequestCurrent ~= nil and not p6.isRequestCurrent()) then
							appendSessionChanged(List2, t)
							
							return updateNextBatch()
						end
						local t1 = {}
						
						for _, gamePass in Result.gamePasses do
							t1[gamePass.gamePassId] = gamePass
						end
						for _, gamePassUpdate in GamePassUpdates do
							local GamePassId = gamePassUpdate.gamePassId
							local Entry = t[GamePassId]
							local Entry1 = t1[GamePassId]
							
							if Entry ~= nil then
								table.insert(List, {
									status = "failed",
									reason = "service_error",
									gamePassId = GamePassId,
									error = Entry.error
								})
								continue
							end
							if Entry1 == nil then
								table.insert(List, {
									status = "unverified",
									reason = "readback_failed",
									gamePassId = GamePassId,
									mutationError = MutationError
								})
							else
								local CallbackResult = Callback(Entry1)
								table.insert(List, {
									gamePassId = GamePassId,
									status = if CallbackResult then "confirmed" else "unverified",
									reason = if CallbackResult then nil else "readback_mismatch",
									config = Entry1,
									mutationError = MutationError
								})
							end
						end
						return updateNextBatch()
					end, function(p9) --[[ Line: 385 ]]
						-- upvalues: p6 (upval), appendSessionChanged (upval), List2 (upval), t (copy), updateNextBatch (upval), GamePassUpdates (upval), List (upval), MutationError (copy)
						if p6 ~= nil and (p6.isRequestCurrent ~= nil and not p6.isRequestCurrent()) then
							appendSessionChanged(List2, t)
							
							return updateNextBatch()
						end
						for _, gamePassUpdate in GamePassUpdates do
							local Entry = t[gamePassUpdate.gamePassId]
							table.insert(List, if Entry == nil then {
								status = "unverified",
								reason = "readback_failed",
								gamePassId = gamePassUpdate.gamePassId,
								error = p9,
								mutationError = MutationError
							} else {
								status = "failed",
								reason = "service_error",
								gamePassId = gamePassUpdate.gamePassId,
								error = Entry.error
							})
						end
						return updateNextBatch()
					end)
				else
					appendSessionChanged(List2, t)
					
					return updateNextBatch()
				end
			end
			
			return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork((transportOptions(p6))), "POST", ("%s/game-passes/v1/game-passes/universes/%d/bulk-update"):format(BaseUrlResult, p3), { gamePassUpdates = GamePassUpdates }, p5, CreatorApiHttpModule.jsonDecoder(function(p9) --[[ Line: 419 ]]
				-- upvalues: decodeBulkGamePassUpdateResponse (upval), t (copy)
				return (decodeBulkGamePassUpdateResponse(t, p9))
			end)):andThen(function(Result) --[[ Line: 422 ]]
				-- upvalues: readBack (copy)
				return readBack(Result, nil)
			end, function(MutationError) --[[ Line: 424 ]]
				-- upvalues: StatusCodes (upval), Copy (upval), Total (upval), GamePassUpdates (copy), List (upval), Errors (upval), updateNextBatch (upval), readBack (copy)
				local ResponseCode = if typeof(MutationError) == "table" then MutationError.responseCode else nil
				
				if ResponseCode == nil or StatusCodes.BAD_REQUEST > ResponseCode or ResponseCode >= StatusCodes.INTERNAL_SERVER_ERROR or ResponseCode == StatusCodes.REQUEST_TIMEOUT then
					return readBack(nil, MutationError)
				end
				local IsResponseCodeMatch: boolean = ResponseCode == StatusCodes.UNAUTHORIZED or (ResponseCode == StatusCodes.FORBIDDEN or ResponseCode == StatusCodes.TOO_MANY_REQUESTS)
				local CountCopy: number = if IsResponseCodeMatch then #Copy else Total - 1
				for i = Total - #GamePassUpdates, CountCopy do
					table.insert(List, {
						status = "failed",
						reason = "service_error",
						gamePassId = Copy[i],
						error = MutationError
					})
				end
				return if IsResponseCodeMatch then { errors = Errors, results = List } else updateNextBatch()
			end)
		else
			local List1 = {}
			
			for i = Total, #Copy do
				table.insert(List1, Copy[i])
			end
			Total = #Copy + 1
			appendSessionChanged(List1)
			
			return PromiseModule.resolve({ errors = Errors, results = List })
		end
	end
	
	return updateNextBatch()
end

return {
	getManagedPricing = function(p9, p10) --[[ Line: 190 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), get (copy), decodeManagedPricingResponse (copy)
		return get(("%s/price-configuration-api/v1/universes/%d/managed-pricing"):format(CreatorApiHttpModule.baseUrl((transportOptions(p10))), p9), "monetization-options.managed-pricing.get", p10, decodeManagedPricingResponse)
	end,
	acceptManagedPricing = function(p9, p10) --[[ Line: 203 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), mutate (copy), decodeEmptyResponse (copy)
		return mutate("POST", ("%s/price-configuration-api/v1/universes/%d/managed-pricing:accept"):format(CreatorApiHttpModule.baseUrl((transportOptions(p10))), p9), nil, "monetization-options.managed-pricing.accept", p10, decodeEmptyResponse)
	end,
	updateDeveloperProductsManagedPricing = function(p9, p10, IsManagedPricingEnabled, p11) --[[ Line: 215 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), PromiseModule (copy), decodeBulkDeveloperProductUpdateResponse (copy)
		local BaseUrlResult = CreatorApiHttpModule.baseUrl((transportOptions(p11)))
		local Errors = {}
		local Total = 1
		
		local function updateNextBatch() --[[ Line: 226 ]]
			-- upvalues: Total (ref), p10 (copy), IsManagedPricingEnabled (copy), PromiseModule (upval), Errors (copy), BaseUrlResult (copy), p9 (copy), p11 (copy), decodeBulkDeveloperProductUpdateResponse (upval), transportOptions (upval), CreatorApiHttpModule (upval), updateNextBatch (copy)
			local DeveloperProductUpdates = {}
			
			for i = Total, math.min(Total + 30 - 1, #p10) do
				table.insert(DeveloperProductUpdates, {
					productId = p10[i],
					changedProperties = { isManagedPricingEnabled = IsManagedPricingEnabled }
				})
			end
			if #DeveloperProductUpdates == 0 then
				return PromiseModule.resolve({ errors = Errors })
			else
				Total += #DeveloperProductUpdates
				
				return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork((transportOptions(p11))), "PATCH", ("%s/developer-products/v1/universes/%d/developer-products"):format(BaseUrlResult, p9), { developerProductUpdates = DeveloperProductUpdates }, "monetization-options.managed-pricing.update-products", CreatorApiHttpModule.jsonDecoder(decodeBulkDeveloperProductUpdateResponse)):andThen(function(Result) --[[ Line: 245 ]]
					-- upvalues: Errors (upval), updateNextBatch (upval)
					local Errors1 = Result.errors or {}
					for _, value in Errors1 do
						table.insert(Errors, value)
					end
					return updateNextBatch()
				end)
			end
		end
		
		return updateNextBatch()
	end,
	updateGamePassesManagedPricing = function(p12, p13, ManagedPricing, p14) --[[ Line: 453 ]]
		-- upvalues: bulkUpdateGamePasses (copy)
		return bulkUpdateGamePasses(p12, p13, "ManagedPricing", { ManagedPricing = ManagedPricing }, function(p15): boolean --[[ Line: 464 ]]
			-- upvalues: ManagedPricing (copy)
			return p15.isManagedPricingEnabled == ManagedPricing
		end, "monetization-options.managed-pricing.update-game-passes", p14)
	end,
	updateGamePassesArchived = function(p12, p13, Archived, p14) --[[ Line: 472 ]]
		-- upvalues: bulkUpdateGamePasses (copy)
		return bulkUpdateGamePasses(p12, p13, "Archived", { Archived = Archived }, function(p15): boolean --[[ Line: 478 ]]
			-- upvalues: Archived (copy)
			return p15.isArchived == Archived and (not Archived or p15.isForSale == false)
		end, "monetization-options.archive.update-game-passes", p14)
	end,
	listShops = function(p12, p13) --[[ Line: 483 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), UrlBuilderModule (copy), get (copy), decodeShopListResponse (copy)
		return get(UrlBuilderModule.UrlBuilder.addQueryString(("%s/shops-api/v1/shops"):format((CreatorApiHttpModule.baseUrl((transportOptions(p13))))), {
			["scope.type"] = "Universe",
			["scope.scopeId"] = tostring(p12)
		}), "monetization-options.shops.list", p13, decodeShopListResponse)
	end,
	createShop = function(p12, IsEnabled, p13) --[[ Line: 492 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), mutate (copy), decodeCreatedShop (copy)
		return mutate("POST", ("%s/shops-api/v1/shops"):format((CreatorApiHttpModule.baseUrl((transportOptions(p13))))), {
			scope = { type = "Universe", scopeId = tostring(p12) },
			entryPoints = {
				{
					name = "InExperienceGlobalIconEnabled",
					isEnabled = IsEnabled
				}
			}
		}, "monetization-options.shops.create", p13, decodeCreatedShop)
	end,
	setShopGlobalIcon = function(p12, IsEnabled, p13) --[[ Line: 504 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), mutate (copy), decodeBatchUpdateShopItemsResponse (copy)
		return mutate("PATCH", ("%s/shops-api/v1/shops/%d/items"):format(CreatorApiHttpModule.baseUrl((transportOptions(p13))), p12), {
			changedEntryPoints = {
				{
					name = "InExperienceGlobalIconEnabled",
					isEnabled = IsEnabled
				}
			}
		}, "monetization-options.shops.update-global-icon", p13, decodeBatchUpdateShopItemsResponse)
	end,
	getMonetizationPermission = function(p12, p13, p14, p15) --[[ Line: 511 ]]
		-- upvalues: CreatorApiHttpModule (copy), transportOptions (copy), get (copy), decodeUniversePermissionResponse (copy), HttpModule (copy), decodeGroupMigrationResponse (copy), PromiseModule (copy), decodeGroupPermissionResponse (copy)
		local BaseUrlResult = CreatorApiHttpModule.baseUrl((transportOptions(p15)))
		
		if p13 == "Group" and p14 ~= nil then
			local GroupsBaseUrl = p15 and p15.groupsBaseUrl or HttpModule.Url.GROUPS_URL
			
			local function getLegacyPermission() --[[ Line: 529 ]]
				-- upvalues: get (upval), BaseUrlResult (copy), p12 (copy), p15 (copy), decodeUniversePermissionResponse (upval)
				return get(("%s/orgs/v2/universes/%d/permissions/resolved"):format(BaseUrlResult, p12), "monetization-options.permission.universe", p15, decodeUniversePermissionResponse)
			end
			
			return CreatorApiHttpModule.get(transportOptions(p15), ("%sv1/groups/%d/migration"):format(GroupsBaseUrl, p14), "monetization-options.permission.group-migration", decodeGroupMigrationResponse):catch(function(Err) --[[ Line: 543 ]]
				-- upvalues: PromiseModule (upval)
				return if type(Err) == "table" and Err.responseCode == 409 then { status = "NotMigrated" } else PromiseModule.reject(Err)
			end):andThen(function(Result) --[[ Line: 550 ]]
				-- upvalues: getLegacyPermission (copy), get (upval), GroupsBaseUrl (copy), p14 (copy), p12 (copy), p15 (copy), decodeGroupPermissionResponse (upval)
				return if Result.status == "Migrated" then get(("%sv2/groups/%d/universes/%d/permissions/resolved"):format(GroupsBaseUrl, p14, p12), "monetization-options.permission.group", p15, decodeGroupPermissionResponse) else getLegacyPermission()
			end)
		else
			return get(("%s/orgs/v2/universes/%d/permissions/resolved"):format(BaseUrlResult, p12), "monetization-options.permission.universe", p15, decodeUniversePermissionResponse)
		end
	end
}