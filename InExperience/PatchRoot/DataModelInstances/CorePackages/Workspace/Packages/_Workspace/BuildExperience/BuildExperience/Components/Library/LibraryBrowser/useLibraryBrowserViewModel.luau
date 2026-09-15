local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Parent.LibraryDataStore)
local libraryCategoriesModule = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryBrowserView)
local _ = require(script.Parent.Parent.LibraryTypes)
local useDataLibraryModule = require(script.Parent.Parent.useDataLibrary)
local useLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

local function useCarousel(p1, p2)
	-- upvalues: reactModule (ref), signalsReactModule (ref), signalsModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), p2 (ref)
		return { offset = 0, limit = 6, source = p1.source, itemKind = p2 }
	end, { p1.source, p2 })
	local var2 = signalsReactModule.useSignalState(p1.getList(var1).data)
	local var3 = if var2 ~= nil then nil else var2.generation
	local var4, var5 = reactModule.useState({ request = var1, generation = var3, offsets = {} })
	local var6 = if var4.request == var1 and var4.generation == var3 then var4.offsets else nil
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7.current = nil
	end, { var1, var3 or false })
	local var8 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var6 (ref), var3 (ref), p1 (ref), p2 (ref)
		local list = { var1 }
		
		if var6 ~= nil and var3 ~= nil then
			for i, v in var6 do
				table.insert(list, {
					limit = 6,
					source = p1.source,
					itemKind = p2,
					offset = v,
					generation = var3
				})
			end
		end
		return list
	end, {
		var1,
		var6,
		var3,
		p1.source,
		p2
	})
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), p1 (ref)
		local t = {}
		
		for i, v in var8 do
			table.insert(t, p1.getList(v))
		end
		return t
	end, { var8, p1.getList, p1.status })
	local var10 = var8[#var8]
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var10 (ref)
		if p1.status == "Ready" then
			p1.getAndFetchList(var10)
			
			return
		end
	end, { var10, p1.getAndFetchList, p1.status })
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), p1 (ref), var9 (ref), var3 (ref), var8 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: p1 (copy), var9 (copy), var3 (copy), var8 (copy)
			local var12 = if p1.status == "Failed" then "Failed" else "Loading"
			local t = {}
			local t_1 = {}
			local var13 = false
			local var14 = 0
			local var15 = false
			local var16 = false
			local var17 = nil
			
			for i, v in var9 do
				if p1.status ~= "Ready" then break end
				local var18 = v.status(p3)
				local var19 = v.data(p3)
				
				if var18 == "Failed" or i > 1 and var19 ~= nil and var19.generation ~= var3 then
					var17 = var8[i]
					var16 = i > 1
					var12 = if i == 1 then "Failed" else "Ready"
					var13 = false
					break
				elseif var18 == "Ready" and var19 ~= nil then
					var12 = "Ready"
					
					for i_1, v_1 in var19.itemIds do
						if not t_1[v_1] then
							t_1[v_1] = true
							local var20 = p1.getItem({ source = p1.source, itemId = v_1 }).data(p3)
							
							if var20 ~= nil then
								table.insert(t, var20)
							end
						end
					end
					var14 = var19.nextOffset
					var13 = var19.hasMore and var8[i].offset < var14
				else
					var15 = i > 1
					var13 = false
					break
				end
			end
			return {
				status = var12,
				items = t,
				hasMore = var13,
				nextOffset = var14,
				isLoadingMore = var15,
				loadMoreFailed = var16,
				failedRequest = var17
			}
		end)
	end, {
		var9, var8, var3, p1.source, p1.getItem, p1.status
	}))
	local var21 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var3 (ref), var7 (ref), var6 (ref), var5 (ref), var1 (ref)
		if var11.hasMore and var3 ~= nil and var7.current ~= var11.nextOffset then
			var7.current = var11.nextOffset
			local var22 = if var6 ~= nil then {} else table.clone(var6)
			table.insert(var22, var11.nextOffset)
			var5({ request = var1, generation = var3, offsets = var22 })
			
			return
		end
	end, {
		var11.hasMore,
		var11.nextOffset,
		var3,
		var6,
		var1
	})
	
	return {
		itemKind = p2,
		firstList = var2,
		state = var11,
		onScrollChanged = reactModule.useCallback(function(p4)
			-- upvalues: var21 (ref)
			if p4.AbsoluteWindowSize.X > 0 and p4.AbsoluteCanvasSize.X > 0 and p4.AbsoluteCanvasSize.X - 192 <= p4.CanvasPosition.X + p4.AbsoluteWindowSize.X then
				var21()
			end
		end, { var21 }),
		onRetry = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var11 (ref), var1 (ref)
			p1.fetchList(var11.failedRequest or var1)
		end, { p1.fetchList, var11.failedRequest, var1 })
	}
