local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local creatorApiHttpModule = require(dataHydration.creatorApiHttp)
local _ = require(script.Parent.DeveloperSubscriptionTypes)

local function collectionUrl(p1, p2)
	return ("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(p1, p2)
end

local function subscriptionUrl(p1, p2, p3)
	return ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(p1, p2), p3)
end

local function _(p1)
	local cloned = table.clone(p1)
	
	if cloned.productType == nil and cloned.developerSubscriptionProductType ~= nil then
		cloned.productType = cloned.developerSubscriptionProductType
		cloned.developerSubscriptionProductType = nil
	end
	assert(typeof(cloned.id) == "string" and cloned.id ~= "", "Invalid Developer Subscription ID")
	
	return cloned
end

local _ = function(p1)
	-- upvalues: creatorApiHttpModule (ref)
	local var1 = creatorApiHttpModule.jsonDecoder(function(p2)
		return p2
	end)
	
	return function(p2)
		-- upvalues: var1 (ref), p1 (ref)
		local var2, var3, var4 = var1(p2)
		
		if var3 == nil then
			assert(typeof(var2.success) == "boolean", "Invalid Developer Subscription mutation success")
			
			return {
				success = var2.success,
				responseCode = p2.statusCode,
				failureReason = var2.failureReason,
				subscription = if var2.success then p1() else nil
			}, nil, nil
		end
		return nil, var3, var4
	end
end

local _ = function(p1)
	-- upvalues: creatorApiHttpModule (ref)
	local var1 = creatorApiHttpModule.jsonDecoder(function(p2)
		return p2
	end)
	
	return function(p2)
		-- upvalues: var1 (ref), p1 (ref)
		local var2, var3, var4 = var1(p2)
		
		if var3 == nil then
			assert(typeof(var2) == "table", "Invalid Developer Subscription image upload response")
			assert(typeof(var2.status) == "boolean", "Invalid Developer Subscription image upload status")
			
			return {
				success = var2.status,
				responseCode = p2.statusCode,
				subscription = if var2.status then { id = p1 } else nil
			}, nil, nil
		end
		return nil, var3, var4
	end
end

local var1 = function(p1)
	-- upvalues: creatorApiHttpModule (ref)
	local var2, var3, var4 = creatorApiHttpModule.jsonDecoder(function(p2)
		return p2
	end)(p1)
	
	if var3 ~= nil then
		return nil, var3, var4
	elseif var2.success == false then
		return {
			success = false,
			responseCode = p1.statusCode,
			failureReason = var2.failureReason
		}, nil, nil
	end
	local t = { success = true, responseCode = p1.statusCode }
	local cloned = table.clone(var2.developerSubscription)
	
	if cloned.productType == nil and cloned.developerSubscriptionProductType ~= nil then
		cloned.productType = cloned.developerSubscriptionProductType
		cloned.developerSubscriptionProductType = nil
	end
	assert(typeof(cloned.id) == "string" and cloned.id ~= "", "Invalid Developer Subscription ID")
	t.subscription = cloned
	
	return t, nil, nil
end

local t = {
	getPermission = function(p1, p2)
		-- upvalues: creatorApiHttpModule (ref), collectionUrl (ref)
		return creatorApiHttpModule.get(p2, ("%s/permission"):format(collectionUrl(creatorApiHttpModule.baseUrl(p2), p1)), "developer-subscription.permission", function(p3)
			return { canEdit = p3.canUserEditExperienceSubscription == true }
		end)
	end,
	getPrices = function(p1, p2)
		-- upvalues: creatorApiHttpModule (ref), collectionUrl (ref)
		return creatorApiHttpModule.get(p2, ("%s/prices"):format(collectionUrl(creatorApiHttpModule.baseUrl(p2), p1)), "developer-subscription.prices", function(p3)
			return { priceTierPrices = p3.priceTierPrices or {} }
		end)
	end
}

local function listPage(p1, p2, p3)
	-- upvalues: creatorApiHttpModule (ref)
	return creatorApiHttpModule.get(p3, creatorApiHttpModule.withQuery(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(creatorApiHttpModule.baseUrl(p3), p1), { resultsPerPage = "50", cursor = p2 }), "developer-subscription.list", function(p4)
		return {
			developerSubscriptions = p4.developerSubscriptions or {},
			nextCursor = p4.nextCursor,
			hasMoreResults = p4.hasMoreResults == true
		}
	end)
end

