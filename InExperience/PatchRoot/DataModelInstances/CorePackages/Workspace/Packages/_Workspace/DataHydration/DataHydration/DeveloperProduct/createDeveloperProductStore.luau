local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchDeveloperProductModule = require(script.Parent.fetchDeveloperProduct)
local _ = require(script.Parent.DeveloperProductStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchDeveloperProductModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchDeveloperProductModule (copy), t (ref)
		return fetchDeveloperProductModule.list(p2, t)
	end)
	
	local function readBackMutation(p2, p3)
		-- upvalues: fetchDeveloperProductModule (copy), t (ref), var1 (ref)
		return fetchDeveloperProductModule.get(p2, p3.productId, t):catch(function()
			-- upvalues: p3 (ref)
			return p3
		end):andThen(function(p4)
			-- upvalues: var1 (copy), p2 (ref)
			var1.fetch(p2)
			
			return p4
		end)
	end
	
	return {
		getProducts = var1.get,
		fetchProducts = var1.fetch,
		getAndFetchProducts = var1.getAndFetch,
		list = function(p2)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref), var1 (ref)
			return fetchDeveloperProductModule.list(p2, t):andThen(function(p3)
				-- upvalues: var1 (copy), p2 (ref)
				var1.update(p2, p3)
				
				return p3
			end)
		end,
		get = function(p2, p3)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref)
			return fetchDeveloperProductModule.get(p2, p3, t)
		end,
		create = function(p2, p3)
			-- upvalues: fetchDeveloperProductModule (copy), t (ref), readBackMutation (ref)
			return fetchDeveloperProductModule.create(p2, p3, t):andThen(function(p4)
				-- upvalues: readBackMutation (copy), p2 (ref)
				return readBackMutation(p2, p4)
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