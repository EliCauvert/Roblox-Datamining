local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(parent.SduiCompat)
local _ = require(parent.DiscoveryTypes)
local gameFiltersModule = require(parent.GameFilters)
local filterPillCarousel = gameFiltersModule.FilterPillCarousel
local getOptionContextTag = gameFiltersModule.getOptionContextTag
local _ = require(parent.UnifiedLogging)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local reportUnifiedLoggingImpressions = sduiCoreSystemModule.reportUnifiedLoggingImpressions
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local useCollectionAnalyticsContextModule = require(script.Parent.useCollectionAnalyticsContext)

local function buildSelectionsFromGroups(p0) --[[ line: 66 ]]
	local t = {}
	
	if not p0 then
		return t
	end
	for i, v in p0 do
		if v.filterType and v.filterType ~= "" then
			t[v.filterType] = v.selectedOptionId or v.defaultOptionId
		end
	end
	return t
end

local function convertToFilterModel(p1, p2) --[[ line: 79 ]]
	local displayName = p1.displayName
	local t = {}
	
	for i, v in p1.options do
		table.insert(t, {
			optionId = v.optionId,
			optionDisplayName = v.displayName,
			optionContextTag = v.optionContextTag
		})
		
		if v.optionId == p2 then
			displayName = v.displayName
		end
	end
	local var9 = nil
	
	if p1.inactiveOptionIds and #p1.inactiveOptionIds > 0 then
		local t_1 = {}
		
		for i_1, v_1 in p1.inactiveOptionIds do
			t_1[v_1] = true
		end
		var9 = t_1
	end
	return {
		filterId = p1.filterId,
		filterType = p1.filterType or "",
		filterDisplayName = p1.displayName,
		filterOptions = t,
		defaultOptionId = p1.defaultOptionId,
		selectedOptionId = p2,
		selectedOptionDisplayName = displayName,
		inactiveOptionIds = var9
	}
end

return reactModule.memo(function(p3) --[[ line: 117 | named "SduiFilterPillsCarousel" ]]
	-- upvalues: reactModule (ref), buildSelectionsFromGroups (ref), convertToFilterModel (ref), useCollectionAnalyticsContextModule (ref), sduiComponentType (ref), getOptionContextTag (ref), reportUnifiedLoggingImpressions (ref), cryoModule (ref), view (ref), filterPillCarousel (ref)
	local filterGroups = p3.filterGroups
	local sduiContext = p3.sduiContext
	local analyticsContext = p3.analyticsContext
	local var11, var12 = reactModule.useState(function() --[[ line: 122 ]]
		-- upvalues: buildSelectionsFromGroups (copy), filterGroups (ref)
		return buildSelectionsFromGroups(filterGroups)
	end)
	reactModule.useEffect(function() --[[ line: 126 ]]
		-- upvalues: filterGroups (ref), var12 (ref), buildSelectionsFromGroups (copy)
		if filterGroups then
			var12(buildSelectionsFromGroups(filterGroups))
		end
	end, { filterGroups })
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: filterGroups (ref), var11 (ref), convertToFilterModel (copy)
		if not filterGroups then
			return {}
		end
		local t = {}
		
		for i, v in filterGroups do
			local filterType = v.filterType or ""
			table.insert(t, convertToFilterModel(v, (if filterType ~= "" then nil else var11[filterType]) or v.defaultOptionId))
		end
		return t
	end, { filterGroups, var11 })
	local _, var15 = useCollectionAnalyticsContextModule(analyticsContext, sduiComponentType.FilterPillsCarousel, #var14, #var14, sduiContext, nil)
	local var16 = reactModule.useMemo(function() --[[ line: 156 ]]
		-- upvalues: var14 (ref), getOptionContextTag (copy)
		local t = {}
		
		for i, v in var14 do
			table.insert(t, {
				itemComponentType = "FilterPill",
				id = v.filterId,
				itemPosition = i,
				filterId = v.filterId,
				selectedOptionId = v.selectedOptionId or "",
				selectedOptionContextTag = getOptionContextTag(v, v.selectedOptionId)
			})
		end
		return t
	end, { var14 })
	
	return if filterGroups and #filterGroups ~= 0 then reactModule.createElement(view, {
		tag = p3.tag,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		backgroundStyle = p3.backgroundStyle
	}, {
		Content = reactModule.createElement(filterPillCarousel, {
			title = p3.title,
			filters = var14,
			sortIndex = if var15.current then var15.current.collectionPosition else 0,
			onFilterApplied = reactModule.useCallback(function(p4, p5) --[[ line: 218 ]]
				-- upvalues: var12 (ref), cryoModule (copy), p3 (ref)
				var12(function(p6) --[[ line: 219 ]]
					-- upvalues: cryoModule (copy), p4 (ref), p5 (ref), p3 (copy)
					local var20 = cryoModule.Dictionary.join(p6, { [p4] = p5 })
					
					if p3.onFilterApplied then
						p3.onFilterApplied(nil, nil, { filterSelections = var20 })
					end
					return var20
				end)
			end, { p3.onFilterApplied }),
			containerRef = var13,
			pageContext = sduiContext.routeName or sduiContext.appPage,
			dataUpdatedTimestamp = sduiContext.dataUpdatedTimestamp,
			scrollViewPositionChangedSignal = p3.scrollViewPositionChangedSignal,
			sendImpressions = reactModule.useCallback(function(p7) --[[ line: 173 ]]
				-- upvalues: reportUnifiedLoggingImpressions (copy), sduiContext (ref), var16 (ref), var15 (ref), p3 (ref)
				reportUnifiedLoggingImpressions(sduiContext, p7, var16, var15.current, nil, p3.impressionEventName, p3.skipItemImpressionsLog)
			end, {
				sduiContext,
				var16,
				var15,
				p3.impressionEventName,
				p3.skipItemImpressionsLog
			}),
			sendFilterClick = reactModule.useCallback(function(p8, p9, p10, p11, p12, p13, p14) --[[ line: 194 ]]
				-- upvalues: p3 (ref)
				if p3.onFilterClick then
					p3.onFilterClick(nil, nil, {
						buttonName = p8,
						filterId = p9,
						selectedOptionId = p10,
						previousOptionId = p11,
						selectedOptionContextTag = p12,
						previousOptionContextTag = p13,
						isActive = p14
					})
				end
			end, { p3.onFilterClick })
		})
	}) else nil
end)