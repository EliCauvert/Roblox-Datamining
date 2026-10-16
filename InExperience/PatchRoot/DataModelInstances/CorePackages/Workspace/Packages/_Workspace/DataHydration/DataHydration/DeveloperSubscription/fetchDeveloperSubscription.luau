local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreatorApiHttpModule = require(DataHydration.creatorApiHttp)
local _ = require(script.Parent.DeveloperSubscriptionTypes)

local function collectionUrl(BaseUrlResult, p1): string --[[ Line: 50 ]]
	return ("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(BaseUrlResult, p1)
end

local function subscriptionUrl(BaseUrlResult, p1, Id): string --[[ Line: 54 ]]
	return ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(BaseUrlResult, p1), Id)
end

local function _(Tbl) --[[ Line: 58 | Named "normalize" ]]
	local Copy = table.clone(Tbl)
	
	if Copy.productType == nil and Copy.developerSubscriptionProductType ~= nil then
		Copy.productType = Copy.developerSubscriptionProductType
		Copy.developerSubscriptionProductType = nil
	end
	assert(typeof(Copy.id) == "string" and Copy.id ~= "", "Invalid Developer Subscription ID")
	
	return Copy
end

local _ = function(p1) --[[ Line: 71 | Named "successDecoder" ]]
	-- upvalues: CreatorApiHttpModule (copy)
	local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p2) --[[ Line: 74 ]]
		return p2
	end)
	
	return function(p2) --[[ Line: 77 ]]
		-- upvalues: JsonDecoderResult (copy), p1 (copy)
		local v1, v2, v3 = JsonDecoderResult(p2)
		
		if v2 == nil then
			assert(typeof(v1.success) == "boolean", "Invalid Developer Subscription mutation success")
			
			return {
				success = v1.success,
				responseCode = p2.statusCode,
				failureReason = v1.failureReason,
				subscription = if v1.success then p1() else nil
			}, nil, nil
		else
			return nil, v2, v3
		end
	end
end

local _ = function(Id) --[[ Line: 95 | Named "imageSuccessDecoder" ]]
	-- upvalues: CreatorApiHttpModule (copy)
	local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p1) --[[ Line: 98 ]]
		return p1
	end)
	
	return function(p1) --[[ Line: 101 ]]
		-- upvalues: JsonDecoderResult (copy), Id (copy)
		local v1, v2, v3 = JsonDecoderResult(p1)
		
		if v2 == nil then
			assert(typeof(v1) == "table", "Invalid Developer Subscription image upload response")
			assert(typeof(v1.status) == "boolean", "Invalid Developer Subscription image upload status")
			
			return {
				success = v1.status,
				responseCode = p1.statusCode,
				subscription = if v1.status then { id = Id } else nil
			}, nil, nil
		else
			return nil, v2, v3
		end
	end
end

local function v9(p1) --[[ Line: 119 ]]
	-- upvalues: CreatorApiHttpModule (copy)
	local v1, v2, v3 = CreatorApiHttpModule.jsonDecoder(function(p2) --[[ Line: 120 ]]
		return p2
	end)(p1)
	
	if v2 ~= nil then
		return nil, v2, v3
	end
	if v1.success == false then
		return {
			success = false,
			responseCode = p1.statusCode,
			failureReason = v1.failureReason
		}, nil, nil
	end
	local config = { success = true, responseCode = p1.statusCode }
	local Copy = table.clone(v1.developerSubscription)
	
	if Copy.productType == nil and Copy.developerSubscriptionProductType ~= nil then
		Copy.productType = Copy.developerSubscriptionProductType
		Copy.developerSubscriptionProductType = nil
	end
	assert(typeof(Copy.id) == "string" and Copy.id ~= "", "Invalid Developer Subscription ID")
	config.subscription = Copy
	
	return config, nil, nil
end

