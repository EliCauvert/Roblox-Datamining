local DataHydration = script:FindFirstAncestor("DataHydration")
local PromiseModule = require(DataHydration.Parent.Promise)
local CreatorApiHttpModule = require(DataHydration.creatorApiHttp)
local _ = require(script.Parent.GamePassConfigTypes)
local IncompleteListCodeModule = require(script.Parent.incompleteListCode)
local FFlagDataHydrationPreserveIncompleteCatalogResultsModule = require(DataHydration.Flags.FFlagDataHydrationPreserveIncompleteCatalogResults)

local function collectionUrl(BaseUrlResult, p1): string
	return ("%s/game-passes/v1/universes/%d/game-passes"):format(BaseUrlResult, p1)
end

local function passUrl(BaseUrlResult, p1, GamePassId): string
	return ("%s/%d"):format(("%s/game-passes/v1/universes/%d/game-passes"):format(BaseUrlResult, p1), GamePassId)
end

local function requestParts(p1)
	-- upvalues: CreatorApiHttpModule (copy)
	local List = {}
	
	if p1.name ~= nil then
		table.insert(List, { name = "name", value = p1.name })
	end
	if p1.description ~= nil then
		table.insert(List, { name = "description", value = p1.description })
	end
	if p1.priceInRobux ~= nil then
		table.insert(List, { name = "price", value = tostring(p1.priceInRobux) })
	end
	if p1.isForSale ~= nil then
		table.insert(List, { name = "isForSale", value = tostring(p1.isForSale) })
	end
	if p1.isManagedPricingEnabled ~= nil then
		table.insert(List, {
			name = "isManagedPricingEnabled",
			value = tostring(p1.isManagedPricingEnabled)
		})
	end
	if p1.imageFile ~= nil then
		table.insert(List, CreatorApiHttpModule.imagePart(p1.imageFile))
	end
	return List
end

local function listPage(p1, PageToken, p2)
	-- upvalues: CreatorApiHttpModule (copy), collectionUrl (copy)
	return CreatorApiHttpModule.get(p2, CreatorApiHttpModule.withQuery(("%s/creator"):format(collectionUrl(CreatorApiHttpModule.baseUrl(p2), p1)), { pageToken = PageToken }), "game-pass.list", function(p3)
		return p3
	end)
end

