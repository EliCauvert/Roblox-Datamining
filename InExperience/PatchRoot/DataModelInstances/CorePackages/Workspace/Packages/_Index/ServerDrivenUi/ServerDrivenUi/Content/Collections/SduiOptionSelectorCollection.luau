local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useTokens = require(parent.Foundation).Hooks.useTokens
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiComponentType = sduiCoreSystemModule.SduiComponentType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiPlaceholderWrapper = require(parent.SduiSharedContent).SduiPlaceholderWrapper
local sduiVariableItemWidthCarouselModule = require(serverDrivenUi.Content.Collections.SduiVariableItemWidthCarousel)
local fFlagSduiOptionImpressionsEventName = require(parent.SharedFlags).FFlagSduiOptionImpressionsEventName
local fFlagSduiChartsSortDetailGenreFilter = require(parent.SharedFlags).FFlagSduiChartsSortDetailGenreFilter
local luaAppNilCheckOptionItemConfigs = game:DefineFastFlag("LuaAppNilCheckOptionItemConfigs", false)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), sduiErrorType (ref), sduiComponentType (ref), fFlagSduiChartsSortDetailGenreFilter (ref), luaAppNilCheckOptionItemConfigs (ref), cryoModule (ref), sduiVariableItemWidthCarouselModule (ref), fFlagSduiOptionImpressionsEventName (ref), sduiPlaceholderWrapper (ref)
	local sduiContext = p1.sduiContext
	local paddingBetweenOptionSelectorAndCollection = p1.paddingBetweenOptionSelectorAndCollection or useTokens().Size.Size_400
	local var1, var2 = reactModule.useState(nil)
	local var3 = var1 or p1.selectedOption
	local var4 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2(nil)
	end, { p1.selectedOption })
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: sduiContext (ref), sduiErrorType (copy), sduiComponentType (copy), var1 (ref), fFlagSduiChartsSortDetailGenreFilter (copy), var2 (ref), var4 (ref), p1 (ref)
		if typeof(p2) ~= "string" or p2 == "" then
			sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				propName = "optionId",
				name = sduiComponentType.OptionSelectorCollection,
				message = `Invalid or missing option id: {p2}`
			}, sduiContext.appPage)
			
			return
		elseif var1 == p2 then return end
		local current = nil
		
		if not fFlagSduiChartsSortDetailGenreFilter then
			var2(p2)
			var4.current += 1
			current = var4.current
		end
		local var6 = p1.onOptionActivated(nil, nil, { selectedOption = p2 })
		
		if fFlagSduiChartsSortDetailGenreFilter then
			if var6 == nil then return end
			var2(p2)
			var4.current += 1
			current = var4.current
		end
		if typeof(var6) == "table" and typeof(var6.finally) == "function" then
			var6:finally(function()
				-- upvalues: var4 (copy), current (write), var2 (copy)
				if var4.current == current then
					var2(nil)
				end
			end)
			
			return
		end
		sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "onOptionActivated did not return a refresh promise",
			propName = "onOptionActivated",
			name = sduiComponentType.OptionSelectorCollection
		}, sduiContext.appPage)
		var2(nil)
	end, { p1.onOptionActivated, sduiContext, var1, var4 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 0)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, paddingBetweenOptionSelectorAndCollection)
		}),
		OptionSelector = reactModule.createElement(sduiVariableItemWidthCarouselModule, {
			layoutOrder = 1,
			sideMargin = 0,
			sduiContext = sduiContext,
			analyticsContext = p1.analyticsContext,
			componentConfig = p1.componentConfig,
			debugName = if p1.debugName then `{p1.debugName}.OptionSelector` else nil,
			index = p1.index,
			impressionEventName = if fFlagSduiOptionImpressionsEventName then p1.optionImpressionEventName else nil,
			skipItemImpressionsLog = if fFlagSduiOptionImpressionsEventName then p1.skipOptionItemImpressionsLog else nil,
			scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
			selectionOrderBase = p1.selectionOrderBase,
			startRow = p1.startRow,
			numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
			appCompositionEnabled = p1.appCompositionEnabled,
			items = reactModule.useMemo(function()
				-- upvalues: luaAppNilCheckOptionItemConfigs (copy), p1 (ref), sduiContext (ref), sduiErrorType (copy), sduiComponentType (copy), cryoModule (copy), var3 (ref), var5 (ref)
				if luaAppNilCheckOptionItemConfigs and (not p1.optionItemConfigs or not p1.optionsData) then
					sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidProps, {
						componentType = sduiComponentType.OptionSelectorCollection,
						message = `Missing {if not p1.optionItemConfigs then "optionItemConfigs" else "optionsData"} prop`,
						propName = if not p1.optionItemConfigs then "optionItemConfigs" else "optionsData"
					}, sduiContext.appPage)
					
					return {}
				end
				local t = {}
				
				for i, v in p1.optionItemConfigs do
					local var6 = p1.optionsData[i]
					local var7 = if var6 then var6.id else nil
					local cloned = table.clone(v)
					cloned.props = cryoModule.Dictionary.join(v.props or {}, {
						isChecked = var7 ~= nil and var7 == var3,
						onActivated = function()
							-- upvalues: var5 (copy), var7 (ref)
							var5(var7)
						end
					})
					table.insert(t, cloned)
				end
				return t
			end, { p1.optionItemConfigs, p1.optionsData, var3, var5 }),
			itemHeight = p1.itemHeight,
			itemPadding = p1.itemPadding,
			scrollButtonsEnabled = p1.scrollButtonsEnabled,
			title = p1.title
		}),
		Collection = reactModule.createElement(sduiPlaceholderWrapper, {
			layoutOrder = 2,
			mountRealDuringPlaceholder = false,
			isPlaceholder = var1 ~= nil,
			transitionDurationSeconds = p1.placeholderTransitionDurationSeconds,
			real = reactModule.useMemo(function()
				-- upvalues: p1 (ref), reactModule (copy), cryoModule (copy)
				return reactModule.cloneElement(p1.collectionComponent, {
					extraLocalProps = cryoModule.Dictionary.join(if p1.collectionComponent.props then p1.collectionComponent.props.extraLocalProps else {}, {
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