local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiVariableItemWidthCarouselModule = require(ServerDrivenUi.Content.Collections.SduiVariableItemWidthCarousel)
local FFlagSduiOptionImpressionsEventName = require(Parent.SharedFlags).FFlagSduiOptionImpressionsEventName
local FFlagSduiOptionSelectorHeaderComponent = require(Parent.SharedFlags).FFlagSduiOptionSelectorHeaderComponent
local FFlagSduiChartsSortDetailGenreFilter = require(Parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local FFlagSduiOptionSelectorAnchorTag = require(Parent.SharedFlags).FFlagSduiOptionSelectorAnchorTag
local FFlagSduiOptionSelectorSkipSelectedRefresh = require(Parent.SharedFlags).FFlagSduiOptionSelectorSkipSelectedRefresh

return function(p1)
	-- upvalues: ReactModule (copy), SduiErrorType (copy), SduiComponentType (copy), FFlagSduiOptionSelectorSkipSelectedRefresh (copy), FFlagSduiChartsSortDetailGenreFilter (copy), FFlagSduiOptionSelectorAnchorTag (copy), CryoModule (copy), SduiVariableItemWidthCarouselModule (copy), FFlagSduiOptionImpressionsEventName (copy), FFlagSduiOptionSelectorHeaderComponent (copy)
	local SduiContext = p1.sduiContext
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1 = UseStateResult or p1.selectedOption
	local UseRefResult = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, { p1.selectedOption })
	local UseResult = ReactModule.useCallback(function(SelectedOption)
		-- upvalues: SduiContext (copy), SduiErrorType (upval), SduiComponentType (upval), FFlagSduiOptionSelectorSkipSelectedRefresh (upval), UseStateResult1 (copy), UseStateResult (copy), FFlagSduiChartsSortDetailGenreFilter (upval), UseStateResult2 (copy), UseRefResult (copy), p1 (copy)
		if typeof(SelectedOption) ~= "string" or SelectedOption == "" then
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				propName = "optionId",
				name = SduiComponentType.OptionSelectorCollection,
				message = `Invalid or missing option id: {SelectedOption}`
			}, SduiContext.appPage)
			
			return
		end
		if (if FFlagSduiOptionSelectorSkipSelectedRefresh then UseStateResult1 else UseStateResult) == SelectedOption then return end
		local Current = nil
		
		if not FFlagSduiChartsSortDetailGenreFilter then
			UseStateResult2(SelectedOption)
			UseRefResult.current += 1
			Current = UseRefResult.current
		end
		local OnOptionActivatedResult = p1.onOptionActivated(nil, nil, { selectedOption = SelectedOption })
		
		if FFlagSduiChartsSortDetailGenreFilter then
			if OnOptionActivatedResult == nil then return end
			UseStateResult2(SelectedOption)
			UseRefResult.current += 1
			Current = UseRefResult.current
		end
		if typeof(OnOptionActivatedResult) == "table" and typeof(OnOptionActivatedResult.finally) == "function" then
			OnOptionActivatedResult:finally(function()
				-- upvalues: UseRefResult (upval), Current (ref), UseStateResult2 (upval)
				if UseRefResult.current == Current then
					UseStateResult2(nil)
				end
			end)
			
			return
		else
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "onOptionActivated did not return a refresh promise",
				propName = "onOptionActivated",
				name = SduiComponentType.OptionSelectorCollection
			}, SduiContext.appPage)
			UseStateResult2(nil)
		end
	end, {
		p1.onOptionActivated,
		SduiContext,
		if FFlagSduiOptionSelectorSkipSelectedRefresh then nil else UseStateResult,
		UseRefResult,
		if FFlagSduiOptionSelectorSkipSelectedRefresh then UseStateResult1 else nil
	})
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), SduiContext (copy), SduiErrorType (upval), SduiComponentType (upval), FFlagSduiOptionSelectorAnchorTag (upval), CryoModule (upval), UseStateResult1 (copy), UseResult (copy)
		if not p1.optionItemConfigs or not p1.optionsData then
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidProps, {
				componentType = SduiComponentType.OptionSelectorCollection,
				message = `Missing {if p1.optionItemConfigs then "optionsData" else "optionItemConfigs"} prop`,
				propName = if p1.optionItemConfigs then "optionsData" else "optionItemConfigs"
			}, SduiContext.appPage)
			
			return {}
		end
		local List = {}
		local T = if FFlagSduiOptionSelectorAnchorTag then {} else nil
		for i, optionItemConfig in p1.optionItemConfigs do
			local Options = p1.optionsData[i]
			local Id = if Options then Options.id else nil
			
			if FFlagSduiOptionSelectorAnchorTag and T then
				local AnchorTag = if Options then Options.anchorTag else nil
				T[i] = if AnchorTag == "" then nil else AnchorTag
			end
			local Copy = table.clone(optionItemConfig)
			Copy.props = CryoModule.Dictionary.join(optionItemConfig.props or {}, {
				isChecked = Id ~= nil and Id == UseStateResult1,
				onActivated = function()
					-- upvalues: UseResult (upval), Id (copy)
					UseResult(Id)
				end
			})
			table.insert(List, Copy)
		end
		if FFlagSduiOptionSelectorAnchorTag then
			return List, T
		else
			return List, nil
		end
	end, {
		p1.optionItemConfigs,
		p1.optionsData,
		UseStateResult1,
		UseResult
	})
	
	return ReactModule.createElement(SduiVariableItemWidthCarouselModule, {
		layoutOrder = 1,
		sideMargin = 0,
		sduiContext = SduiContext,
		analyticsContext = p1.analyticsContext,
		componentConfig = p1.componentConfig,
		debugName = if p1.debugName then `{p1.debugName}.OptionSelector` else nil,
		index = p1.index,
		impressionEventName = if FFlagSduiOptionImpressionsEventName then p1.optionImpressionEventName else nil,
		skipItemImpressionsLog = if FFlagSduiOptionImpressionsEventName then p1.skipOptionItemImpressionsLog else nil,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
		selectionOrderBase = p1.selectionOrderBase,
		startRow = p1.startRow,
		numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
		appCompositionEnabled = p1.appCompositionEnabled,
		items = UseMemoResult,
		itemTags = if FFlagSduiOptionSelectorAnchorTag then UseMemoResult2 else nil,
		itemHeight = p1.itemHeight,
		itemPadding = p1.itemPadding,
		scrollButtonsEnabled = p1.scrollButtonsEnabled,
		headerComponent = if FFlagSduiOptionSelectorHeaderComponent then p1.headerComponent else nil,
		title = p1.title
	}), UseStateResult ~= nil
end