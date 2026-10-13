local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local httpModule = require(parent.Http)
local statusCodes = httpModule.StatusCodes
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local urlBuilderModule = require(parent.UrlBuilder)
local creatorApiHttpModule = require(dataHydration.creatorApiHttp)
local _ = require(script.Parent.MonetizationOptionsTypes)
local fetchGamePassConfigModule = require(dataHydration.GamePassConfig.fetchGamePassConfig)
local _ = require(dataHydration.GamePassConfig.GamePassConfigTypes)
local var1 = tModule.interface({
	status = tModule.union(tModule.literal("Disabled"), tModule.literal("Pending"), tModule.literal("Accepted"))
})
local var2 = tModule.interface({
	errorCode = tModule.optional(tModule.string),
	errorMessage = tModule.optional(tModule.string),
	field = tModule.optional(tModule.string),
	hint = tModule.optional(tModule.string)
})
local var3 = tModule.interface({
	errors = tModule.array(tModule.interface({ productId = tModule.integer, error = var2 }))
})
local var4 = tModule.interface({
	errors = tModule.array(tModule.interface({ gamePassId = tModule.integer, error = var2 }))
})
local var5 = tModule.interface({
	shopId = tModule.integer,
	status = tModule.union(tModule.literal("Draft"), tModule.literal("Active"))
})
local var6 = tModule.interface({
	shops = tModule.array(tModule.interface({
		shopId = tModule.integer,
		entryPoints = tModule.array(tModule.interface({ name = tModule.string, isEnabled = tModule.boolean }))
	}))
})
local var7 = tModule.interface({ createdCategories = tModule.array(tModule.table) })
local var8 = tModule.interface({ monetizeExperience = tModule.boolean })
local var9 = tModule.interface({
	status = tModule.union(tModule.literal("Invalid"), tModule.literal("NotMigrated"), tModule.literal("Migrating"), tModule.literal("Migrated"))
})
local var10 = tModule.interface({
	permissions = tModule.optional(tModule.map(tModule.string, tModule.boolean))
})

local function _(p1, p2, p3)
	local var11, var12 = p2(p3)
	assert(var11, `Invalid {p1} response: {tostring(var12)}`)
	
	return p3
end

local function decodeManagedPricingResponse(p1)
	-- upvalues: var1 (ref)
	local var11, var12 = var1(p1)
	assert(var11, `Invalid Managed Pricing response: {tostring(var12)}`)
	
	return p1
end

local function decodeBulkDeveloperProductUpdateResponse(p1)
	-- upvalues: var3 (ref)
	local var11, var12 = var3(p1)
	assert(var11, `Invalid bulk developer product update response: {tostring(var12)}`)
	
	return p1
end

local function decodeBulkGamePassUpdateResponse(p1, p2)
	-- upvalues: var4 (ref)
	local var11, var12 = var4(p2)
	assert(var11, `Invalid bulk Game Pass update response: {tostring(var12)}`)
	local t = {}
	
	for i, v in p2.errors do
		assert(p1[v.gamePassId], "Bulk Game Pass update error has an unexpected ID")
		assert(not t[v.gamePassId], "Bulk Game Pass update error has a duplicate ID")
		t[v.gamePassId] = true
	end
	return p2
end

local function decodeCreatedShop(p3)
	-- upvalues: var5 (ref)
	local var13, var14 = var5(p3)
	assert(var13, `Invalid created Shop response: {tostring(var14)}`)
	
	return p3
end

local function decodeShopListResponse(p3)
	-- upvalues: var6 (ref)
	local var13, var14 = var6(p3)
	assert(var13, `Invalid Shop list response: {tostring(var14)}`)
	
	return p3
end

local function decodeUniversePermissionResponse(p3)
	-- upvalues: var8 (ref)
	local var13, var14 = var8(p3)
	assert(var13, `Invalid universe permission response: {tostring(var14)}`)
	
	return { canMonetize = p3.monetizeExperience }
end