local function listPage(UniverseId, Cursor, p1) --[[ Line: 177 ]]
	-- upvalues: CreatorApiHttpModule (copy)
	return CreatorApiHttpModule.get(p1, CreatorApiHttpModule.withQuery(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(CreatorApiHttpModule.baseUrl(p1), UniverseId), { resultsPerPage = "50", cursor = Cursor }), "developer-subscription.list", function(p2) --[[ Line: 182 ]]
		return {
			developerSubscriptions = p2.developerSubscriptions or {},
			nextCursor = p2.nextCursor,
			hasMoreResults = p2.hasMoreResults == true
		}
	end)
end

return {
	getPermission = function(p1, p2) --[[ Line: 147 ]]
		-- upvalues: CreatorApiHttpModule (copy), collectionUrl (copy)
		return CreatorApiHttpModule.get(p2, ("%s/permission"):format(collectionUrl(CreatorApiHttpModule.baseUrl(p2), p1)), "developer-subscription.permission", function(p3) --[[ Line: 155 ]]
			return { canEdit = p3.canUserEditExperienceSubscription == true }
		end)
	end,
	getPrices = function(p1, p2) --[[ Line: 162 ]]
		-- upvalues: CreatorApiHttpModule (copy), collectionUrl (copy)
		return CreatorApiHttpModule.get(p2, ("%s/prices"):format(collectionUrl(CreatorApiHttpModule.baseUrl(p2), p1)), "developer-subscription.prices", function(p3) --[[ Line: 170 ]]
			return { priceTierPrices = p3.priceTierPrices or {} }
		end)
	end,
	list = function(UniverseId, p1) --[[ Line: 192 ]]
		-- upvalues: listPage (copy), PromiseModule (copy)
		local DeveloperSubscriptions = {}
		local t = {}
		local t1 = {}
		
		local function fetchNext(Cursor, p2) --[[ Line: 200 ]]
			-- upvalues: listPage (upval), UniverseId (copy), p1 (copy), t1 (copy), DeveloperSubscriptions (copy), PromiseModule (upval), t (copy), fetchNext (copy)
			return listPage(UniverseId, Cursor, p1):andThen(function(Result) --[[ Line: 201 ]]
				-- upvalues: UniverseId (upval), t1 (upval), DeveloperSubscriptions (upval), PromiseModule (upval), t (upval), p2 (copy), fetchNext (upval)
				for _, developerSubscription in Result.developerSubscriptions do
					local Copy = table.clone(developerSubscription)
					
					if Copy.productType == nil and Copy.developerSubscriptionProductType ~= nil then
						Copy.productType = Copy.developerSubscriptionProductType
						Copy.developerSubscriptionProductType = nil
					end
					assert(typeof(Copy.id) == "string" and Copy.id ~= "", "Invalid Developer Subscription ID")
					assert(Copy.universeId == nil or Copy.universeId == UniverseId, "Developer Subscription list contains an item from another universe")
					assert(not t1[Copy.id], "Developer Subscription list contains a duplicate ID")
					t1[Copy.id] = true
					table.insert(DeveloperSubscriptions, Copy)
				end
				local NextCursor = Result.nextCursor
				
				if not Result.hasMoreResults then
					return { developerSubscriptions = DeveloperSubscriptions }
				elseif NextCursor == nil or NextCursor == "" then
					return PromiseModule.reject({
						code = "IncompleteDeveloperSubscriptionList",
						message = "The service reported another page without a cursor",
						developerSubscriptions = DeveloperSubscriptions
					})
				elseif t[NextCursor] or p2 >= 50 then
					return PromiseModule.reject({
						code = "IncompleteDeveloperSubscriptionList",
						message = if t[NextCursor] then "Repeated cursor" else "Page limit reached",
						developerSubscriptions = DeveloperSubscriptions,
						nextCursor = NextCursor
					})
				else
					t[NextCursor] = true
					
					return fetchNext(NextCursor, p2 + 1)
				end
			end)
		end
		
		return fetchNext(nil, 1)
	end,
	get = function(UniverseId, PermissionName, p2) --[[ Line: 244 ]]
		-- upvalues: CreatorApiHttpModule (copy)
		return CreatorApiHttpModule.get(p2, ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(CreatorApiHttpModule.baseUrl(p2), UniverseId), PermissionName), "developer-subscription.get", function(Tbl) --[[ Line: 253 ]]
			-- upvalues: PermissionName (copy), UniverseId (copy)
			local Copy = table.clone(Tbl)
			
			if Copy.productType == nil and Copy.developerSubscriptionProductType ~= nil then
				Copy.productType = Copy.developerSubscriptionProductType
				Copy.developerSubscriptionProductType = nil
			end
			assert(typeof(Copy.id) == "string" and Copy.id ~= "", "Invalid Developer Subscription ID")
			assert(Copy.id == PermissionName, "Developer Subscription response ID does not match the requested ID")
			assert(Copy.universeId == nil or Copy.universeId == UniverseId, "Developer Subscription response universe does not match the requested universe")
			
			return Copy
		end)
	end,
	create = function(p2, p3, p4) --[[ Line: 269 ]]
		-- upvalues: CreatorApiHttpModule (copy), v9 (copy)
		return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork(p4), "POST", ("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(CreatorApiHttpModule.baseUrl(p4), p2), {
			productName = p3.name,
			productDescription = p3.description,
			productType = p3.productType,
			basePriceId = p3.basePriceId,
			currencyType = p3.currencyType,
			priceInRobux = p3.priceInRobux,
			isRegionalPricingEnabled = p3.isRegionalPricingEnabled
		}, "developer-subscription.create", v9)
	end,
	update = function(p2, Id, p3, p4) --[[ Line: 292 ]]
		-- upvalues: CreatorApiHttpModule (copy)
		local function v32() --[[ Line: 311 ]]
			-- upvalues: Id (copy), p3 (copy)
			return {
				id = Id,
				description = p3.description,
				imageAssetId = p3.imageAssetId,
				basePriceId = p3.basePriceId,
				priceInRobux = p3.priceInRobux
			}
		end
		
		local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p5) --[[ Line: 74 ]]
			return p5
		end)
		
		return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork(p4), "PATCH", ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(CreatorApiHttpModule.baseUrl(p4), p2), Id), {
			description = p3.description,
			imageAssetId = p3.imageAssetId,
			basePriceId = p3.basePriceId,
			currencyType = p3.currencyType,
			priceInRobux = p3.priceInRobux,
			isRegionalPricingEnabled = p3.isRegionalPricingEnabled
		}, "developer-subscription.update", function(p5) --[[ Line: 77 ]]
			-- upvalues: JsonDecoderResult (copy), v32 (copy)
			local v1, v2, v3 = JsonDecoderResult(p5)
			
			if v2 == nil then
				assert(typeof(v1.success) == "boolean", "Invalid Developer Subscription mutation success")
				
				return {
					success = v1.success,
					responseCode = p5.statusCode,
					failureReason = v1.failureReason,
					subscription = if v1.success then v32() else nil
				}, nil, nil
			else
				return nil, v2, v3
			end
		end)
	end,
	uploadImage = function(p2, Id, p3, p4, p5) --[[ Line: 323 ]]
		-- upvalues: CreatorApiHttpModule (copy), subscriptionUrl (copy)
		local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p6) --[[ Line: 98 ]]
			return p6
		end)
		
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p5), "POST", ("%s/upload-image"):format(subscriptionUrl(CreatorApiHttpModule.baseUrl(p5), p2, Id)), {
			{ name = "ActingUserId", value = tostring(p3) },
			CreatorApiHttpModule.imagePart(p4)
		}, "developer-subscription.upload-image", function(p6) --[[ Line: 101 ]]
			-- upvalues: JsonDecoderResult (copy), Id (copy)
			local v1, v2, v3 = JsonDecoderResult(p6)
			
			if v2 == nil then
				assert(typeof(v1) == "table", "Invalid Developer Subscription image upload response")
				assert(typeof(v1.status) == "boolean", "Invalid Developer Subscription image upload status")
				
				return {
					success = v1.status,
					responseCode = p6.statusCode,
					subscription = if v1.status then { id = Id } else nil
				}, nil, nil
			else
				return nil, v2, v3
			end
		end)
	end,
	activate = function(p2, Id, p3) --[[ Line: 340 ]]
		-- upvalues: CreatorApiHttpModule (copy), subscriptionUrl (copy)
		local function v35() --[[ Line: 351 ]]
			-- upvalues: Id (copy)
			return { id = Id }
		end
		
		local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p4) --[[ Line: 74 ]]
			return p4
		end)
		
		return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork(p3), "POST", ("%s/activate"):format(subscriptionUrl(CreatorApiHttpModule.baseUrl(p3), p2, Id)), nil, "developer-subscription.activate", function(p4) --[[ Line: 77 ]]
			-- upvalues: JsonDecoderResult (copy), v35 (copy)
			local v1, v2, v3 = JsonDecoderResult(p4)
			
			if v2 == nil then
				assert(typeof(v1.success) == "boolean", "Invalid Developer Subscription mutation success")
				
				return {
					success = v1.success,
					responseCode = p4.statusCode,
					failureReason = v1.failureReason,
					subscription = if v1.success then v35() else nil
				}, nil, nil
			else
				return nil, v2, v3
			end
		end)
	end,
	deactivate = function(p2, Id, p3, p4) --[[ Line: 357 ]]
		-- upvalues: CreatorApiHttpModule (copy), subscriptionUrl (copy)
		local function v37() --[[ Line: 373 ]]
			-- upvalues: Id (copy)
			return { id = Id }
		end
		
		local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p5) --[[ Line: 74 ]]
			return p5
		end)
		
		return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork(p4), "POST", CreatorApiHttpModule.withQuery(("%s/deactivate"):format(subscriptionUrl(CreatorApiHttpModule.baseUrl(p4), p2, Id)), { cancelRenewals = tostring(p3) }), nil, "developer-subscription.deactivate", function(p5) --[[ Line: 77 ]]
			-- upvalues: JsonDecoderResult (copy), v37 (copy)
			local v1, v2, v3 = JsonDecoderResult(p5)
			
			if v2 == nil then
				assert(typeof(v1.success) == "boolean", "Invalid Developer Subscription mutation success")
				
				return {
					success = v1.success,
					responseCode = p5.statusCode,
					failureReason = v1.failureReason,
					subscription = if v1.success then v37() else nil
				}, nil, nil
			else
				return nil, v2, v3
			end
		end)
	end,
	delete = function(p2, Id, p3) --[[ Line: 379 ]]
		-- upvalues: CreatorApiHttpModule (copy)
		local function v39() --[[ Line: 390 ]]
			-- upvalues: Id (copy)
			return { id = Id }
		end
		
		local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p4) --[[ Line: 74 ]]
			return p4
		end)
		
		return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork(p3), "DELETE", ("%s/%s"):format(("%s/experience-subscriptions/v1/experiences/%d/experience-subscriptions"):format(CreatorApiHttpModule.baseUrl(p3), p2), Id), nil, "developer-subscription.delete", function(p4) --[[ Line: 77 ]]
			-- upvalues: JsonDecoderResult (copy), v39 (copy)
			local v1, v2, v3 = JsonDecoderResult(p4)
			
			if v2 == nil then
				assert(typeof(v1.success) == "boolean", "Invalid Developer Subscription mutation success")
				
				return {
					success = v1.success,
					responseCode = p4.statusCode,
					failureReason = v1.failureReason,
					subscription = if v1.success then v39() else nil
				}, nil, nil
			else
				return nil, v2, v3
			end
		end)
	end
}