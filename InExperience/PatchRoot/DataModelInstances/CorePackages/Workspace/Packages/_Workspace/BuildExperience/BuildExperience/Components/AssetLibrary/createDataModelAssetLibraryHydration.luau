local dataHydrationModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration)
local _ = require(script.Parent.collectDataModelLibrarySnapshot)

return function(value)
	-- upvalues: dataHydrationModule (ref)
	local t = {}
	local var1 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		replaceItems = true,
		cache = dataHydrationModule.createDataCache(3600, 60),
		fetchFn = function(p1, p2)
			-- upvalues: t (write), value (ref)
			local var2 = t[p1]
			
			if var2 == nil then
				error(`Missing Asset Library hydration request for {p1}`)
			end
			return if var2.kind == "Snapshot" then value.fetchSnapshot(var2.sourceKey, p2.data(false)) elseif var2.kind == "CategoryPage" then value.fetchCategoryPage(var2.categoryPage, p2.data(false)) else value.fetchPreview(var2.sourceKey, var2.itemId, p2.data(false))
		end,
		logError = function() end
	})
	
	return {
		getSnapshot = function(p3)
			-- upvalues: t (write), var1 (ref)
			local var3 = `snapshot\31{p3}`
			t[var3] = { kind = "Snapshot", sourceKey = p3 }
			
			return var1.getAndFetchItem(var3)
		end,
		refreshSnapshot = function(p3)
			-- upvalues: t (write), var1 (ref)
			local var3 = `snapshot\31{p3}`
			t[var3] = { kind = "Snapshot", sourceKey = p3 }
			
			return var1.fetchItem(var3)
		end,
		getCategoryPage = function(p3, p4, p5, p6, p7, p8)
			-- upvalues: t (write), var1 (ref)
			local lowerText = string.lower(p8 or "")
			local var3 = `{p3}\31{p5}\31{p4}\31{lowerText}\31{p6}\31{p7}`
			t[var3] = {
				kind = "CategoryPage",
				categoryPage = {
					sourceKey = p3,
					categoryKey = p4,
					generation = p5,
					offset = p6,
					limit = p7,
					query = lowerText
				}
			}
			
			return var1.getAndFetchItem(var3)
		end,
		getPreview = function(p3, p4)
			-- upvalues: t (write), var1 (ref)
			local var3 = `preview\31{p3}\31{p4}`
			t[var3] = { kind = "Preview", sourceKey = p3, itemId = p4 }
			
			return var1.getAndFetchItem(var3)
		end,
		clear = function()
			-- upvalues: var1 (ref), t (write)
			var1.clear()
			t = {}
		end,
		dispose = function()
			-- upvalues: var1 (ref), t (write)
			var1.dispose()
			t = {}
		end
	}
end