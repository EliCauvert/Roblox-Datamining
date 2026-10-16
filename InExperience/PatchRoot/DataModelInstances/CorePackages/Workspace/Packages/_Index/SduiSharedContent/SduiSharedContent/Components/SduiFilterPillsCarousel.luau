local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(Parent.SduiCompat)
local _ = require(Parent.DiscoveryTypes)
local GameFiltersModule = require(Parent.GameFilters)
local FilterPillCarousel = GameFiltersModule.FilterPillCarousel
local GetOptionContextTagFunction = GameFiltersModule.getOptionContextTag
local _ = require(Parent.UnifiedLogging)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local ReportUnifiedLoggingImpressionsFunction = SduiCoreSystemModule.reportUnifiedLoggingImpressions
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local UseCollectionAnalyticsContextModule = require(script.Parent.useCollectionAnalyticsContext)

local function buildSelectionsFromGroups(FilterGroups) --[[ Line: 66 ]]
	local SelectedOptionIds = {}
	
	if not FilterGroups then
		return SelectedOptionIds
	end
	for _, filterGroup in FilterGroups do
		if filterGroup.filterType and filterGroup.filterType ~= "" then
			SelectedOptionIds[filterGroup.filterType] = filterGroup.selectedOptionId or filterGroup.defaultOptionId
		end
	end
	return SelectedOptionIds
end

local function convertToFilterModel(p1, SelectedOptionId) --[[ Line: 79 ]]
	local DisplayName = p1.displayName
	local FilterOptions = {}
	
	for _, option in p1.options do
		table.insert(FilterOptions, {
			optionId = option.optionId,
			optionDisplayName = option.displayName,
			optionContextTag = option.optionContextTag
		})
		
		if option.optionId == SelectedOptionId then
			DisplayName = option.displayName
		end
	end
	local InactiveOptionIds = nil
	
	if p1.inactiveOptionIds and #p1.inactiveOptionIds > 0 then
		local t = {}
		
		for _, inactiveOptionId in p1.inactiveOptionIds do
			t[inactiveOptionId] = true
		end
		InactiveOptionIds = t
	end
	return {
		filterId = p1.filterId,
		filterType = p1.filterType or "",
		filterDisplayName = p1.displayName,
		filterOptions = FilterOptions,
		defaultOptionId = p1.defaultOptionId,
		selectedOptionId = SelectedOptionId,
		selectedOptionDisplayName = DisplayName,
		inactiveOptionIds = InactiveOptionIds
	}
end