return {
	list = function(p1, p2)
		-- upvalues: listPage (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (copy), PromiseModule (copy), IncompleteListCodeModule (copy)
		local GamePasses = {}
		local t = {}
		local t1 = {}
		
		local function fetchNext(NextPageToken, p3)
			-- upvalues: listPage (upval), p1 (copy), p2 (copy), FFlagDataHydrationPreserveIncompleteCatalogResultsModule (upval), t1 (copy), GamePasses (copy), t (copy), PromiseModule (upval), IncompleteListCodeModule (upval), fetchNext (copy)
			return listPage(p1, NextPageToken, p2):andThen(function(Result)
				-- upvalues: FFlagDataHydrationPreserveIncompleteCatalogResultsModule (upval), t1 (upval), GamePasses (upval), t (upval), p3 (copy), PromiseModule (upval), IncompleteListCodeModule (upval), fetchNext (upval)
				for _, gamePass in Result.gamePasses do
					if FFlagDataHydrationPreserveIncompleteCatalogResultsModule then
						assert(not t1[gamePass.gamePassId], "Game Pass list contains a duplicate ID")
						t1[gamePass.gamePassId] = true
					end
					table.insert(GamePasses, gamePass)
				end
				local NextPageToken = Result.nextPageToken
				
				if NextPageToken == nil or NextPageToken == "" then
					return { gamePasses = GamePasses }
				elseif t[NextPageToken] or p3 >= 50 then
					return PromiseModule.reject({
						code = IncompleteListCodeModule,
						message = if t[NextPageToken] then "Repeated page token" else "Page limit reached",
						gamePasses = GamePasses,
						nextPageToken = NextPageToken
					})
				else
					t[NextPageToken] = true
					
					return fetchNext(NextPageToken, p3 + 1)
				end
			end)
		end
		
		return fetchNext(nil, 1)
	end,
	get = function(p3, CreatorName, p4)
		-- upvalues: CreatorApiHttpModule (copy), passUrl (copy)
		return CreatorApiHttpModule.get(p4, ("%s/creator"):format(passUrl(CreatorApiHttpModule.baseUrl(p4), p3, CreatorName)), "game-pass.get", function(p5)
			-- upvalues: CreatorName (copy)
			assert(p5.gamePassId == CreatorName, "Game Pass response ID does not match the requested ID")
			
			return p5
		end)
	end,
	batchGet = function(p3, GamePassIds, p4)
		-- upvalues: CreatorApiHttpModule (copy), collectionUrl (copy)
		return CreatorApiHttpModule.json(CreatorApiHttpModule.mutatingNetwork(p4), "POST", ("%s/creator:batchGet"):format(collectionUrl(CreatorApiHttpModule.baseUrl(p4), p3)), { gamePassIds = GamePassIds }, "game-pass.batch-get", CreatorApiHttpModule.jsonDecoder(function(p5)
			-- upvalues: GamePassIds (copy)
			local t = {}
			
			for _, gamePassId in GamePassIds do
				t[gamePassId] = true
			end
			for _, gamePass in p5.gamePasses do
				assert(t[gamePass.gamePassId], "Game Pass batch contains an unexpected or duplicate ID")
				t[gamePass.gamePassId] = nil
			end
			return p5
		end))
	end,
	create = function(p6, p7, p8)
		-- upvalues: requestParts (copy), CreatorApiHttpModule (copy)
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p8), "POST", ("%s/game-passes/v1/universes/%d/game-passes"):format(CreatorApiHttpModule.baseUrl(p8), p6), requestParts({
			name = p7.name,
			description = p7.description,
			priceInRobux = p7.priceInRobux,
			isForSale = p7.isForSale ~= nil and p7.isForSale,
			isManagedPricingEnabled = p7.isManagedPricingEnabled,
			imageFile = p7.imageFile
		}), "game-pass.create", CreatorApiHttpModule.jsonDecoder(function(p9)
			assert(type(p9.gamePassId) == "number" and p9.gamePassId % 1 == 0 and p9.gamePassId > 0, "Created Game Pass response has an invalid ID")
			
			return p9
		end))
	end,
	update = function(p6, GamePassId, p7, p8)
		-- upvalues: CreatorApiHttpModule (copy), requestParts (copy)
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p8), "PATCH", ("%s/%d"):format(("%s/game-passes/v1/universes/%d/game-passes"):format(CreatorApiHttpModule.baseUrl(p8), p6), GamePassId), requestParts(p7), "game-pass.update", CreatorApiHttpModule.noContentDecoder(function()
			-- upvalues: GamePassId (copy)
			return { gamePassId = GamePassId }
		end))
	end,
	setArchived = function(p6, p7, p8, p9)
		-- upvalues: CreatorApiHttpModule (copy)
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p9), "PATCH", ("%s/%d"):format(("%s/game-passes/v1/universes/%d/game-passes"):format(CreatorApiHttpModule.baseUrl(p9), p6), p7), { { name = "isArchived", value = tostring(p8) } }, "game-pass.set-archived", CreatorApiHttpModule.noContentDecoder(function()
			return nil
		end))
	end,
	getSalesLimit = function(p6, p7)
		-- upvalues: CreatorApiHttpModule (copy)
		return CreatorApiHttpModule.get(p7, ("%s/game-passes/v1/game-passes/universes/%d/sales-limit"):format(CreatorApiHttpModule.baseUrl(p7), p6), "game-pass.sales-limit", function(p8)
			return p8
		end)
	end
}