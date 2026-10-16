local MusicPicker = script:FindFirstAncestor("MusicPicker")
local ReactModule = require(MusicPicker.Parent.React)
local MusicPickerContextModule = require(MusicPicker.Context.MusicPickerContext)
local MusicPickerViewModule = require(MusicPicker.Components.MusicPickerView)
local UseMusicPickerViewModelModule = require(MusicPicker.Hooks.useMusicPickerViewModel)
local UseMusicPickerAnalyticsModule = require(MusicPicker.Hooks.useMusicPickerAnalytics)
local _ = require(MusicPicker.Types.MusicPickerTypes)

local function MusicPickerBase(p1) --[[ Line: 54 ]]
	-- upvalues: UseMusicPickerViewModelModule (copy), ReactModule (copy), MusicPickerViewModule (copy)
	local UseMusicPickerViewModelModuleResult = UseMusicPickerViewModelModule({
		tabs = p1.tabs,
		onQueryChanged = p1.onQueryChanged,
		onTabChanged = p1.onTabChanged,
		initialQuery = p1.initialQuery
	})
	
	return ReactModule.createElement(MusicPickerViewModule, {
		titleText = p1.titleText,
		searchPlaceholder = p1.searchPlaceholder,
		searchText = UseMusicPickerViewModelModuleResult.searchText,
		mode = UseMusicPickerViewModelModuleResult.mode,
		showTabs = p1.showTabs,
		tabs = p1.tabs,
		activeTabId = UseMusicPickerViewModelModuleResult.activeTabId,
		searchContent = p1.searchContent,
		onSearchChanged = UseMusicPickerViewModelModuleResult.onSearchChanged,
		onSubmitSearch = UseMusicPickerViewModelModuleResult.onSubmitSearch,
		onTabSelected = UseMusicPickerViewModelModuleResult.onTabSelected,
		onClose = p1.onClose,
		onSelect = p1.onSelect,
		safeAreaInsets = p1.safeAreaInsets
	})
end

return function(p1) --[[ Line: 83 | Named "MusicPicker" ]]
	-- upvalues: ReactModule (copy), MusicPickerContextModule (copy), UseMusicPickerAnalyticsModule (copy), MusicPickerBase (copy)
	local UseContextResult = ReactModule.useContext(MusicPickerContextModule)
	local UseMusicPickerAnalyticsModuleResult = UseMusicPickerAnalyticsModule({
		source = p1.source,
		previewingId = UseContextResult.previewingId,
		savedIds = UseContextResult.savedIds,
		itemsById = ReactModule.useMemo(function() --[[ Line: 86 ]]
			-- upvalues: p1 (copy)
			local t = {}
			
			for _, tab in p1.tabs do
				for _, item in tab.content.items do
					t[item.id] = item
				end
			end
			for _, item1 in p1.searchContent.items do
				t[item1.id] = item1
			end
			return t
		end, { p1.tabs, p1.searchContent })
	})
	
	return ReactModule.createElement(MusicPickerContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 111 ]]
			-- upvalues: UseContextResult (copy), UseMusicPickerAnalyticsModuleResult (copy)
			return {
				previewingId = UseContextResult.previewingId,
				togglePreview = function(PreviewingId) --[[ Line: 114 ]]
					-- upvalues: UseContextResult (upval), UseMusicPickerAnalyticsModuleResult (upval)
					if UseContextResult.previewingId == PreviewingId then
						UseMusicPickerAnalyticsModuleResult(PreviewingId)
					end
					UseContextResult.togglePreview(PreviewingId)
				end,
				savedIds = UseContextResult.savedIds,
				toggleSaved = UseContextResult.toggleSaved,
				showSaveButton = UseContextResult.showSaveButton
			}
		end, { UseContextResult, UseMusicPickerAnalyticsModuleResult })
	}, { Picker = ReactModule.createElement(MusicPickerBase, p1) })
end