local function decodeGroupMigrationResponse(p3)
	-- upvalues: var9 (ref)
	local var13, var14 = var9(p3)
	assert(var13, `Invalid group migration response: {tostring(var14)}`)
	
	return p3
end

local function decodeGroupPermissionResponse(p3)
	-- upvalues: var10 (ref)
	local var13, var14 = var10(p3)
	assert(var13, `Invalid group permission response: {tostring(var14)}`)
	
	return {
		canMonetize = p3.permissions ~= nil and p3.permissions.canMonetize == true
	}
end

local function decodeBatchUpdateShopItemsResponse(p3)
	-- upvalues: var7 (ref)
	local var13, var14 = var7(p3)
	assert(var13, `Invalid Shop item update response: {tostring(var14)}`)
	
	return p3
end

local function decodeEmptyResponse(_)
	return nil
end

local function transportOptions(p3)
	p3 = p3 or {}
	
	return {
		retryReads = false,
		network = p3.network,
		readNetwork = p3.readNetwork,
		mutatingNetwork = p3.mutatingNetwork,
		baseUrl = p3.baseUrl
	}
end

local _ = function(p3)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref)
	return creatorApiHttpModule.baseUrl(transportOptions(p3))
end

local function get(p3, p4, p5, p6)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref)
	return creatorApiHttpModule.get(transportOptions(p5), p3, p4, p6)
end

local function mutate(p3, p4, p5, p6, p7, p8)
	-- upvalues: transportOptions (ref), creatorApiHttpModule (ref)
	return creatorApiHttpModule.json(creatorApiHttpModule.mutatingNetwork(transportOptions(p7)), p3, p4, p5, p6, creatorApiHttpModule.jsonDecoder(p8))
end

local t = {
	getManagedPricing = function(p3, p4)
		-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), get (ref), decodeManagedPricingResponse (ref)
		return get(("%s/price-configuration-api/v1/universes/%d/managed-pricing"):format(creatorApiHttpModule.baseUrl(transportOptions(p4)), p3), "monetization-options.managed-pricing.get", p4, decodeManagedPricingResponse)
	end,
	acceptManagedPricing = function(p3, p4)
		-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), mutate (ref), decodeEmptyResponse (ref)
		return mutate("POST", ("%s/price-configuration-api/v1/universes/%d/managed-pricing:accept"):format(creatorApiHttpModule.baseUrl(transportOptions(p4)), p3), nil, "monetization-options.managed-pricing.accept", p4, decodeEmptyResponse)
	end,
	updateDeveloperProductsManagedPricing = function(p3, p4, p5, p6)
		-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), promiseModule (ref), decodeBulkDeveloperProductUpdateResponse (ref)
		local var13 = creatorApiHttpModule.baseUrl(transportOptions(p6))
		local t = {}
		local var14 = 1
		
		local function updateNextBatch()
			-- upvalues: var14 (write), p4 (ref), p5 (ref), promiseModule (copy), t (ref), var13 (ref), p3 (ref), p6 (ref), decodeBulkDeveloperProductUpdateResponse (copy), transportOptions (copy), creatorApiHttpModule (copy), updateNextBatch (ref)
			local t_1 = {}
			
			for i = var14, math.min(var14 + 30 - 1, #p4) do
				table.insert(t_1, {
					productId = p4[i],
					changedProperties = { isManagedPricingEnabled = p5 }
				})
			end
			if #t_1 == 0 then
				return promiseModule.resolve({ errors = t })
			end
			var14 += #t_1
			
			return creatorApiHttpModule.json(creatorApiHttpModule.mutatingNetwork(transportOptions(p6)), "PATCH", ("%s/developer-products/v1/universes/%d/developer-products"):format(var13, p3), { developerProductUpdates = t_1 }, "monetization-options.managed-pricing.update-products", creatorApiHttpModule.jsonDecoder(decodeBulkDeveloperProductUpdateResponse)):andThen(function(p7)
				-- upvalues: t (copy), updateNextBatch (copy)
				for i, v in p7.errors or {} do
					table.insert(t, v)
				end
				return updateNextBatch()
			end)
		end
		
		return updateNextBatch()
	end
}

