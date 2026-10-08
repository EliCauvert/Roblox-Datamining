local musicPicker = script:FindFirstAncestor("MusicPicker")
local reactModule = require(musicPicker.Parent.React)
local musicPickerContextModule = require(musicPicker.Context.MusicPickerContext)
local musicPickerViewModule = require(musicPicker.Components.MusicPickerView)
local useMusicPickerViewModelModule = require(musicPicker.Hooks.useMusicPickerViewModel)
local useMusicPickerAnalyticsModule = require(musicPicker.Hooks.useMusicPickerAnalytics)
local _ = require(musicPicker.Types.MusicPickerTypes)
local fFlagMusicPickerSongbirdAnalyticsModule = require(musicPicker.Flags.FFlagMusicPickerSongbirdAnalytics)

local function MusicPickerBase(p1)
	-- upvalues: useMusicPickerViewModelModule (ref), reactModule (ref), musicPickerViewModule (ref)
	local var1 = useMusicPickerViewModelModule({
		tabs = p1.tabs,
		onQueryChanged = p1.onQueryChanged,
		onTabChanged = p1.onTabChanged,
		initialQuery = p1.initialQuery
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

local function MusicPickerWithAnalytics(p1)
	-- upvalues: reactModule (ref), musicPickerContextModule (ref), useMusicPickerAnalyticsModule (ref), MusicPickerBase (ref)
	local var1 = reactModule.useContext(musicPickerContextModule)
	local var2 = useMusicPickerAnalyticsModule({
		source = p1.source,
		previewingId = var1.previewingId,
		savedIds = var1.savedIds,
		itemsById = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			local t = {}
			
			for i, v in p1.tabs do
				for i_2, v_1 in v.content.items do
					t[v_1.id] = v_1
				end
			end
			for i, v_1 in p1.searchContent.items do
				t[v_1.id] = v_1
			end
			return t
		end, { p1.tabs, p1.searchContent })
	})
	
	return reactModule.createElement(musicPickerContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: var1 (ref), var2 (ref)
			return {
				previewingId = var1.previewingId,
				togglePreview = function(p2)
					-- upvalues: var1 (copy), var2 (copy)
					if var1.previewingId == p2 then
						var2(p2)
					end
					var1.togglePreview(p2)
				end,
				savedIds = var1.savedIds,
				toggleSaved = var1.toggleSaved
			}
		end, { var1, var2 })
	}, { Picker = reactModule.createElement(MusicPickerBase, p1) })
end

return function(p2)
	-- upvalues: fFlagMusicPickerSongbirdAnalyticsModule (ref), reactModule (ref), MusicPickerWithAnalytics (ref), MusicPickerBase (ref)
	return if fFlagMusicPickerSongbirdAnalyticsModule then reactModule.createElement(MusicPickerWithAnalytics, p2) else reactModule.createElement(MusicPickerBase, p2)
end