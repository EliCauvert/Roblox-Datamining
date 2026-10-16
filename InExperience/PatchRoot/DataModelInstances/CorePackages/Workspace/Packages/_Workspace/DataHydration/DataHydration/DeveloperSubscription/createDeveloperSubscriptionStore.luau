local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local StatusCodes = require(Parent.Http).StatusCodes
local PromiseModule = require(Parent.Promise)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(DataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local FetchDeveloperSubscriptionModule = require(script.Parent.fetchDeveloperSubscription)
local DeveloperSubscriptionTypesModule = require(script.Parent.DeveloperSubscriptionTypes)
local Frozen = table.freeze({
	errorMessage = "The local user changed while the Developer Subscription request was running"
})

return function(p1) --[[ Line: 38 | Named "createDeveloperSubscriptionStore" ]]
	-- upvalues: DataHydrationUtilsModule (copy), FetchDeveloperSubscriptionModule (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), PromiseModule (copy), CreateSingleEntityResolverModule (copy), Frozen (copy), StatusCodes (copy), DeveloperSubscriptionTypesModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local GetLocalPlayerUserId = P0.getLocalPlayerUserId or DataHydrationUtilsModule.getLocalPlayerUserId
	local ObserveLocalPlayerUserId = P0.observeLocalPlayerUserId or DataHydrationUtilsModule.observeLocalPlayerUserId
	local Generation = 0
	local Flag = false
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 47 | Named "fetchSubscriptions" ]]
		-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (upval), PromiseModule (upval)
		local ListResult = FetchDeveloperSubscriptionModule.list(p2, config)
		
		return if FFlagDataHydrationPreserveIncompleteCatalogResultsModule then ListResult:catch(function(Err) --[[ Line: 52 ]]
			-- upvalues: PromiseModule (upval)
			return if typeof(Err) == "table" and Err.code == "IncompleteDeveloperSubscriptionList" then {
				isIncomplete = true,
				developerSubscriptions = Err.developerSubscriptions,
				nextCursor = Err.nextCursor
			} else PromiseModule.reject(Err)
		end) else ListResult
	end, {
		cache = if FFlagDataHydrationPreserveIncompleteCatalogResultsModule then {
			ttlSecondsForItem = function(p2) --[[ Line: 67 ]]
				return if p2.isIncomplete then 60 else nil
			end
		} else nil,
		resolver = { replaceItems = true }
	})
	local Callback = ObserveLocalPlayerUserId(function() --[[ Line: 77 ]]
		-- upvalues: Generation (ref)
		Generation += 1
	end)
	
	local function _(Id, p2, p3, Cause) --[[ Line: 89 | Named "verificationError" ]]
		return {
			outcome = "unverified",
			errorMessage = `The Developer Subscription request could not be confirmed: {p2}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
			subscription = p3 or (if Id == nil then nil else { id = Id }),
			cause = Cause
		}
	end
	
	local function failedError(Id, ErrorMessage, Cause) --[[ Line: 104 ]]
		return {
			outcome = "failed",
			errorMessage = `The Developer Subscription request was rejected: {ErrorMessage}.`,
			subscription = if Id == nil then nil else { id = Id },
			cause = Cause
		}
	end
	
	local _ = function() --[[ Line: 117 | Named "captureMutationToken" ]]
		-- upvalues: GetLocalPlayerUserId (copy), Generation (ref)
		local LocalPlayerUserId = GetLocalPlayerUserId()
		
		if LocalPlayerUserId == nil then
			return nil, {
				outcome = "failed",
				errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
				subscription = nil,
				cause = nil
			}
		else
			return { generation = Generation, userId = LocalPlayerUserId }, nil
		end
	end
	
	local _ = function(p2): boolean --[[ Line: 128 | Named "isTokenCurrent" ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
	end
	
	local _ = function(p2) --[[ Line: 132 | Named "currentTokenError" ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		
		return if IsUserIdMatch then nil else Frozen
	end
	
	local _ = function(p2) --[[ Line: 139 | Named "refreshInventory" ]]
		-- upvalues: Flag (ref), SingleEntityResolverModule (copy)
		if not Flag then
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule.fetch(p2)
		end
	end
	
	local _ = function(Promise, Id) --[[ Line: 146 | Named "mutationResult" ]]
		-- upvalues: PromiseModule (upval), failedError (copy), StatusCodes (upval)
		return Promise:andThen(function(Result) --[[ Line: 150 ]]
			-- upvalues: PromiseModule (upval), failedError (upval), Id (copy)
			return if Result.success then assert(Result.subscription, "A successful Developer Subscription mutation must return its identity") else PromiseModule.reject((failedError(Id, `the service returned failureReason {tostring(Result.failureReason)}`, Result)))
		end, function(Cause) --[[ Line: 164 ]]
			-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (upval), Id (copy)
			return if typeof(Cause) == "table" and Cause.responseCode ~= nil and StatusCodes.BAD_REQUEST <= Cause.responseCode and Cause.responseCode < StatusCodes.INTERNAL_SERVER_ERROR and Cause.responseCode ~= StatusCodes.REQUEST_TIMEOUT then PromiseModule.reject((failedError(Id, Cause.errorMessage or "the service rejected the write", Cause))) else PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the write outcome is unknown. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Cause
			})
		end)
	end
	
	local function verifyRead(p2, Callback, Callback1, TheSubscriptionDidNotBeginDeactivation, Id) --[[ Line: 180 ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		local Frozen1 = if IsUserIdMatch then nil else Frozen
		
		return if Frozen1 == nil then Callback():andThen(function(Result) --[[ Line: 193 ]]
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval), Id (copy), Callback1 (copy), TheSubscriptionDidNotBeginDeactivation (copy)
			local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
			local Frozen1 = if IsUserIdMatch then nil else Frozen
			
			return if Frozen1 == nil then if Callback1(Result) then Result else PromiseModule.reject({
				outcome = "unverified",
				cause = nil,
				errorMessage = `The Developer Subscription request could not be confirmed: {TheSubscriptionDidNotBeginDeactivation}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = Result or (if Id == nil then nil else { id = Id })
			}) else PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Frozen1
			})
		end, function(Cause) --[[ Line: 204 ]]
			-- upvalues: Frozen (upval), p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), Id (copy), TheSubscriptionDidNotBeginDeactivation (copy)
			if Cause ~= Frozen then
				local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
				
				if (if IsUserIdMatch then nil else Frozen) == nil then
					return PromiseModule.reject({
						outcome = "unverified",
						errorMessage = `The Developer Subscription request could not be confirmed: {TheSubscriptionDidNotBeginDeactivation}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = if Id == nil then nil else { id = Id },
						cause = Cause
					})
				end
			end
			return PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Cause
			})
		end) else PromiseModule.reject({
			outcome = "unverified",
			errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
			subscription = if Id == nil then nil else { id = Id },
			cause = Frozen1
		})
	end
	
	local function tokenBoundGet(p2, p3, Id) --[[ Line: 214 ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval), FetchDeveloperSubscriptionModule (upval), config (copy)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		local Frozen1 = if IsUserIdMatch then nil else Frozen
		
		return if Frozen1 == nil then FetchDeveloperSubscriptionModule.get(p3, Id, config):andThen(function(Result) --[[ Line: 223 ]]
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval)
			local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
			local Frozen1 = if IsUserIdMatch then nil else Frozen
			
			return if Frozen1 == nil then Result else PromiseModule.reject(Frozen1)
		end) else PromiseModule.reject(Frozen1)
	end
	
	local function withMutationPreflight(p2, Id, Callback) --[[ Line: 229 ]]
		-- upvalues: GetLocalPlayerUserId (copy), Generation (ref), PromiseModule (upval), tokenBoundGet (copy), Flag (ref), Frozen (upval), failedError (copy)
		local LocalPlayerUserId = GetLocalPlayerUserId()
		local v1 = nil
		local config = nil
		
		if LocalPlayerUserId == nil then
			v1 = nil
			config = {
				outcome = "failed",
				errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
				subscription = nil,
				cause = nil
			}
		else
			v1 = { generation = Generation, userId = LocalPlayerUserId }
			config = nil
		end
		return if v1 == nil then PromiseModule.reject(config) else tokenBoundGet(v1, p2, Id):andThen(function(Result) --[[ Line: 238 ]]
			-- upvalues: v1 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval), failedError (upval), Id (copy), Callback (copy)
			local IsUserIdMatch: boolean = not Flag and (v1.generation == Generation and v1.userId == GetLocalPlayerUserId())
			local Frozen1 = if IsUserIdMatch then nil else Frozen
			
			return if Frozen1 == nil then Callback(v1, Result) else PromiseModule.reject((failedError(Id, Frozen1.errorMessage, Frozen1)))
		end, function(Cause) --[[ Line: 244 ]]
			-- upvalues: PromiseModule (upval), failedError (upval), Id (copy)
			return PromiseModule.reject((failedError(Id, if typeof(Cause) == "table" and typeof(Cause.errorMessage) == "string" then Cause.errorMessage else "the subscription could not be read before the write", Cause)))
		end)
	end
	
	local function runMutation(p2, Id, Callback) --[[ Line: 252 ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval), failedError (copy), StatusCodes (upval)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		local Frozen1 = if IsUserIdMatch then nil else Frozen
		
		return if Frozen1 == nil then Callback():andThen(function(Result) --[[ Line: 150 ]]
			-- upvalues: PromiseModule (upval), failedError (upval), Id (copy)
			return if Result.success then assert(Result.subscription, "A successful Developer Subscription mutation must return its identity") else PromiseModule.reject((failedError(Id, `the service returned failureReason {tostring(Result.failureReason)}`, Result)))
		end, function(Cause) --[[ Line: 164 ]]
			-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (upval), Id (copy)
			return if typeof(Cause) == "table" and Cause.responseCode ~= nil and StatusCodes.BAD_REQUEST <= Cause.responseCode and Cause.responseCode < StatusCodes.INTERNAL_SERVER_ERROR and Cause.responseCode ~= StatusCodes.REQUEST_TIMEOUT then PromiseModule.reject((failedError(Id, Cause.errorMessage or "the service rejected the write", Cause))) else PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the write outcome is unknown. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Cause
			})
		end):andThen(function(Result) --[[ Line: 261 ]]
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval), Id (copy)
			local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
			local Frozen1 = if IsUserIdMatch then nil else Frozen
			
			return if Frozen1 == nil then Result else PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed after the write. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = Result or (if Id == nil then nil else { id = Id }),
				cause = Frozen1
			})
		end) else PromiseModule.reject((failedError(Id, Frozen1.errorMessage, Frozen1)))
	end
	
	local function reconcileMutation(p2, Promise) --[[ Line: 276 ]]
		-- upvalues: Flag (ref), SingleEntityResolverModule (copy), PromiseModule (upval)
		return Promise:andThen(function(Result) --[[ Line: 277 ]]
			-- upvalues: p2 (copy), Flag (upval), SingleEntityResolverModule (upval)
			if not Flag then
				SingleEntityResolverModule.clear()
				SingleEntityResolverModule.fetch(p2)
			end
			return Result
		end, function(p3) --[[ Line: 280 ]]
			-- upvalues: p2 (copy), Flag (upval), SingleEntityResolverModule (upval), PromiseModule (upval)
			if typeof(p3) == "table" and p3.outcome == "unverified" and not Flag then
				SingleEntityResolverModule.clear()
				SingleEntityResolverModule.fetch(p2)
			end
			return PromiseModule.reject(p3)
		end)
	end
	
	local list = {
		"description", "imageAssetId", "basePriceId", "currencyType", "priceInRobux",
		"isRegionalPricingEnabled"
	}
	
	local function readBackMutation(p2, p3, Id, p4, p5) --[[ Line: 297 ]]
		-- upvalues: tokenBoundGet (copy), PromiseModule (upval), DeveloperSubscriptionTypesModule (upval), list (copy), Frozen (upval), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return tokenBoundGet(p2, p3, Id):andThen(function(Result) --[[ Line: 304 ]]
			-- upvalues: p5 (copy), p4 (copy), PromiseModule (upval), Id (copy), DeveloperSubscriptionTypesModule (upval), list (upval)
			if p5 then
				if Result.name ~= p4.name then
					return PromiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the stored name does not match. Do not automatically retry the write; inspect existing subscriptions first.",
						cause = nil,
						subscription = Result or (if Id == nil then nil else { id = Id })
					})
				end
				if Result.productType ~= p4.productType then
					return PromiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the stored product type does not match. Do not automatically retry the write; inspect existing subscriptions first.",
						cause = nil,
						subscription = Result or (if Id == nil then nil else { id = Id })
					})
				end
				if Result.productStatusType ~= DeveloperSubscriptionTypesModule.ProductStatusType.Inactive then
					return PromiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the new subscription is not inactive. Do not automatically retry the write; inspect existing subscriptions first.",
						cause = nil,
						subscription = Result or (if Id == nil then nil else { id = Id })
					})
				end
			end
			for _, value in list do
				if p4[value] ~= nil and Result[value] ~= p4[value] then
					return PromiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = `The Developer Subscription request could not be confirmed: {`the stored {value} does not match`}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = Result or (if Id == nil then nil else { id = Id })
					})
				end
			end
			return Result
		end, function(Cause) --[[ Line: 329 ]]
			-- upvalues: Frozen (upval), p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), Id (copy)
			if Cause ~= Frozen then
				local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
				
				if (if IsUserIdMatch then nil else Frozen) == nil then
					return PromiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the authoritative readback failed. Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = if Id == nil then nil else { id = Id },
						cause = Cause
					})
				end
			end
			return PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during readback. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Cause
			})
		end)
	end
	
	return {
		getSubscriptions = SingleEntityResolverModule.get,
		fetchSubscriptions = SingleEntityResolverModule.fetch,
		getAndFetchSubscriptions = SingleEntityResolverModule.getAndFetch,
		getAccountResetGeneration = SingleEntityResolverModule.getAccountResetGeneration,
		getPermission = function(p6) --[[ Line: 539 ]]
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.getPermission(p6, config)
		end,
		getPrices = function(p6) --[[ Line: 543 ]]
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.getPrices(p6, config)
		end,
		list = function(p6) --[[ Line: 81 ]]
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.list(p6, config)
		end,
		get = function(p6, p7) --[[ Line: 85 ]]
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.get(p6, p7, config)
		end,
		create = function(p6, p7) --[[ Line: 339 ]]
			-- upvalues: GetLocalPlayerUserId (copy), Generation (ref), PromiseModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), readBackMutation (copy), reconcileMutation (copy)
			local LocalPlayerUserId = GetLocalPlayerUserId()
			local v1 = nil
			local config1 = nil
			
			if LocalPlayerUserId == nil then
				v1 = nil
				config1 = {
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
					subscription = nil,
					cause = nil
				}
			else
				v1 = { generation = Generation, userId = LocalPlayerUserId }
				config1 = nil
			end
			return if v1 == nil then PromiseModule.reject(config1) else reconcileMutation(p6, (runMutation(v1, nil, function() --[[ Line: 347 ]]
				-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (copy), p7 (copy), config (upval)
				return FetchDeveloperSubscriptionModule.create(p6, p7, config)
			end):andThen(function(Result) --[[ Line: 349 ]]
				-- upvalues: p7 (copy), readBackMutation (upval), v1 (copy), p6 (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), config (upval), PromiseModule (upval)
				local ImageAssetId = p7.imageAssetId
				
				return if ImageAssetId == nil then readBackMutation(v1, p6, Result.id, p7, true) else runMutation(v1, Result.id, function() --[[ Line: 354 ]]
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Result (copy), ImageAssetId (copy), config (upval)
					return FetchDeveloperSubscriptionModule.update(p6, Result.id, { imageAssetId = ImageAssetId }, config)
				end):andThen(function() --[[ Line: 356 ]]
					-- upvalues: readBackMutation (upval), v1 (upval), p6 (upval), Result (copy), p7 (upval)
					return readBackMutation(v1, p6, Result.id, p7, true)
				end, function(Cause) --[[ Line: 358 ]]
					-- upvalues: PromiseModule (upval), Result (copy)
					local Id = Result.id
					
					return PromiseModule.reject({
						outcome = "unverified",
						errorMessage = "The Developer Subscription request could not be confirmed: the created subscription's image was not confirmed. Do not automatically retry the write; inspect existing subscriptions first.",
						subscription = Result or (if Id == nil then nil else { id = Id }),
						cause = Cause
					})
				end)
			end)))
		end,
		update = function(p6, Id, p7) --[[ Line: 367 ]]
			-- upvalues: GetLocalPlayerUserId (copy), Generation (ref), PromiseModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), readBackMutation (copy), reconcileMutation (copy)
			local LocalPlayerUserId = GetLocalPlayerUserId()
			local v1 = nil
			local config1 = nil
			
			if LocalPlayerUserId == nil then
				v1 = nil
				config1 = {
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: a signed-in local user is required.",
					subscription = nil,
					cause = nil
				}
			else
				v1 = { generation = Generation, userId = LocalPlayerUserId }
				config1 = nil
			end
			return if v1 == nil then PromiseModule.reject(config1) else reconcileMutation(p6, (runMutation(v1, Id, function() --[[ Line: 376 ]]
				-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (copy), Id (copy), p7 (copy), config (upval)
				return FetchDeveloperSubscriptionModule.update(p6, Id, p7, config)
			end):andThen(function() --[[ Line: 378 ]]
				-- upvalues: readBackMutation (upval), v1 (copy), p6 (copy), Id (copy), p7 (copy)
				return readBackMutation(v1, p6, Id, p7, false)
			end)))
		end,
		uploadImage = function(p6, Id, UserId) --[[ Line: 384 ]]
			-- upvalues: withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), verifyRead (copy), tokenBoundGet (copy), reconcileMutation (copy)
			return reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p7, Cause) --[[ Line: 389 ]]
				-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), UserId (copy), config (upval), verifyRead (upval), tokenBoundGet (upval)
				local ProductStatusType = Cause.productStatusType
				
				if ProductStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive or ProductStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Active or ProductStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then
					local ImageAssetId = Cause.imageAssetId
					
					return runMutation(p7, Id, function() --[[ Line: 405 ]]
						-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), p7 (copy), UserId (upval), config (upval)
						return FetchDeveloperSubscriptionModule.uploadImage(p6, Id, p7.userId, UserId, config)
					end):andThen(function() --[[ Line: 407 ]]
						-- upvalues: verifyRead (upval), p7 (copy), tokenBoundGet (upval), p6 (upval), Id (upval), ImageAssetId (copy)
						return verifyRead(p7, function() --[[ Line: 408 ]]
							-- upvalues: tokenBoundGet (upval), p7 (upval), p6 (upval), Id (upval)
							return tokenBoundGet(p7, p6, Id)
						end, function(p8): boolean --[[ Line: 410 ]]
							-- upvalues: ImageAssetId (upval)
							return p8.imageAssetId ~= nil and (p8.imageAssetId > 0 and p8.imageAssetId ~= ImageAssetId)
						end, "the uploaded image did not appear in authoritative reads", Id)
					end)
				else
					return PromiseModule.reject({
						outcome = "failed",
						errorMessage = "The Developer Subscription request was rejected: images can only be changed while a subscription is in a stable state.",
						subscription = if Id == nil then nil else { id = Id },
						cause = Cause
					})
				end
			end)))
		end,
		activate = function(p6, Id) --[[ Line: 420 ]]
			-- upvalues: withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), verifyRead (copy), tokenBoundGet (copy), reconcileMutation (copy)
			return reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p7, Cause) --[[ Line: 421 ]]
				-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), config (upval), verifyRead (upval), tokenBoundGet (upval)
				return if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive or Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then if Cause.imageAssetId == nil or Cause.imageAssetId <= 0 then PromiseModule.reject({
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: upload an image before activating the subscription.",
					subscription = if Id == nil then nil else { id = Id },
					cause = Cause
				}) else runMutation(p7, Id, function() --[[ Line: 435 ]]
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), config (upval)
					return FetchDeveloperSubscriptionModule.activate(p6, Id, config)
				end):andThen(function() --[[ Line: 437 ]]
					-- upvalues: verifyRead (upval), p7 (copy), tokenBoundGet (upval), p6 (upval), Id (upval), DeveloperSubscriptionTypesModule (upval)
					return verifyRead(p7, function() --[[ Line: 438 ]]
						-- upvalues: tokenBoundGet (upval), p7 (upval), p6 (upval), Id (upval)
						return tokenBoundGet(p7, p6, Id)
					end, function(p8): boolean --[[ Line: 440 ]]
						-- upvalues: DeveloperSubscriptionTypesModule (upval)
						return p8.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Active
					end, "the subscription did not become active", Id)
				end) else PromiseModule.reject({
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: only an inactive or off-sale subscription can be activated.",
					subscription = if Id == nil then nil else { id = Id },
					cause = Cause
				})
			end)))
		end,
		deactivate = function(p6, Id, p7) --[[ Line: 448 ]]
			-- upvalues: PromiseModule (upval), withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), verifyRead (copy), tokenBoundGet (copy), reconcileMutation (copy)
			return if typeof(p7) == "boolean" then reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p8, Cause) --[[ Line: 456 ]]
				-- upvalues: p7 (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), config (upval), verifyRead (upval), tokenBoundGet (upval)
				return if p7 or Cause.productStatusType ~= DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Active or p7 and Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then runMutation(p8, Id, function() --[[ Line: 472 ]]
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), p7 (upval), config (upval)
					return FetchDeveloperSubscriptionModule.deactivate(p6, Id, p7, config)
				end):andThen(function() --[[ Line: 474 ]]
					-- upvalues: verifyRead (upval), p8 (copy), tokenBoundGet (upval), p6 (upval), Id (upval), p7 (upval), DeveloperSubscriptionTypesModule (upval)
					return verifyRead(p8, function() --[[ Line: 477 ]]
						-- upvalues: tokenBoundGet (upval), p8 (upval), p6 (upval), Id (upval)
						return tokenBoundGet(p8, p6, Id)
					end, function(p9): boolean --[[ Line: 480 ]]
						-- upvalues: p7 (upval), DeveloperSubscriptionTypesModule (upval)
						return if p7 then p9.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.ToBeDeactivated or p9.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive else p9.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale
					end, if p7 then "the subscription did not begin deactivation" else "the subscription did not go off sale", Id)
				end) else PromiseModule.reject({
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: the subscription cannot be deactivated from its current state.",
					subscription = if Id == nil then nil else { id = Id },
					cause = Cause
				}) else PromiseModule.resolve(Cause)
			end))) else PromiseModule.reject({
				outcome = "failed",
				errorMessage = "The Developer Subscription request was rejected: cancelRenewals must be chosen explicitly.",
				cause = nil,
				subscription = if Id == nil then nil else { id = Id }
			})
		end,
		delete = function(p6, Id) --[[ Line: 497 ]]
			-- upvalues: withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), failedError (copy), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), tokenBoundGet (copy), Frozen (upval), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), StatusCodes (upval), reconcileMutation (copy)
			return reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p7, Cause) --[[ Line: 498 ]]
				-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), failedError (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), config (upval), tokenBoundGet (upval), Frozen (upval), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), StatusCodes (upval)
				return if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive then runMutation(p7, Id, function() --[[ Line: 505 ]]
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), config (upval)
					return FetchDeveloperSubscriptionModule.delete(p6, Id, config)
				end):andThen(function() --[[ Line: 507 ]]
					-- upvalues: tokenBoundGet (upval), p7 (copy), p6 (upval), Id (upval), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Frozen (upval), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), StatusCodes (upval)
					return tokenBoundGet(p7, p6, Id):andThen(function(Result) --[[ Line: 508 ]]
						-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (upval)
						return if Result.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.ToBeDeleted or Result.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Deleted then Result else PromiseModule.reject({
							outcome = "unverified",
							errorMessage = "The Developer Subscription request could not be confirmed: the subscription did not enter a deletion state. Do not automatically retry the write; inspect existing subscriptions first.",
							cause = nil,
							subscription = Result or (if Id == nil then nil else { id = Id })
						})
					end, function(Cause) --[[ Line: 518 ]]
						-- upvalues: Frozen (upval), p7 (upval), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), Id (upval), StatusCodes (upval)
						if Cause ~= Frozen then
							local IsUserIdMatch: boolean = not Flag and (p7.generation == Generation and p7.userId == GetLocalPlayerUserId())
							
							if (if IsUserIdMatch then nil else Frozen) == nil then
								return if typeof(Cause) == "table" and Cause.responseCode == StatusCodes.NOT_FOUND then nil else PromiseModule.reject({
									outcome = "unverified",
									errorMessage = "The Developer Subscription request could not be confirmed: the deletion readback failed. Do not automatically retry the write; inspect existing subscriptions first.",
									subscription = if Id == nil then nil else { id = Id },
									cause = Cause
								})
							end
						end
						return PromiseModule.reject({
							outcome = "unverified",
							errorMessage = "The Developer Subscription request could not be confirmed: the local user changed during deletion readback. Do not automatically retry the write; inspect existing subscriptions first.",
							subscription = if Id == nil then nil else { id = Id },
							cause = Cause
						})
					end)
				end) else PromiseModule.reject((failedError(Id, if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.ToBeDeactivated then "Wait for the subscription to become inactive before deleting it" else "Deactivate the subscription and wait for it to become inactive before deleting it", Cause)))
			end)))
		end,
		clear = function() --[[ Line: 547 ]]
			-- upvalues: SingleEntityResolverModule (copy)
			SingleEntityResolverModule.clear()
		end,
		dispose = function() --[[ Line: 551 ]]
			-- upvalues: Flag (ref), Generation (ref), Callback (copy), SingleEntityResolverModule (copy)
			Flag = true
			Generation += 1
			Callback()
			SingleEntityResolverModule.dispose()
		end
	}
end