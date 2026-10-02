local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchDeveloperProductModule = require(script.Parent.fetchDeveloperProduct)
local _ = require(script.Parent.DeveloperProductStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchDeveloperProductModule (ref), promiseModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchDeveloperProductModule (copy), t (ref)
		return fetchDeveloperProductModule.list(p2, t)
	end)
	
	local function list(p2)
		-- upvalues: fetchDeveloperProductModule (copy), t (ref), var1 (ref)
		return fetchDeveloperProductModule.list(p2, t):andThen(function(p3)
			-- upvalues: var1 (copy), p2 (ref)
			var1.update(p2, p3)
			
			return p3
		end)
	end
	
	local function get(p2, p3)
		-- upvalues: fetchDeveloperProductModule (copy), t (ref)
		return fetchDeveloperProductModule.get(p2, p3, t)
	end
	
	local function _(p2, p3)
		return {
			errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(p2.productId), p3),
			product = p2
		}
	end
	
	local function readBackMutation(p2, p3, p4)
		-- upvalues: fetchDeveloperProductModule (copy), t (ref), promiseModule (copy), var1 (ref)
		local var2 = fetchDeveloperProductModule.get(p2, p3.productId, t)
		
		return (if p4 == nil then var2:catch(function()
			-- upvalues: p3 (ref)
			return p3
		end) else var2:catch(function()
			-- upvalues: promiseModule (copy), p3 (ref)
			return promiseModule.reject({
				errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(p3.productId), "the product could not be read back"),
				product = p3
			})
		end)):andThen(function(p5)
			-- upvalues: var1 (copy), p2 (ref), p4 (ref), promiseModule (copy), p3 (ref)
			var1.fetch(p2)
			
			if p4 == nil or p5.iconImageAssetId == p4 then
				return p5
			end
			local var3 = p3
			
			return promiseModule.reject({
				errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(var3.productId), "the stored icon did not match the returned icon"),
				product = var3
			})
		end)
	end
	
	return {
		getProducts = var1.get,
		fetchProducts = var1.fetch,
		getAndFetchProducts = var1.getAndFetch,
		list = list,
		get = get,
		create = function(p2, p3)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref), promiseModule (copy), readBackMutation (ref)
			return fetchDeveloperProductModule.create(p2, p3, t):andThen(function(p4)
				-- upvalues: p3 (ref), promiseModule (copy), readBackMutation (copy), p2 (ref)
				return if p3.imageFile == nil or p4.iconImageAssetId ~= nil then readBackMutation(p2, p4, if p3.imageFile ~= nil then nil else p4.iconImageAssetId) else promiseModule.reject({
					errorMessage = ("Developer product %s was created, but its uploaded image could not be verified because %s. Do not create another product; inspect the existing product before retrying."):format(tostring(p4.productId), "the API did not return an image asset ID"),
					product = p4
				})
			end)
		end,
		update = function(p2, p3, p4)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref), readBackMutation (ref)
			return fetchDeveloperProductModule.update(p2, p3, p4, t):andThen(function(p5)
				-- upvalues: readBackMutation (copy), p2 (ref)
				return readBackMutation(p2, p5)
			end)
		end,
		activate = function(p2, p3)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref), readBackMutation (ref)
			return fetchDeveloperProductModule.activate(p2, p3, t):andThen(function(p4)
				-- upvalues: readBackMutation (copy), p2 (ref)
				return readBackMutation(p2, p4)
			end)
		end,
		deactivate = function(p2, p3)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref), readBackMutation (ref)
			return fetchDeveloperProductModule.deactivate(p2, p3, t):andThen(function(p4)
				-- upvalues: readBackMutation (copy), p2 (ref)
				return readBackMutation(p2, p4)
			end)
		end,
		clear = function()
			-- upvalues: var1 (ref)
			var1.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref)
			var1.dispose()
		end
	}
end