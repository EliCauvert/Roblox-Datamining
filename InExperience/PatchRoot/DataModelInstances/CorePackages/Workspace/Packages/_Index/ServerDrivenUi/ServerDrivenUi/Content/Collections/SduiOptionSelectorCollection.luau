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

return reactModule.memo(function(p0) --[[ line: 65 | named "SduiOptionSelectorCollection" ]]
	-- upvalues: useTokens (ref), reactModule (ref), sduiErrorType (ref), sduiComponentType (ref), cryoModule (ref), sduiVariableItemWidthCarouselModule (ref), fFlagSduiOptionImpressionsEventName (ref), sduiPlaceholderWrapper (ref)
	local sduiContext = p0.sduiContext
	local paddingBetweenOptionSelectorAndCollection = p0.paddingBetweenOptionSelectorAndCollection or useTokens().Size.Size_400
	local var6, var7 = reactModule.useState(nil)
	local var6_1 = var6 or p0.selectedOption
	local var9 = reactModule.useRef(0)
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var7 (ref)
		var7(nil)
	end, { p0.selectedOption })
	local var10 = reactModule.useCallback(function(p1) --[[ line: 83 ]]
		-- upvalues: sduiContext (ref), sduiErrorType (copy), sduiComponentType (copy), var6 (ref), var7 (ref), var9 (ref), p0 (ref)
		if typeof(p1) ~= "string" or p1 == "" then
			sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
				propName = "optionId",
				name = sduiComponentType.OptionSelectorCollection,
				message = `Invalid or missing option id: {p1}`
			}, sduiContext.appPage)
			
			return
		elseif var6 == p1 then return end
		var7(p1)
		var9.current += 1
		local current = var9.current
		local var11 = p0.onOptionActivated(nil, nil, { selectedOption = p1 })
		
		if typeof(var11) == "table" and typeof(var11.finally) == "function" then
			var11:finally(function() --[[ line: 117 ]]
				-- upvalues: var9 (copy), current (ref), var7 (copy)
				if var9.current == current then
					var7(nil)
				end
			end)
			
			return
		end
		sduiContext.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "onOptionActivated did not return a refresh promise",
			propName = "onOptionActivated",
			name = sduiComponentType.OptionSelectorCollection
		}, sduiContext.appPage)
		var7(nil)
	end, { p0.onOptionActivated, sduiContext, var6, var9 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder,
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
			analyticsContext = p0.analyticsContext,
			componentConfig = p0.componentConfig,
			debugName = if p0.debugName then `{p0.debugName}.OptionSelector` else nil,
			index = p0.index,
			impressionEventName = if fFlagSduiOptionImpressionsEventName then p0.optionImpressionEventName else nil,
			skipItemImpressionsLog = if fFlagSduiOptionImpressionsEventName then p0.skipOptionItemImpressionsLog else nil,
			scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
			selectionOrderBase = p0.selectionOrderBase,
			startRow = p0.startRow,
			numUpdatesToDelayImpressions = p0.numUpdatesToDelayImpressions,
			appCompositionEnabled = p0.appCompositionEnabled,
			items = reactModule.useMemo(function() --[[ line: 125 ]]
				-- upvalues: p0 (ref), cryoModule (copy), var6_1 (ref), var10 (ref)
				local t = {}
				
				for i, v in p0.optionItemConfigs do
					local var13 = p0.optionsData[i]
					local var14 = if var13 then var13.id else nil
					local cloned = table.clone(v)
					cloned.props = cryoModule.Dictionary.join(v.props or {}, {
						isChecked = var14 ~= nil and var14 == var6_1,
						onActivated = function() --[[ line: 137 ]]
							-- upvalues: var10 (copy), var14 (ref)
							var10(var14)
						end
					})
					table.insert(t, cloned)
				end
				return t
			end, { p0.optionItemConfigs, p0.optionsData, var6_1, var10 }),
			itemHeight = p0.itemHeight,
			itemPadding = p0.itemPadding,
			scrollButtonsEnabled = p0.scrollButtonsEnabled,
			title = p0.title
		}),
		Collection = reactModule.createElement(sduiPlaceholderWrapper, {
			layoutOrder = 2,
			mountRealDuringPlaceholder = false,
			isPlaceholder = var6 ~= nil,
			transitionDurationSeconds = p0.placeholderTransitionDurationSeconds,
			real = reactModule.useMemo(function() --[[ line: 149 ]]
				-- upvalues: p0 (ref), reactModule (copy), cryoModule (copy)
				return reactModule.cloneElement(p0.collectionComponent, {
					extraLocalProps = cryoModule.Dictionary.join(if p0.collectionComponent.props then p0.collectionComponent.props.extraLocalProps else {}, {
						index = p0.index,
						scrollViewPositionChangedSignal = p0.scrollViewPositionChangedSignal,
						verticalScrollingFrameRef = p0.verticalScrollingFrameRef,
						selectionOrderBase = p0.selectionOrderBase,
						startRow = p0.startRow,
						numUpdatesToDelayImpressions = p0.numUpdatesToDelayImpressions,
						appCompositionEnabled = p0.appCompositionEnabled
					})
				})
			end, {
				p0.collectionComponent, p0.index, p0.scrollViewPositionChangedSignal,
				p0.verticalScrollingFrameRef, p0.selectionOrderBase, p0.startRow,
				p0.numUpdatesToDelayImpressions, p0.appCompositionEnabled
			}),
			placeholder = p0.placeholderCollectionComponent
		})
	})
end)