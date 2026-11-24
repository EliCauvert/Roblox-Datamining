local BuildExperience = script:FindFirstAncestor("BuildExperience")
local SignalsReactModule = require(BuildExperience.Parent.SignalsReact)
local _ = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryCategoryView)
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local _ = require(script.Parent.Parent.LibraryTypes)
local UseLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local UseLibraryItemsModule = require(script.Parent.Parent.useLibraryItems)
local GetFolderPreviewModule = require(script.Parent.Parent.getFolderPreview)
local UseLibraryTilePlaybackModule = require(script.Parent.Parent.useLibraryTilePlayback)
local GetLibraryTileSoundIdModule = require(script.Parent.Parent.getLibraryTileSoundId)
local FFlagBuildExperienceLibraryTilePlaybackModule = require(BuildExperience.Flags.FFlagBuildExperienceLibraryTilePlayback)

return function(p1)
	-- upvalues: UseLibraryStringsModule (copy), SignalsReactModule (copy), UseLibraryItemsModule (copy), FFlagBuildExperienceLibraryTilePlaybackModule (copy), GetLibraryTileSoundIdModule (copy), UseLibraryTilePlaybackModule (copy), GetFolderPreviewModule (copy)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.library.getItems)
	local UseLibraryItemsModuleResult, UseLibraryItemsModuleResult2, UseLibraryItemsModuleResult3 = UseLibraryItemsModule(p1.library, UseSignalStateResult, p1.itemKind, p1.query, 24, p1.categoryKey, p1.folderId)
	local v1 = nil
	
	if FFlagBuildExperienceLibraryTilePlaybackModule then
		local VisibleSoundIds = {}
		
		for _, value in UseLibraryItemsModuleResult do
			local LibraryTileSoundIdModule = GetLibraryTileSoundIdModule(value)
			
			if LibraryTileSoundIdModule ~= nil then
				table.insert(VisibleSoundIds, LibraryTileSoundIdModule)
			end
		end
		v1 = UseLibraryTilePlaybackModule({
			surface = "Category",
			isOpen = p1.isOpen ~= false,
			visibleSoundIds = VisibleSoundIds
		})
	end
	local Items = {}
	
	for _, value1 in UseLibraryItemsModuleResult do
		local LibraryTileSoundIdModule = if v1 == nil then nil else GetLibraryTileSoundIdModule(value1)
		table.insert(Items, {
			tileKey = `library-item-{value1.id}`,
			itemId = value1.id,
			itemKind = value1.kind,
			isFolder = value1.className == "Folder",
			folderPreview = GetFolderPreviewModule(value1, UseSignalStateResult),
			displayName = value1.displayName,
			unavailableText = UseLibraryStringsModuleResult.modelUnavailable,
			thumbnail = value1.image,
			model = value1.model,
			onActivated = function()
				-- upvalues: value1 (copy), p1 (copy)
				if value1.className ~= "Folder" then
					p1.onOpenItem(value1.id, value1.kind)
				elseif p1.onOpenCategory ~= nil then
					p1.onOpenCategory(value1.kind, value1.id, value1.displayName, value1.id)
					
					return
				end
			end,
			isSoundPlaying = if v1 == nil or LibraryTileSoundIdModule == nil then nil else v1.playingSoundId == LibraryTileSoundIdModule,
			onTogglePlayback = if v1 == nil or LibraryTileSoundIdModule == nil then nil else function()
				-- upvalues: v1 (ref), LibraryTileSoundIdModule (copy)
				v1.onTogglePlayback(LibraryTileSoundIdModule)
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