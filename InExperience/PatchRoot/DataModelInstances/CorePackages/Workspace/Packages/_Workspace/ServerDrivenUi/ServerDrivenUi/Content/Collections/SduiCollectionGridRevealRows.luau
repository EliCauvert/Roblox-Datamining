local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local CollectionGrid = require(Parent.CollectionViews).CollectionGrid
local GuiService = game:GetService("GuiService")
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ShowMoreClickEventFunction = require(Parent.DiscoveryAnalytics).Events.showMoreClickEvent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local FIntLuaAppGameGridRevealMoreButtonGapPx = require(Parent.SharedFlags).FIntLuaAppGameGridRevealMoreButtonGapPx

local function _(p1: number): boolean
	return p1 ~= nil and p1 > 0
end

local _ = function(p1, p2: number, p3: number): number?
	if p2 <= 0 then
		return nil
	end
	local Ceiled = math.ceil(p1 / p2)
	
	if p3 ~= nil and p3 > 0 then
		Ceiled = math.min(Ceiled, p3)
	end
	return Ceiled
end

local _ = function(p1, p2: number)
	if p1 == nil or p2 == nil then
		return nil, false
	end
	local v1 = p1 - (p2 - 1)
	
	if v1 <= 0 then
		return nil, true
	else
		return v1, false
	end
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), DiscoveryEventErrorLogger (copy), ReactFocusNavigationModule (copy), FindAnalyticsFieldInAncestorsFunction (copy), GuiService (copy), ShowMoreClickEventFunction (copy), GetSduiComponentWrapperFunction (copy), FIntLuaAppGameGridRevealMoreButtonGapPx (copy), CollectionGrid (copy), CryoModule (copy)
	local ItemCount = p1.itemCount
	local ItemsPerRow: number = p1.itemsPerRow
	local MaxNumRows: number = p1.maxNumRows
	local TotalNumberOfRows = nil
	
	if ItemsPerRow <= 0 then
		TotalNumberOfRows = nil
	else
		local Ceiled = math.ceil(ItemCount / ItemsPerRow)
		
		if MaxNumRows ~= nil and MaxNumRows > 0 then
			Ceiled = math.min(Ceiled, MaxNumRows)
		end
		TotalNumberOfRows = Ceiled
	end
	local InitialFeedVisibleRows: number = p1.initialFeedVisibleRows
	local IsInitialFeedVisibleRowsAbove: boolean = InitialFeedVisibleRows ~= nil and InitialFeedVisibleRows > 0
	
	if IsInitialFeedVisibleRowsAbove then
		local VisibleRowsPerReveal: number = p1.visibleRowsPerReveal
		IsInitialFeedVisibleRowsAbove = VisibleRowsPerReveal ~= nil and VisibleRowsPerReveal > 0
	end
	local InitialFeedVisibleRows1 = p1.initialFeedVisibleRows
	local StartRow: number = p1.startRow
	local v1 = nil
	local Flag = nil
	
	if InitialFeedVisibleRows1 == nil or StartRow == nil then
		v1 = nil
		Flag = false
	else
		local InitialFeedVisibleRowsDelta = InitialFeedVisibleRows1 - (StartRow - 1)
		
		if InitialFeedVisibleRowsDelta <= 0 then
			v1 = nil
			Flag = true
		else
			v1 = InitialFeedVisibleRowsDelta
			Flag = false
		end
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(v1)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), v1 (copy)
		UseStateResult2(v1)
	end, {
		v1,
		p1.initialFeedVisibleRows,
		p1.visibleRowsPerReveal,
		p1.startRow,
		p1.sduiContext.dataUpdatedTimestamp
	})
	ReactModule.useEffect(function()
		-- upvalues: IsInitialFeedVisibleRowsAbove (copy), Flag (copy), DiscoveryEventErrorLogger (upval), p1 (copy)
		if IsInitialFeedVisibleRowsAbove and Flag then
			DiscoveryEventErrorLogger.reportError("SduiCollectionGridRevealRowsInvalidFeedThreshold", "Unable to reveal CollectionGrid rows because the grid starts after the feed threshold", {
				initialFeedVisibleRows = p1.initialFeedVisibleRows,
				startRow = p1.startRow
			})
		end
	end, {
		IsInitialFeedVisibleRowsAbove,
		Flag,
		p1.initialFeedVisibleRows,
		p1.startRow
	})
	local HasUseStateResult: boolean = IsInitialFeedVisibleRowsAbove and (not Flag and (TotalNumberOfRows ~= nil and UseStateResult ~= nil))
	local Smallest = if HasUseStateResult then math.min(UseStateResult, TotalNumberOfRows) else nil
	local IsSmallestBelow: boolean = HasUseStateResult and Smallest < TotalNumberOfRows
	local Smallest1 = if IsSmallestBelow then Smallest else nil
	ReactModule.useLayoutEffect(function()
		-- upvalues: p1 (copy), Smallest1 (copy)
		p1.setDisplayedRowCount(Smallest1)
	end, { p1.setDisplayedRowCount, Smallest1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		local SetDisplayedRowCountFunction = p1.setDisplayedRowCount
		
		return function()
			-- upvalues: SetDisplayedRowCountFunction (copy)
			SetDisplayedRowCountFunction(nil)
		end
	end, { p1.setDisplayedRowCount })
	local UseMostRecentFocusBehaviorResult = ReactFocusNavigationModule.useMostRecentFocusBehavior(p1.setContainerFrame)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local CollectionId = FindAnalyticsFieldInAncestorsFunction("collectionId", p1.analyticsContext)
	local CollectionPosition = FindAnalyticsFieldInAncestorsFunction("collectionPosition", p1.analyticsContext)
	local Element = ReactModule.createElement(GetSduiComponentWrapperFunction(p1.revealRowsComponent), {
		debugName = "SduiCollectionGridRevealRows.RevealRowsComponent",
		componentConfig = p1.revealRowsComponent,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			layoutOrder = 2,
			zIndex = 1,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Smallest (copy), TotalNumberOfRows (copy), p1 (copy), GuiService (upval), UseFocusGuiObjectResult (copy), UseStateResult2 (copy), CollectionId (copy), CollectionPosition (copy), ShowMoreClickEventFunction (upval), DiscoveryEventErrorLogger (upval)
				if Smallest == nil or TotalNumberOfRows == nil or p1.visibleRowsPerReveal == nil then return end
				if GuiService.SelectedCoreObject ~= nil and p1.containerFrame ~= nil then
					UseFocusGuiObjectResult(p1.containerFrame)
				end
				local Smallest1 = math.min(Smallest + p1.visibleRowsPerReveal, TotalNumberOfRows)
				UseStateResult2(Smallest1)
				
				if typeof(CollectionId) == "string" and typeof(CollectionPosition) == "number" then
					ShowMoreClickEventFunction(p1.sduiContext.appPage or (p1.sduiContext.routeName or ""), {
						topicId = CollectionId,
						sortIndex = CollectionPosition,
						previousVisibleRows = Smallest,
						newVisibleRows = Smallest1,
						visibleRowsPerReveal = p1.visibleRowsPerReveal,
						totalNumberOfRows = TotalNumberOfRows
					})
					
					return
				else
					DiscoveryEventErrorLogger.reportError("SduiCollectionGridRevealRowsMissingAnalytics", "Revealed CollectionGrid rows without valid collection analytics", { topicId = CollectionId, sortIndex = CollectionPosition })
				end
			end, {
				TotalNumberOfRows, UseFocusGuiObjectResult, p1.containerFrame, p1.sduiContext,
				p1.visibleRowsPerReveal, CollectionPosition, CollectionId, Smallest
			})
		}
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.gridProps.LayoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, FIntLuaAppGameGridRevealMoreButtonGapPx)
		}),
		CollectionGrid = ReactModule.createElement(CollectionGrid, CryoModule.Dictionary.join(p1.gridProps, {
			LayoutOrder = 1,
			containerRef = UseMostRecentFocusBehaviorResult,
			ZIndex = if HasUseStateResult then 2 else p1.gridProps.ZIndex,
			maxNumRows = if HasUseStateResult then Smallest else p1.gridProps.maxNumRows
		})),
		RevealMoreButton = if IsSmallestBelow then Element else nil
	})
end)