local function bulkUpdateGamePasses(p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), promiseModule (ref), fetchGamePassConfigModule (ref), decodeBulkGamePassUpdateResponse (ref), statusCodes (ref)
	local var15 = creatorApiHttpModule.baseUrl(transportOptions(p13))
	local cloned = table.clone(p8)
	local t = {
		baseUrl = var15,
		network = creatorApiHttpModule.readNetwork(transportOptions(p13))
	}
	local t_1 = {}
	local t_2 = {}
	local var16 = 1
	local frozen = table.freeze({
		errorMessage = "The local user changed while the bulk Game Pass request was running"
	})
	
	local function _()
		-- upvalues: p13 (ref)
		return if p13 ~= nil then if p13.isRequestCurrent ~= nil then p13.isRequestCurrent() else true else true
	end
	
	local function appendSessionChanged(p14, p15)
		-- upvalues: t_2 (ref), frozen (ref)
		for i, v in p14 do
			local var17 = if p15 ~= nil then nil else p15[v]
			table.insert(t_2, if var17 ~= nil then {
				status = "unverified",
				reason = "session_changed",
				gamePassId = v,
				error = frozen
			} else {
				status = "failed",
				reason = "service_error",
				gamePassId = v,
				error = var17.error
			})
		end
	end
	
	local function updateNextBatch()
		-- upvalues: p13 (ref), var16 (write), cloned (ref), appendSessionChanged (ref), promiseModule (copy), t_1 (ref), t_2 (ref), p9 (ref), p10 (ref), updateNextBatch (ref), fetchGamePassConfigModule (copy), p7 (ref), t (ref), p11 (ref), var15 (ref), p12 (ref), decodeBulkGamePassUpdateResponse (copy), transportOptions (copy), creatorApiHttpModule (copy), statusCodes (copy)
		if if p13 ~= nil then if p13.isRequestCurrent ~= nil then p13.isRequestCurrent() else true else true then
			local t_3 = {}
			local t_4 = {}
			
			for i_1 = var16, math.min(var16 + 30 - 1, #cloned) do
				table.insert(t_4, cloned[i_1])
				table.insert(t_3, {
					gamePassId = cloned[i_1],
					changedPropertyNames = { p9 },
					changedProperties = p10
				})
			end
			if #t_3 == 0 then
				return promiseModule.resolve({ errors = t_1, results = t_2 })
			end
			var16 += #t_3
			local t_5 = {}
			
			for i_2, v in t_3 do
				t_5[v.gamePassId] = true
			end
			local function readBack(p16, p17)
				-- upvalues: t_1 (copy), t_3 (ref), p13 (copy), appendSessionChanged (copy), t_4 (ref), updateNextBatch (copy), fetchGamePassConfigModule (copy), p7 (copy), t (copy), t_2 (copy), p11 (copy)
				local t_5 = {}
				local t_6 = {}
				
				if p16 ~= nil then
					for i, v in p16.errors do
						table.insert(t_1, v)
						t_5[v.gamePassId] = v
					end
				end
				for i, v in t_3 do
					if t_5[v.gamePassId] == nil then
						table.insert(t_6, v.gamePassId)
					end
				end
				if if p13 ~= nil then if p13.isRequestCurrent ~= nil then p13.isRequestCurrent() else true else true then
					return fetchGamePassConfigModule.batchGet(p7, t_6, t):andThen(function(p18)
						-- upvalues: p13 (copy), appendSessionChanged (copy), t_4 (copy), t_5 (ref), updateNextBatch (copy), t_3 (copy), t_2 (copy), p17 (ref), p11 (copy)
						if not (if p13 ~= nil then if p13.isRequestCurrent ~= nil then p13.isRequestCurrent() else true else true) then
							appendSessionChanged(t_4, t_5)
							
							return updateNextBatch()
						end
						local t = {}
						
						for i, v in p18.gamePasses do
							t[v.gamePassId] = v
						end
						for i, v_1 in t_3 do
							local gamePassId = v_1.gamePassId
							local var18 = t_5[gamePassId]
							local var19 = t[gamePassId]
							
							if var18 ~= nil then
								table.insert(t_2, {
									status = "failed",
									reason = "service_error",
									gamePassId = gamePassId,
									error = var18.error
								})
							elseif var19 == nil then
								table.insert(t_2, {
									status = "unverified",
									reason = "readback_failed",
									gamePassId = gamePassId,
									mutationError = p17
								})
							else
								local var20 = p11(var19)
								table.insert(t_2, {
									gamePassId = gamePassId,
									status = if var20 then "confirmed" else "unverified",
									reason = if var20 then nil else "readback_mismatch",
									config = var19,
									mutationError = p17
								})
							end
						end
						return updateNextBatch()
					end, function(p19)
						-- upvalues: p13 (copy), appendSessionChanged (copy), t_4 (copy), t_5 (ref), updateNextBatch (copy), t_3 (copy), t_2 (copy), p17 (ref)
						if not (if p13 ~= nil then if p13.isRequestCurrent ~= nil then p13.isRequestCurrent() else true else true) then
							appendSessionChanged(t_4, t_5)
							
							return updateNextBatch()
						end
						for i, v in t_3 do
							local gamePassId = t_5[v.gamePassId]
							table.insert(t_2, if gamePassId ~= nil then {
								status = "unverified",
								reason = "readback_failed",
								gamePassId = v.gamePassId,
								error = p19,
								mutationError = p17
							} else {
								status = "failed",
								reason = "service_error",
								gamePassId = v.gamePassId,
								error = gamePassId.error
							})
						end
						return updateNextBatch()
					end)
				end
				appendSessionChanged(t_4, t_5)
				
				return updateNextBatch()
			end
			
			return creatorApiHttpModule.json(creatorApiHttpModule.mutatingNetwork(transportOptions(p13)), "POST", ("%s/game-passes/v1/game-passes/universes/%d/bulk-update"):format(var15, p7), { gamePassUpdates = t_3 }, p12, creatorApiHttpModule.jsonDecoder(function(p19)
				-- upvalues: decodeBulkGamePassUpdateResponse (copy), t_5 (ref)
				return decodeBulkGamePassUpdateResponse(t_5, p19)
			end)):andThen(function(p19)
				-- upvalues: readBack (ref)
				return readBack(p19, nil)
			end, function(p19)
				-- upvalues: statusCodes (copy), cloned (copy), var16 (copy), t_3 (ref), t_2 (copy), t_1 (copy), updateNextBatch (copy), readBack (ref)
				local var21 = if typeof(p19) == "table" then p19.responseCode else nil
				
				if var21 == nil or statusCodes.BAD_REQUEST > var21 or (var21 >= statusCodes.INTERNAL_SERVER_ERROR or var21 == statusCodes.REQUEST_TIMEOUT) then
					return readBack(nil, p19)
				end
				local var22 = if var21 ~= statusCodes.UNAUTHORIZED then if var21 ~= statusCodes.FORBIDDEN then var21 == statusCodes.TOO_MANY_REQUESTS else true else true
				
				for i = var16 - #t_3, if var22 then #cloned else var16 - 1 do
					table.insert(t_2, {
						status = "failed",
						reason = "service_error",
						gamePassId = cloned[i],
						error = p19
					})
				end
				return if var22 then { errors = t_1, results = t_2 } else updateNextBatch()
			end)
		else
			local t_3 = {}
			
			for i = var16, #cloned do
				table.insert(t_3, cloned[i])
			end
			var16 = #cloned + 1
			appendSessionChanged(t_3)
			
			return promiseModule.resolve({ errors = t_1, results = t_2 })
		end
	end
	
	return updateNextBatch()
end

function t.updateGamePassesManagedPricing(p18, p19, p20, p21)
	-- upvalues: bulkUpdateGamePasses (ref)
	return bulkUpdateGamePasses(p18, p19, "ManagedPricing", { ManagedPricing = p20 }, function(p22)
		-- upvalues: p20 (ref)
		return p22.isManagedPricingEnabled == p20
	end, "monetization-options.managed-pricing.update-game-passes", p21)
end

function t.updateGamePassesArchived(p18, p19, p20, p21)
	-- upvalues: bulkUpdateGamePasses (ref)
	return bulkUpdateGamePasses(p18, p19, "Archived", { Archived = p20 }, function(p22)
		-- upvalues: p20 (ref)
		return p22.isArchived == p20 and (not p20 or p22.isForSale == false)
	end, "monetization-options.archive.update-game-passes", p21)
end

function t.listShops(p18, p19)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), urlBuilderModule (ref), get (ref), decodeShopListResponse (ref)
	return get(urlBuilderModule.UrlBuilder.addQueryString(("%s/shops-api/v1/shops"):format(creatorApiHttpModule.baseUrl(transportOptions(p19))), {
		["scope.type"] = "Universe",
		["scope.scopeId"] = tostring(p18)
	}), "monetization-options.shops.list", p19, decodeShopListResponse)
