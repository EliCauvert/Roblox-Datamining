local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchDeveloperProductModule = require(script.Parent.fetchDeveloperProduct)
local _ = require(script.Parent.DeveloperProductStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchDeveloperProductModule (copy), PromiseModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchDeveloperProductModule (upval), config (copy)
		return FetchDeveloperProductModule.list(p2, config)
	end)
	
	local function _(Product, p2)
		return {
			errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(Product.productId), p2),
			product = Product
		}
	end
	
	local function readBackMutation(p2, Product, IconImageAssetId, p3)
		-- upvalues: FetchDeveloperProductModule (upval), config (copy), SingleEntityResolverModule (copy), PromiseModule (upval)
		local GetResult = FetchDeveloperProductModule.get(p2, Product.productId, config)
		
		return (if IconImageAssetId == nil then GetResult:catch(function()
			-- upvalues: p3 (copy), SingleEntityResolverModule (upval), p2 (copy), PromiseModule (upval), Product (copy)
			if p3 then
				SingleEntityResolverModule.fetch(p2)
				
				return PromiseModule.reject({
					errorMessage = "The developer product update may have saved, but its text could not be verified because the follow-up read failed. List the product before retrying.",
					outcome = "unverified",
					product = { productId = Product.productId }
				})
			else
				return Product
			end
		end) else GetResult:catch(function()
			-- upvalues: PromiseModule (upval), Product (copy)
			return PromiseModule.reject({
				errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(Product.productId), "the product could not be read back"),
				product = Product
			})
		end)):andThen(function(Result)
			-- upvalues: SingleEntityResolverModule (upval), p2 (copy), IconImageAssetId (copy), PromiseModule (upval), Product (copy)
			SingleEntityResolverModule.fetch(p2)
			
			return if IconImageAssetId == nil or Result.iconImageAssetId == IconImageAssetId then Result else PromiseModule.reject({
				errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(Product.productId), "the stored icon did not match the returned icon"),
				product = Product
			})
		end)
	end
	
	return {
		getProducts = SingleEntityResolverModule.get,
		fetchProducts = SingleEntityResolverModule.fetch,
		getAndFetchProducts = SingleEntityResolverModule.getAndFetch,
		getAccountResetGeneration = SingleEntityResolverModule.getAccountResetGeneration,
		list = function(p2)
			-- upvalues: FetchDeveloperProductModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchDeveloperProductModule.list(p2, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.update(p2, Result)
				
				return Result
			end)
		end,
		get = function(p2, ProductId)
			-- upvalues: FetchDeveloperProductModule (upval), config (copy)
			return FetchDeveloperProductModule.get(p2, ProductId, config)
		end,
		create = function(p2, p3)
			-- upvalues: FetchDeveloperProductModule (upval), config (copy), PromiseModule (upval), readBackMutation (copy)
			return FetchDeveloperProductModule.create(p2, p3, config):andThen(function(Result)
				-- upvalues: p3 (copy), PromiseModule (upval), readBackMutation (upval), p2 (copy)
				return if p3.imageFile == nil or Result.iconImageAssetId ~= nil then readBackMutation(p2, Result, if p3.imageFile == nil then nil else Result.iconImageAssetId) else PromiseModule.reject({
					errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(Result.productId), "the API did not return an image asset ID"),
					product = Result
				})
			end)
		end,
		update = function(p2, p3, p4, p5)
			-- upvalues: FetchDeveloperProductModule (upval), config (copy), readBackMutation (copy)
			return FetchDeveloperProductModule.update(p2, p3, p4, config):andThen(function(Result)
				-- upvalues: readBackMutation (upval), p2 (copy), p5 (copy)
				return readBackMutation(p2, Result, nil, p5)
			end)
		end,
		activate = function(p2, p3)
			-- upvalues: FetchDeveloperProductModule (upval), config (copy), readBackMutation (copy)
			return FetchDeveloperProductModule.activate(p2, p3, config):andThen(function(Result)
				-- upvalues: readBackMutation (upval), p2 (copy)
				return readBackMutation(p2, Result)
			end)
		end,
		deactivate = function(p2, p3)
			-- upvalues: FetchDeveloperProductModule (upval), config (copy), readBackMutation (copy)
			return FetchDeveloperProductModule.deactivate(p2, p3, config):andThen(function(Result)
				-- upvalues: readBackMutation (upval), p2 (copy)
				return readBackMutation(p2, Result)
			end)
		end,
		clear = function()
			-- upvalues: SingleEntityResolverModule (copy)
			SingleEntityResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: SingleEntityResolverModule (copy)
			SingleEntityResolverModule.dispose()
		end
	}
end