local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local creatorApiHttpModule = require(dataHydration.creatorApiHttp)
local _ = require(script.Parent.GamePassConfigTypes)

local function collectionUrl(p1, p2)
	return ("%s/game-passes/v1/universes/%d/game-passes"):format(p1, p2)
end

local function passUrl(p1, p2, p3)
	return ("%s/%d"):format(("%s/game-passes/v1/universes/%d/game-passes"):format(p1, p2), p3)
end

local function requestParts(p1)
	-- upvalues: creatorApiHttpModule (ref)
	local t = {}
	
	if p1.name ~= nil then
		table.insert(t, { name = "name", value = p1.name })
	end
	if p1.description ~= nil then
		table.insert(t, { name = "description", value = p1.description })
	end
	if p1.priceInRobux ~= nil then
		table.insert(t, { name = "price", value = tostring(p1.priceInRobux) })
	end
	if p1.isForSale ~= nil then
		table.insert(t, { name = "isForSale", value = tostring(p1.isForSale) })
	end
	if p1.isManagedPricingEnabled ~= nil then
		table.insert(t, {
			name = "isManagedPricingEnabled",
			value = tostring(p1.isManagedPricingEnabled)
		})
	end
	if p1.imageFile ~= nil then
		table.insert(t, creatorApiHttpModule.imagePart(p1.imageFile))
	end
	return t
end

local t = {}

local function listPage(p1, p2, p3)
	-- upvalues: creatorApiHttpModule (ref), collectionUrl (ref)
	return creatorApiHttpModule.get(p3, creatorApiHttpModule.withQuery(("%s/creator"):format(collectionUrl(creatorApiHttpModule.baseUrl(p3), p1)), { pageToken = p2 }), "game-pass.list", function(p4)
		return p4
	end)
end

function t.list(p1, p2)
	-- upvalues: listPage (ref), promiseModule (ref)
	local t = {}
	local t_1 = {}
	
	local function fetchNext(p3, p4)
		-- upvalues: listPage (copy), p1 (ref), p2 (ref), t (ref), t_1 (ref), promiseModule (copy), fetchNext (ref)
		return listPage(p1, p3, p2):andThen(function(p5)
			-- upvalues: t (copy), t_1 (copy), p4 (ref), promiseModule (copy), fetchNext (copy)
			for i, v in p5.gamePasses do
				table.insert(t, v)
			end
			local nextPageToken = p5.nextPageToken
			
			if nextPageToken == nil or nextPageToken == "" then
				return { gamePasses = t }
			elseif t_1[nextPageToken] or p4 >= 50 then
				return promiseModule.reject({
					code = "IncompleteGamePassList",
					message = if t_1[nextPageToken] then "Repeated page token" else "Page limit reached",
					gamePasses = t,
					nextPageToken = nextPageToken
				})
			end
			t_1[nextPageToken] = true
			
			return fetchNext(nextPageToken, p4 + 1)
		end)
	end
	
	return fetchNext(nil, 1)
end

function t.get(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref), passUrl (ref)
	return creatorApiHttpModule.get(p5, ("%s/creator"):format(passUrl(creatorApiHttpModule.baseUrl(p5), p3, p4)), "game-pass.get", function(p6)
		-- upvalues: p4 (ref)
		assert(p6.gamePassId == p4, "Game Pass response ID does not match the requested ID")
		
		return p6
	end)
end

function t.batchGet(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref), collectionUrl (ref)
	return creatorApiHttpModule.json(creatorApiHttpModule.mutatingNetwork(p5), "POST", ("%s/creator:batchGet"):format(collectionUrl(creatorApiHttpModule.baseUrl(p5), p3)), { gamePassIds = p4 }, "game-pass.batch-get", creatorApiHttpModule.jsonDecoder(function(p6)
		-- upvalues: p4 (ref)
		local t = {}
		
		for i, v in p4 do
			t[v] = true
		end
		for i, v_1 in p6.gamePasses do
			assert(t[v_1.gamePassId], "Game Pass batch contains an unexpected or duplicate ID")
			t[v_1.gamePassId] = nil
		end
		return p6
	end))
end

function t.create(p7, p8, p9)
	-- upvalues: requestParts (ref), creatorApiHttpModule (ref)
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p9), "POST", ("%s/game-passes/v1/universes/%d/game-passes"):format(creatorApiHttpModule.baseUrl(p9), p7), requestParts({
		name = p8.name,
		description = p8.description,
		priceInRobux = p8.priceInRobux,
		isForSale = if p8.isForSale ~= nil then false else p8.isForSale,
		isManagedPricingEnabled = p8.isManagedPricingEnabled,
		imageFile = p8.imageFile
	}), "game-pass.create", creatorApiHttpModule.jsonDecoder(function(p10)
		assert(type(p10.gamePassId) == "number" and (p10.gamePassId % 1 == 0 and p10.gamePassId > 0), "Created Game Pass response has an invalid ID")
		
		return p10
	end))
end

function t.update(p7, p8, p9, p10)
	-- upvalues: creatorApiHttpModule (ref), requestParts (ref)
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p10), "PATCH", ("%s/%d"):format(("%s/game-passes/v1/universes/%d/game-passes"):format(creatorApiHttpModule.baseUrl(p10), p7), p8), requestParts(p9), "game-pass.update", creatorApiHttpModule.noContentDecoder(function()
		-- upvalues: p8 (ref)
		return { gamePassId = p8 }
	end))
end

function t.setArchived(value, p7, p8, p9)
	-- upvalues: creatorApiHttpModule (ref)
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p9), "PATCH", ("%s/%d"):format(("%s/game-passes/v1/universes/%d/game-passes"):format(creatorApiHttpModule.baseUrl(p9), value), p7), { { name = "isArchived", value = tostring(p8) } }, "game-pass.set-archived", creatorApiHttpModule.noContentDecoder(function()
		return nil
	end))
end

function t.getSalesLimit(p7, p8)
	-- upvalues: creatorApiHttpModule (ref)
	return creatorApiHttpModule.get(p8, ("%s/game-passes/v1/game-passes/universes/%d/sales-limit"):format(creatorApiHttpModule.baseUrl(p8), p7), "game-pass.sales-limit", function(p9)
		return p9
	end)
end

return t