local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local urlBuilderModule = require(parent.UrlBuilder)
local urlBase = urlBuilderModule.UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.MonetizationOptionsTypes)
local var1 = tModule.interface({
	status = tModule.union(tModule.literal("Disabled"), tModule.literal("Pending"), tModule.literal("Accepted"))
})
local var2 = tModule.interface({
	errors = tModule.array(tModule.interface({
		productId = tModule.integer,
		error = tModule.interface({
			errorCode = tModule.optional(tModule.string),
			errorMessage = tModule.optional(tModule.string),
			field = tModule.optional(tModule.string),
			hint = tModule.optional(tModule.string)
		})
	}))
})
local var3 = tModule.interface({
	shopId = tModule.integer,
	status = tModule.union(tModule.literal("Draft"), tModule.literal("Active"))
})
local var4 = tModule.interface({
	shops = tModule.array(tModule.interface({
		shopId = tModule.integer,
		entryPoints = tModule.array(tModule.interface({ name = tModule.string, isEnabled = tModule.boolean }))
	}))
})
local var5 = tModule.interface({ createdCategories = tModule.array(tModule.table) })
local var6 = tModule.interface({ monetizeExperience = tModule.boolean })
local var7 = tModule.interface({
	status = tModule.union(tModule.literal("Invalid"), tModule.literal("NotMigrated"), tModule.literal("Migrating"), tModule.literal("Migrated"))
})
local var8 = tModule.interface({
	permissions = tModule.optional(tModule.map(tModule.string, tModule.boolean))
})

local function _(p1, p2, p3)
	local var9, var10 = p2(p3)
	assert(var9, `Invalid {p1} response: {tostring(var10)}`)
	
	return p3
end

local function decodeManagedPricingResponse(p1)
	-- upvalues: var1 (ref)
	local var9, var10 = var1(p1)
	assert(var9, `Invalid Managed Pricing response: {tostring(var10)}`)
	
	return p1
end

local function decodeBulkDeveloperProductUpdateResponse(p1)
	-- upvalues: var2 (ref)
	local var9, var10 = var2(p1)
	assert(var9, `Invalid bulk developer product update response: {tostring(var10)}`)
	
	return p1
end

local function decodeCreatedShop(p1)
	-- upvalues: var3 (ref)
	local var9, var10 = var3(p1)
	assert(var9, `Invalid created Shop response: {tostring(var10)}`)
	
	return p1
end

local function decodeShopListResponse(p1)
	-- upvalues: var4 (ref)
	local var9, var10 = var4(p1)
	assert(var9, `Invalid Shop list response: {tostring(var10)}`)
	
	return p1
end

local function decodeUniversePermissionResponse(p1)
	-- upvalues: var6 (ref)
	local var9, var10 = var6(p1)
	assert(var9, `Invalid universe permission response: {tostring(var10)}`)
	
	return { canMonetize = p1.monetizeExperience }
end

local function decodeGroupMigrationResponse(p1)
	-- upvalues: var7 (ref)
	local var9, var10 = var7(p1)
	assert(var9, `Invalid group migration response: {tostring(var10)}`)
	
	return p1
end

local function decodeGroupPermissionResponse(p1)
	-- upvalues: var8 (ref)
	local var9, var10 = var8(p1)
	assert(var9, `Invalid group permission response: {tostring(var10)}`)
	
	return {
		canMonetize = p1.permissions ~= nil and p1.permissions.canMonetize == true
	}
end

local function decodeBatchUpdateShopItemsResponse(p1)
	-- upvalues: var5 (ref)
	local var9, var10 = var5(p1)
	assert(var9, `Invalid Shop item update response: {tostring(var10)}`)
	
	return p1
end

local function decodeEmptyResponse(_)
	return nil
end

local _ = function(p1)
	-- upvalues: urlBase (ref)
	return (p1 or {}).baseUrl or urlBase.APIS
end

