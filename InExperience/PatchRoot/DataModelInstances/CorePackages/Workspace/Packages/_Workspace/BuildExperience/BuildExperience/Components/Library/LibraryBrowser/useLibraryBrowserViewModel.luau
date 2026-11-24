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
	-- upvalues: UseLibraryStringsModule (copy), SignalsReactModule (copy), useCarousel (copy), LibraryCategoriesModule (copy), GetFolderPreviewModule (copy)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.library.getItems)
	local Query = p1.query
	local config = {
		Model = useCarousel(p1.library, UseSignalStateResult, "Model", Query),
		Image = useCarousel(p1.library, UseSignalStateResult, "Image", Query),
		Sound = useCarousel(p1.library, UseSignalStateResult, "Sound", Query)
	}
	local List = {}
	
	for _, value in config do
		for _, item in value.items do
			table.insert(List, item)
		end
	end
	local Ready: string = if p1.isReady then "Ready" else "Loading"
	local Categories = {}
	
	for _, value1 in LibraryCategoriesModule.fromItems(List, UseLibraryStringsModuleResult) do
		local Entry = config[value1.itemKind]
		local Items = {}
		
		for _, item1 in Entry.items do
			table.insert(Items, {
				tileKey = `library-item-{item1.id}`,
				itemId = item1.id,
				itemKind = item1.kind,
				isFolder = item1.className == "Folder",
				folderPreview = GetFolderPreviewModule(item1, UseSignalStateResult),
				displayName = item1.displayName,
				unavailableText = UseLibraryStringsModuleResult.modelUnavailable,
				thumbnail = item1.image,
				model = item1.model,
				onActivated = if p1.onOpenItem == nil and p1.onOpenCategory == nil then nil else function()
					-- upvalues: item1 (copy), p1 (copy)
					if item1.className == "Folder" then
						if p1.onOpenCategory ~= nil then
							p1.onOpenCategory(item1.kind, item1.id, item1.displayName, item1.id)
							
							return
						end
					elseif p1.onOpenItem ~= nil then
						p1.onOpenItem(item1.id, item1.kind)
					end
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