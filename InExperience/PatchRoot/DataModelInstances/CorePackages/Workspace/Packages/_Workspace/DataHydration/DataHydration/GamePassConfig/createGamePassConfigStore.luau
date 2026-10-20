local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local StatusCodes = require(Parent.Http).StatusCodes
local PromiseModule = require(Parent.Promise)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(DataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local FetchGamePassConfigModule = require(script.Parent.fetchGamePassConfig)
local _ = require(script.Parent.GamePassConfigTypes)
local Frozen = table.freeze({
	errorMessage = "The local user changed while the Game Pass request was running"
})

return function(p1)
	-- upvalues: DataHydrationUtilsModule (copy), FetchGamePassConfigModule (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), PromiseModule (copy), CreateSingleEntityResolverModule (copy), Frozen (copy), StatusCodes (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local GetLocalPlayerUserId = P0.getLocalPlayerUserId or DataHydrationUtilsModule.getLocalPlayerUserId
	local ObserveLocalPlayerUserId = P0.observeLocalPlayerUserId or DataHydrationUtilsModule.observeLocalPlayerUserId
	local Flag = false
	local Generation = 0
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchGamePassConfigModule (upval), config (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (upval), PromiseModule (upval)
		local ListResult = FetchGamePassConfigModule.list(p2, config)
		
		return if FFlagDataHydrationPreserveIncompleteCatalogResultsModule then ListResult:catch(function(Err)
			-- upvalues: PromiseModule (upval)
			return if typeof(Err) == "table" and Err.code == "IncompleteGamePassList" then {
				isIncomplete = true,
				gamePasses = Err.gamePasses,
				nextPageToken = Err.nextPageToken
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
	
	local function _(GamePass, p2, Cause)
		return {
			outcome = "unverified",
			errorMessage = (if GamePass == nil then `The Game Pass request could not be verified: {p2}. ` else `Game pass {GamePass.gamePassId} could not be verified: {p2}. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
			gamePass = GamePass,
			cause = Cause
		}
	end
	
	local function failedError(GamePassId, ErrorMessage, Cause)
		return {
			outcome = "failed",
			errorMessage = `The Game Pass request was rejected: {ErrorMessage}.`,
			gamePass = if GamePassId == nil then nil else { gamePassId = GamePassId },
			cause = Cause
		}
	end
	
	local _ = function(GamePassId)
		-- upvalues: GetLocalPlayerUserId (copy), Generation (ref)
		local LocalPlayerUserId = GetLocalPlayerUserId()
		
		if LocalPlayerUserId == nil then
			return nil, {
				outcome = "failed",
				errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
				cause = nil,
				gamePass = if GamePassId == nil then nil else { gamePassId = GamePassId }
			}
		else
			return { generation = Generation, userId = LocalPlayerUserId }, nil
		end
	end
	
	local _ = function(p2)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval)
		return if Flag or p2.generation ~= Generation or p2.userId ~= GetLocalPlayerUserId() then Frozen else nil
	end
	
	local _ = function(p2)
		-- upvalues: Flag (ref), SingleEntityResolverModule (copy)
		if not Flag then
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule.fetch(p2)
		end
	end
	
	local _ = function(Promise, GamePassId)
		-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (copy)
		return Promise:catch(function(Err)
			-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (upval), GamePassId (copy)
			if typeof(Err) == "table" and Err.responseCode ~= nil and StatusCodes.BAD_REQUEST <= Err.responseCode and Err.responseCode < StatusCodes.INTERNAL_SERVER_ERROR and Err.responseCode ~= StatusCodes.REQUEST_TIMEOUT then
				return PromiseModule.reject((failedError(GamePassId, Err.errorMessage or "the service rejected the write", Err)))
			else
				local Config = if GamePassId == nil then nil else { gamePassId = GamePassId }
				
				return PromiseModule.reject({
					outcome = "unverified",
					errorMessage = (if Config == nil then "The Game Pass request could not be verified: the write outcome is unknown. " else `Game pass {Config.gamePassId} could not be verified: the write outcome is unknown. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = Config,
					cause = Err
				})
			end
		end)
	end
	
	local function runMutation(p2, GamePassId, Callback)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval), failedError (copy), StatusCodes (upval)
		local Frozen1 = if Flag or p2.generation ~= Generation or p2.userId ~= GetLocalPlayerUserId() then Frozen else nil
		
		return if Frozen1 == nil then Callback():catch(function(Err)
			-- upvalues: StatusCodes (upval), PromiseModule (upval), failedError (upval), GamePassId (copy)
			if typeof(Err) == "table" and Err.responseCode ~= nil and StatusCodes.BAD_REQUEST <= Err.responseCode and Err.responseCode < StatusCodes.INTERNAL_SERVER_ERROR and Err.responseCode ~= StatusCodes.REQUEST_TIMEOUT then
				return PromiseModule.reject((failedError(GamePassId, Err.errorMessage or "the service rejected the write", Err)))
			else
				local Config = if GamePassId == nil then nil else { gamePassId = GamePassId }
				
				return PromiseModule.reject({
					outcome = "unverified",
					errorMessage = (if Config == nil then "The Game Pass request could not be verified: the write outcome is unknown. " else `Game pass {Config.gamePassId} could not be verified: the write outcome is unknown. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = Config,
					cause = Err
				})
			end
		end):andThen(function(Result)
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), GamePassId (copy), PromiseModule (upval)
			local Frozen1 = if Flag or p2.generation ~= Generation or p2.userId ~= GetLocalPlayerUserId() then Frozen else nil
			
			if Frozen1 == nil then
				return Result
			else
				local Result1 = if typeof(Result) == "table" and typeof(Result.gamePassId) == "number" then Result elseif GamePassId == nil then nil else { gamePassId = GamePassId }
				
				return PromiseModule.reject({
					outcome = "unverified",
					errorMessage = (if Result1 == nil then "The Game Pass request could not be verified: the local user changed after the write. " else `Game pass {Result1.gamePassId} could not be verified: the local user changed after the write. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = Result1,
					cause = Frozen1
				})
			end
		end) else PromiseModule.reject((failedError(GamePassId, Frozen1.errorMessage, Frozen1)))
	end
	
	local function tokenBoundGet(p2, p3, GamePassId)
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval), PromiseModule (upval), FetchGamePassConfigModule (upval), config (copy)
		local Frozen1 = if Flag or p2.generation ~= Generation or p2.userId ~= GetLocalPlayerUserId() then Frozen else nil
		
		return if Frozen1 == nil then FetchGamePassConfigModule.get(p3, GamePassId, config):andThen(function(Result)
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval), PromiseModule (upval)
			local Frozen1 = if Flag or p2.generation ~= Generation or p2.userId ~= GetLocalPlayerUserId() then Frozen else nil
			
			return if Frozen1 == nil then Result else PromiseModule.reject(Frozen1)
		end) else PromiseModule.reject(Frozen1)
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
	
	local function readBackMutation(p2, p3, GamePassId, IconAssetId, IconAssetId1, IsForSale, p4)
		-- upvalues: tokenBoundGet (copy), PromiseModule (upval), Frozen (upval), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return tokenBoundGet(p2, p3, GamePassId):andThen(function(Result)
			-- upvalues: IconAssetId (copy), PromiseModule (upval), IconAssetId1 (copy), IsForSale (copy), p4 (copy)
			if IconAssetId ~= nil and Result.iconAssetId ~= IconAssetId then
				return PromiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if Result == nil then "The Game Pass request could not be verified: the stored icon did not match the returned icon. " else `Game pass {Result.gamePassId} could not be verified: the stored icon did not match the returned icon. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = Result
				})
			end
			if IconAssetId1 ~= nil and (Result.iconAssetId == nil or Result.iconAssetId <= 0 or Result.iconAssetId == IconAssetId1) then
				return PromiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if Result == nil then "The Game Pass request could not be verified: the replacement image is not visible yet. " else `Game pass {Result.gamePassId} could not be verified: the replacement image is not visible yet. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = Result
				})
			end
			if IsForSale ~= nil and Result.isForSale ~= IsForSale then
				return PromiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if Result == nil then "The Game Pass request could not be verified: the sale state does not match the requested state. " else `Game pass {Result.gamePassId} could not be verified: the sale state does not match the requested state. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = Result
				})
			end
			if p4 ~= nil then
				for _, value in { "name", "description", "isManagedPricingEnabled" } do
					if p4[value] ~= nil and Result[value] ~= p4[value] then
						local Message: string = `the stored {value} does not match the request`
						
						return PromiseModule.reject({
							outcome = "unverified",
							cause = nil,
							errorMessage = (if Result == nil then `The Game Pass request could not be verified: {Message}. ` else `Game pass {Result.gamePassId} could not be verified: {Message}. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
							gamePass = Result
						})
					end
				end
				local PriceInformation = Result.priceInformation
				
				if p4.priceInRobux ~= nil and (PriceInformation == nil or PriceInformation.defaultPriceInRobux ~= p4.priceInRobux) then
					return PromiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if Result == nil then "The Game Pass request could not be verified: the stored price does not match the request. " else `Game pass {Result.gamePassId} could not be verified: the stored price does not match the request. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = Result
					})
				end
			end
			return Result
		end, function(Cause)
			-- upvalues: Frozen (upval), p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), GamePassId (copy)
			if Cause == Frozen or (if Flag or p2.generation ~= Generation or p2.userId ~= GetLocalPlayerUserId() then Frozen else nil) ~= nil then
				local GamePass = { gamePassId = GamePassId }
				
				return PromiseModule.reject({
					outcome = "unverified",
					errorMessage = (if GamePass == nil then "The Game Pass request could not be verified: the local user changed during readback. " else `Game pass {GamePass.gamePassId} could not be verified: the local user changed during readback. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = GamePass,
					cause = Cause
				})
			else
				local GamePass = { gamePassId = GamePassId }
				
				return PromiseModule.reject({
					outcome = "unverified",
					errorMessage = (if GamePass == nil then "The Game Pass request could not be verified: the readback failed. " else `Game pass {GamePass.gamePassId} could not be verified: the readback failed. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = GamePass,
					cause = Cause
				})
			end
		end)
	end
	
	local function update(p5, GamePassId, p6)
		-- upvalues: GetLocalPlayerUserId (copy), Generation (ref), PromiseModule (upval), runMutation (copy), FetchGamePassConfigModule (upval), config (copy), readBackMutation (copy), tokenBoundGet (copy), Frozen (upval), Flag (ref), failedError (copy), reconcileMutation (copy)
		local LocalPlayerUserId = GetLocalPlayerUserId()
		local v1 = nil
		local config1 = nil
		
		if LocalPlayerUserId == nil then
			v1 = nil
			config1 = {
				outcome = "failed",
				errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
				cause = nil,
				gamePass = if GamePassId == nil then nil else { gamePassId = GamePassId }
			}
		else
			v1 = { generation = Generation, userId = LocalPlayerUserId }
			config1 = nil
		end
		if v1 == nil then
			return PromiseModule.reject(config1)
		else
			local function mutate(IconAssetId)
				-- upvalues: runMutation (upval), v1 (copy), GamePassId (copy), FetchGamePassConfigModule (upval), p5 (copy), p6 (copy), config (upval), readBackMutation (upval)
				return runMutation(v1, GamePassId, function()
					-- upvalues: FetchGamePassConfigModule (upval), p5 (upval), GamePassId (upval), p6 (upval), config (upval)
					return FetchGamePassConfigModule.update(p5, GamePassId, p6, config)
				end):andThen(function()
					-- upvalues: readBackMutation (upval), v1 (upval), p5 (upval), GamePassId (upval), IconAssetId (copy), p6 (upval)
					return readBackMutation(v1, p5, GamePassId, nil, IconAssetId, p6.isForSale, p6)
				end)
			end
			
			return reconcileMutation(p5, if p6.imageFile == nil then mutate(nil) else tokenBoundGet(v1, p5, GamePassId):andThen(function(Result)
				-- upvalues: PromiseModule (upval), mutate (copy)
				return if Result.iconAssetId == nil then PromiseModule.reject({
					outcome = "failed",
					errorMessage = "The existing icon could not be read. No update was sent.",
					gamePass = Result
				}) else mutate(Result.iconAssetId)
			end, function(Cause)
				-- upvalues: Frozen (upval), v1 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), failedError (upval), GamePassId (copy)
				if Cause == Frozen or (if Flag or v1.generation ~= Generation or v1.userId ~= GetLocalPlayerUserId() then Frozen else nil) ~= nil then
					return PromiseModule.reject((failedError(GamePassId, Frozen.errorMessage, Cause)))
				else
					return PromiseModule.reject((failedError(GamePassId, Cause.errorMessage or "the existing Game Pass could not be read before the update", Cause)))
				end
			end))
		end
	end
	
	return {
		getGamePasses = SingleEntityResolverModule.get,
		fetchGamePasses = SingleEntityResolverModule.fetch,
		getAndFetchGamePasses = SingleEntityResolverModule.getAndFetch,
		getAccountResetGeneration = SingleEntityResolverModule.getAccountResetGeneration,
		list = function(p5)
			-- upvalues: FetchGamePassConfigModule (upval), config (copy)
			return FetchGamePassConfigModule.list(p5, config)
		end,
		get = function(p5, p6)
			-- upvalues: FetchGamePassConfigModule (upval), config (copy)
			return FetchGamePassConfigModule.get(p5, p6, config)
		end,
		batchGet = function(p5, p6)
			-- upvalues: PromiseModule (upval), FetchGamePassConfigModule (upval), config (copy)
			return if #p6 == 0 then PromiseModule.resolve({ gamePasses = {} }) else FetchGamePassConfigModule.batchGet(p5, p6, config)
		end,
		create = function(p5, p6)
			-- upvalues: GetLocalPlayerUserId (copy), Generation (ref), PromiseModule (upval), runMutation (copy), FetchGamePassConfigModule (upval), config (copy), readBackMutation (copy), reconcileMutation (copy)
			local LocalPlayerUserId = GetLocalPlayerUserId()
			local v1 = nil
			local config1 = nil
			
			if LocalPlayerUserId == nil then
				v1 = nil
				config1 = {
					outcome = "failed",
					errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
					gamePass = nil,
					cause = nil
				}
			else
				v1 = { generation = Generation, userId = LocalPlayerUserId }
				config1 = nil
			end
			return if v1 == nil then PromiseModule.reject(config1) else reconcileMutation(p5, (runMutation(v1, nil, function()
				-- upvalues: FetchGamePassConfigModule (upval), p5 (copy), p6 (copy), config (upval)
				return FetchGamePassConfigModule.create(p5, p6, config)
			end):andThen(function(Result)
				-- upvalues: p6 (copy), PromiseModule (upval), readBackMutation (upval), v1 (copy), p5 (copy)
				if p6.imageFile == nil or Result.iconAssetId ~= nil and Result.iconAssetId > 0 then
					return readBackMutation(v1, p5, Result.gamePassId, if p6.imageFile == nil then nil else Result.iconAssetId, nil, p6.isForSale ~= nil and p6.isForSale, p6)
				else
					local GamePass = { gamePassId = Result.gamePassId }
					
					return PromiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if GamePass == nil then "The Game Pass request could not be verified: the API did not return an uploaded image asset ID. " else `Game pass {GamePass.gamePassId} could not be verified: the API did not return an uploaded image asset ID. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = GamePass
					})
				end
			end)))
		end,
		update = update,
		activate = function(p5, GamePassId)
			-- upvalues: update (copy)
			return update(p5, GamePassId, { isForSale = true })
		end,
		deactivate = function(p5, GamePassId)
			-- upvalues: update (copy)
			return update(p5, GamePassId, { isForSale = false })
		end,
		setArchived = function(p5, GamePassId, IsArchived)
			-- upvalues: GetLocalPlayerUserId (copy), Generation (ref), PromiseModule (upval), runMutation (copy), FetchGamePassConfigModule (upval), config (copy), readBackMutation (copy), reconcileMutation (copy)
			local LocalPlayerUserId = GetLocalPlayerUserId()
			local v1 = nil
			local config1 = nil
			
			if LocalPlayerUserId == nil then
				v1 = nil
				config1 = {
					outcome = "failed",
					errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
					cause = nil,
					gamePass = if GamePassId == nil then nil else { gamePassId = GamePassId }
				}
			else
				v1 = { generation = Generation, userId = LocalPlayerUserId }
				config1 = nil
			end
			return if v1 == nil then PromiseModule.reject(config1) else reconcileMutation(p5, (runMutation(v1, GamePassId, function()
				-- upvalues: FetchGamePassConfigModule (upval), p5 (copy), GamePassId (copy), IsArchived (copy), config (upval)
				return FetchGamePassConfigModule.setArchived(p5, GamePassId, IsArchived, config)
			end):andThen(function()
				-- upvalues: readBackMutation (upval), v1 (copy), p5 (copy), GamePassId (copy), PromiseModule (upval), IsArchived (copy)
				return readBackMutation(v1, p5, GamePassId):andThen(function(Result)
					-- upvalues: PromiseModule (upval), IsArchived (upval)
					return if Result.isArchived == nil then PromiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if Result == nil then "The Game Pass request could not be verified: archiving is not available for this account yet. " else `Game pass {Result.gamePassId} could not be verified: archiving is not available for this account yet. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = Result
					}) elseif Result.isArchived == IsArchived then if IsArchived and Result.isForSale ~= false then PromiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if Result == nil then "The Game Pass request could not be verified: the archived pass was not taken off sale. " else `Game pass {Result.gamePassId} could not be verified: the archived pass was not taken off sale. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = Result
					}) else Result else PromiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if Result == nil then "The Game Pass request could not be verified: the archive state is unchanged. " else `Game pass {Result.gamePassId} could not be verified: the archive state is unchanged. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = Result
					})
				end)
			end)))
		end,
		getSalesLimit = function(p6)
			-- upvalues: FetchGamePassConfigModule (upval), config (copy)
			return FetchGamePassConfigModule.getSalesLimit(p6, config)
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