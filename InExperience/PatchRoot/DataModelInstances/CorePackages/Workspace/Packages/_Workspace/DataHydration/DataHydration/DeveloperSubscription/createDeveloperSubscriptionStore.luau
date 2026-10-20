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

return function(p1)
	-- upvalues: DataHydrationUtilsModule (copy), FetchDeveloperSubscriptionModule (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), PromiseModule (copy), CreateSingleEntityResolverModule (copy), Frozen (copy), StatusCodes (copy), DeveloperSubscriptionTypesModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local GetLocalPlayerUserId = P0.getLocalPlayerUserId or DataHydrationUtilsModule.getLocalPlayerUserId
	local ObserveLocalPlayerUserId = P0.observeLocalPlayerUserId or DataHydrationUtilsModule.observeLocalPlayerUserId
	local Generation = 0
	local Flag = false
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (upval), PromiseModule (upval)
		local ListResult = FetchDeveloperSubscriptionModule.list(p2, config)
		
		return if FFlagDataHydrationPreserveIncompleteCatalogResultsModule then ListResult:catch(function(Err)
			-- upvalues: PromiseModule (upval)
			return if typeof(Err) == "table" and Err.code == "IncompleteDeveloperSubscriptionList" then {
				isIncomplete = true,
				developerSubscriptions = Err.developerSubscriptions,
				nextCursor = Err.nextCursor
			} else PromiseModule.reject(Err)
		end) else ListResult
	end, {
		cache = if FFlagDataHydrationPreserveIncompleteCatalogResultsModule then {
			ttlSecondsForItem = function(p2)
				return if p2.isIncomplete then 60 else nil
			end
		} else nil,
		resolver = { replaceItems = true }
	})
	local Callback = ObserveLocalPlayerUserId(function()
		-- upvalues: Generation (ref)
		Generation += 1
	end)
	
	local function _(Id, p2, p3, Cause)
		return {
			outcome = "unverified",
			errorMessage = `The Developer Subscription request could not be confirmed: {p2}. ` .. "Do not automatically retry the write; inspect existing subscriptions first.",
			subscription = p3 or (if Id == nil then nil else { id = Id }),
			cause = Cause
		}
	end
	
	local function failedError(Id, ErrorMessage, Cause)
		return {
			outcome = "failed",
			errorMessage = `The Developer Subscription request was rejected: {ErrorMessage}.`,
			subscription = if Id == nil then nil else { id = Id },
			cause = Cause
		}
	end
	
	local _ = function()
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
	
	local _ = function(p2): boolean
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
	end
	
	local _ = function(p2)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		
		return if IsUserIdMatch then nil else Frozen
	end
	
	local _ = function(p2)
		-- upvalues: Flag (ref), SingleEntityResolverModule (copy)
		if not Flag then
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule.fetch(p2)
		end
	end
	
	local _ = function(Promise, Id)
		-- upvalues: PromiseModule (upval), failedError (copy), StatusCodes (upval)
		return Promise:andThen(function(Result)
			-- upvalues: PromiseModule (upval), failedError (upval), Id (copy)
			return if Result.success then assert(Result.subscription, "A successful Developer Subscription mutation must return its identity") else PromiseModule.reject((failedError(Id, `the service returned failureReason {tostring(Result.failureReason)}`, Result)))
		end, function(Cause)
			-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (upval), Id (copy)
			return if typeof(Cause) == "table" and Cause.responseCode ~= nil and StatusCodes.BAD_REQUEST <= Cause.responseCode and Cause.responseCode < StatusCodes.INTERNAL_SERVER_ERROR and Cause.responseCode ~= StatusCodes.REQUEST_TIMEOUT then PromiseModule.reject((failedError(Id, Cause.errorMessage or "the service rejected the write", Cause))) else PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the write outcome is unknown. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Cause
			})
		end)
	end
	
	local function verifyRead(p2, Callback, Callback1, TheSubscriptionDidNotBeginDeactivation, Id)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		local Frozen1 = if IsUserIdMatch then nil else Frozen
		
		return if Frozen1 == nil then Callback():andThen(function(Result)
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
		end, function(Cause)
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
	
	local function tokenBoundGet(p2, p3, Id)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval), FetchDeveloperSubscriptionModule (upval), config (copy)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		local Frozen1 = if IsUserIdMatch then nil else Frozen
		
		return if Frozen1 == nil then FetchDeveloperSubscriptionModule.get(p3, Id, config):andThen(function(Result)
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval)
			local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
			local Frozen1 = if IsUserIdMatch then nil else Frozen
			
			return if Frozen1 == nil then Result else PromiseModule.reject(Frozen1)
		end) else PromiseModule.reject(Frozen1)
	end
	
	local function withMutationPreflight(p2, Id, Callback)
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
		return if v1 == nil then PromiseModule.reject(config) else tokenBoundGet(v1, p2, Id):andThen(function(Result)
			-- upvalues: v1 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval), failedError (upval), Id (copy), Callback (copy)
			local IsUserIdMatch: boolean = not Flag and (v1.generation == Generation and v1.userId == GetLocalPlayerUserId())
			local Frozen1 = if IsUserIdMatch then nil else Frozen
			
			return if Frozen1 == nil then Callback(v1, Result) else PromiseModule.reject((failedError(Id, Frozen1.errorMessage, Frozen1)))
		end, function(Cause)
			-- upvalues: PromiseModule (upval), failedError (upval), Id (copy)
			return PromiseModule.reject((failedError(Id, if typeof(Cause) == "table" and typeof(Cause.errorMessage) == "string" then Cause.errorMessage else "the subscription could not be read before the write", Cause)))
		end)
	end
	
	local function runMutation(p2, Id, Callback)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval), failedError (copy), StatusCodes (upval)
		local IsUserIdMatch: boolean = not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
		local Frozen1 = if IsUserIdMatch then nil else Frozen
		
		return if Frozen1 == nil then Callback():andThen(function(Result)
			-- upvalues: PromiseModule (upval), failedError (upval), Id (copy)
			return if Result.success then assert(Result.subscription, "A successful Developer Subscription mutation must return its identity") else PromiseModule.reject((failedError(Id, `the service returned failureReason {tostring(Result.failureReason)}`, Result)))
		end, function(Cause)
			-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (upval), Id (copy)
			return if typeof(Cause) == "table" and Cause.responseCode ~= nil and StatusCodes.BAD_REQUEST <= Cause.responseCode and Cause.responseCode < StatusCodes.INTERNAL_SERVER_ERROR and Cause.responseCode ~= StatusCodes.REQUEST_TIMEOUT then PromiseModule.reject((failedError(Id, Cause.errorMessage or "the service rejected the write", Cause))) else PromiseModule.reject({
				outcome = "unverified",
				errorMessage = "The Developer Subscription request could not be confirmed: the write outcome is unknown. Do not automatically retry the write; inspect existing subscriptions first.",
				subscription = if Id == nil then nil else { id = Id },
				cause = Cause
			})
		end):andThen(function(Result)
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
	
	local function reconcileMutation(p2, Promise)
		-- upvalues: Flag (ref), SingleEntityResolverModule (copy), PromiseModule (upval)
		return Promise:andThen(function(Result)
			-- upvalues: p2 (copy), Flag (upval), SingleEntityResolverModule (upval)
			if not Flag then
				SingleEntityResolverModule.clear()
				SingleEntityResolverModule.fetch(p2)
			end
			return Result
		end, function(p3)
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
	
	local function readBackMutation(p2, p3, Id, p4, p5)
		-- upvalues: tokenBoundGet (copy), PromiseModule (upval), DeveloperSubscriptionTypesModule (upval), list (copy), Frozen (upval), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return tokenBoundGet(p2, p3, Id):andThen(function(Result)
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
		end, function(Cause)
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
		getPermission = function(p6)
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.getPermission(p6, config)
		end,
		getPrices = function(p6)
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.getPrices(p6, config)
		end,
		list = function(p6)
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.list(p6, config)
		end,
		get = function(p6, p7)
			-- upvalues: FetchDeveloperSubscriptionModule (upval), config (copy)
			return FetchDeveloperSubscriptionModule.get(p6, p7, config)
		end,
		create = function(p6, p7)
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
			return if v1 == nil then PromiseModule.reject(config1) else reconcileMutation(p6, (runMutation(v1, nil, function()
				-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (copy), p7 (copy), config (upval)
				return FetchDeveloperSubscriptionModule.create(p6, p7, config)
			end):andThen(function(Result)
				-- upvalues: p7 (copy), readBackMutation (upval), v1 (copy), p6 (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), config (upval), PromiseModule (upval)
				local ImageAssetId = p7.imageAssetId
				
				return if ImageAssetId == nil then readBackMutation(v1, p6, Result.id, p7, true) else runMutation(v1, Result.id, function()
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Result (copy), ImageAssetId (copy), config (upval)
					return FetchDeveloperSubscriptionModule.update(p6, Result.id, { imageAssetId = ImageAssetId }, config)
				end):andThen(function()
					-- upvalues: readBackMutation (upval), v1 (upval), p6 (upval), Result (copy), p7 (upval)
					return readBackMutation(v1, p6, Result.id, p7, true)
				end, function(Cause)
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
		update = function(p6, Id, p7)
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
			return if v1 == nil then PromiseModule.reject(config1) else reconcileMutation(p6, (runMutation(v1, Id, function()
				-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (copy), Id (copy), p7 (copy), config (upval)
				return FetchDeveloperSubscriptionModule.update(p6, Id, p7, config)
			end):andThen(function()
				-- upvalues: readBackMutation (upval), v1 (copy), p6 (copy), Id (copy), p7 (copy)
				return readBackMutation(v1, p6, Id, p7, false)
			end)))
		end,
		uploadImage = function(p6, Id, UserId)
			-- upvalues: withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), verifyRead (copy), tokenBoundGet (copy), reconcileMutation (copy)
			return reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p7, Cause)
				-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), UserId (copy), config (upval), verifyRead (upval), tokenBoundGet (upval)
				local ProductStatusType = Cause.productStatusType
				
				if ProductStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive or ProductStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Active or ProductStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then
					local ImageAssetId = Cause.imageAssetId
					
					return runMutation(p7, Id, function()
						-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), p7 (copy), UserId (upval), config (upval)
						return FetchDeveloperSubscriptionModule.uploadImage(p6, Id, p7.userId, UserId, config)
					end):andThen(function()
						-- upvalues: verifyRead (upval), p7 (copy), tokenBoundGet (upval), p6 (upval), Id (upval), ImageAssetId (copy)
						return verifyRead(p7, function()
							-- upvalues: tokenBoundGet (upval), p7 (upval), p6 (upval), Id (upval)
							return tokenBoundGet(p7, p6, Id)
						end, function(p8): boolean
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
		activate = function(p6, Id)
			-- upvalues: withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), verifyRead (copy), tokenBoundGet (copy), reconcileMutation (copy)
			return reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p7, Cause)
				-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), config (upval), verifyRead (upval), tokenBoundGet (upval)
				return if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive or Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then if Cause.imageAssetId == nil or Cause.imageAssetId <= 0 then PromiseModule.reject({
					outcome = "failed",
					errorMessage = "The Developer Subscription request was rejected: upload an image before activating the subscription.",
					subscription = if Id == nil then nil else { id = Id },
					cause = Cause
				}) else runMutation(p7, Id, function()
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), config (upval)
					return FetchDeveloperSubscriptionModule.activate(p6, Id, config)
				end):andThen(function()
					-- upvalues: verifyRead (upval), p7 (copy), tokenBoundGet (upval), p6 (upval), Id (upval), DeveloperSubscriptionTypesModule (upval)
					return verifyRead(p7, function()
						-- upvalues: tokenBoundGet (upval), p7 (upval), p6 (upval), Id (upval)
						return tokenBoundGet(p7, p6, Id)
					end, function(p8): boolean
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
		deactivate = function(p6, Id, p7)
			-- upvalues: PromiseModule (upval), withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), verifyRead (copy), tokenBoundGet (copy), reconcileMutation (copy)
			return if typeof(p7) == "boolean" then reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p8, Cause)
				-- upvalues: p7 (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), config (upval), verifyRead (upval), tokenBoundGet (upval)
				return if p7 or Cause.productStatusType ~= DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Active or p7 and Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.OffSale then runMutation(p8, Id, function()
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), p7 (upval), config (upval)
					return FetchDeveloperSubscriptionModule.deactivate(p6, Id, p7, config)
				end):andThen(function()
					-- upvalues: verifyRead (upval), p8 (copy), tokenBoundGet (upval), p6 (upval), Id (upval), p7 (upval), DeveloperSubscriptionTypesModule (upval)
					return verifyRead(p8, function()
						-- upvalues: tokenBoundGet (upval), p8 (upval), p6 (upval), Id (upval)
						return tokenBoundGet(p8, p6, Id)
					end, function(p9): boolean
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
		delete = function(p6, Id)
			-- upvalues: withMutationPreflight (copy), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), failedError (copy), runMutation (copy), FetchDeveloperSubscriptionModule (upval), config (copy), tokenBoundGet (copy), Frozen (upval), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), StatusCodes (upval), reconcileMutation (copy)
			return reconcileMutation(p6, (withMutationPreflight(p6, Id, function(p7, Cause)
				-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), failedError (upval), Id (copy), runMutation (upval), FetchDeveloperSubscriptionModule (upval), p6 (copy), config (upval), tokenBoundGet (upval), Frozen (upval), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), StatusCodes (upval)
				return if Cause.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Inactive then runMutation(p7, Id, function()
					-- upvalues: FetchDeveloperSubscriptionModule (upval), p6 (upval), Id (upval), config (upval)
					return FetchDeveloperSubscriptionModule.delete(p6, Id, config)
				end):andThen(function()
					-- upvalues: tokenBoundGet (upval), p7 (copy), p6 (upval), Id (upval), DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Frozen (upval), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), StatusCodes (upval)
					return tokenBoundGet(p7, p6, Id):andThen(function(Result)
						-- upvalues: DeveloperSubscriptionTypesModule (upval), PromiseModule (upval), Id (upval)
						return if Result.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.ToBeDeleted or Result.productStatusType == DeveloperSubscriptionTypesModule.ProductStatusType.Deleted then Result else PromiseModule.reject({
							outcome = "unverified",
							errorMessage = "The Developer Subscription request could not be confirmed: the subscription did not enter a deletion state. Do not automatically retry the write; inspect existing subscriptions first.",
							cause = nil,
							subscription = Result or (if Id == nil then nil else { id = Id })
						})
					end, function(Cause)
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
		clear = function()
			-- upvalues: SingleEntityResolverModule (copy)
			SingleEntityResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: Flag (ref), Generation (ref), Callback (copy), SingleEntityResolverModule (copy)
			Flag = true
			Generation += 1
			Callback()
			SingleEntityResolverModule.dispose()
		end
	}
end