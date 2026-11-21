local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SduiPlaceholderWrapper = require(Parent.SduiSharedContent).SduiPlaceholderWrapper
local UseOptionSelectorRowModule = require(script.Parent.useOptionSelectorRow)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseOptionSelectorRowModule (copy), ReactModule (copy), CryoModule (copy), SduiPlaceholderWrapper (copy)
	local UseTokensResult = UseTokensFunction()
	local PaddingBetweenOptionSelectorAndCollection = p1.paddingBetweenOptionSelectorAndCollection or UseTokensResult.Size.Size_400
	local UseOptionSelectorRowModuleResult, UseOptionSelectorRowModuleResult2 = UseOptionSelectorRowModule(p1)
	
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
		OptionSelector = UseOptionSelectorRowModuleResult,
		Collection = ReactModule.createElement(SduiPlaceholderWrapper, {
			layoutOrder = 2,
			mountRealDuringPlaceholder = false,
			isPlaceholder = UseOptionSelectorRowModuleResult2,
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