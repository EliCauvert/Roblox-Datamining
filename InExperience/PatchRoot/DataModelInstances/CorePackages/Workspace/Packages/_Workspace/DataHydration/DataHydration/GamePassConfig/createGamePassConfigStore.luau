local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local statusCodes = require(parent.Http).StatusCodes
local promiseModule = require(parent.Promise)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(dataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)
local dataHydrationUtilsModule = require(dataHydration.DataHydrationUtils)
local fetchGamePassConfigModule = require(script.Parent.fetchGamePassConfig)
local _ = require(script.Parent.GamePassConfigTypes)
local frozen = table.freeze({
	errorMessage = "The local user changed while the Game Pass request was running"
})

return function(p1)
	-- upvalues: dataHydrationUtilsModule (ref), fetchGamePassConfigModule (ref), fFlagDataHydrationPreserveIncompleteCatalogResultsModule (ref), promiseModule (ref), createSingleEntityResolverModule (ref), frozen (ref), statusCodes (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local getLocalPlayerUserId = p1.getLocalPlayerUserId or dataHydrationUtilsModule.getLocalPlayerUserId
	local observeLocalPlayerUserId = p1.observeLocalPlayerUserId or dataHydrationUtilsModule.observeLocalPlayerUserId
	local var1 = false
	local var2 = 0
	local var3 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchGamePassConfigModule (copy), t (ref), fFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), promiseModule (copy)
		local var4 = fetchGamePassConfigModule.list(p2, t)
		
		return if fFlagDataHydrationPreserveIncompleteCatalogResultsModule then var4:catch(function(p3)
			-- upvalues: promiseModule (copy)
			return if typeof(p3) == "table" and p3.code == "IncompleteGamePassList" then {
				isIncomplete = true,
				gamePasses = p3.gamePasses,
				nextPageToken = p3.nextPageToken
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
		-- upvalues: var2 (write)
		var2 += 1
	end)
	
	local function list(p2)
		-- upvalues: fetchGamePassConfigModule (copy), t (ref)
		return fetchGamePassConfigModule.list(p2, t)
	end
	
	local function get(p2, p3)
		-- upvalues: fetchGamePassConfigModule (copy), t (ref)
		return fetchGamePassConfigModule.get(p2, p3, t)
	end
	
	local function batchGet(p2, p3)
		-- upvalues: promiseModule (copy), fetchGamePassConfigModule (copy), t (ref)
		return if #p3 == 0 then promiseModule.resolve({ gamePasses = {} }) else fetchGamePassConfigModule.batchGet(p2, p3, t)
	end
	
	local function _(p2, p3, p4)
		return {
			outcome = "unverified",
			errorMessage = (if p2 ~= nil then `The Game Pass request could not be verified: {p3}. ` else `Game pass {p2.gamePassId} could not be verified: {p3}. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
			gamePass = p2,
			cause = p4
		}
	end
	
	local function failedError(p2, p3, p4)
		return {
			outcome = "failed",
			errorMessage = `The Game Pass request was rejected: {p3}.`,
			gamePass = if p2 ~= nil then nil else { gamePassId = p2 },
			cause = p4
		}
	end
	
	local _ = function(p2)
		-- upvalues: getLocalPlayerUserId (ref), var2 (write)
		local var5 = getLocalPlayerUserId()
		
		if var5 == nil then
			return nil, {
				outcome = "failed",
				errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
				cause = nil,
				gamePass = if p2 ~= nil then nil else { gamePassId = p2 }
			}
		end
		return { generation = var2, userId = var5 }, nil
	end
	
	local _ = function(p2)
		-- upvalues: var1 (write), var2 (write), getLocalPlayerUserId (ref), frozen (copy)
		return if var1 or p2.generation ~= var2 or p2.userId ~= getLocalPlayerUserId() then frozen else nil
	end
	
	local _ = function(p2)
		-- upvalues: var1 (write), var3 (ref)
		if not var1 then
			var3.clear()
			var3.fetch(p2)
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: statusCodes (copy), promiseModule (copy), failedError (ref)
		return p2:catch(function(p4)
			-- upvalues: statusCodes (copy), promiseModule (copy), failedError (copy), p3 (ref)
			if typeof(p4) == "table" and p4.responseCode ~= nil and (statusCodes.BAD_REQUEST <= p4.responseCode and p4.responseCode < statusCodes.INTERNAL_SERVER_ERROR) and p4.responseCode ~= statusCodes.REQUEST_TIMEOUT then
				return promiseModule.reject(failedError(p3, p4.errorMessage or "the service rejected the write", p4))
			end
			local var5 = if p3 ~= nil then nil else { gamePassId = p3 }
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = (if var5 ~= nil then "The Game Pass request could not be verified: the write outcome is unknown. " else `Game pass {var5.gamePassId} could not be verified: the write outcome is unknown. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
				gamePass = var5,
				cause = p4
			})
		end)
	end
	
	local function runMutation(p2, p3, p4)
		-- upvalues: var1 (write), var2 (write), getLocalPlayerUserId (ref), frozen (copy), promiseModule (copy), failedError (ref), statusCodes (copy)
		local var5 = if var1 or p2.generation ~= var2 or p2.userId ~= getLocalPlayerUserId() then frozen else nil
		
		return if var5 == nil then p4():catch(function(p5)
			-- upvalues: statusCodes (copy), promiseModule (copy), failedError (copy), p3 (ref)
			if typeof(p5) == "table" and p5.responseCode ~= nil and (statusCodes.BAD_REQUEST <= p5.responseCode and p5.responseCode < statusCodes.INTERNAL_SERVER_ERROR) and p5.responseCode ~= statusCodes.REQUEST_TIMEOUT then
				return promiseModule.reject(failedError(p3, p5.errorMessage or "the service rejected the write", p5))
			end
			local var6 = if p3 ~= nil then nil else { gamePassId = p3 }
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = (if var6 ~= nil then "The Game Pass request could not be verified: the write outcome is unknown. " else `Game pass {var6.gamePassId} could not be verified: the write outcome is unknown. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
				gamePass = var6,
				cause = p5
			})
		end):andThen(function(p5)
			-- upvalues: p2 (ref), var1 (copy), var2 (copy), getLocalPlayerUserId (copy), frozen (copy), p3 (ref), promiseModule (copy)
			local var6 = p2
			local var7 = if var1 or var6.generation ~= var2 or var6.userId ~= getLocalPlayerUserId() then frozen else nil
			
			if var7 == nil then
				return p5
			end
			var6 = if typeof(p5) == "table" and typeof(p5.gamePassId) == "number" then p5 elseif p3 ~= nil then nil else { gamePassId = p3 }
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = (if var6 ~= nil then "The Game Pass request could not be verified: the local user changed after the write. " else `Game pass {var6.gamePassId} could not be verified: the local user changed after the write. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
				gamePass = var6,
				cause = var7
			})
		end) else promiseModule.reject(failedError(p3, var5.errorMessage, var5))
	end
	
	local function tokenBoundGet(p2, p3, p4)
		-- upvalues: var1 (write), var2 (write), getLocalPlayerUserId (ref), frozen (copy), promiseModule (copy), fetchGamePassConfigModule (copy), t (ref)
		local var5 = if var1 or p2.generation ~= var2 or p2.userId ~= getLocalPlayerUserId() then frozen else nil
		
		return if var5 == nil then fetchGamePassConfigModule.get(p3, p4, t):andThen(function(p5)
			-- upvalues: p2 (ref), var1 (copy), var2 (copy), getLocalPlayerUserId (copy), frozen (copy), promiseModule (copy)
			local var6 = p2
			local var7 = if var1 or var6.generation ~= var2 or var6.userId ~= getLocalPlayerUserId() then frozen else nil
			
			return if var7 == nil then p5 else promiseModule.reject(var7)
		end) else promiseModule.reject(var5)
	end
	
	local function reconcileMutation(p2, p3)
		-- upvalues: var1 (write), var3 (ref), promiseModule (copy)
		return p3:andThen(function(p4)
			-- upvalues: p2 (ref), var1 (copy), var3 (copy)
			if not var1 then
				var3.clear()
				var3.fetch(p2)
			end
			return p4
		end, function(p4)
			-- upvalues: p2 (ref), var1 (copy), var3 (copy), promiseModule (copy)
			if typeof(p4) == "table" and p4.outcome == "unverified" then
				local var5 = p2
				
				if not var1 then
					var3.clear()
					var3.fetch(var5)
				end
			end
			return promiseModule.reject(p4)
		end)
	end
	
	local function readBackMutation(p2, p3, p4, p5, p6, p7, p8)
		-- upvalues: tokenBoundGet (ref), promiseModule (copy), frozen (copy), var1 (write), var2 (write), getLocalPlayerUserId (ref)
		return tokenBoundGet(p2, p3, p4):andThen(function(p9)
			-- upvalues: p5 (ref), promiseModule (copy), p6 (ref), p7 (ref), p8 (ref)
			if p5 ~= nil and p9.iconAssetId ~= p5 then
				return promiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if p9 ~= nil then "The Game Pass request could not be verified: the stored icon did not match the returned icon. " else `Game pass {p9.gamePassId} could not be verified: the stored icon did not match the returned icon. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = p9
				})
			elseif p6 ~= nil and (p9.iconAssetId == nil or p9.iconAssetId <= 0 or p9.iconAssetId == p6) then
				return promiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if p9 ~= nil then "The Game Pass request could not be verified: the replacement image is not visible yet. " else `Game pass {p9.gamePassId} could not be verified: the replacement image is not visible yet. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = p9
				})
			elseif p7 ~= nil and p9.isForSale ~= p7 then
				return promiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if p9 ~= nil then "The Game Pass request could not be verified: the sale state does not match the requested state. " else `Game pass {p9.gamePassId} could not be verified: the sale state does not match the requested state. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = p9
				})
			elseif p8 ~= nil then
				for i, v in { "name", "description", "isManagedPricingEnabled" } do
					if p8[v] ~= nil and p9[v] ~= p8[v] then
						local var5 = `the stored {v} does not match the request`
						
						return promiseModule.reject({
							outcome = "unverified",
							cause = nil,
							errorMessage = (if p9 ~= nil then `The Game Pass request could not be verified: {var5}. ` else `Game pass {p9.gamePassId} could not be verified: {var5}. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
							gamePass = p9
						})
					end
				end
				local priceInformation = p9.priceInformation
				
				return if p8.priceInRobux == nil or priceInformation ~= nil and priceInformation.defaultPriceInRobux == p8.priceInRobux then p9 else promiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if p9 ~= nil then "The Game Pass request could not be verified: the stored price does not match the request. " else `Game pass {p9.gamePassId} could not be verified: the stored price does not match the request. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = p9
				})
			end
		end, function(p10)
			-- upvalues: frozen (copy), p2 (ref), var1 (copy), var2 (copy), getLocalPlayerUserId (copy), promiseModule (copy), p4 (ref)
			if p10 ~= frozen then
				local var6 = p2
				
				if (if var1 or var6.generation ~= var2 or var6.userId ~= getLocalPlayerUserId() then frozen else nil) == nil then
					local t = { gamePassId = p4 }
					
					return promiseModule.reject({
						outcome = "unverified",
						errorMessage = (if t ~= nil then "The Game Pass request could not be verified: the readback failed. " else `Game pass {t.gamePassId} could not be verified: the readback failed. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = t,
						cause = p10
					})
				end
			end
			local t = { gamePassId = p4 }
			
			return promiseModule.reject({
				outcome = "unverified",
				errorMessage = (if t ~= nil then "The Game Pass request could not be verified: the local user changed during readback. " else `Game pass {t.gamePassId} could not be verified: the local user changed during readback. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
				gamePass = t,
				cause = p10
			})
		end)
	end
	
	local function update(p9, p10, p11)
		-- upvalues: getLocalPlayerUserId (ref), var2 (write), promiseModule (copy), runMutation (ref), fetchGamePassConfigModule (copy), t (ref), readBackMutation (ref), tokenBoundGet (ref), frozen (copy), var1 (write), failedError (ref), reconcileMutation (ref)
		local t_1, t_2
		local var5 = getLocalPlayerUserId()
		
		if var5 == nil then
			t_1 = nil
			t_2 = {
				outcome = "failed",
				errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
				cause = nil,
				gamePass = if p10 ~= nil then nil else { gamePassId = p10 }
			}
		else
			t_1 = { generation = var2, userId = var5 }
			t_2 = nil
		end
		if t_1 == nil then
			return promiseModule.reject(t_2)
		end
		local function mutate(p12)
			-- upvalues: runMutation (copy), t_1 (ref), p10 (ref), fetchGamePassConfigModule (copy), p9 (ref), p11 (ref), t (copy), readBackMutation (copy)
			return runMutation(t_1, p10, function()
				-- upvalues: fetchGamePassConfigModule (copy), p9 (copy), p10 (copy), p11 (copy), t (copy)
				return fetchGamePassConfigModule.update(p9, p10, p11, t)
			end):andThen(function()
				-- upvalues: readBackMutation (copy), t_1 (copy), p9 (copy), p10 (copy), p12 (ref), p11 (copy)
				return readBackMutation(t_1, p9, p10, nil, p12, p11.isForSale, p11)
			end)
		end
		
		return reconcileMutation(p9, if p11.imageFile ~= nil then mutate(nil) else tokenBoundGet(t_1, p9, p10):andThen(function(p12)
			-- upvalues: promiseModule (copy), mutate (ref)
			return if p12.iconAssetId == nil then promiseModule.reject({
				outcome = "failed",
				errorMessage = "The existing icon could not be read. No update was sent.",
				gamePass = p12
			}) else mutate(p12.iconAssetId)
		end, function(p12)
			-- upvalues: frozen (copy), t_1 (ref), var1 (copy), var2 (copy), getLocalPlayerUserId (copy), promiseModule (copy), failedError (copy), p10 (ref)
			if p12 ~= frozen then
				local var6 = t_1
				
				return if (if var1 or var6.generation ~= var2 or var6.userId ~= getLocalPlayerUserId() then frozen else nil) == nil then promiseModule.reject(failedError(p10, p12.errorMessage or "the existing Game Pass could not be read before the update", p12)) else promiseModule.reject(failedError(p10, frozen.errorMessage, p12))
			end
		end))
	end
	
	return {
		getGamePasses = var3.get,
		fetchGamePasses = var3.fetch,
		getAndFetchGamePasses = var3.getAndFetch,
		getAccountResetGeneration = var3.getAccountResetGeneration,
		list = list,
		get = get,
		batchGet = batchGet,
		create = function(p9, p10)
			-- upvalues: getLocalPlayerUserId (ref), var2 (write), promiseModule (copy), runMutation (ref), fetchGamePassConfigModule (copy), t (ref), readBackMutation (ref), reconcileMutation (ref)
			local t_1, t_2
			local var5 = getLocalPlayerUserId()
			
			if var5 == nil then
				t_1 = nil
				t_2 = {
					outcome = "failed",
					errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
					gamePass = nil,
					cause = nil
				}
			else
				t_1 = { generation = var2, userId = var5 }
				t_2 = nil
			end
			return if t_1 == nil then promiseModule.reject(t_2) else reconcileMutation(p9, runMutation(t_1, nil, function()
				-- upvalues: fetchGamePassConfigModule (copy), p9 (ref), p10 (ref), t (copy)
				return fetchGamePassConfigModule.create(p9, p10, t)
			end):andThen(function(p11)
				-- upvalues: p10 (ref), promiseModule (copy), readBackMutation (copy), t_1 (ref), p9 (ref)
				if p10.imageFile == nil or p11.iconAssetId ~= nil and p11.iconAssetId > 0 then
					return readBackMutation(t_1, p9, p11.gamePassId, if p10.imageFile ~= nil then nil else p11.iconAssetId, nil, if p10.isForSale ~= nil then false else p10.isForSale, p10)
				end
				local t = { gamePassId = p11.gamePassId }
				
				return promiseModule.reject({
					outcome = "unverified",
					cause = nil,
					errorMessage = (if t ~= nil then "The Game Pass request could not be verified: the API did not return an uploaded image asset ID. " else `Game pass {t.gamePassId} could not be verified: the API did not return an uploaded image asset ID. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
					gamePass = t
				})
			end))
		end,
		update = update,
		activate = function(p9, p10)
			-- upvalues: update (ref)
			return update(p9, p10, { isForSale = true })
		end,
		deactivate = function(p9, p10)
			-- upvalues: update (ref)
			return update(p9, p10, { isForSale = false })
		end,
		setArchived = function(value, p9, p10)
			-- upvalues: getLocalPlayerUserId (ref), var2 (write), promiseModule (copy), runMutation (ref), fetchGamePassConfigModule (copy), t (ref), readBackMutation (ref), reconcileMutation (ref)
			local t_1, t_2
			local var5 = getLocalPlayerUserId()
			
			if var5 == nil then
				t_1 = nil
				t_2 = {
					outcome = "failed",
					errorMessage = "The Game Pass request was rejected: a signed-in local user is required.",
					cause = nil,
					gamePass = if p9 ~= nil then nil else { gamePassId = p9 }
				}
			else
				t_1 = { generation = var2, userId = var5 }
				t_2 = nil
			end
			return if t_1 == nil then promiseModule.reject(t_2) else reconcileMutation(value, runMutation(t_1, p9, function()
				-- upvalues: fetchGamePassConfigModule (copy), value (ref), p9 (ref), p10 (ref), t (copy)
				return fetchGamePassConfigModule.setArchived(value, p9, p10, t)
			end):andThen(function()
				-- upvalues: readBackMutation (copy), t_1 (ref), value (ref), p9 (ref), promiseModule (copy), p10 (ref)
				return readBackMutation(t_1, value, p9):andThen(function(p11)
					-- upvalues: promiseModule (copy), p10 (copy)
					return if p11.isArchived == nil then promiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if p11 ~= nil then "The Game Pass request could not be verified: archiving is not available for this account yet. " else `Game pass {p11.gamePassId} could not be verified: archiving is not available for this account yet. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = p11
					}) elseif p11.isArchived == p10 then if p10 and p11.isForSale ~= false then promiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if p11 ~= nil then "The Game Pass request could not be verified: the archived pass was not taken off sale. " else `Game pass {p11.gamePassId} could not be verified: the archived pass was not taken off sale. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = p11
					}) else p11 else promiseModule.reject({
						outcome = "unverified",
						cause = nil,
						errorMessage = (if p11 ~= nil then "The Game Pass request could not be verified: the archive state is unchanged. " else `Game pass {p11.gamePassId} could not be verified: the archive state is unchanged. `) .. "Inspect the existing game pass before retrying. Do not create another game pass.",
						gamePass = p11
					})
				end)
			end))
		end,
		getSalesLimit = function(p11)
			-- upvalues: fetchGamePassConfigModule (copy), t (ref)
			return fetchGamePassConfigModule.getSalesLimit(p11, t)
		end,
		clear = function()
			-- upvalues: var3 (ref)
			var3.clear()
		end,
		dispose = function()
			-- upvalues: var1 (write), var2 (write), var4 (ref), var3 (ref)
			var1 = true
			var2 += 1
			var4()
			var3.dispose()
		end
	}
end