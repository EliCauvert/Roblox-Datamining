local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreatorApiHttpModule = require(DataHydration.creatorApiHttp)
local _ = require(script.Parent.DeveloperProductStoreTypes)

local function collectionUrl(BaseUrlResult, p1): string --[[ Line: 20 ]]
	return ("%s/developer-products/v2/universes/%d/developer-products"):format(BaseUrlResult, p1)
end

local function _(p1, p2): string --[[ Line: 24 | Named "listUrl" ]]
	-- upvalues: collectionUrl (copy)
	return ("%s/creator"):format(collectionUrl(p1, p2))
end

local _ = function(p1, p2, p3): string --[[ Line: 28 | Named "getUrl" ]]
	return ("%s/%d/creator"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2), p3)
end

local _ = function(p1, p2, p3): string --[[ Line: 32 | Named "productUrl" ]]
	return ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2), p3)
end

local function requestParts(p1) --[[ Line: 38 ]]
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
		table.insert(List, {
			name = "imageFile",
			value = p1.imageFile.content,
			fileName = p1.imageFile.fileName,
			contentType = p1.imageFile.contentType
		})
	end
	return List
end

local JsonDecoderResult = CreatorApiHttpModule.jsonDecoder(function(p1) --[[ Line: 73 ]]
	return p1
end)

local function synthesizedDecoder(Callback) --[[ Line: 78 ]]
	-- upvalues: CreatorApiHttpModule (copy)
	return CreatorApiHttpModule.jsonDecoder(function(_) --[[ Line: 83 ]]
		-- upvalues: Callback (copy)
		return Callback()
	end)
end

local function listPage(p1, PageToken, p2) --[[ Line: 90 ]]
	-- upvalues: CreatorApiHttpModule (copy), collectionUrl (copy)
	return CreatorApiHttpModule.get(p2, CreatorApiHttpModule.withQuery(("%s/creator"):format(collectionUrl(CreatorApiHttpModule.baseUrl(p2), p1)), { pageToken = PageToken }), "developer-product.list", function(p3) --[[ Line: 98 ]]
		return p3
	end)
end

local FetchDeveloperProductModule = {
	list = function(p1, p2) --[[ Line: 103 ]]
		-- upvalues: listPage (copy)
		local DeveloperProducts = {}
		
		local function fetchNext(NextPageToken, p3) --[[ Line: 106 ]]
			-- upvalues: listPage (upval), p1 (copy), p2 (copy), DeveloperProducts (copy), fetchNext (copy)
			return listPage(p1, NextPageToken, p2):andThen(function(Result) --[[ Line: 107 ]]
				-- upvalues: DeveloperProducts (upval), p3 (copy), fetchNext (upval)
				for _, developerProduct in Result.developerProducts do
					table.insert(DeveloperProducts, developerProduct)
				end
				local NextPageToken = Result.nextPageToken
				
				return if NextPageToken == nil or NextPageToken == "" or p3 >= 50 then {
					developerProducts = DeveloperProducts,
					nextPageToken = if p3 >= 50 then NextPageToken else nil
				} else fetchNext(NextPageToken, p3 + 1)
			end)
		end
		
		return fetchNext(nil, 1)
	end,
	get = function(p3, CreatorName, p4) --[[ Line: 127 ]]
		-- upvalues: CreatorApiHttpModule (copy)
		return CreatorApiHttpModule.get(p4, ("%s/%d/creator"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(CreatorApiHttpModule.baseUrl(p4), p3), CreatorName), "developer-product.get", function(p5) --[[ Line: 136 ]]
			return p5
		end)
	end,
	create = function(p3, p4, p5) --[[ Line: 142 ]]
		-- upvalues: CreatorApiHttpModule (copy), requestParts (copy), JsonDecoderResult (copy)
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p5), "POST", ("%s/developer-products/v2/universes/%d/developer-products"):format(CreatorApiHttpModule.baseUrl(p5), p3), requestParts({
			name = p4.name,
			description = p4.description,
			priceInRobux = p4.priceInRobux,
			isForSale = p4.isForSale ~= nil and p4.isForSale,
			isManagedPricingEnabled = p4.isManagedPricingEnabled,
			imageFile = p4.imageFile
		}), "developer-product.create", JsonDecoderResult)
	end,
	update = function(p3, ProductId, p4, p5) --[[ Line: 168 ]]
		-- upvalues: CreatorApiHttpModule (copy), requestParts (copy), synthesizedDecoder (copy)
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p5), "PATCH", ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(CreatorApiHttpModule.baseUrl(p5), p3), ProductId), requestParts({
			imageFile = nil,
			name = p4.name,
			description = p4.description,
			priceInRobux = p4.priceInRobux,
			isForSale = p4.isForSale,
			isManagedPricingEnabled = p4.isManagedPricingEnabled
		}), "developer-product.update", synthesizedDecoder(function() --[[ Line: 189 ]]
			-- upvalues: ProductId (copy), p4 (copy)
			return {
				productId = ProductId,
				name = p4.name,
				description = p4.description,
				isForSale = p4.isForSale,
				isManagedPricingEnabled = p4.isManagedPricingEnabled,
				priceInformation = if p4.priceInRobux == nil then nil else { defaultPriceInRobux = p4.priceInRobux }
			}
		end))
	end,
	setForSale = function(p3, ProductId, IsForSale, p4) --[[ Line: 204 ]]
		-- upvalues: CreatorApiHttpModule (copy), synthesizedDecoder (copy)
		return CreatorApiHttpModule.multipart(CreatorApiHttpModule.mutatingNetwork(p4), "PATCH", ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(CreatorApiHttpModule.baseUrl(p4), p3), ProductId), { { name = "isForSale", value = tostring(IsForSale) } }, "developer-product.set-for-sale", synthesizedDecoder(function() --[[ Line: 217 ]]
			-- upvalues: ProductId (copy), IsForSale (copy)
			return { productId = ProductId, isForSale = IsForSale }
		end))
	end
}

function FetchDeveloperProductModule.activate(p3, ProductId, p4) --[[ Line: 223 ]]
	-- upvalues: FetchDeveloperProductModule (copy)
	return FetchDeveloperProductModule.setForSale(p3, ProductId, true, p4)
end

function FetchDeveloperProductModule.deactivate(p3, ProductId, p4) --[[ Line: 231 ]]
	-- upvalues: FetchDeveloperProductModule (copy)
	return FetchDeveloperProductModule.setForSale(p3, ProductId, false, p4)
end

return FetchDeveloperProductModule