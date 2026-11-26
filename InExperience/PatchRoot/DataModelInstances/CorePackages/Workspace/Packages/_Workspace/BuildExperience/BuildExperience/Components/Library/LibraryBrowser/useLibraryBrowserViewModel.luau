local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local LibraryCategoriesModule = require(script.Parent.Parent.LibraryCategories)
local _ = require(script.Parent.LibraryBrowserView)
local _ = require(script.Parent.Parent.LibraryTypes)
local UseLibraryStringsModule = require(script.Parent.Parent.useLibraryStrings)
local UseLibraryItemsModule = require(script.Parent.Parent.useLibraryItems)
local GetFolderPreviewModule = require(script.Parent.Parent.getFolderPreview)
local _ = require(script.Parent.Parent.LibraryWorldCutout.LibraryWorldCutoutView)
local UseLibraryTilePlaybackModule = require(script.Parent.Parent.useLibraryTilePlayback)
local GetLibraryTileSoundIdModule = require(script.Parent.Parent.getLibraryTileSoundId)
local FFlagBuildExperienceLibraryTilePlaybackModule = require(BuildExperience.Flags.FFlagBuildExperienceLibraryTilePlayback)

local function useCarousel(Library, UseSignalStateResult, p1, Query)
	-- upvalues: UseLibraryItemsModule (copy), ReactModule (copy)
	local UseLibraryItemsModuleResult, UseLibraryItemsModuleResult2, UseLibraryItemsModuleResult3 = UseLibraryItemsModule(Library, UseSignalStateResult, p1, Query, 6)
	
	return {
		items = UseLibraryItemsModuleResult,
		hasMore = UseLibraryItemsModuleResult2,
		onScrollChanged = ReactModule.useCallback(function(ScrollFrame)
			-- upvalues: UseLibraryItemsModuleResult3 (copy)
			if ScrollFrame.AbsoluteWindowSize.X > 0 and ScrollFrame.AbsoluteCanvasSize.X > 0 and ScrollFrame.AbsoluteCanvasSize.X - 192 <= ScrollFrame.CanvasPosition.X + ScrollFrame.AbsoluteWindowSize.X then
				UseLibraryItemsModuleResult3()
			end
		end, { UseLibraryItemsModuleResult3 })
	}
end

return function(p1)
	-- upvalues: UseLibraryStringsModule (copy), SignalsReactModule (copy), useCarousel (copy), FFlagBuildExperienceLibraryTilePlaybackModule (copy), GetLibraryTileSoundIdModule (copy), UseLibraryTilePlaybackModule (copy), LibraryCategoriesModule (copy), GetFolderPreviewModule (copy)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.library.getItems)
	local Query = p1.query
	local Model = useCarousel(p1.library, UseSignalStateResult, "Model", Query)
	local Image = useCarousel(p1.library, UseSignalStateResult, "Image", Query)
	local Sound = useCarousel(p1.library, UseSignalStateResult, "Sound", Query)
	local config = { Model = Model, Image = Image, Sound = Sound }
	local List = {}
	
	for _, value in config do
		for _, item in value.items do
			table.insert(List, item)
		end
	end
	local Ready: string = if p1.isReady then "Ready" else "Loading"
	local v1 = nil
	
	if FFlagBuildExperienceLibraryTilePlaybackModule then
		local VisibleSoundIds = {}
		
		for _, item1 in Sound.items do
			local LibraryTileSoundIdModule = GetLibraryTileSoundIdModule(item1)
			
			if LibraryTileSoundIdModule ~= nil then
				table.insert(VisibleSoundIds, LibraryTileSoundIdModule)
			end
		end
		v1 = UseLibraryTilePlaybackModule({
			surface = "Browser",
			isOpen = p1.isOpen ~= false,
			visibleSoundIds = VisibleSoundIds
		})
	end
	local Categories = {}
	
	for _, value1 in LibraryCategoriesModule.fromItems(List, UseLibraryStringsModuleResult) do
		local Entry = config[value1.itemKind]
		local Items = {}
		
		for _, item2 in Entry.items do
			local LibraryTileSoundIdModule = if v1 == nil then nil else GetLibraryTileSoundIdModule(item2)
			table.insert(Items, {
				tileKey = `library-item-{item2.id}`,
				itemId = item2.id,
				itemKind = item2.kind,
				isFolder = item2.className == "Folder",
				folderPreview = GetFolderPreviewModule(item2, UseSignalStateResult),
				displayName = item2.displayName,
				unavailableText = UseLibraryStringsModuleResult.modelUnavailable,
				thumbnail = item2.image,
				model = item2.model,
				onActivated = if p1.onOpenItem == nil and p1.onOpenCategory == nil then nil else function()
					-- upvalues: item2 (copy), p1 (copy)
					if item2.className == "Folder" then
						if p1.onOpenCategory ~= nil then
							p1.onOpenCategory(item2.kind, item2.id, item2.displayName, item2.id)
							
							return
						end
					elseif p1.onOpenItem ~= nil then
						p1.onOpenItem(item2.id, item2.kind)
					end
				end,
				isSoundPlaying = if v1 == nil or LibraryTileSoundIdModule == nil then nil else v1.playingSoundId == LibraryTileSoundIdModule,
				onTogglePlayback = if v1 == nil or LibraryTileSoundIdModule == nil then nil else function()
					-- upvalues: v1 (ref), LibraryTileSoundIdModule (copy)
					v1.onTogglePlayback(LibraryTileSoundIdModule)
				end
			})
		end
		table.insert(Categories, {
			categoryKey = value1.key,
			itemKind = value1.itemKind,
			title = value1.title,
			items = Items,
			status = Ready,
			hasMore = Entry.hasMore,
			onScrollChanged = Entry.onScrollChanged,
			onOpenCategory = if p1.onOpenCategory == nil then nil else function()
				-- upvalues: p1 (copy), value1 (copy)
				p1.onOpenCategory(value1.itemKind, value1.key, value1.title)
			end
		})
	end
	return {
		categories = Categories,
		status = Ready,
		strings = UseLibraryStringsModuleResult,
		worldCutout = p1.worldCutout
	}
end