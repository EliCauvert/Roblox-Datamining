local BuildExperience = script:FindFirstAncestor("BuildExperience")
local SignalsReactModule = require(BuildExperience.Parent.SignalsReact)
local _ = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryCategoryView)
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.Parent.LibraryTypes)
local UseLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local UseLibraryItemsModule = require(script.Parent.Parent.useLibraryItems)
local GetFolderPreviewModule = require(script.Parent.Parent.getFolderPreview)

return function(p1) --[[ Line: 31 | Named "useLibraryCategoryViewModel" ]]
	-- upvalues: UseLibraryStringsModule (copy), SignalsReactModule (copy), UseLibraryItemsModule (copy), GetFolderPreviewModule (copy)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.library.getItems)
	local UseLibraryItemsModuleResult, UseLibraryItemsModuleResult2, UseLibraryItemsModuleResult3 = UseLibraryItemsModule(p1.library, UseSignalStateResult, p1.itemKind, p1.query, 24, p1.categoryKey, p1.folderId)
	local Items = {}
	
	for _, value in UseLibraryItemsModuleResult do
		table.insert(Items, {
			tileKey = `library-item-{value.id}`,
			itemId = value.id,
			itemKind = value.kind,
			isFolder = value.className == "Folder",
			folderPreview = GetFolderPreviewModule(value, UseSignalStateResult),
			displayName = value.displayName,
			unavailableText = UseLibraryStringsModuleResult.modelUnavailable,
			thumbnail = value.image,
			model = value.model,
			onActivated = function() --[[ Line: 56 ]]
				-- upvalues: value (copy), p1 (copy)
				if value.className ~= "Folder" then
					p1.onOpenItem(value.id, value.kind)
				elseif p1.onOpenCategory ~= nil then
					p1.onOpenCategory(value.kind, value.id, value.displayName, value.id)
					
					return
				end
			end
		})
	end
	return {
		items = Items,
		status = if p1.isReady then "Ready" else "Loading",
		hasMore = p1.isReady and UseLibraryItemsModuleResult2,
		strings = {
			empty = if p1.query == "" then UseLibraryStringsModuleResult.empty else UseLibraryStringsModuleResult.searchEmpty
		},
		onLoadMore = UseLibraryItemsModuleResult3
	}
end