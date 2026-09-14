local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local logger = require(parent.Loggers).Logger
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local assetLibraryCategoriesModule = require(script.Parent.AssetLibraryCategories)
local collectDataModelLibrarySnapshotModule = require(script.Parent.collectDataModelLibrarySnapshot)
local _ = require(buildExperience.Components.ModelLibrary.collectWorkspaceModels)
local createDataModelAssetLibraryHydrationModule = require(script.Parent.createDataModelAssetLibraryHydration)
local t = {}
local tbl = setmetatable({}, { __mode = "k" })
local tbl_1 = setmetatable({}, { __mode = "k" })
local var1 = 0

local function projectCurrentTeamCreateSnapshot(p1)
	-- upvalues: assetLibraryCategoriesModule (ref)
	local t = {}
	
	for i, v in p1.categories do
		for i_1, v_1 in v.items do
			table.insert(t, v_1)
		end
	end
	local t_1 = {}
	
	for i_1, v_1 in assetLibraryCategoriesModule.definitions do
		local t_2 = {}
		
		for i_2, v_2 in t do
			if assetLibraryCategoriesModule.matches(v_1.key, v_2) then
				table.insert(t_2, v_2)
			end
		end
		table.insert(t_1, {
			hasMore = false,
			key = v_1.key,
			kind = v_1.assetType,
			count = #t_2,
			items = t_2,
			nextOffset = #t_2
		})
	end
	return {
		categories = t_1,
		itemsById = p1.itemsById,
		generation = p1.generation
	}
end

local function metadataSignature(value)
	local list = { tostring(value.generation or 0) }
	
	for i, v in value.categories or {} do
		table.insert(list, `{tostring(v.key)}:{tostring(v.count or 0)}`)
	end
	return table.concat(list, "|")
end

local function snapshotContentSignature(value)
	local t = {}
	
	for i, v in value.categories do
		table.insert(t, `{tostring(v.key)}:{tostring(v.count or #v.items)}`)
		
		for i_1, v_1 in v.items do
			table.insert(t, v_1.id)
		end
	end
	return table.concat(t, "|")
end

local function _(p2)
	if p2 ~= nil then
		return p2
	end
	local ok, status = pcall(function()
		return game:GetService("ExperienceService")
	end)
	
	return if ok then status else nil
end

