local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local chatSheetViewModule = require(buildExperience.Components.ChatSheet.ChatSheetView)
local _ = require(buildExperience.Components.ChatSheet.useChatSheetViewModel)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local libraryChatSheetOverlayModule = require(script.Parent.LibraryChatSheetOverlay)
local useLibraryChatSheetViewModelModule = require(script.Parent.useLibraryChatSheetViewModel)
local t = { ["Color.Common.Backdrop"] = "Color.None" }

local function onBoundsChanged(p1, p2)
	-- upvalues: getLibraryStoreModule (ref)
	local var1 = getLibraryStoreModule()
	var1.setWorldChatTop(p1)
	var1.setWorldChatLeft(p2)
end

local var1 = signalsModule.createComputed(function(p1)
	-- upvalues: getLibraryStoreModule (ref)
	local worldViewportRect = getLibraryStoreModule().getWorldViewportRect(p1)
	
	return if worldViewportRect == nil then nil else worldViewportRect.Min.Y
end)

local function ViewportTopOverlay(p1)
	-- upvalues: signalsReactModule (ref), var1 (ref), reactModule (ref), libraryChatSheetOverlayModule (ref)
	local cloned = table.clone(p1)
	cloned.top = signalsReactModule.useSignalState(var1)
	
	return reactModule.createElement(libraryChatSheetOverlayModule, cloned)
end

return function(p1)
	-- upvalues: roactUtilsModule (ref), foundationModule (ref), useLibraryChatSheetViewModelModule (ref), reactModule (ref), t (ref), ViewportTopOverlay (ref), onBoundsChanged (ref), chatSheetViewModule (ref)
	local var2 = roactUtilsModule.Hooks.useSelectedTheme()
	local var3 = foundationModule.Hooks.useOverlay()
	local var4 = if var3 ~= nil then nil else var3:FindFirstAncestorWhichIsA("ScreenGui")
	local var5 = useLibraryChatSheetViewModelModule(p1)
	
	return reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = if var2 == "light" then foundationModule.Enums.ColorMode.Light else foundationModule.Enums.ColorMode.Dark,
		overlayGui = {
			DisplayOrder = if var4 ~= nil then nil else var4.DisplayOrder
		},
		tokenOverrides = t
	}, {
		Overlay = reactModule.createElement(ViewportTopOverlay, {
			isOpen = var5.isOpen,
			snapPoints = var5.snapPoints,
			onBoundsChanged = onBoundsChanged,
			renderSheet = function(p2, p3, p4)
				-- upvalues: var5 (ref), reactModule (copy), chatSheetViewModule (copy)
				local cloned = table.clone(var5)
				cloned.snapPoints = p2
				cloned.onFramesChanged = p3
				cloned.onSnapPointChanged = p4
				
				return reactModule.createElement(chatSheetViewModule, cloned)
			end
		})
	})
end