local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local collectionGrid = require(parent.CollectionViews).CollectionGrid
local guiService = game:GetService("GuiService")
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local showMoreClickEvent = require(parent.DiscoveryAnalytics).Events.showMoreClickEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local fIntLuaAppGameGridRevealMoreButtonGapPx = require(parent.SharedFlags).FIntLuaAppGameGridRevealMoreButtonGapPx

local function _(p1)
	return p1 ~= nil and p1 > 0
end

local _ = function(p1, p2, p3)
	if p2 <= 0 then
		return nil
	end
	local ceiled = math.ceil(p1 / p2)
	
	if p3 ~= nil and p3 > 0 then
		ceiled = math.min(ceiled, p3)
	end
	return ceiled
end

local _ = function(p1, p2)
	if p1 == nil or p2 == nil then
		return nil, false
	end
	local var1 = p1 - (p2 - 1)
	
	if var1 <= 0 then
		return nil, true
	end
	return var1, false
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), discoveryEventErrorLogger (ref), reactFocusNavigationModule (ref), findAnalyticsFieldInAncestors (ref), guiService (ref), showMoreClickEvent (ref), getSduiComponentWrapper (ref), fIntLuaAppGameGridRevealMoreButtonGapPx (ref), collectionGrid (ref), cryoModule (ref)
	local var1
	local itemCount = p1.itemCount
	local itemsPerRow = p1.itemsPerRow
	local maxNumRows = p1.maxNumRows
	
	if itemsPerRow <= 0 then
		var1 = nil
	else
		local ceiled = math.ceil(itemCount / itemsPerRow)
		
		if maxNumRows ~= nil and maxNumRows > 0 then
			ceiled = math.min(ceiled, maxNumRows)
		end
		var1 = ceiled
	end
	local initialFeedVisibleRows = p1.initialFeedVisibleRows
	local var2 = initialFeedVisibleRows ~= nil and initialFeedVisibleRows > 0
	
	if var2 then
		local visibleRowsPerReveal = p1.visibleRowsPerReveal
		var2 = visibleRowsPerReveal ~= nil and visibleRowsPerReveal > 0
	end
	local var3, var4
	local initialFeedVisibleRows_1 = p1.initialFeedVisibleRows
	local startRow = p1.startRow
	
	if initialFeedVisibleRows_1 == nil or startRow == nil then
		var3 = nil
		var4 = false
	else
		local var5 = initialFeedVisibleRows_1 - (startRow - 1)
		
		if var5 <= 0 then
			var3 = nil
			var4 = true
		else
			var3 = var5
			var4 = false
		end
	end
	initialFeedVisibleRows_1, var13 = reactModule.useState(var3)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var3 (ref)
		var13(var3)
	end, {
		var3,
		p1.initialFeedVisibleRows,
		p1.visibleRowsPerReveal,
		p1.startRow,
		p1.sduiContext.dataUpdatedTimestamp
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), discoveryEventErrorLogger (copy), p1 (ref)
		if var2 and var4 then
			discoveryEventErrorLogger.reportError("SduiCollectionGridRevealRowsInvalidFeedThreshold", "Unable to reveal CollectionGrid rows because the grid starts after the feed threshold", {
				initialFeedVisibleRows = p1.initialFeedVisibleRows,
				startRow = p1.startRow
			})
		end
	end, { var2, var4, p1.initialFeedVisibleRows, p1.startRow })
	local var6 = var2 and (not var4 and (var1 ~= nil and initialFeedVisibleRows_1 ~= nil))
	local var7 = if var6 then math.min(initialFeedVisibleRows_1, var1) else nil
	local var8 = var6 and var7 < var1
	local var9 = if var8 then var7 else nil
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), var9 (ref)
		p1.setDisplayedRowCount(var9)
	end, { p1.setDisplayedRowCount, var9 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local setDisplayedRowCount = p1.setDisplayedRowCount
		
		return function()
			-- upvalues: setDisplayedRowCount (ref)
			setDisplayedRowCount(nil)
		end
	end, { p1.setDisplayedRowCount })
	local var10 = reactFocusNavigationModule.useMostRecentFocusBehavior(p1.setContainerFrame)
	local var11 = reactFocusNavigationModule.useFocusGuiObject()
	local var12 = findAnalyticsFieldInAncestors("collectionId", p1.analyticsContext)
	local var13 = findAnalyticsFieldInAncestors("collectionPosition", p1.analyticsContext)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.gridProps.LayoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, fIntLuaAppGameGridRevealMoreButtonGapPx)
		}),
		CollectionGrid = reactModule.createElement(collectionGrid, cryoModule.Dictionary.join(p1.gridProps, {
			LayoutOrder = 1,
			containerRef = var10,
			ZIndex = if var6 then 2 else p1.gridProps.ZIndex,
			maxNumRows = if var6 then var7 else p1.gridProps.maxNumRows
		})),
		RevealMoreButton = if var8 then reactModule.createElement(getSduiComponentWrapper(p1.revealRowsComponent), {
			debugName = "SduiCollectionGridRevealRows.RevealRowsComponent",
			componentConfig = p1.revealRowsComponent,
			sduiContext = p1.sduiContext,
			extraLocalProps = {
				layoutOrder = 2,
				zIndex = 1,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var7 (ref), var1 (ref), p1 (ref), guiService (copy), var11 (ref), var13 (ref), var12 (ref), var13 (ref), showMoreClickEvent (copy), discoveryEventErrorLogger (copy)
					if var7 == nil or var1 == nil or p1.visibleRowsPerReveal == nil then return end
					if guiService.SelectedCoreObject ~= nil and p1.containerFrame ~= nil then
						var11(p1.containerFrame)
					end
					local minValue = math.min(var7 + p1.visibleRowsPerReveal, var1)
					var13(minValue)
					
					if typeof(var12) == "string" and typeof(var13) == "number" then
						showMoreClickEvent(p1.sduiContext.appPage or (p1.sduiContext.routeName or ""), {
							topicId = var12,
							sortIndex = var13,
							previousVisibleRows = var7,
							newVisibleRows = minValue,
							visibleRowsPerReveal = p1.visibleRowsPerReveal,
							totalNumberOfRows = var1
						})
						
						return
					end
					discoveryEventErrorLogger.reportError("SduiCollectionGridRevealRowsMissingAnalytics", "Revealed CollectionGrid rows without valid collection analytics", { topicId = var12, sortIndex = var13 })
				end, {
					var1, var11, p1.containerFrame, p1.sduiContext, p1.visibleRowsPerReveal, var13,
					var12, var7
				})
			}
		}) else nil
	})
end)