local musicPicker = script:FindFirstAncestor("MusicPicker")
local reactModule = require(musicPicker.Parent.React)
local musicPickerViewModule = require(musicPicker.Components.MusicPickerView)
local useMusicPickerViewModelModule = require(musicPicker.Hooks.useMusicPickerViewModel)
local _ = require(musicPicker.Types.MusicPickerTypes)

return function(p1)
	-- upvalues: useMusicPickerViewModelModule (ref), reactModule (ref), musicPickerViewModule (ref)
	local var1 = useMusicPickerViewModelModule({
		tabs = p1.tabs,
		onQueryChanged = p1.onQueryChanged,
		onTabChanged = p1.onTabChanged
	})
	
	return reactModule.createElement(musicPickerViewModule, {
		titleText = p1.titleText,
		searchPlaceholder = p1.searchPlaceholder,
		searchText = var1.searchText,
		mode = var1.mode,
		showTabs = p1.showTabs,
		tabs = p1.tabs,
		activeTabId = var1.activeTabId,
		searchContent = p1.searchContent,
		onSearchChanged = var1.onSearchChanged,
		onSubmitSearch = var1.onSubmitSearch,
		onTabSelected = var1.onTabSelected,
		onClose = p1.onClose,
		onSelect = p1.onSelect,
		safeAreaInsets = p1.safeAreaInsets
	})
end