function t.list(p1, p2)
	-- upvalues: listPage (ref), promiseModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function fetchNext(p3, p4)
		-- upvalues: listPage (copy), p1 (ref), p2 (ref), t_2 (ref), t (ref), promiseModule (copy), t_1 (ref), fetchNext (ref)
		return listPage(p1, p3, p2):andThen(function(p5)
			-- upvalues: p1 (copy), t_2 (copy), t (copy), promiseModule (copy), t_1 (copy), p4 (ref), fetchNext (copy)
			for i, v in p5.developerSubscriptions do
				local cloned = table.clone(v)
				
				if cloned.productType == nil and cloned.developerSubscriptionProductType ~= nil then
					cloned.productType = cloned.developerSubscriptionProductType
					cloned.developerSubscriptionProductType = nil
				end
				assert(typeof(cloned.id) == "string" and cloned.id ~= "", "Invalid Developer Subscription ID")
				local var2 = cloned
				assert(if var2.universeId ~= nil then var2.universeId == p1 else true, "Developer Subscription list contains an item from another universe")
				assert(not t_2[var2.id], "Developer Subscription list contains a duplicate ID")
				t_2[var2.id] = true
				table.insert(t, var2)
			end
			local nextCursor = p5.nextCursor
			
			if not p5.hasMoreResults then
				return { developerSubscriptions = t }
			elseif nextCursor == nil or nextCursor == "" then
				return promiseModule.reject({
					code = "IncompleteDeveloperSubscriptionList",
					message = "The service reported another page without a cursor",
					developerSubscriptions = t
				})
			elseif t_1[nextCursor] or p4 >= 50 then
				return promiseModule.reject({
					code = "IncompleteDeveloperSubscriptionList",
					message = if t_1[nextCursor] then "Repeated cursor" else "Page limit reached",
					developerSubscriptions = t,
					nextCursor = nextCursor
				})
			end
			t_1[nextCursor] = true
			
			return fetchNext(nextCursor, p4 + 1)
		end)
	end
	
	return fetchNext(nil, 1)
end

function t.get(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref)
	return creatorApiHttpModule.get(p5, ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(creatorApiHttpModule.baseUrl(p5), p3), p4), "developer-subscription.get", function(p6)
		-- upvalues: p4 (ref), p3 (ref)
		local cloned = table.clone(p6)
		
		if cloned.productType == nil and cloned.developerSubscriptionProductType ~= nil then
			cloned.productType = cloned.developerSubscriptionProductType
			cloned.developerSubscriptionProductType = nil
		end
		assert(typeof(cloned.id) == "string" and cloned.id ~= "", "Invalid Developer Subscription ID")
		assert(cloned.id == p4, "Developer Subscription response ID does not match the requested ID")
		assert(if cloned.universeId ~= nil then cloned.universeId == p3 else true, "Developer Subscription response universe does not match the requested universe")
		
		return cloned
	end)
end

function t.create(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref), var1 (ref)
	return creatorApiHttpModule.json(creatorApiHttpModule.mutatingNetwork(p5), "POST", ("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(creatorApiHttpModule.baseUrl(p5), p3), {
		productName = p4.name,
		productDescription = p4.description,
		productType = p4.productType,
		basePriceId = p4.basePriceId,
		currencyType = p4.currencyType,
		priceInRobux = p4.priceInRobux,
		isRegionalPricingEnabled = p4.isRegionalPricingEnabled
	}, "developer-subscription.create", var1)
end

function t.update(p3, p4, p5, p6)
	-- upvalues: creatorApiHttpModule (ref)
	local json = creatorApiHttpModule.json
	local var2 = creatorApiHttpModule.mutatingNetwork(p6)
	local var3 = "PATCH"
	local var4 = ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(creatorApiHttpModule.baseUrl(p6), p3), p4)
	local t = {
		description = p5.description,
		imageAssetId = p5.imageAssetId,
		basePriceId = p5.basePriceId,
		currencyType = p5.currencyType,
		priceInRobux = p5.priceInRobux,
		isRegionalPricingEnabled = p5.isRegionalPricingEnabled
	}
	local var5 = "developer-subscription.update"
	
	local var6 = function()
		-- upvalues: p4 (ref), p5 (ref)
		return {
			id = p4,
			description = p5.description,
			imageAssetId = p5.imageAssetId,
			basePriceId = p5.basePriceId,
			priceInRobux = p5.priceInRobux
		}
	end
	
	local var7 = creatorApiHttpModule.jsonDecoder(function(p7)
		return p7
	end)
	
	return json(var2, var3, var4, t, var5, function(p7)
		-- upvalues: var7 (ref), var6 (ref)
		local var8, var9, var10 = var7(p7)
		
		if var9 == nil then
			assert(typeof(var8.success) == "boolean", "Invalid Developer Subscription mutation success")
			
			return {
				success = var8.success,
				responseCode = p7.statusCode,
				failureReason = var8.failureReason,
				subscription = if var8.success then var6() else nil
			}, nil, nil
		end
		return nil, var9, var10
	end)