local _ = function(p1)
	return {
		request = function(p2, p3)
			-- upvalues: p1 (ref)
			local var9 = nil
			
			if p2.headers ~= nil then
				local t = {}
				
				for i, v in p2.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var9 = t
			end
			return p1.request({
				url = p2.url,
				method = p2.method,
				headers = var9,
				body = p2.body,
				onMessage = p2.onMessage,
				priority = p2.priority
			}, p3)
		end
	}
end

local _ = function(p2)
	-- upvalues: httpClientModule (ref)
	p2 = p2 or {}
	local readNetwork = p2.readNetwork or p2.network
	
	if readNetwork == nil then
		local var9 = httpClientModule.createRequestInternalNetwork()
		
		return {
			request = function(p3, p4)
				-- upvalues: var9 (ref)
				local var10 = nil
				
				if p3.headers ~= nil then
					local t = {}
					
					for i, v in p3.headers do
						if string.lower(i) ~= "accept" then
							t[i] = v
						end
					end
					var10 = t
				end
				return var9.request({
					url = p3.url,
					method = p3.method,
					headers = var10,
					body = p3.body,
					onMessage = p3.onMessage,
					priority = p3.priority
				}, p4)
			end
		}
	end
	return {
		request = function(p3, p4)
			-- upvalues: readNetwork (ref)
			local var10 = nil
			
			if p3.headers ~= nil then
				local t = {}
				
				for i, v in p3.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var10 = t
			end
			return readNetwork.request({
				url = p3.url,
				method = p3.method,
				headers = var10,
				body = p3.body,
				onMessage = p3.onMessage,
				priority = p3.priority
			}, p4)
		end
	}
end

local function mutationNetwork(p3)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	p3 = p3 or {}
	local mutatingNetwork = p3.mutatingNetwork or p3.network
	
	if mutatingNetwork == nil then
		local var10 = httpClientModule.createRequestInternalNetwork()
		
		return withCsrfRetryModule({
			request = function(p4, p5)
				-- upvalues: var10 (ref)
				local var11 = nil
				
				if p4.headers ~= nil then
					local t = {}
					
					for i, v in p4.headers do
						if string.lower(i) ~= "accept" then
							t[i] = v
						end
					end
					var11 = t
				end
				return var10.request({
					url = p4.url,
					method = p4.method,
					headers = var11,
					body = p4.body,
					onMessage = p4.onMessage,
					priority = p4.priority
				}, p5)
			end
		})
	end
	return {
		request = function(p4, p5)
			-- upvalues: mutatingNetwork (ref)
			local var11 = nil
			
			if p4.headers ~= nil then
				local t = {}
				
				for i, v in p4.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var11 = t
			end
			return mutatingNetwork.request({
				url = p4.url,
				method = p4.method,
				headers = var11,
				body = p4.body,
				onMessage = p4.onMessage,
				priority = p4.priority
			}, p5)
		end
	}
end

local function get(p4, p5, p6, p7)
	-- upvalues: httpClientModule (ref)
	local t_1
	local asPromise = httpClientModule.asPromise
	local fetch = httpClientModule.fetch
	local t = { method = "GET" }
	p6 = p6 or {}
	local readNetwork = p6.readNetwork or p6.network
	
	if readNetwork == nil then
		local var11 = httpClientModule.createRequestInternalNetwork()
		t_1 = {
			request = function(p8, p9)
				-- upvalues: var11 (ref)
				local var12 = nil
				
				if p8.headers ~= nil then
					local t = {}
					
					for i, v in p8.headers do
						if string.lower(i) ~= "accept" then
							t[i] = v
						end
					end
					var12 = t
				end
				return var11.request({
					url = p8.url,
					method = p8.method,
					headers = var12,
					body = p8.body,
					onMessage = p8.onMessage,
					priority = p8.priority
				}, p9)
			end
		}
	else
		t_1 = {
			request = function(p10, p11)
				-- upvalues: readNetwork (ref)
				local var13 = nil
				
				if p10.headers ~= nil then
					local t = {}
					
					for i, v in p10.headers do
						if string.lower(i) ~= "accept" then
							t[i] = v
						end
					end
					var13 = t
				end
				return readNetwork.request({
					url = p10.url,
					method = p10.method,
					headers = var13,
					body = p10.body,
					onMessage = p10.onMessage,
					priority = p10.priority
				}, p11)
			end
		}
	end
	t.network = t_1
	t.url = p4
	t.analyticsKey = p5
	t.decode = p7
	
	return asPromise(fetch(t))
