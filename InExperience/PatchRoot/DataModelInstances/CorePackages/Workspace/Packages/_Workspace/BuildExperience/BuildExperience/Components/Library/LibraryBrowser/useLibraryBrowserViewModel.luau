local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local libraryCategoriesModule = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryBrowserView)
local _ = require(script.Parent.Parent.LibraryTypes)
local useLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local useLibraryItemsModule = require(script.Parent.Parent.useLibraryItems)
local getFolderPreviewModule = require(script.Parent.Parent.getFolderPreview)
local _ = require(script.Parent.Parent.LibraryWorldCutout.LibraryWorldCutoutView)

local function useCarousel(p1, p2, p3, p4)
	-- upvalues: useLibraryItemsModule (ref), reactModule (ref)
	local var1, var2, var3 = useLibraryItemsModule(p1, p2, p3, p4, 6)
	
	return {
		items = var1,
		hasMore = var2,
		onScrollChanged = reactModule.useCallback(function(p5)
			-- upvalues: var3 (ref)
			if p5.AbsoluteWindowSize.X > 0 and p5.AbsoluteCanvasSize.X > 0 and p5.AbsoluteCanvasSize.X - 192 <= p5.CanvasPosition.X + p5.AbsoluteWindowSize.X then
				var3()
			end
		end, { var3 })
	}
end

return function(p1)
	-- upvalues: useLibraryStringsModule (ref), signalsReactModule (ref), useCarousel (ref), libraryCategoriesModule (ref), getFolderPreviewModule (ref)
	local var1 = useLibraryStringsModule()
	local var2 = signalsReactModule.useSignalState(p1.library.getItems)
	local query = p1.query
	local t = {
		Model = useCarousel(p1.library, var2, "Model", query),
		Image = useCarousel(p1.library, var2, "Image", query),
		Sound = useCarousel(p1.library, var2, "Sound", query)
	}
	local t_1 = {}
	
	for i, v in t do
		for i_1, v_1 in v.items do
			table.insert(t_1, v_1)
		end
	end
	local var3 = if p1.isReady then "Ready" else "Loading"
	local t_2 = {}
	
	for i_1, v_1 in libraryCategoriesModule.fromItems(t_1, var1) do
		local itemKind = t[v_1.itemKind]
		local t_3 = {}
		
		for i_2, v_2 in itemKind.items do
			table.insert(t_3, {
				tileKey = `library-item-{v_2.id}`,
				itemId = v_2.id,
				itemKind = v_2.kind,
				isFolder = v_2.className == "Folder",
				folderPreview = getFolderPreviewModule(v_2, var2),
				displayName = v_2.displayName,
				unavailableText = var1.modelUnavailable,
				thumbnail = v_2.image,
				model = v_2.model,
				onActivated = if p1.onOpenItem == nil and p1.onOpenCategory == nil then nil else function()
					-- upvalues: v_2 (ref), p1 (ref)
					if v_2.className == "Folder" then
						if p1.onOpenCategory == nil then
							return
						else
							p1.onOpenCategory(v_2.kind, v_2.id, v_2.displayName, v_2.id)
							
							return
						end
					elseif p1.onOpenItem ~= nil then
						p1.onOpenItem(v_2.id, v_2.kind)
					end
				end
			})
		end
		table.insert(t_2, {
			categoryKey = v_1.key,
			itemKind = v_1.itemKind,
			title = v_1.title,
			items = t_3,
			status = var3,
			hasMore = itemKind.hasMore,
			onScrollChanged = itemKind.onScrollChanged,
			onOpenCategory = if p1.onOpenCategory == nil then nil else function()
				-- upvalues: p1 (ref), v_1 (ref)
				p1.onOpenCategory(v_1.itemKind, v_1.key, v_1.title)
			end
		})
	end
	return {
		categories = t_2,
		status = var3,
		strings = var1,
		worldCutout = p1.worldCutout
	}
end