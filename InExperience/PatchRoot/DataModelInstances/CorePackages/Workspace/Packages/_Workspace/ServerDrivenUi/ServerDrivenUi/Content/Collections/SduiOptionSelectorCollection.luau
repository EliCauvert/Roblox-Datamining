local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiComponentType = SduiCoreSystemModule.SduiComponentType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiPlaceholderWrapper = require(Parent.SduiSharedContent).SduiPlaceholderWrapper
local SduiVariableItemWidthCarouselModule = require(ServerDrivenUi.Content.Collections.SduiVariableItemWidthCarousel)
local FFlagSduiOptionImpressionsEventName = require(Parent.SharedFlags).FFlagSduiOptionImpressionsEventName
local FFlagSduiOptionSelectorHeaderComponent = require(Parent.SharedFlags).FFlagSduiOptionSelectorHeaderComponent
local FFlagSduiChartsSortDetailGenreFilter = require(Parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local FFlagSduiOptionSelectorAnchorTag = require(Parent.SharedFlags).FFlagSduiOptionSelectorAnchorTag
local LuaAppNilCheckOptionItemConfigs = game:DefineFastFlag("LuaAppNilCheckOptionItemConfigs", false)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SduiErrorType (copy), SduiComponentType (copy), FFlagSduiChartsSortDetailGenreFilter (copy), LuaAppNilCheckOptionItemConfigs (copy), FFlagSduiOptionSelectorAnchorTag (copy), CryoModule (copy), SduiVariableItemWidthCarouselModule (copy), FFlagSduiOptionImpressionsEventName (copy), FFlagSduiOptionSelectorHeaderComponent (copy), SduiPlaceholderWrapper (copy)
	local SduiContext = p1.sduiContext
	local UseTokensResult = UseTokensFunction()
	local PaddingBetweenOptionSelectorAndCollection = p1.paddingBetweenOptionSelectorAndCollection or UseTokensResult.Size.Size_400
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1 = UseStateResult or p1.selectedOption
	local UseRefResult = ReactModule.useRef(0)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, { p1.selectedOption })
	local UseResult = ReactModule.useCallback(function(SelectedOption)
		-- upvalues: SduiContext (copy), SduiErrorType (upval), SduiComponentType (upval), UseStateResult (copy), FFlagSduiChartsSortDetailGenreFilter (upval), UseStateResult2 (copy), UseRefResult (copy), p1 (copy)
		if typeof(SelectedOption) ~= "string" or SelectedOption == "" then
			SduiContext.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
				propName = "optionId",
				name = SduiComponentType.OptionSelectorCollection,
				message = `Invalid or missing option id: {SelectedOption}`
			}, SduiContext.appPage)
			
			return
		end
		if UseStateResult == SelectedOption then return end
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
		UseStateResult,
		UseRefResult
	})
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: LuaAppNilCheckOptionItemConfigs (upval), p1 (copy), SduiContext (copy), SduiErrorType (upval), SduiComponentType (upval), FFlagSduiOptionSelectorAnchorTag (upval), CryoModule (upval), UseStateResult1 (copy), UseResult (copy)
		if LuaAppNilCheckOptionItemConfigs and (not p1.optionItemConfigs or not p1.optionsData) then
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
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, PaddingBetweenOptionSelectorAndCollection)
		}),
		OptionSelector = ReactModule.createElement(SduiVariableItemWidthCarouselModule, {
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
		}),
		Collection = ReactModule.createElement(SduiPlaceholderWrapper, {
			layoutOrder = 2,
			mountRealDuringPlaceholder = false,
			isPlaceholder = UseStateResult ~= nil,
			transitionDurationSeconds = p1.placeholderTransitionDurationSeconds,
			real = ReactModule.useMemo(function()
				-- upvalues: p1 (copy), ReactModule (upval), CryoModule (upval)
				return ReactModule.cloneElement(p1.collectionComponent, {
					extraLocalProps = CryoModule.Dictionary.join(p1.collectionComponent.props and p1.collectionComponent.props.extraLocalProps or {}, {
						index = p1.index,
						scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
						selectionOrderBase = p1.selectionOrderBase,
						startRow = p1.startRow,
						numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
						appCompositionEnabled = p1.appCompositionEnabled
					})
				})
			end, {
				p1.collectionComponent, p1.index, p1.scrollViewPositionChangedSignal,
				p1.verticalScrollingFrameRef, p1.selectionOrderBase, p1.startRow,
				p1.numUpdatesToDelayImpressions, p1.appCompositionEnabled
			}),
			placeholder = p1.placeholderCollectionComponent
		})
	})
end)