end

function t.uploadImage(p3, p4, p5, p6, p7)
	-- upvalues: creatorApiHttpModule (ref), subscriptionUrl (ref)
	local var2 = creatorApiHttpModule.jsonDecoder(function(p8)
		return p8
	end)
	
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p7), "POST", ("%s/upload-image"):format(subscriptionUrl(creatorApiHttpModule.baseUrl(p7), p3, p4)), {
		{ name = "ActingUserId", value = tostring(p5) },
		creatorApiHttpModule.imagePart(p6)
	}, "developer-subscription.upload-image", function(p8)
		-- upvalues: var2 (ref), p4 (ref)
		local var3, var4, var5 = var2(p8)
		
		if var4 == nil then
			assert(typeof(var3) == "table", "Invalid Developer Subscription image upload response")
			assert(typeof(var3.status) == "boolean", "Invalid Developer Subscription image upload status")
			
			return {
				success = var3.status,
				responseCode = p8.statusCode,
				subscription = if var3.status then { id = p4 } else nil
			}, nil, nil
		end
		return nil, var4, var5
	end)
end

function t.activate(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref), subscriptionUrl (ref)
	local json = creatorApiHttpModule.json
	local var2 = creatorApiHttpModule.mutatingNetwork(p5)
	local var3 = "POST"
	local var4 = ("%s/activate"):format(subscriptionUrl(creatorApiHttpModule.baseUrl(p5), p3, p4))
	local var5 = nil
	local var6 = "developer-subscription.activate"
	
	local var7 = function()
		-- upvalues: p4 (ref)
		return { id = p4 }
	end
	
	local var8 = creatorApiHttpModule.jsonDecoder(function(p6)
		return p6
	end)
	
	return json(var2, var3, var4, var5, var6, function(p6)
		-- upvalues: var8 (ref), var7 (ref)
		local var9, var10, var11 = var8(p6)
		
		if var10 == nil then
			assert(typeof(var9.success) == "boolean", "Invalid Developer Subscription mutation success")
			
			return {
				success = var9.success,
				responseCode = p6.statusCode,
				failureReason = var9.failureReason,
				subscription = if var9.success then var7() else nil
			}, nil, nil
		end
		return nil, var10, var11
	end)
end

function t.deactivate(p3, p4, p5, p6)
	-- upvalues: creatorApiHttpModule (ref), subscriptionUrl (ref)
	local var2 = creatorApiHttpModule.withQuery(("%s/deactivate"):format(subscriptionUrl(creatorApiHttpModule.baseUrl(p6), p3, p4)), { cancelRenewals = tostring(p5) })
	local json = creatorApiHttpModule.json
	local var3 = creatorApiHttpModule.mutatingNetwork(p6)
	local var4 = "POST"
	local var5 = nil
	local var6 = "developer-subscription.deactivate"
	
	local var7 = function()
		-- upvalues: p4 (ref)
		return { id = p4 }
	end
	
	local var8 = creatorApiHttpModule.jsonDecoder(function(p7)
		return p7
	end)
	
	return json(var3, var4, var2, var5, var6, function(p7)
		-- upvalues: var8 (ref), var7 (ref)
		local var9, var10, var11 = var8(p7)
		
		if var10 == nil then
			assert(typeof(var9.success) == "boolean", "Invalid Developer Subscription mutation success")
			
			return {
				success = var9.success,
				responseCode = p7.statusCode,
				failureReason = var9.failureReason,
				subscription = if var9.success then var7() else nil
			}, nil, nil
		end
		return nil, var10, var11
	end)
end

function t.delete(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref)
	local json = creatorApiHttpModule.json
	local var2 = creatorApiHttpModule.mutatingNetwork(p5)
	local var3 = "DELETE"
	local var4 = ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(creatorApiHttpModule.baseUrl(p5), p3), p4)
	local var5 = nil
	local var6 = "developer-subscription.delete"
	
	local var7 = function()
		-- upvalues: p4 (ref)
		return { id = p4 }
	end
	
	local var8 = creatorApiHttpModule.jsonDecoder(function(p6)
		return p6
	end)
	
	return json(var2, var3, var4, var5, var6, function(p6)
		-- upvalues: var8 (ref), var7 (ref)
		local var9, var10, var11 = var8(p6)
		
		if var10 == nil then
			assert(typeof(var9.success) == "boolean", "Invalid Developer Subscription mutation success")
			
			return {
				success = var9.success,
				responseCode = p6.statusCode,
				failureReason = var9.failureReason,
				subscription = if var9.success then var7() else nil
			}, nil, nil
		end
		return nil, var10, var11
	end)
end

return t