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

local function buildSelectionsFromGroups(p1)
	local t = {}
	
	if not p1 then
		return t
	end
	for i, v in p1 do
		if v.filterType and v.filterType ~= "" then
			t[v.filterType] = v.selectedOptionId or v.defaultOptionId
		end
	end
	return t
end

local function convertToFilterModel(p2, p3)
	local displayName = p2.displayName
	local t = {}
	
	for i, v in p2.options do
		table.insert(t, {
			optionId = v.optionId,
			optionDisplayName = v.displayName,
			optionContextTag = v.optionContextTag
		})
		
		if v.optionId == p3 then
			displayName = v.displayName
		end
	end
	local var1 = nil
	
	if p2.inactiveOptionIds and #p2.inactiveOptionIds > 0 then
		local t_1 = {}
		
		for i_1, v_1 in p2.inactiveOptionIds do
			t_1[v_1] = true
		end
		var1 = t_1
	end
	return {
		filterId = p2.filterId,
		filterType = p2.filterType or "",
		filterDisplayName = p2.displayName,
		filterOptions = t,
		defaultOptionId = p2.defaultOptionId,
		selectedOptionId = p3,
		selectedOptionDisplayName = displayName,
		inactiveOptionIds = var1
	}
end

return reactModule.memo(function(p4)
	-- upvalues: reactModule (ref), buildSelectionsFromGroups (ref), convertToFilterModel (ref), useCollectionAnalyticsContextModule (ref), sduiComponentType (ref), getOptionContextTag (ref), reportUnifiedLoggingImpressions (ref), cryoModule (ref), view (ref), filterPillCarousel (ref)
	local filterGroups = p4.filterGroups
	local sduiContext = p4.sduiContext
	local analyticsContext = p4.analyticsContext
	local var2, var3 = reactModule.useState(function()
		-- upvalues: buildSelectionsFromGroups (copy), filterGroups (ref)
		return buildSelectionsFromGroups(filterGroups)
	end)
	reactModule.useEffect(function()
		-- upvalues: filterGroups (ref), var3 (ref), buildSelectionsFromGroups (copy)
		if filterGroups then
			var3(buildSelectionsFromGroups(filterGroups))
		end
	end, { filterGroups })
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useMemo(function()
		-- upvalues: filterGroups (ref), var2 (ref), convertToFilterModel (copy)
		if not filterGroups then
			return {}
		end
		local t = {}
		
		for i, v in filterGroups do
			local filterType = v.filterType or ""
			table.insert(t, convertToFilterModel(v, (if filterType ~= "" then nil else var2[filterType]) or v.defaultOptionId))
		end
		return t
	end, { filterGroups, var2 })
	local _, var6 = useCollectionAnalyticsContextModule(analyticsContext, sduiComponentType.FilterPillsCarousel, #var5, #var5, sduiContext, nil)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), getOptionContextTag (copy)
		local t = {}
		
		for i, v in var5 do
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
	end, { var5 })
	
	return if filterGroups and #filterGroups ~= 0 then reactModule.createElement(view, {
		tag = p4.tag,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		backgroundStyle = p4.backgroundStyle
	}, {
		Content = reactModule.createElement(filterPillCarousel, {
			title = p4.title,
			filters = var5,
			sortIndex = if var6.current then var6.current.collectionPosition else 0,
			onFilterApplied = reactModule.useCallback(function(p5, p6)
				-- upvalues: var3 (ref), cryoModule (copy), p4 (ref)
				var3(function(p7)
					-- upvalues: cryoModule (copy), p5 (ref), p6 (ref), p4 (copy)
					local var8 = cryoModule.Dictionary.join(p7, { [p5] = p6 })
					
					if p4.onFilterApplied then
						p4.onFilterApplied(nil, nil, { filterSelections = var8 })
					end
					return var8
				end)
			end, { p4.onFilterApplied }),
			containerRef = var4,
			pageContext = sduiContext.routeName or sduiContext.appPage,
			dataUpdatedTimestamp = sduiContext.dataUpdatedTimestamp,
			scrollViewPositionChangedSignal = p4.scrollViewPositionChangedSignal,
			sendImpressions = reactModule.useCallback(function(p5)
				-- upvalues: reportUnifiedLoggingImpressions (copy), sduiContext (ref), var7 (ref), var6 (ref), p4 (ref)
				reportUnifiedLoggingImpressions(sduiContext, p5, var7, var6.current, nil, p4.impressionEventName, p4.skipItemImpressionsLog)
			end, {
				sduiContext,
				var7,
				var6,
				p4.impressionEventName,
				p4.skipItemImpressionsLog
			}),
			sendFilterClick = reactModule.useCallback(function(p5, p6, p7, p8, p9, p10, p11)
				-- upvalues: p4 (ref)
				if p4.onFilterClick then
					p4.onFilterClick(nil, nil, {
						buttonName = p5,
						filterId = p6,
						selectedOptionId = p7,
						previousOptionId = p8,
						selectedOptionContextTag = p9,
						previousOptionContextTag = p10,
						isActive = p11
					})
				end
			end, { p4.onFilterClick })
		})
	}) else nil
end)