end

function t.createShop(p18, p19, p20)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), mutate (ref), decodeCreatedShop (ref)
	return mutate("POST", ("%s/shops-api/v1/shops"):format(creatorApiHttpModule.baseUrl(transportOptions(p20))), {
		scope = { type = "Universe", scopeId = tostring(p18) },
		entryPoints = {
			{ name = "InExperienceGlobalIconEnabled", isEnabled = p19 }
		}
	}, "monetization-options.shops.create", p20, decodeCreatedShop)
end

function t.setShopGlobalIcon(value, p18, p19)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), mutate (ref), decodeBatchUpdateShopItemsResponse (ref)
	return mutate("PATCH", ("%s/shops-api/v1/shops/%d/items"):format(creatorApiHttpModule.baseUrl(transportOptions(p19)), value), {
		changedEntryPoints = {
			{ name = "InExperienceGlobalIconEnabled", isEnabled = p18 }
		}
	}, "monetization-options.shops.update-global-icon", p19, decodeBatchUpdateShopItemsResponse)
end

function t.getMonetizationPermission(p18, p19, p20, p21)
	-- upvalues: creatorApiHttpModule (ref), transportOptions (ref), get (ref), decodeUniversePermissionResponse (ref), httpModule (ref), decodeGroupMigrationResponse (ref), promiseModule (ref), decodeGroupPermissionResponse (ref)
	local var18 = creatorApiHttpModule.baseUrl(transportOptions(p21))
	
	if p19 == "Group" and p20 ~= nil then
		local var19 = if p21 then p21.groupsBaseUrl else httpModule.Url.GROUPS_URL
		
		local function getLegacyPermission()
			-- upvalues: get (copy), var18 (ref), p18 (ref), p21 (ref), decodeUniversePermissionResponse (copy)
			return get(("%s/orgs/v2/universes/%d/permissions/resolved"):format(var18, p18), "monetization-options.permission.universe", p21, decodeUniversePermissionResponse)
		end
		
		return creatorApiHttpModule.get(transportOptions(p21), ("%sv1/groups/%d/migration"):format(var19, p20), "monetization-options.permission.group-migration", decodeGroupMigrationResponse):catch(function(p22)
			-- upvalues: promiseModule (copy)
			return if type(p22) == "table" and p22.responseCode == 409 then { status = "NotMigrated" } else promiseModule.reject(p22)
		end):andThen(function(p22)
			-- upvalues: getLegacyPermission (ref), get (copy), var19 (ref), p20 (ref), p18 (ref), p21 (ref), decodeGroupPermissionResponse (copy)
			return if p22.status == "Migrated" then get(("%sv2/groups/%d/universes/%d/permissions/resolved"):format(var19, p20, p18), "monetization-options.permission.group", p21, decodeGroupPermissionResponse) else getLegacyPermission()
		end)
	end
	return get(("%s/orgs/v2/universes/%d/permissions/resolved"):format(var18, p18), "monetization-options.permission.universe", p21, decodeUniversePermissionResponse)
end

return t