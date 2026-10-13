local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local creatorApiHttpModule = require(dataHydration.creatorApiHttp)
local _ = require(script.Parent.DeveloperProductStoreTypes)

local function collectionUrl(p1, p2)
	return ("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2)
end

local function _(p1, p2)
	-- upvalues: collectionUrl (ref)
	return ("%s/creator"):format(collectionUrl(p1, p2))
end

local _ = function(p1, p2, p3)
	return ("%s/%d/creator"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2), p3)
end

local _ = function(p1, p2, p3)
	return ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2), p3)
end

local function requestParts(p1)
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
		table.insert(t, {
			name = "imageFile",
			value = p1.imageFile.content,
			fileName = p1.imageFile.fileName,
			contentType = p1.imageFile.contentType
		})
	end
	return t
end

local var1 = creatorApiHttpModule.jsonDecoder(function(p1)
	return p1
end)

local function synthesizedDecoder(p1)
	-- upvalues: creatorApiHttpModule (ref)
	return creatorApiHttpModule.jsonDecoder(function(_)
		-- upvalues: p1 (ref)
		return p1()
	end)
end

local t = {}

local function listPage(p1, p2, p3)
	-- upvalues: creatorApiHttpModule (ref), collectionUrl (ref)
	return creatorApiHttpModule.get(p3, creatorApiHttpModule.withQuery(("%s/creator"):format(collectionUrl(creatorApiHttpModule.baseUrl(p3), p1)), { pageToken = p2 }), "developer-product.list", function(p4)
		return p4
	end)
end

function t.list(p1, p2)
	-- upvalues: listPage (ref)
	local t = {}
	
	local function fetchNext(p3, p4)
		-- upvalues: listPage (copy), p1 (ref), p2 (ref), t (ref), fetchNext (ref)
		return listPage(p1, p3, p2):andThen(function(p5)
			-- upvalues: t (copy), p4 (ref), fetchNext (copy)
			for i, v in p5.developerProducts do
				table.insert(t, v)
			end
			local nextPageToken = p5.nextPageToken
			
			return if nextPageToken == nil or nextPageToken == "" or p4 >= 50 then {
				developerProducts = t,
				nextPageToken = if p4 >= 50 then nextPageToken else nil
			} else fetchNext(nextPageToken, p4 + 1)
		end)
	end
	
	return fetchNext(nil, 1)
end

function t.get(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref)
	return creatorApiHttpModule.get(p5, ("%s/%d/creator"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(creatorApiHttpModule.baseUrl(p5), p3), p4), "developer-product.get", function(p6)
		return p6
	end)
end

function t.create(p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref), requestParts (ref), var1 (ref)
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p5), "POST", ("%s/developer-products/v2/universes/%d/developer-products"):format(creatorApiHttpModule.baseUrl(p5), p3), requestParts({
		name = p4.name,
		description = p4.description,
		priceInRobux = p4.priceInRobux,
		isForSale = if p4.isForSale ~= nil then false else p4.isForSale,
		isManagedPricingEnabled = p4.isManagedPricingEnabled,
		imageFile = p4.imageFile
	}), "developer-product.create", var1)
end

function t.update(p3, p4, p5, p6)
	-- upvalues: creatorApiHttpModule (ref), requestParts (ref), synthesizedDecoder (ref)
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p6), "PATCH", ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(creatorApiHttpModule.baseUrl(p6), p3), p4), requestParts({
		imageFile = nil,
		name = p5.name,
		description = p5.description,
		priceInRobux = p5.priceInRobux,
		isForSale = p5.isForSale,
		isManagedPricingEnabled = p5.isManagedPricingEnabled
	}), "developer-product.update", synthesizedDecoder(function()
		-- upvalues: p4 (ref), p5 (ref)
		return {
			productId = p4,
			name = p5.name,
			description = p5.description,
			isForSale = p5.isForSale,
			isManagedPricingEnabled = p5.isManagedPricingEnabled,
			priceInformation = if p5.priceInRobux ~= nil then nil else { defaultPriceInRobux = p5.priceInRobux }
		}
	end))
end

function t.setForSale(value, p3, p4, p5)
	-- upvalues: creatorApiHttpModule (ref), synthesizedDecoder (ref)
	return creatorApiHttpModule.multipart(creatorApiHttpModule.mutatingNetwork(p5), "PATCH", ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(creatorApiHttpModule.baseUrl(p5), value), p3), { { name = "isForSale", value = tostring(p4) } }, "developer-product.set-for-sale", synthesizedDecoder(function()
		-- upvalues: p3 (ref), p4 (ref)
		return { productId = p3, isForSale = p4 }
	end))
end

function t.activate(p3, p4, p5)
	-- upvalues: t (ref)
	return t.setForSale(p3, p4, true, p5)
end

function t.deactivate(p3, p4, p5)
	-- upvalues: t (ref)
	return t.setForSale(p3, p4, false, p5)
end

return t