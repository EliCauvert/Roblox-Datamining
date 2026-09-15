local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryCategoryView)
local _ = require(script.Parent.Parent.LibraryDataStore)
local _ = require(script.Parent.Parent.LibraryTypes)
local useDataLibraryModule = require(script.Parent.Parent.useDataLibrary)
local useLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local createLibraryBrowseStoreModule = require(buildExperience.Stores.Library.createLibraryBrowseStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1)
	-- upvalues: useLibraryStringsModule (ref), reactModule (ref), createLibraryBrowseStoreModule (ref), useDataLibraryModule (ref), signalsReactModule (ref), signalsModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = useLibraryStringsModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), createLibraryBrowseStoreModule (copy)
		return if p1.browseStore == nil then createLibraryBrowseStoreModule({ initialQuery = p1.query }) else p1.browseStore
	end, { p1.browseStore, p1.query })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		return function()
			-- upvalues: p1 (copy), var2 (copy)
			if p1.browseStore == nil then
				var2.destroy()
			end
		end
	end, { var2, p1.browseStore })
	local var3 = useDataLibraryModule({ source = p1.source })
	local var4 = signalsReactModule.useSignalState(var2.getDraftQuery)
	local var5 = signalsReactModule.useSignalState(var2.getDebouncedQuery)
	local var6 = reactModule.useRef(false)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref), var5 (ref)
		return {
			offset = 0,
			limit = 24,
			source = var3.source,
			itemKind = p1.itemKind,
			query = var5
		}
	end, { var3.source, p1.itemKind, var5 })
	local var8 = signalsReactModule.useSignalState(var3.getList(var7).data)
	local var9 = if var8 ~= nil then nil else var8.generation
	local var10, var11 = reactModule.useState({ count = 1, request = var7, generation = var9 })
	local var12 = if var10.request == var7 and var10.generation == var9 then var10.count else 1
	local var13 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var9 (ref), var12 (ref), var3 (ref), p1 (ref), var5 (ref)
		local list = { var7 }
		
		if var9 ~= nil then
			for i = 1, var12 - 1 do
				table.insert(list, {
					limit = 24,
					source = var3.source,
					itemKind = p1.itemKind,
					offset = i * 24,
					query = var5,
					generation = var9
				})
			end
		end
		return list
	end, {
		var7, var9 or false, var12, var3.source, p1.itemKind, var5
	})
	local var14 = reactModule.useMemo(function()
		-- upvalues: var13 (ref), var3 (ref)
		local t = {}
		
		for i, v in var13 do
			table.insert(t, var3.getList(v))
		end
		return t
	end, { var13, var3.getList, var3.status })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var13 (ref)
		if var3.status ~= "Ready" then return end
		for i, v in var13 do
			var3.getAndFetchList(v)
		end
	end, { var13, var3.getAndFetchList, var3.status })
	local var15 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var3 (ref), var14 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var3 (copy), var14 (copy)
			local t = {}
			local t_1 = {}
			local t_2 = {}
			local var16 = if var3.status == "Failed" then "Failed" else "Loading"
			local var17 = false
			local var18 = 0
			local var19 = false
			local var20 = false
			local var21 = nil
			
			for i, v in var14 do
				if var3.status ~= "Ready" then break end
				local var22 = v.status(p2)
				local var23 = v.data(p2)
				
				if var22 == "Failed" then
					var21 = i
					var17 = false
					
					if i == 1 then
						var16 = "Failed"
						break
					end
					var16 = "Ready"
					var19 = true
					break
				elseif var22 == "Ready" and var23 ~= nil then
					var16 = "Ready"
					
					for i_1, v_1 in var23.itemIds do
						if not t_2[v_1] then
							t_2[v_1] = true
							table.insert(t, v_1)
							local var24 = var3.getItem({ source = var3.source, itemId = v_1 }).data(p2)
							
							if var24 ~= nil then
								table.insert(t_1, var24)
							end
						end
					end
					var17 = var23.hasMore == true
					var18 = var23.nextOffset or #t
				elseif i > 1 then
					var16 = "Ready"
					var20 = true
				end
				var17 = false
				break
			end
			return {
				itemIds = t,
				models = t_1,
				status = var16,
				hasMore = var17,
				nextOffset = var18,
				loadMoreFailed = var19,
				isLoadingMore = var20,
				failedIndex = var21
			}
		end)
	end, { var3.source, var3.getItem, var14, var3.status }))
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var11 (ref), var7 (ref), var9 (ref)
		var6.current = false
		var11({ count = 1, request = var7, generation = var9 })
	end, { var7, var9 or false })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var6 (ref)
		if not var15.isLoadingMore then
			var6.current = false
		end
	end, { var15.isLoadingMore, var15.nextOffset })
	local t = {}
	
	for i, v in var15.models do
		table.insert(t, {
			tileKey = `library-item-{v.id}`,
			itemId = v.id,
			itemKind = v.kind or "Model",
			displayName = v.displayName,
			thumbnail = v.image,
			model = v.model,
			item = v,
			onActivated = function()
				-- upvalues: p1 (ref), v (ref)
				p1.onOpenItem(v.id, v.kind or "Model")
			end
		})
	end
	return {
		title = if p1.title ~= nil then if p1.categoryKey ~= nil then var1.model else p1.categoryKey else p1.title,
		query = var4,
		items = t,
		status = var15.status,
		hasMore = var15.hasMore,
		loadMoreFailed = var15.loadMoreFailed,
		isLoadingMore = var15.isLoadingMore,
		strings = var1,
		onBack = p1.onBack,
		onLoadMore = reactModule.useCallback(function()
			-- upvalues: var15 (ref), var6 (ref), var11 (ref), var7 (ref), var9 (ref), var12 (ref), sendBuildExperienceEventModule (copy), p1 (ref)
			if var15.hasMore and not var6.current then
				var6.current = true
				var11({ request = var7, generation = var9, count = var12 + 1 })
				sendBuildExperienceEventModule("LIBRARY_LOAD_MORE", { universeId = p1.universeId }, { itemKind = tostring(p1.itemKind) })
				
				return
			end
		end, {
			var15.hasMore, var7, var9 or false, var12, p1.itemKind, p1.universeId
		}),
		onQueryChanged = reactModule.useCallback(function(p3)
			-- upvalues: var2 (ref)
			if p3 == "" then
				var2.clearQuery()
				
				return
			end
			var2.setQuery(p3)
		end, { var2 }),
		onSearchReset = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2.clearQuery()
		end, { var2 }),
		onRetry = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var13 (ref), var15 (ref)
			if var3.status == "Ready" then
				var3.fetchList(var13[var15.failedIndex or 1])
				
				return
			end
			var3.retrySource()
		end, {
			var13,
			var15.failedIndex or false,
			var3.fetchList,
			var3.status,
			var3.retrySource
		}),
		presentation = p1.presentation
	}
end