return ReactModule.memo(function(p2) --[[ Line: 117 | Named "SduiFilterPillsCarousel" ]]
	-- upvalues: ReactModule (copy), buildSelectionsFromGroups (copy), convertToFilterModel (copy), UseCollectionAnalyticsContextModule (copy), SduiComponentType (copy), GetOptionContextTagFunction (copy), ReportUnifiedLoggingImpressionsFunction (copy), CryoModule (copy), View (copy), FilterPillCarousel (copy)
	local FilterGroups = p2.filterGroups
	local SduiContext = p2.sduiContext
	local AnalyticsContext = p2.analyticsContext
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 122 ]]
		-- upvalues: buildSelectionsFromGroups (upval), FilterGroups (copy)
		return (buildSelectionsFromGroups(FilterGroups))
	end)
	ReactModule.useEffect(function() --[[ Line: 126 ]]
		-- upvalues: FilterGroups (copy), UseStateResult2 (copy), buildSelectionsFromGroups (upval)
		if FilterGroups then
			UseStateResult2((buildSelectionsFromGroups(FilterGroups)))
		end
	end, { FilterGroups })
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 134 ]]
		-- upvalues: FilterGroups (copy), UseStateResult (copy), convertToFilterModel (upval)
		if not FilterGroups then
			return {}
		end
		local List = {}
		
		for _, filterGroup in FilterGroups do
			local FilterType = filterGroup.filterType or ""
			table.insert(List, (convertToFilterModel(filterGroup, (if FilterType == "" then nil else UseStateResult[FilterType]) or filterGroup.defaultOptionId)))
		end
		return List
	end, { FilterGroups, UseStateResult })
	local _, UseCollectionAnalyticsContextModuleResult2 = UseCollectionAnalyticsContextModule(AnalyticsContext, SduiComponentType.FilterPillsCarousel, #UseMemoResult, #UseMemoResult, SduiContext, nil)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 156 ]]
		-- upvalues: UseMemoResult (copy), GetOptionContextTagFunction (upval)
		local List = {}
		
		for ItemPosition, value in UseMemoResult do
			table.insert(List, {
				itemComponentType = "FilterPill",
				id = value.filterId,
				itemPosition = ItemPosition,
				filterId = value.filterId,
				selectedOptionId = value.selectedOptionId or "",
				selectedOptionContextTag = GetOptionContextTagFunction(value, value.selectedOptionId)
			})
		end
		return List
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function(p3) --[[ Line: 173 ]]
		-- upvalues: ReportUnifiedLoggingImpressionsFunction (upval), SduiContext (copy), UseMemoResult1 (copy), UseCollectionAnalyticsContextModuleResult2 (copy), p2 (copy)
		ReportUnifiedLoggingImpressionsFunction(SduiContext, p3, UseMemoResult1, UseCollectionAnalyticsContextModuleResult2.current, nil, p2.impressionEventName, p2.skipItemImpressionsLog)
	end, {
		SduiContext,
		UseMemoResult1,
		UseCollectionAnalyticsContextModuleResult2,
		p2.impressionEventName,
		p2.skipItemImpressionsLog
	})
	local UseResult1 = ReactModule.useCallback(function(ButtonName, FilterId, SelectedOptionId, PreviousOptionId, SelectedOptionContextTag, PreviousOptionContextTag, IsActive) --[[ Line: 194 ]]
		-- upvalues: p2 (copy)
		if p2.onFilterClick then
			p2.onFilterClick(nil, nil, {
				buttonName = ButtonName,
				filterId = FilterId,
				selectedOptionId = SelectedOptionId,
				previousOptionId = PreviousOptionId,
				selectedOptionContextTag = SelectedOptionContextTag,
				previousOptionContextTag = PreviousOptionContextTag,
				isActive = IsActive
			})
		end
	end, { p2.onFilterClick })
	local UseResult2 = ReactModule.useCallback(function(p3, p4) --[[ Line: 218 ]]
		-- upvalues: UseStateResult2 (copy), CryoModule (upval), p2 (copy)
		UseStateResult2(function(p5) --[[ Line: 219 ]]
			-- upvalues: CryoModule (upval), p3 (copy), p4 (copy), p2 (upval)
			local JoinResult = CryoModule.Dictionary.join(p5, { [p3] = p4 })
			
			if p2.onFilterApplied then
				p2.onFilterApplied(nil, nil, { filterSelections = JoinResult })
			end
			return JoinResult
		end)
	end, { p2.onFilterApplied })
	local CollectionPosition = if UseCollectionAnalyticsContextModuleResult2.current then UseCollectionAnalyticsContextModuleResult2.current.collectionPosition else 0
	
	return if FilterGroups and #FilterGroups ~= 0 then ReactModule.createElement(View, {
		tag = p2.tag,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		backgroundStyle = p2.backgroundStyle
	}, {
		Content = ReactModule.createElement(FilterPillCarousel, {
			title = p2.title,
			filters = UseMemoResult,
			sortIndex = CollectionPosition,
			onFilterApplied = UseResult2,
			containerRef = UseRefResult,
			pageContext = SduiContext.routeName or SduiContext.appPage,
			dataUpdatedTimestamp = SduiContext.dataUpdatedTimestamp,
			scrollViewPositionChangedSignal = p2.scrollViewPositionChangedSignal,
			sendImpressions = UseResult,
			sendFilterClick = UseResult1
		})
	}) else nil
end)