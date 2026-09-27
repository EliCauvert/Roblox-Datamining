local buildExperience = script:FindFirstAncestor("BuildExperience")
local signalsReactModule = require(buildExperience.Parent.SignalsReact)
local _ = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryCategoryView)
local _ = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.Parent.LibraryTypes)
local useLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local useLibraryItemsModule = require(script.Parent.Parent.useLibraryItems)
local getFolderPreviewModule = require(script.Parent.Parent.getFolderPreview)

return function(p1)
	-- upvalues: useLibraryStringsModule (ref), signalsReactModule (ref), useLibraryItemsModule (ref), getFolderPreviewModule (ref)
	local var1 = useLibraryStringsModule()
	local var2 = signalsReactModule.useSignalState(p1.library.getItems)
	local var3, var4, var5 = useLibraryItemsModule(p1.library, var2, p1.itemKind, p1.query, 24, p1.categoryKey, p1.folderId)
	local t = {}
	
	for i, v in var3 do
		table.insert(t, {
			tileKey = `library-item-{v.id}`,
			itemId = v.id,
			itemKind = v.kind,
			isFolder = v.className == "Folder",
			folderPreview = getFolderPreviewModule(v, var2),
			displayName = v.displayName,
			unavailableText = var1.modelUnavailable,
			thumbnail = v.image,
			model = v.model,
			onActivated = function()
				-- upvalues: v (ref), p1 (ref)
				if v.className == "Folder" then
					if p1.onOpenCategory == nil then
						return
					else
						p1.onOpenCategory(v.kind, v.id, v.displayName, v.id)
						
						return
					end
				else
					p1.onOpenItem(v.id, v.kind)
				end
			end
		})
	end
	return {
		items = t,
		status = if p1.isReady then "Ready" else "Loading",
		hasMore = p1.isReady and var4,
		strings = {
			empty = if p1.query ~= "" then var1.empty else var1.searchEmpty
		},
		onLoadMore = var5
	}
end