local var2 = nil
var2 = createDataModelAssetLibraryHydrationModule({
	fetchSnapshot = function(p2, p3)
		-- upvalues: t (ref), promiseModule (ref), collectDataModelLibrarySnapshotModule (ref), projectCurrentTeamCreateSnapshot (ref), snapshotContentSignature (ref), metadataSignature (ref)
		local var3 = t[p2]
		
		return promiseModule.new(function(p4, p5)
			-- upvalues: var3 (ref), p2 (ref), collectDataModelLibrarySnapshotModule (copy), p3 (ref), projectCurrentTeamCreateSnapshot (copy), snapshotContentSignature (copy), metadataSignature (copy)
			if var3 == nil then
				p5(`Unknown Asset Library source {p2}`)
				
				return
			elseif var3.dependencies == nil then
				local var4
				local experienceService = var3.experienceService
				
				if experienceService == nil then
					local ok, status = pcall(function()
						return game:GetService("ExperienceService")
					end)
					var4 = if ok then status else nil
				else
					var4 = experienceService
				end
				if var4 == nil or var3.placeId == nil then
					p5("ExperienceService or placeId unavailable")
					
					return
				elseif not var3.viewerStarted then
					local ok, status = pcall(function()
						-- upvalues: var4 (ref), var3 (copy)
						var4:StartCrossExperience("BuildAssetLibrary", { placeId = var3.placeId })
					end)
					
					if not ok then
						p5(status)
						
						return
					end
					var3.viewerStarted = true
				end
				local ok, status = pcall(function()
					-- upvalues: var4 (ref), var3 (copy), metadataSignature (copy), p3 (copy), p4 (ref), collectDataModelLibrarySnapshotModule (copy), p5 (ref)
					var4:ExecuteCrossExperienceCall("BuildAssetLibrary.GetSnapshot", { placeId = var3.placeId }, function(p6)
						-- upvalues: metadataSignature (copy), p3 (copy), var3 (copy), p4 (copy), collectDataModelLibrarySnapshotModule (copy), p5 (copy)
						local var5 = metadataSignature(p6)
						
						if p3 ~= nil and var5 == var3.lastMetadataSignature then
							p4(p3)
							
							return
						end
						local ok, status = pcall(collectDataModelLibrarySnapshotModule.collectSerializedPayload, p6, (if p3 then p3.generation else 0) + 1)
						
						if ok then
							var3.lastMetadataSignature = var5
							p4(status)
							
							return
						end
						p5(status)
					end, p5)
				end)
				
				if not ok then
					p5(status)
				end
				return
			else
				local ok, status = pcall(collectDataModelLibrarySnapshotModule.collect, var3.dependencies, (if p3 then p3.generation else 0) + 1)
				
				if not ok then
					p5(status)
					
					return
				end
				status = projectCurrentTeamCreateSnapshot(status)
				
				if p3 == nil or snapshotContentSignature(p3) ~= snapshotContentSignature(status) then
					p4(status)
					
					return
				end
				p4(p3)
			end
		end)
	end,
	fetchCategoryPage = function(p2, _)
		-- upvalues: t (ref), promiseModule (ref), var2 (write), collectDataModelLibrarySnapshotModule (ref)
		local sourceKey = t[p2.sourceKey]
		
		return promiseModule.new(function(p3, p4)
			-- upvalues: sourceKey (ref), p2 (ref), var2 (copy), collectDataModelLibrarySnapshotModule (copy)
			if sourceKey == nil then
				p4(`Unknown Asset Library source {p2.sourceKey}`)
				
				return
			elseif sourceKey.dependencies == nil then
				local var3
				local experienceService = sourceKey.experienceService
				
				if experienceService == nil then
					local ok, status = pcall(function()
						return game:GetService("ExperienceService")
					end)
					var3 = if ok then status else nil
				else
					var3 = experienceService
				end
				if var3 == nil then
					p4("ExperienceService unavailable")
					
					return
				end
				local ok, status = pcall(function()
					-- upvalues: var3 (ref), p2 (copy), collectDataModelLibrarySnapshotModule (copy), p3 (ref), p4 (ref)
					var3:ExecuteCrossExperienceCall("BuildAssetLibrary.GetCategoryPage", {
						categoryKey = p2.categoryKey,
						offset = p2.offset,
						limit = p2.limit,
						query = p2.query
					}, function(p5)
						-- upvalues: collectDataModelLibrarySnapshotModule (copy), p3 (copy), p4 (copy)
						local ok, status = pcall(collectDataModelLibrarySnapshotModule.collectSerializedCategoryPayload, p5)
						
						if ok then
							p3(status)
							
							return
						end
						p4(status)
					end, p4)
				end)
				
				if not ok then
					p4(status)
				end
				return
			else
				local var4 = var2.getSnapshot(p2.sourceKey).data(false)
				
				if var4 == nil then
					p4("Asset Library snapshot unavailable")
					
					return
				end
				local t = {}
				local kind = nil
				
				if p2.categoryKey == "Models" then
					kind = "Model"
					
					for i, v in var4.itemsById do
						if v.kind == "Model" then
							table.insert(t, v)
						end
					end
					table.sort(t, function(p5, p6)
						return if p5.displayName == p6.displayName then p5.id < p6.id else p5.displayName < p6.displayName
					end)
				elseif p2.categoryKey == "Images" then
					kind = "Image"
					
					for i, v in var4.itemsById do
						if v.kind == "Image" then
							table.insert(t, v)
						end
					end
					table.sort(t, function(p5, p6)
						return if p5.displayName == p6.displayName then p5.id < p6.id else p5.displayName < p6.displayName
					end)
				else
					for i, v in var4.categories do
						if v.key == p2.categoryKey then
							t = v.items
							kind = v.kind
							break
						end
					end
				end
				if kind == nil then
					p4(`Unknown Asset Library category {p2.categoryKey}`)
					
					return
				elseif p2.query ~= "" then
					local t_1 = {}
					local lowerText = string.lower(p2.query)
					
					for i, v in t do
						if string.find(string.lower(`{v.displayName} {v.path}`), lowerText, 1, true) ~= nil then
							table.insert(t_1, v)
						end
					end
					t = t_1
				end
				local t_1 = {}
				
				for i = p2.offset + 1, math.min(#t, p2.offset + p2.limit) do
					table.insert(t_1, t[i])
				end
				p3({
					key = p2.categoryKey,
					kind = kind,
					count = #t,
					items = t_1,
					hasMore = p2.offset + #t_1 < #t,
					nextOffset = p2.offset + #t_1
				})
			end
		end)
	end,
	fetchPreview = function(p5, p6, p7)
		-- upvalues: t (ref), promiseModule (ref), var2 (write), collectDataModelLibrarySnapshotModule (ref)
		local var5 = t[p5]
		
		return promiseModule.new(function(p8, p9)
			-- upvalues: var5 (ref), p5 (ref), p7 (ref), var2 (copy), p6 (ref), collectDataModelLibrarySnapshotModule (copy)
			if var5 == nil then
				p9(`Unknown Asset Library source {p5}`)
				
				return
			elseif p7 ~= nil and p7.model ~= nil then
				p8(p7)
				
				return
			elseif var5.dependencies == nil then
				local var6
				local experienceService = var5.experienceService
				
				if experienceService == nil then
					local ok, status = pcall(function()
						return game:GetService("ExperienceService")
					end)
					var6 = if ok then status else nil
				else
					var6 = experienceService
				end
				if var6 == nil then
					p9("ExperienceService unavailable")
					
					return
				end
				local ok, status = pcall(function()
					-- upvalues: var6 (ref), p6 (copy), collectDataModelLibrarySnapshotModule (copy), p8 (ref), p9 (ref)
					var6:ExecuteCrossExperienceCall("BuildAssetLibrary.GetPreview", { itemId = p6 }, function(p10)
						-- upvalues: collectDataModelLibrarySnapshotModule (copy), p8 (copy), p9 (copy)
						local ok, status = pcall(collectDataModelLibrarySnapshotModule.collectSerializedCategoryPayload, p10)
						
						if ok and status.items[1] ~= nil then
							p8(status.items[1])
							
							return
						end
						p9(if ok then "Asset Library preview is empty" else status)
					end, p9)
				end)
				
				if not ok then
					p9(status)
				end
				return
			else
				local var7 = var2.getSnapshot(p5).data(false)
				local var8 = if var7 ~= nil then nil else var7.itemsById[p6]
				
				if var8 == nil then
					p9(`Unknown Asset Library item {p6}`)
					
					return
				end
				p8(var8)
			end
		end)
	end
})

local function getSource(p5)
	-- upvalues: t (ref), tbl (ref), tbl_1 (ref), var1 (write)
	if p5.dependencies == nil then
		local placeId = `place:{tostring(p5.placeId)}`
		local var5 = t[placeId]
		
		if var5 == nil then
			var5 = {
				viewerStarted = false,
				retainCount = 0,
				placeId = p5.placeId,
				experienceService = p5.experienceService
			}
			t[placeId] = var5
			
			return placeId, var5
		end
		var5.experienceService = p5.experienceService
		
		return placeId, var5
	else
		local workspace = p5.dependencies.workspace
		local var6 = if workspace ~= nil then tbl_1[p5.dependencies] else tbl[workspace]
		
		if var6 == nil then
			var1 += 1
			var6 = `workspace:{var1}`
			
			if workspace == nil then
				tbl_1[p5.dependencies] = var6
			else
				tbl[workspace] = var6
			end
		end
		local var7 = t[var6]
		
		if var7 == nil then
			var7 = {
				viewerStarted = true,
				retainCount = 0,
				dependencies = p5.dependencies
			}
			t[var6] = var7
			
			return var6, var7
		end
		var7.dependencies = p5.dependencies
		
		return var6, var7
	end
end

return function(value)
	-- upvalues: getSource (ref), var2 (write), signalsReactModule (ref), reactModule (ref), signalsModule (ref), logger (ref)
	local var5, var6 = getSource(value)
	local snapshot = var2.getSnapshot(var5)
	local var7 = signalsReactModule.useSignalState(snapshot.data)
	local var8 = signalsReactModule.useSignalState(snapshot.status)
	local var9 = reactModule.useRef(var7)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useRef({})
	local var13 = reactModule.useRef(value.scheduleDelay)
	local var14 = reactModule.useRef(value.cancelDelay)
	var13.current = value.scheduleDelay
	var14.current = value.cancelDelay
	local var15 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var2 (copy), var5 (ref)
		var11(false)
		var2.refreshSnapshot(var5)
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var2 (copy), var5 (ref)
		var6.retainCount += 1
		
		if var6.pendingRelease ~= nil then
			task.cancel(var6.pendingRelease)
			var6.pendingRelease = nil
		end
		if var6.dependencies == nil and not var6.viewerStarted then
			var2.refreshSnapshot(var5)
		end
		return function()
			-- upvalues: var6 (copy)
			var6.retainCount -= 1
			
			if var6.dependencies == nil and var6.retainCount <= 0 then
				var6.pendingRelease = task.delay(0.1, function()
					-- upvalues: var6 (copy)
					var6.pendingRelease = nil
					
					if var6.retainCount > 0 or not var6.viewerStarted then return end
					local var16
					local experienceService = var6.experienceService
					
					if experienceService == nil then
						local ok, status = pcall(function()
							return game:GetService("ExperienceService")
						end)
						var16 = if ok then status else nil
					else
						var16 = experienceService
					end
					if var16 ~= nil then
						pcall(function()
							-- upvalues: var16 (ref), var6 (copy)
							var16:StopCrossExperience("BuildAssetLibrary", { placeId = var6.placeId })
						end)
					end
					var6.viewerStarted = false
					var6.lastMetadataSignature = nil
				end)
				
				return
			end
		end
	end, { var6, var5 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref)
		return function()
			-- upvalues: var12 (copy)
			for i, v in var12.current do
				v()
			end
			var12.current = {}
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var2 (copy), var5 (ref), var9 (ref), var13 (ref), var14 (ref), var11 (ref)
		if var6.dependencies == nil then
			if var9.current == nil then
				local var16 = if var13.current ~= nil then function(p5, p6)
					return task.delay(p5, p6)
				end else var13.current
				local var17 = if var14.current ~= nil then function(p5)
					task.cancel(p5)
				end else var14.current
				local var18 = 1
				local var19 = nil
				local var20 = false
				
				local function poll()
					-- upvalues: var20 (write), var18 (write), var11 (copy), var2 (copy), var5 (copy), var19 (write), var16 (ref), poll (ref)
					if var20 then return end
					if var18 >= 60 then
						var11(true)
						
						return
					elseif var2.getSnapshot(var5).data(false) == nil then
						var19 = var16(1, function()
							-- upvalues: var19 (copy), var2 (copy), var5 (copy), var18 (copy), poll (copy)
							var19 = nil
							
							if var2.getSnapshot(var5).data(false) == nil then
								var18 += 1
								var2.refreshSnapshot(var5)
								poll()
								
								return
							end
						end)
						
						return
					end
				end
				
				poll()
				
				return function()
					-- upvalues: var20 (write), var19 (write), var17 (ref)
					var20 = true
					
					if var19 ~= nil then
						var17(var19)
					end
				end
			end
			return
		else
			local workspace = var6.dependencies.workspace
			
			if workspace == nil then
				return
			end
			local var21 = nil
			
			local function scheduleRewalk()
				-- upvalues: var21 (write), var2 (copy), var5 (copy)
				if var21 ~= nil then
					task.cancel(var21)
				end
				var21 = task.delay(0.25, function()
					-- upvalues: var21 (copy), var2 (copy), var5 (copy)
					var21 = nil
					var2.refreshSnapshot(var5)
				end)
			end
			
			local list = {
				workspace.ChildAdded:Connect(scheduleRewalk),
				workspace.ChildRemoved:Connect(scheduleRewalk),
				workspace.DescendantAdded:Connect(scheduleRewalk),
				workspace.DescendantRemoving:Connect(scheduleRewalk)
			}
			
			return function()
				-- upvalues: var21 (write), list (ref)
				if var21 ~= nil then
					task.cancel(var21)
				end
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { var6.dependencies, var5 })
	
	return {
		snapshot = var7,
		status = if var8 == "Ready" then "Ready" elseif var8 == "Failed" and (var6.dependencies ~= nil or var10) then "Failed" else "Loading",
		onRetry = var15,
		requestCategoryPage = reactModule.useCallback(function(p5, p6, p7, p8, p9, p10)
			-- upvalues: var2 (copy), var5 (ref), var7 (ref), signalsModule (copy), logger (copy), var12 (ref)
			local categoryPage = var2.getCategoryPage(var5, p5, if var7 then var7.generation else 0, math.max(0, p6), math.min(24, math.max(1, p7)), p8)
			local var22 = false
			local var23 = nil
			table.insert(var12.current, signalsModule.createEffect(function(p11)
				-- upvalues: var22 (write), categoryPage (ref), p9 (ref), logger (copy), p5 (ref), p10 (ref), var23 (write)
				if var22 then return end
				local var24 = categoryPage.status(p11)
				
				if var24 == "Ready" then
					local var25 = categoryPage.data(p11)
					
					if var25 ~= nil then
						var22 = true
						p9(var25)
					end
				elseif var24 == "Failed" then
					var22 = true
					logger:warning("BuildAssetLibrary category hydration failed: {}", p5)
					p10()
				end
				if var22 then
					task.defer(function()
						-- upvalues: var23 (copy)
						if var23 ~= nil then
							var23()
						end
					end)
				end
			end))
		end, { var7, var5 }),
		requestPreview = reactModule.useCallback(function(p5, p6, p7)
			-- upvalues: var2 (copy), var5 (ref), signalsModule (copy), logger (copy), var12 (ref)
			local preview = var2.getPreview(var5, p5)
			local var22 = false
			local var23 = nil
			table.insert(var12.current, signalsModule.createEffect(function(p8)
				-- upvalues: var22 (write), preview (ref), p6 (ref), logger (copy), p5 (ref), p7 (ref), var23 (write)
				if var22 then return end
				local var24 = preview.status(p8)
				
				if var24 == "Ready" then
					local var25 = preview.data(p8)
					
					if var25 ~= nil then
						var22 = true
						p6(var25)
					end
				elseif var24 == "Failed" then
					var22 = true
					logger:warning("BuildAssetLibrary preview hydration failed: {}", p5)
					p7()
				end
				if var22 then
					task.defer(function()
						-- upvalues: var23 (copy)
						if var23 ~= nil then
							var23()
						end
					end)
				end
			end))
		end, { var5 })
	}
end