end

return function(p3)
	-- upvalues: useLibraryStringsModule (ref), useDataLibraryModule (ref), useCarousel (ref), reactModule (ref), sendBuildExperienceEventModule (ref), libraryCategoriesModule (ref)
	local var12 = useLibraryStringsModule()
	local var13 = useDataLibraryModule({ source = p3.source })
	local list = {
		useCarousel(var13, "Model"),
		useCarousel(var13, "Image"),
		useCarousel(var13, "Sound")
	}
	local t = {}
	local var14 = "Ready"
	
	for i, v in list do
		if v.firstList ~= nil then
			table.insert(t, v.firstList)
		end
		if v.state.status == "Failed" then
			var14 = "Failed"
		elseif var14 ~= "Failed" and v.state.status ~= "Ready" then
			var14 = "Loading"
		end
	end
	local notReady = reactModule.useRef("NotReady")
	reactModule.useEffect(function()
		-- upvalues: var14 (write), notReady (ref), sendBuildExperienceEventModule (copy), p3 (ref)
		if var14 == "Failed" and notReady.current ~= "Failed" then
			sendBuildExperienceEventModule("LIBRARY_FETCH_FAILED", { universeId = p3.universeId }, {})
		end
		notReady.current = var14
	end, { var14, p3.universeId })
	
	local function onRetry()
		-- upvalues: var13 (ref), list (ref)
		if var13.status ~= "Ready" then
			var13.retrySource()
			
			return
		end
		for i, v in list do
			v.onRetry()
		end
	end
	
	local t_1 = {}
	
	for i_1, v_1 in libraryCategoriesModule.fromLists(t) do
		local v_2
		local var15 = list[if v_1.itemKind == "Model" then 1 elseif v_1.itemKind == "Image" then 2 else 3]
		local t_2 = {}
		
		for i_2, v_2 in var15.state.items do
			table.insert(t_2, {
				tileKey = `library-item-{v_2.id}`,
				itemId = v_2.id,
				itemKind = v_2.kind,
				displayName = v_2.displayName,
				thumbnail = v_2.image,
				model = v_2.model,
				item = v_2,
				onActivated = if p3.onOpenItem == nil then nil else function()
					-- upvalues: p3 (ref), v_2 (ref)
					p3.onOpenItem(v_2.id, v_2.kind)
				end
			})
		end
		local var16 = if p3.onOpenCategory == nil then nil else function()
			-- upvalues: p3 (ref), v_1 (ref)
			p3.onOpenCategory(v_1.itemKind, v_1.key, v_1.title)
		end
		i_2 = {
			categoryKey = v_1.key,
			sectionTitle = v_1.sectionTitle,
			itemKind = v_1.itemKind,
			title = v_1.title,
			items = t_2,
			status = var15.state.status,
			hasMore = var15.state.hasMore,
			isLoadingMore = var15.state.isLoadingMore,
			loadMoreFailed = var15.state.loadMoreFailed,
			onScrollChanged = var15.onScrollChanged
		}
		v_2 = if var15.state.hasMore or var15.state.isLoadingMore or var15.state.loadMoreFailed then "Incomplete" else "Complete"
		i_2.coverage = v_2
		i_2.onOpenCategory = var16
		i_2.onOpenSection = var16
		i_2.onRetry = var15.onRetry
		table.insert(t_1, i_2)
	end
	return {
		categories = t_1,
		status = var14,
		onRetry = onRetry,
		strings = var12,
		onBack = p3.onBack,
		presentation = p3.presentation
	}
end