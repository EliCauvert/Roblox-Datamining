local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local statusCodes = require(parent.Http).StatusCodes
local promiseModule = require(parent.Promise)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(dataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)
local dataHydrationUtilsModule = require(dataHydration.DataHydrationUtils)
local fetchDeveloperSubscriptionModule = require(script.Parent.fetchDeveloperSubscription)
local developerSubscriptionTypesModule = require(script.Parent.DeveloperSubscriptionTypes)
local frozen = table.freeze({
	errorMessage = "The local user changed while the Developer Subscription request was running"
})

return function(p1)
	-- upvalues: dataHydrationUtilsModule (ref), fetchDeveloperSubscriptionModule (ref), fFlagDataHydrationPreserveIncompleteCatalogResultsModule (ref), promiseModule (ref), createSingleEntityResolverModule (ref), frozen (ref), statusCodes (ref), developerSubscriptionTypesModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local getLocalPlayerUserId = p1.getLocalPlayerUserId or dataHydrationUtilsModule.getLocalPlayerUserId
	local observeLocalPlayerUserId = p1.observeLocalPlayerUserId or dataHydrationUtilsModule.observeLocalPlayerUserId
	local var1 = 0
	local var2 = false
	local var3 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchDeveloperSubscriptionModule (copy), t (ref), fFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), promiseModule (copy)
		local var4 = fetchDeveloperSubscriptionModule.list(p2, t)
		
		return if fFlagDataHydrationPreserveIncompleteCatalogResultsModule then var4:catch(function(p3)
			-- upvalues: promiseModule (copy)
			return if typeof(p3) == "table" and p3.code == "IncompleteDeveloperSubscriptionList" then {
				isIncomplete = true,
				developerSubscriptions = p3.developerSubscriptions,
				nextCursor = p3.nextCursor
			} else promiseModule.reject(p3)
		end) else var4
	end, {
		cache = if fFlagDataHydrationPreserveIncompleteCatalogResultsModule then {
			ttlSecondsForItem = function(p2)
				return if p2.isIncomplete then 60 else nil
			end
		} else nil,
		resolver = { replaceItems = true }
	})
	local var4 = observeLocalPlayerUserId(function()
		-- upvalues: var1 (write)
		var1 += 1
	end)
	
	local function list(p2)
		-- upvalues: fetchDeveloperSubscriptionModule (copy), t (ref)
		return fetchDeveloperSubscriptionModule.list(p2, t)
	end
	
	local function get(p2, p3)
		-- upvalues: fetchDeveloperSubscriptionModule (copy), t (ref)
		return fetchDeveloperSubscriptionModule.get(p2, p3, t)
	end
	
	local function _(p2, p3, p4, p5)
		return {
			outcome = "unverified",
			errorMessage = `The Developer Subscription request could not be confirmed: {p3}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
			subscription = p4 or (if p2 ~= nil then nil else { id = p2 }),
			cause = p5
		}
	end
	
	local function failedError(p2, p3, p4)
		return {
			outcome = "failed",
			errorMessage = `The Developer Subscription request was rejected: {p3}.`,
			subscription = if p2 ~= nil then nil else { id = p2 },
			cause = p4
		}
	end
	
	local _ = function()
		-- upvalues: getLocalPlayerUserId (ref), var1 (write)
		local var5 = getLocalPlayerUserId()
		
		if var5 == nil then
			return nil, {
				outcome = "failed",
				errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
				subscription = nil,
				cause = nil
			}
		end
		return { generation = var1, userId = var5 }, nil
	end
	
	local _ = function(p2)
		-- upvalues: var2 (write), var1 (write), getLocalPlayerUserId (ref)
		return not var2 and (p2.generation == var1 and p2.userId == getLocalPlayerUserId())
	end
	
	local _ = function(p2)
		-- upvalues: var2 (write), var1 (write), getLocalPlayerUserId (ref), frozen (copy)
		return if not var2 and (p2.generation == var1 and p2.userId == getLocalPlayerUserId()) then nil else frozen
	end
	
	local _ = function(p2)
		-- upvalues: var2 (write), var3 (ref)
		if not var2 then
			var3.clear()
			var3.fetch(p2)
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: promiseModule (copy), failedError (ref), statusCodes (copy)
		return p2:andThen(function(p4)
			-- upvalues: promiseModule (copy), failedError (copy), p3 (ref)
			return if p4.success then assert(p4.subscription, "A successful Developer Subscription mutation must return its identity") else promiseModule.reject(failedError(p3, `the service returned failureReason {tostring(p4.failureReason)}`, p4))
		end, function(p4)
			-- upvalues: statusCodes (copy), promiseModule (copy), failedError (copy), p3 (ref)
			return if typeof(p4) == "table" and p4.responseCode ~= nil and (statusCodes.BAD_REQUEST <= p4.responseCode and p4.responseCode < statusCodes.INTERNAL_SERVER_ERROR) and p4.responseCode ~= statusCodes.REQUEST_TIMEOUT then promiseModule.reject(failedError(p3, p4.errorMessage or "the service rejected the write", p4)) else promiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the write outcome is unknown. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if p3 ~= nil then nil else { id = p3 },
				cause = p4
			})
		end)
	end
	
	local function verifyRead(p2, p3, p4, p5, p6)
		-- upvalues: var2 (write), var1 (write), getLocalPlayerUserId (ref), frozen (copy), promiseModule (copy)
		local var5 = if not (not var2 and (p2.generation == var1 and p2.userId == getLocalPlayerUserId())) then frozen else nil
		
		return if var5 == nil then p3():andThen(function(p7)
			-- upvalues: p2 (ref), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), frozen (copy), promiseModule (copy), p6 (ref), p4 (ref), p5 (ref)
			local var6 = p2
			local var7 = if not (not var2 and (var6.generation == var1 and var6.userId == getLocalPlayerUserId())) then frozen else nil
			
			if var7 ~= nil then
				local var8 = p6
				
				return promiseModule.reject({
					outcome = "unverified",
					errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
					subscription = if var8 ~= nil then nil else { id = var8 },
					cause = var7
				})
			end
			return if p4(p7) then p7 else promiseModule.reject({
				outcome = "unverified",
				cause = nil,
				errorMessage = `The Developer Subscription request could not be confirmed: {p5}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = p7 or (if p6 ~= nil then nil else { id = p6 })
			})
		end, function(p7)
			-- upvalues: frozen (copy), p2 (ref), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), promiseModule (copy), p6 (ref), p5 (ref)
			if p7 ~= frozen then
				local var6 = p2
				
				if (if not (not var2 and (var6.generation == var1 and var6.userId == getLocalPlayerUserId())) then frozen else nil) == nil then
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = `The Developer Subscription request could not be confirmed: {p5}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = if p6 ~= nil then nil else { id = p6 },
						cause = p7
					})
				end
			end
			local var7 = p6
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if var7 ~= nil then nil else { id = var7 },
				cause = p7
			})
		end) else promiseModule.reject({
			outcome = "unverified",
			errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
			subscription = if p6 ~= nil then nil else { id = p6 },
			cause = var5
		})
	end
	
	local function tokenBoundGet(p2, p3, p4)
		-- upvalues: var2 (write), var1 (write), getLocalPlayerUserId (ref), frozen (copy), promiseModule (copy), fetchDeveloperSubscriptionModule (copy), t (ref)
		local var5 = if not (not var2 and (p2.generation == var1 and p2.userId == getLocalPlayerUserId())) then frozen else nil
		
		return if var5 == nil then fetchDeveloperSubscriptionModule.get(p3, p4, t):andThen(function(p5)
			-- upvalues: p2 (ref), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), frozen (copy), promiseModule (copy)
			local var6 = p2
			local var7 = if not (not var2 and (var6.generation == var1 and var6.userId == getLocalPlayerUserId())) then frozen else nil
			
			return if var7 == nil then p5 else promiseModule.reject(var7)
		end) else promiseModule.reject(var5)
	end
	
	local function withMutationPreflight(p2, p3, p4)
		-- upvalues: getLocalPlayerUserId (ref), var1 (write), promiseModule (copy), tokenBoundGet (ref), var2 (write), frozen (copy), failedError (ref)
		local t, t_1
		local var5 = getLocalPlayerUserId()
		
		if var5 == nil then
			t = nil
			t_1 = {
				outcome = "failed",
				errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
				subscription = nil,
				cause = nil
			}
		else
			t = { generation = var1, userId = var5 }
			t_1 = nil
		end
		return if t == nil then promiseModule.reject(t_1) else tokenBoundGet(t, p2, p3):andThen(function(p5)
			-- upvalues: t (ref), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), frozen (copy), promiseModule (copy), failedError (copy), p3 (ref), p4 (ref)
			local var6 = t
			local var7 = if not (not var2 and (var6.generation == var1 and var6.userId == getLocalPlayerUserId())) then frozen else nil
			
			return if var7 == nil then p4(t, p5) else promiseModule.reject(failedError(p3, var7.errorMessage, var7))
		end, function(p5)
			-- upvalues: promiseModule (copy), failedError (copy), p3 (ref)
			return promiseModule.reject(failedError(p3, if typeof(p5) == "table" and typeof(p5.errorMessage) == "string" then p5.errorMessage else "the subscription could not be read before the write", p5))
		end)
	end
	
	local function runMutation(p2, p3, p4)
		-- upvalues: var2 (write), var1 (write), getLocalPlayerUserId (ref), frozen (copy), promiseModule (copy), failedError (ref), statusCodes (copy)
		local var5 = if not (not var2 and (p2.generation == var1 and p2.userId == getLocalPlayerUserId())) then frozen else nil
		
		return if var5 == nil then p4():andThen(function(p5)
			-- upvalues: promiseModule (copy), failedError (copy), p3 (ref)
			return if p5.success then assert(p5.subscription, "A successful Developer Subscription mutation must return its identity") else promiseModule.reject(failedError(p3, `the service returned failureReason {tostring(p5.failureReason)}`, p5))
		end, function(p5)
			-- upvalues: statusCodes (copy), promiseModule (copy), failedError (copy), p3 (ref)
			return if typeof(p5) == "table" and p5.responseCode ~= nil and (statusCodes.BAD_REQUEST <= p5.responseCode and p5.responseCode < statusCodes.INTERNAL_SERVER_ERROR) and p5.responseCode ~= statusCodes.REQUEST_TIMEOUT then promiseModule.reject(failedError(p3, p5.errorMessage or "the service rejected the write", p5)) else promiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the write outcome is unknown. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if p3 ~= nil then nil else { id = p3 },
				cause = p5
			})
		end):andThen(function(p5)
			-- upvalues: p2 (ref), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), frozen (copy), promiseModule (copy), p3 (ref)
			local var6 = p2
			local var7 = if not (not var2 and (var6.generation == var1 and var6.userId == getLocalPlayerUserId())) then frozen else nil
			
			if var7 == nil then
				return p5
			end
			local var8 = p3
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed after the write. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = p5 or (if var8 ~= nil then nil else { id = var8 }),
				cause = var7
			})
		end) else promiseModule.reject(failedError(p3, var5.errorMessage, var5))
	end
	
	local function reconcileMutation(p2, p3)
		-- upvalues: var2 (write), var3 (ref), promiseModule (copy)
		return p3:andThen(function(p4)
			-- upvalues: p2 (ref), var2 (copy), var3 (copy)
			if not var2 then
				var3.clear()
				var3.fetch(p2)
			end
			return p4
		end, function(p4)
			-- upvalues: p2 (ref), var2 (copy), var3 (copy), promiseModule (copy)
			if typeof(p4) == "table" and p4.outcome == "unverified" then
				local var5 = p2
				
				if not var2 then
					var3.clear()
					var3.fetch(var5)
				end
			end
			return promiseModule.reject(p4)
		end)
	end
	
	local list_1 = {
		"description", "imageAssetId", "basePriceId", "currencyType", "priceInRobux",
		"isRegionalPricingEnabled"
	}
	
	local function readBackMutation(p2, p3, p4, p5, p6)
		-- upvalues: tokenBoundGet (ref), promiseModule (copy), developerSubscriptionTypesModule (copy), list_1 (ref), frozen (copy), var2 (write), var1 (write), getLocalPlayerUserId (ref)
		return tokenBoundGet(p2, p3, p4):andThen(function(p7)
			-- upvalues: p6 (ref), p5 (ref), promiseModule (copy), p4 (ref), developerSubscriptionTypesModule (copy), list_1 (copy)
			if p6 then
				local var5 = p5
				
				if p7.name ~= var5.name then
					local var6 = p4
					
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the stored name does not match. Do not automatically retry the write; inspect existing subscriptions first.",
						cause = nil,
						subscription = p7 or (if var6 ~= nil then nil else { id = var6 })
					})
				elseif p7.productType ~= var5.productType then
					local var7 = p4
					
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the stored product type does not match. Do not automatically retry the write; inspect existing subscriptions first.",
						cause = nil,
						subscription = p7 or (if var7 ~= nil then nil else { id = var7 })
					})
				elseif p7.productStatusType ~= developerSubscriptionTypesModule.ProductStatusType.Inactive then
					local var8 = p4
					
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the new subscription is not inactive. Do not automatically retry the write; inspect existing subscriptions first.",
						cause = nil,
						subscription = p7 or (if var8 ~= nil then nil else { id = var8 })
					})
				end
			end
			for i, v in list_1 do
				if p5[v] ~= nil and p7[v] ~= p5[v] then
					local var9 = p4
					
					return promiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = `The Developer Subscription request could not be confirmed: {`the stored {v} does not match`}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = p7 or (if var9 ~= nil then nil else { id = var9 })
					})
				end
			end
			return p7
		end, function(p8)
			-- upvalues: frozen (copy), p2 (ref), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), promiseModule (copy), p4 (ref)
			if p8 ~= frozen then
				local var10 = p2
				
				if (if not (not var2 and (var10.generation == var1 and var10.userId == getLocalPlayerUserId())) then frozen else nil) == nil then
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the authoritative readback failed. Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = if p4 ~= nil then nil else { id = p4 },
						cause = p8
					})
				end
			end
			local var11 = p4
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if var11 ~= nil then nil else { id = var11 },
				cause = p8
			})
		end)
	end
	
	return {
		getSubscriptions = var3.get,
		fetchSubscriptions = var3.fetch,
		getAndFetchSubscriptions = var3.getAndFetch,
		getAccountResetGeneration = var3.getAccountResetGeneration,
		getPermission = function(p7)
			-- upvalues: fetchDeveloperSubscriptionModule (copy), t (ref)
			return fetchDeveloperSubscriptionModule.getPermission(p7, t)
		end,
		getPrices = function(p7)
			-- upvalues: fetchDeveloperSubscriptionModule (copy), t (ref)
			return fetchDeveloperSubscriptionModule.getPrices(p7, t)
		end,
		list = list,
		get = get,
		create = function(p7, p8)
			-- upvalues: getLocalPlayerUserId (ref), var1 (write), promiseModule (copy), runMutation (ref), fetchDeveloperSubscriptionModule (copy), t (ref), readBackMutation (ref), reconcileMutation (ref)
			local t_1, t_2
			local var5 = getLocalPlayerUserId()
			
			if var5 == nil then
				t_1 = nil
				t_2 = {
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
					subscription = nil,
					cause = nil
				}
			else
				t_1 = { generation = var1, userId = var5 }
				t_2 = nil
			end
			return if t_1 == nil then promiseModule.reject(t_2) else reconcileMutation(p7, runMutation(t_1, nil, function()
				-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (ref), p8 (ref), t (copy)
				return fetchDeveloperSubscriptionModule.create(p7, p8, t)
			end):andThen(function(p9)
				-- upvalues: p8 (ref), readBackMutation (copy), t_1 (ref), p7 (ref), runMutation (copy), fetchDeveloperSubscriptionModule (copy), t (copy), promiseModule (copy)
				local imageAssetId = p8.imageAssetId
				
				return if imageAssetId == nil then readBackMutation(t_1, p7, p9.id, p8, true) else runMutation(t_1, p9.id, function()
					-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (copy), p9 (ref), imageAssetId (ref), t (copy)
					return fetchDeveloperSubscriptionModule.update(p7, p9.id, { imageAssetId = imageAssetId }, t)
				end):andThen(function()
					-- upvalues: readBackMutation (copy), t_1 (copy), p7 (copy), p9 (ref), p8 (copy)
					return readBackMutation(t_1, p7, p9.id, p8, true)
				end, function(p10)
					-- upvalues: promiseModule (copy), p9 (ref)
					local id = p9.id
					
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the created subscription's image was not confirmed. Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = p9 or (if id ~= nil then nil else { id = id }),
						cause = p10
					})
				end)
			end))
		end,
		update = function(p7, p8, p9)
			-- upvalues: getLocalPlayerUserId (ref), var1 (write), promiseModule (copy), runMutation (ref), fetchDeveloperSubscriptionModule (copy), t (ref), readBackMutation (ref), reconcileMutation (ref)
			local t_1, t_2
			local var5 = getLocalPlayerUserId()
			
			if var5 == nil then
				t_1 = nil
				t_2 = {
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
					subscription = nil,
					cause = nil
				}
			else
				t_1 = { generation = var1, userId = var5 }
				t_2 = nil
			end
			return if t_1 == nil then promiseModule.reject(t_2) else reconcileMutation(p7, runMutation(t_1, p8, function()
				-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (ref), p8 (ref), p9 (ref), t (copy)
				return fetchDeveloperSubscriptionModule.update(p7, p8, p9, t)
			end):andThen(function()
				-- upvalues: readBackMutation (copy), t_1 (ref), p7 (ref), p8 (ref), p9 (ref)
				return readBackMutation(t_1, p7, p8, p9, false)
			end))
		end,
		uploadImage = function(p7, p8, p9)
			-- upvalues: withMutationPreflight (ref), developerSubscriptionTypesModule (copy), promiseModule (copy), runMutation (ref), fetchDeveloperSubscriptionModule (copy), t (ref), verifyRead (ref), tokenBoundGet (ref), reconcileMutation (ref)
			return reconcileMutation(p7, withMutationPreflight(p7, p8, function(p10, p11)
				-- upvalues: developerSubscriptionTypesModule (copy), promiseModule (copy), p8 (ref), runMutation (copy), fetchDeveloperSubscriptionModule (copy), p7 (ref), p9 (ref), t (copy), verifyRead (copy), tokenBoundGet (copy)
				local productStatusType = p11.productStatusType
				
				if productStatusType == developerSubscriptionTypesModule.ProductStatusType.Inactive or productStatusType == developerSubscriptionTypesModule.ProductStatusType.Active or productStatusType == developerSubscriptionTypesModule.ProductStatusType.OffSale then
					local imageAssetId = p11.imageAssetId
					
					return runMutation(p10, p8, function()
						-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (copy), p8 (copy), p10 (ref), p9 (copy), t (copy)
						return fetchDeveloperSubscriptionModule.uploadImage(p7, p8, p10.userId, p9, t)
					end):andThen(function()
						-- upvalues: verifyRead (copy), p10 (ref), tokenBoundGet (copy), p7 (copy), p8 (copy), imageAssetId (ref)
						return verifyRead(p10, function()
							-- upvalues: tokenBoundGet (copy), p10 (copy), p7 (copy), p8 (copy)
							return tokenBoundGet(p10, p7, p8)
						end, function(p12)
							-- upvalues: imageAssetId (copy)
							return p12.imageAssetId ~= nil and (p12.imageAssetId > 0 and p12.imageAssetId ~= imageAssetId)
						end, "the uploaded image did not appear in authoritative reads", p8)
					end)
				end
				local var5 = p8
				
				return promiseModule.reject({
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: images can only be changed while a subscription is in a stable state.",
					subscription = if var5 ~= nil then nil else { id = var5 },
					cause = p11
				})
			end))
		end,
		activate = function(p7, p8)
			-- upvalues: withMutationPreflight (ref), developerSubscriptionTypesModule (copy), promiseModule (copy), runMutation (ref), fetchDeveloperSubscriptionModule (copy), t (ref), verifyRead (ref), tokenBoundGet (ref), reconcileMutation (ref)
			return reconcileMutation(p7, withMutationPreflight(p7, p8, function(p9, p10)
				-- upvalues: developerSubscriptionTypesModule (copy), promiseModule (copy), p8 (ref), runMutation (copy), fetchDeveloperSubscriptionModule (copy), p7 (ref), t (copy), verifyRead (copy), tokenBoundGet (copy)
				if p10.productStatusType ~= developerSubscriptionTypesModule.ProductStatusType.Inactive and p10.productStatusType ~= developerSubscriptionTypesModule.ProductStatusType.OffSale then
					local var5 = p8
					
					return promiseModule.reject({
						outcome = "failed",
						errorMessage = "The Developer Subscription request was rejected: only an inactive or off-sale subscription can be activated.",
						subscription = if var5 ~= nil then nil else { id = var5 },
						cause = p10
					})
				elseif p10.imageAssetId == nil or p10.imageAssetId <= 0 then
					local var6 = p8
					
					return promiseModule.reject({
						outcome = "failed",
						errorMessage = "The Developer Subscription request was rejected: upload an image before activating the subscription.",
						subscription = if var6 ~= nil then nil else { id = var6 },
						cause = p10
					})
				end
				return runMutation(p9, p8, function()
					-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (copy), p8 (copy), t (copy)
					return fetchDeveloperSubscriptionModule.activate(p7, p8, t)
				end):andThen(function()
					-- upvalues: verifyRead (copy), p9 (ref), tokenBoundGet (copy), p7 (copy), p8 (copy), developerSubscriptionTypesModule (copy)
					return verifyRead(p9, function()
						-- upvalues: tokenBoundGet (copy), p9 (copy), p7 (copy), p8 (copy)
						return tokenBoundGet(p9, p7, p8)
					end, function(p11)
						-- upvalues: developerSubscriptionTypesModule (copy)
						return p11.productStatusType == developerSubscriptionTypesModule.ProductStatusType.Active
					end, "the subscription did not become active", p8)
				end)
			end))
		end,
		deactivate = function(p7, p8, p9)
			-- upvalues: promiseModule (copy), withMutationPreflight (ref), developerSubscriptionTypesModule (copy), runMutation (ref), fetchDeveloperSubscriptionModule (copy), t (ref), verifyRead (ref), tokenBoundGet (ref), reconcileMutation (ref)
			return if typeof(p9) == "boolean" then reconcileMutation(p7, withMutationPreflight(p7, p8, function(p10, p11)
				-- upvalues: p9 (ref), developerSubscriptionTypesModule (copy), promiseModule (copy), p8 (ref), runMutation (copy), fetchDeveloperSubscriptionModule (copy), p7 (ref), t (copy), verifyRead (copy), tokenBoundGet (copy)
				if not p9 and p11.productStatusType == developerSubscriptionTypesModule.ProductStatusType.OffSale then
					return promiseModule.resolve(p11)
				elseif p11.productStatusType == developerSubscriptionTypesModule.ProductStatusType.Active or p9 and p11.productStatusType == developerSubscriptionTypesModule.ProductStatusType.OffSale then
					return runMutation(p10, p8, function()
						-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (copy), p8 (copy), p9 (copy), t (copy)
						return fetchDeveloperSubscriptionModule.deactivate(p7, p8, p9, t)
					end):andThen(function()
						-- upvalues: verifyRead (copy), p10 (ref), tokenBoundGet (copy), p7 (copy), p8 (copy), p9 (copy), developerSubscriptionTypesModule (copy)
						return verifyRead(p10, function()
							-- upvalues: tokenBoundGet (copy), p10 (copy), p7 (copy), p8 (copy)
							return tokenBoundGet(p10, p7, p8)
						end, function(p12)
							-- upvalues: p9 (copy), developerSubscriptionTypesModule (copy)
							return if p9 then if p12.productStatusType ~= developerSubscriptionTypesModule.ProductStatusType.ToBeDeactivated then p12.productStatusType == developerSubscriptionTypesModule.ProductStatusType.Inactive else true else p12.productStatusType == developerSubscriptionTypesModule.ProductStatusType.OffSale
						end, if p9 then "the subscription did not begin deactivation" else "the subscription did not go off sale", p8)
					end)
				end
				local var5 = p8
				
				return promiseModule.reject({
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: the subscription cannot be deactivated from its current state.",
					subscription = if var5 ~= nil then nil else { id = var5 },
					cause = p11
				})
			end)) else promiseModule.reject({
				outcome = "failed",
				errorMessage = "The Developer Subscription request was rejected: cancelRenewals must be chosen explicitly.",
				cause = nil,
				subscription = if p8 ~= nil then nil else { id = p8 }
			})
		end,
		delete = function(p7, p8)
			-- upvalues: withMutationPreflight (ref), developerSubscriptionTypesModule (copy), promiseModule (copy), failedError (ref), runMutation (ref), fetchDeveloperSubscriptionModule (copy), t (ref), tokenBoundGet (ref), frozen (copy), var2 (write), var1 (write), getLocalPlayerUserId (ref), statusCodes (copy), reconcileMutation (ref)
			return reconcileMutation(p7, withMutationPreflight(p7, p8, function(p9, p10)
				-- upvalues: developerSubscriptionTypesModule (copy), promiseModule (copy), failedError (copy), p8 (ref), runMutation (copy), fetchDeveloperSubscriptionModule (copy), p7 (ref), t (copy), tokenBoundGet (copy), frozen (copy), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), statusCodes (copy)
				return if p10.productStatusType == developerSubscriptionTypesModule.ProductStatusType.Inactive then runMutation(p9, p8, function()
					-- upvalues: fetchDeveloperSubscriptionModule (copy), p7 (copy), p8 (copy), t (copy)
					return fetchDeveloperSubscriptionModule.delete(p7, p8, t)
				end):andThen(function()
					-- upvalues: tokenBoundGet (copy), p9 (ref), p7 (copy), p8 (copy), developerSubscriptionTypesModule (copy), promiseModule (copy), frozen (copy), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), statusCodes (copy)
					return tokenBoundGet(p9, p7, p8):andThen(function(p11)
						-- upvalues: developerSubscriptionTypesModule (copy), promiseModule (copy), p8 (copy)
						if p11.productStatusType == developerSubscriptionTypesModule.ProductStatusType.ToBeDeleted or p11.productStatusType == developerSubscriptionTypesModule.ProductStatusType.Deleted then
							return p11
						end
						local var5 = p8
						
						return promiseModule.reject({
							outcome = "unverified",
							errorMessage = "The Developer Subscription request could not be confirmed: the subscription did not enter a deletion state. Do not automatically retry the write; inspect existing subscriptions first.",
							cause = nil,
							subscription = p11 or (if var5 ~= nil then nil else { id = var5 })
						})
					end, function(p11)
						-- upvalues: frozen (copy), p9 (copy), var2 (copy), var1 (copy), getLocalPlayerUserId (copy), promiseModule (copy), p8 (copy), statusCodes (copy)
						if p11 ~= frozen then
							local var5 = p9
							
							if (if not (not var2 and (var5.generation == var1 and var5.userId == getLocalPlayerUserId())) then frozen else nil) ~= nil then
								local var6 = p8
								
								return promiseModule.reject({
									outcome = "unverified",
									errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during deletion readback. Do not automatically retry the write; inspect existing subscriptions first.",
									subscription = if var6 ~= nil then nil else { id = var6 },
									cause = p11
								})
							end
							return if typeof(p11) == "table" and p11.responseCode == statusCodes.NOT_FOUND then nil else promiseModule.reject({
								outcome = "unverified",
								errorMessage = "The Developer Subscription request could not be confirmed: the deletion readback failed. Do not automatically retry the write; inspect existing subscriptions first.",
								subscription = if p8 ~= nil then nil else { id = p8 },
								cause = p11
							})
						end
					end)
				end) else promiseModule.reject(failedError(p8, if p10.productStatusType == developerSubscriptionTypesModule.ProductStatusType.ToBeDeactivated then "Wait for the subscription to become inactive before deleting it" else "Deactivate the subscription and wait for it to become inactive before deleting it", p10))
			end))
		end,
		clear = function()
			-- upvalues: var3 (ref)
			var3.clear()
		end,
		dispose = function()
			-- upvalues: var2 (write), var1 (write), var4 (ref), var3 (ref)
			var2 = true
			var1 += 1
			var4()
			var3.dispose()
		end
	}
end