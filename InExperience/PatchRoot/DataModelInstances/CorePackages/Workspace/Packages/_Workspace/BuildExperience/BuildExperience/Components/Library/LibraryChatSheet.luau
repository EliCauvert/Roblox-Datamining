local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local ChatSheetViewModule = require(BuildExperience.Components.ChatSheet.ChatSheetView)
local _ = require(BuildExperience.Components.ChatSheet.useChatSheetViewModel)
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local LibraryChatSheetOverlayModule = require(script.Parent.LibraryChatSheetOverlay)
local UseLibraryChatSheetViewModelModule = require(script.Parent.useLibraryChatSheetViewModel)
local TokenOverrides = { ["Color.Common.Backdrop"] = "Color.None" }

local function onBoundsChanged(p1, p2)
	-- upvalues: GetLibraryStoreModule (copy)
	local LibraryStoreModule = GetLibraryStoreModule()
	LibraryStoreModule.setWorldChatTop(p1)
	LibraryStoreModule.setWorldChatLeft(p2)
end

local Computed = require(Parent.Signals).createComputed(function(p1)
	-- upvalues: GetLibraryStoreModule (copy)
	local WorldViewportRect = GetLibraryStoreModule().getWorldViewportRect(p1)
	
	return if WorldViewportRect == nil then nil else WorldViewportRect.Min.Y
end)

local function ViewportTopOverlay(Tbl)
	-- upvalues: SignalsReactModule (copy), Computed (copy), ReactModule (copy), LibraryChatSheetOverlayModule (copy)
	local Copy = table.clone(Tbl)
	Copy.top = SignalsReactModule.useSignalState(Computed)
	
	return ReactModule.createElement(LibraryChatSheetOverlayModule, Copy)
end

return function(p1)
	-- upvalues: RoactUtilsModule (copy), FoundationModule (copy), UseLibraryChatSheetViewModelModule (copy), ReactModule (copy), TokenOverrides (copy), ViewportTopOverlay (copy), onBoundsChanged (copy), ChatSheetViewModule (copy)
	local UseSelectedThemeResult = RoactUtilsModule.Hooks.useSelectedTheme()
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local ScreenGui = if UseOverlayResult == nil then nil else UseOverlayResult:FindFirstAncestorWhichIsA("ScreenGui")
	local UseLibraryChatSheetViewModelModuleResult = UseLibraryChatSheetViewModelModule(p1)
	
	return ReactModule.createElement(FoundationModule.FoundationProvider, {
		colorMode = if UseSelectedThemeResult == "light" then FoundationModule.Enums.ColorMode.Light else FoundationModule.Enums.ColorMode.Dark,
		overlayGui = {
			DisplayOrder = if ScreenGui == nil then nil else ScreenGui.DisplayOrder
		},
		tokenOverrides = TokenOverrides
	}, {
		Overlay = ReactModule.createElement(ViewportTopOverlay, {
			isOpen = UseLibraryChatSheetViewModelModuleResult.isOpen,
			snapPoints = UseLibraryChatSheetViewModelModuleResult.snapPoints,
			onBoundsChanged = onBoundsChanged,
			renderSheet = function(SnapPoints, OnFramesChanged, OnSnapPointChanged)
				-- upvalues: UseLibraryChatSheetViewModelModuleResult (copy), ReactModule (upval), ChatSheetViewModule (upval)
				local Copy = table.clone(UseLibraryChatSheetViewModelModuleResult)
				Copy.snapPoints = SnapPoints
				Copy.onFramesChanged = OnFramesChanged
				Copy.onSnapPointChanged = OnSnapPointChanged
				
				return ReactModule.createElement(ChatSheetViewModule, Copy)
			end
		})
	})
end