end

local function mutate(p8, p9, p10, p11, p12, p13)
	-- upvalues: httpClientModule (ref), mutationNetwork (ref)
	return httpClientModule.asPromise(httpClientModule.fetch({
		network = mutationNetwork(p12),
		method = p8,
		url = p9,
		body = p10,
		analyticsKey = p11,
		decode = p13
	}))
end

return {
	getManagedPricing = function(p8, p9)
		-- upvalues: urlBase (ref), get (ref), decodeManagedPricingResponse (ref)
		return get(("%s/price-configuration-api/v1/universes/%d/managed-pricing"):format((p9 or {}).baseUrl or urlBase.APIS, p8), "monetization-options.managed-pricing.get", p9, decodeManagedPricingResponse)
	end,
	acceptManagedPricing = function(p8, p9)
		-- upvalues: urlBase (ref), mutate (ref), decodeEmptyResponse (ref)
		return mutate("POST", ("%s/price-configuration-api/v1/universes/%d/managed-pricing:accept"):format((p9 or {}).baseUrl or urlBase.APIS, p8), nil, "monetization-options.managed-pricing.accept", p9, decodeEmptyResponse)
	end,
	updateDeveloperProductsManagedPricing = function(p8, p9, p10, p11)
		-- upvalues: urlBase (ref), promiseModule (ref), mutate (ref), decodeBulkDeveloperProductUpdateResponse (ref)
		local baseUrl = (p11 or {}).baseUrl or urlBase.APIS
		local t = {}
		local var12 = 1
		
		local function updateNextBatch()
			-- upvalues: var12 (write), p9 (ref), p10 (ref), promiseModule (copy), t (ref), mutate (copy), baseUrl (ref), p8 (ref), p11 (ref), decodeBulkDeveloperProductUpdateResponse (copy), updateNextBatch (ref)
			local t_1 = {}
			
			for i = var12, math.min(var12 + 29, #p9) do
				table.insert(t_1, {
					productId = p9[i],
					changedProperties = { isManagedPricingEnabled = p10 }
				})
			end
			if #t_1 == 0 then
				return promiseModule.resolve({ errors = t })
			end
			var12 += #t_1
			
			return mutate("PATCH", ("%s/developer-products/v1/universes/%d/developer-products"):format(baseUrl, p8), { developerProductUpdates = t_1 }, "monetization-options.managed-pricing.update-products", p11, decodeBulkDeveloperProductUpdateResponse):andThen(function(p12)
				-- upvalues: t (copy), updateNextBatch (copy)
				for i, v in p12.errors or {} do
					table.insert(t, v)
				end
				return updateNextBatch()
			end)
		end
		
		return updateNextBatch()
	end,
	listShops = function(p12, p13)
		-- upvalues: urlBase (ref), urlBuilderModule (ref), get (ref), decodeShopListResponse (ref)
		return get(urlBuilderModule.UrlBuilder.addQueryString(("%s/shops-api/v1/shops"):format((p13 or {}).baseUrl or urlBase.APIS), {
			["scope.type"] = "Universe",
			["scope.scopeId"] = tostring(p12)
		}), "monetization-options.shops.list", p13, decodeShopListResponse)
	end,
	createShop = function(p12, p13, p14)
		-- upvalues: urlBase (ref), mutate (ref), decodeCreatedShop (ref)
		return mutate("POST", ("%s/shops-api/v1/shops"):format((p14 or {}).baseUrl or urlBase.APIS), {
			scope = { type = "Universe", scopeId = tostring(p12) },
			entryPoints = {
				{ name = "InExperienceGlobalIconEnabled", isEnabled = p13 }
			}
		}, "monetization-options.shops.create", p14, decodeCreatedShop)
	end,
	setShopGlobalIcon = function(value, p12, p13)
		-- upvalues: urlBase (ref), mutate (ref), decodeBatchUpdateShopItemsResponse (ref)
		return mutate("PATCH", ("%s/shops-api/v1/shops/%d/items"):format((p13 or {}).baseUrl or urlBase.APIS, value), {
			changedEntryPoints = {
				{ name = "InExperienceGlobalIconEnabled", isEnabled = p12 }
			}
		}, "monetization-options.shops.update-global-icon", p13, decodeBatchUpdateShopItemsResponse)
	end,
	getMonetizationPermission = function(p12, p13, p14, p15)
		-- upvalues: urlBase (ref), get (ref), decodeUniversePermissionResponse (ref), httpModule (ref), decodeGroupMigrationResponse (ref), httpClientModule (ref), promiseModule (ref), decodeGroupPermissionResponse (ref)
		local baseUrl = (p15 or {}).baseUrl or urlBase.APIS
		
		if p13 ~= "Group" or p14 == nil then
			return get(("%s/orgs/v2/universes/%d/permissions/resolved"):format(baseUrl, p12), "monetization-options.permission.universe", p15, decodeUniversePermissionResponse)
		end
		local t_1
		local var13 = if p15 then p15.groupsBaseUrl else httpModule.Url.GROUPS_URL
		
		local function getLegacyPermission()
			-- upvalues: get (copy), baseUrl (ref), p12 (ref), p15 (ref), decodeUniversePermissionResponse (copy)
			return get(("%s/orgs/v2/universes/%d/permissions/resolved"):format(baseUrl, p12), "monetization-options.permission.universe", p15, decodeUniversePermissionResponse)
		end
		
		local var14 = ("%sv1/groups/%d/migration"):format(var13, p14)
		local asPromise = httpClientModule.asPromise
		local fetch = httpClientModule.fetch
		local t = {
			method = "GET",
			analyticsKey = "monetization-options.permission.group-migration"
		}
		p15 = p15 or {}
		local readNetwork = p15.readNetwork or p15.network
		
		if readNetwork == nil then
			local var15 = httpClientModule.createRequestInternalNetwork()
			t_1 = {
				request = function(p16, p17)
					-- upvalues: var15 (ref)
					local var16 = nil
					
					if p16.headers ~= nil then
						local t = {}
						
						for i, v in p16.headers do
							if string.lower(i) ~= "accept" then
								t[i] = v
							end
						end
						var16 = t
					end
					return var15.request({
						url = p16.url,
						method = p16.method,
						headers = var16,
						body = p16.body,
						onMessage = p16.onMessage,
						priority = p16.priority
					}, p17)
				end
			}
		else
			t_1 = {
				request = function(p18, p19)
					-- upvalues: readNetwork (ref)
					local var17 = nil
					
					if p18.headers ~= nil then
						local t = {}
						
						for i, v in p18.headers do
							if string.lower(i) ~= "accept" then
								t[i] = v
							end
						end
						var17 = t
					end
					return readNetwork.request({
						url = p18.url,
						method = p18.method,
						headers = var17,
						body = p18.body,
						onMessage = p18.onMessage,
						priority = p18.priority
					}, p19)
				end
			}
		end
		t.network = t_1
		t.url = var14
		t.decode = decodeGroupMigrationResponse
		
		return asPromise(fetch(t)):catch(function(p18)
			-- upvalues: promiseModule (copy)
			return if type(p18) == "table" and p18.responseCode == 409 then { status = "NotMigrated" } else promiseModule.reject(p18)
		end):andThen(function(p18)
			-- upvalues: getLegacyPermission (ref), get (copy), var13 (ref), p14 (ref), p12 (ref), p15 (ref), decodeGroupPermissionResponse (copy)
			return if p18.status == "Migrated" then get(("%sv2/groups/%d/universes/%d/permissions/resolved"):format(var13, p14, p12), "monetization-options.permission.group", p15, decodeGroupPermissionResponse) else getLegacyPermission()
		end)
	end
}