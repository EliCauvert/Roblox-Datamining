local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldFunction = SduiCoreSystemModule.findAnalyticsField
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiFeedItemModule = require(SduiSharedContent.Components.SduiFeedItem)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiCollectionGridRevealRows = SharedFlagsModule.FFlagSduiCollectionGridRevealRows
local FFlagAppPageShellScrollToTopFocus = SharedFlagsModule.FFlagAppPageShellScrollToTopFocus
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagSduiIndividualFeedItemSpacing = SharedFlagsModule.FFlagSduiIndividualFeedItemSpacing
local FFlagSduiSamePoolFeedItemSpacing = SharedFlagsModule.FFlagSduiSamePoolFeedItemSpacing
local SduiFeedDebugNameWithImpressionsTag = game:DefineFastFlag("SduiFeedDebugNameWithImpressionsTag", false)
local SORTINDEXSELECTIONORDERMULTIPLIER = require(Parent.DiscoveryTypes).Constants.SORT_INDEX_SELECTION_ORDER_MULTIPLIER
local t = {}

local function _(p1, p2, p3: number, p4, p5) --[[ Line: 33 | Named "getSpacingAfterFeedItem" ]]
	-- upvalues: FFlagSduiSamePoolFeedItemSpacing (copy)
	return if p1 == nil then nil elseif FFlagSduiSamePoolFeedItemSpacing and p4 ~= nil and p5 ~= nil and p5.continuesPreviousSection == true then p4 elseif p2 == 1 and p3 ~= nil and p3 >= 0 then p3 else p1
end

return function(p1) --[[ Line: 86 | Named "buildSduiFeedChildren" ]]
	-- upvalues: FFlagSduiIndividualFeedItemSpacing (copy), FindAnalyticsFieldFunction (copy), t (copy), SduiBuilder (copy), SduiErrors (copy), GetSduiComponentWrapperFunction (copy), CryoModule (copy), FFlagSduiCollectionGridRevealRows (copy), FFlagAppPageShellScrollToTopFocus (copy), SORTINDEXSELECTIONORDERMULTIPLIER (copy), ReactModule (copy), SduiFeedDebugNameWithImpressionsTag (copy), FFlagSduiSamePoolFeedItemSpacing (copy), SduiFeedItemModule (copy), FFlagLuaAppsDefaultSelection (copy)
	local Elements = {}
	local SduiContext = p1.sduiContext
	local StartRow = p1.extraLocalProps and p1.extraLocalProps.startRow
	local StartRow1 = if typeof(StartRow) == "number" then StartRow else 1
	local MaxConfigs = p1.maxConfigs
	local GapBetweenFeedItems = if FFlagSduiIndividualFeedItemSpacing then p1.gapBetweenFeedItems else nil
	local GapAfterFirstFeedItem = if FFlagSduiIndividualFeedItemSpacing then p1.gapAfterFirstFeedItem else nil
	for CollectionPosition, config in p1.configs do
		if MaxConfigs ~= nil and MaxConfigs < CollectionPosition then break end
		local ComponentType = FindAnalyticsFieldFunction("componentType", config.analyticsData or t) or SduiBuilder.getComponentType(config, SduiContext)
		
		if not ComponentType then
			SduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
				componentType = p1.componentType,
				name = p1.debugName,
				message = `Nil componentType in {p1.componentType} at index {CollectionPosition}`
			}, SduiContext.appPage)
			continue
		end
		local Text: string = `{p1.componentType}{CollectionPosition}_{ComponentType}`
		local SduiComponentWrapper = GetSduiComponentWrapperFunction(config)
		local LocalAnalyticsData = {
			feedItemPosition = CollectionPosition,
			itemComponentType = ComponentType,
			componentType = ComponentType,
			collectionPosition = CollectionPosition
		}
		local _ = p1.extraLocalProps
		local StartRowGetter = config.startRowGetter
		local Config = if StartRowGetter == nil then nil else { startRow = StartRowGetter }
		local JoinResult = CryoModule.Dictionary.join(CryoModule.Dictionary.join(p1.extraLocalProps or t, {
			startRow = if StartRowGetter == nil then StartRow1 + CollectionPosition - 1 else CryoModule.None,
			setDisplayedRowCount = if FFlagSduiCollectionGridRevealRows then config.setDisplayedRowCount else nil
		}), { index = CollectionPosition })
		
		if FFlagAppPageShellScrollToTopFocus and p1.selectionOrderBase ~= nil then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				selectionOrderBase = p1.selectionOrderBase + CollectionPosition * SORTINDEXSELECTIONORDERMULTIPLIER
			})
		end
		local Element = ReactModule.createElement(SduiComponentWrapper, {
			debugName = if SduiFeedDebugNameWithImpressionsTag and p1.impressionsTag ~= nil and p1.impressionsTag ~= "" then `{Text}_{p1.impressionsTag}` else Text,
			componentConfig = config,
			sduiContext = SduiContext,
			localAnalyticsData = LocalAnalyticsData,
			extraLocalProps = JoinResult,
			extraLocalPropSignals = Config
		})
		local LayoutOrder = if config.props and config.props.layoutOrder ~= nil then config.props.layoutOrder else CollectionPosition
		local ZIndex = if config.props and config.props.zIndex ~= nil then config.props.zIndex else -CollectionPosition
		local Negated = if p1.negateImpressionIndex then -CollectionPosition else CollectionPosition
		local v1: number? = nil
		
		if FFlagSduiIndividualFeedItemSpacing then
			v1 = LayoutOrder * 2
			local SamePoolFeedItemGap = if FFlagSduiSamePoolFeedItemSpacing then p1.samePoolFeedItemGap else nil
			local Config1 = if FFlagSduiSamePoolFeedItemSpacing then p1.configs[CollectionPosition + 1] else nil
			local YOffset = if GapBetweenFeedItems == nil then nil elseif FFlagSduiSamePoolFeedItemSpacing and (SamePoolFeedItemGap ~= nil and Config1 ~= nil and Config1.continuesPreviousSection == true) then SamePoolFeedItemGap elseif CollectionPosition == 1 and GapAfterFirstFeedItem ~= nil and GapAfterFirstFeedItem >= 0 then GapAfterFirstFeedItem else GapBetweenFeedItems
			
			if YOffset ~= nil and YOffset > 0 then
				Elements[`{Text}_GapAfter`] = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, YOffset),
					LayoutOrder = v1 + 1
				})
			end
		end
		Elements[Text] = ReactModule.createElement(SduiFeedItemModule, {
			layoutOrder = if FFlagSduiIndividualFeedItemSpacing then v1 else LayoutOrder,
			zIndex = ZIndex,
			index = Negated,
			impressionsTag = p1.impressionsTag,
			selectionBehaviorLeft = p1.selectionBehaviorLeft,
			selectionBehaviorRight = p1.selectionBehaviorRight,
			defaultFocusRef = if FFlagAppPageShellScrollToTopFocus and FFlagLuaAppsDefaultSelection and CollectionPosition == 1 then p1.defaultFocusRef else nil
		}, { Item = Element })
	end
	return Elements
end