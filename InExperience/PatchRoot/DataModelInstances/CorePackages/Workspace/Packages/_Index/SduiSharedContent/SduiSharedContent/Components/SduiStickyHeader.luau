local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local orientation = foundationModule.Enums.Orientation
local _ = require(parent.SduiCompat)
local _ = require(parent.SduiCoreSystem)
local useScrollAwayHeaderPosition = require(parent.SduiSharedUtilities).useScrollAwayHeaderPosition
local buildSduiFeedChildrenModule = require(sduiSharedContent.Components.buildSduiFeedChildren)

local function buildWrappedItems(p0) --[[ line: 40 ]]
	-- upvalues: buildSduiFeedChildrenModule (ref)
	return buildSduiFeedChildrenModule({
		componentType = "StickyHeader",
		negateImpressionIndex = true,
		configs = p0.stickyItems,
		sduiContext = p0.sduiContext,
		debugName = p0.debugName or "StickyHeader",
		extraLocalProps = p0.extraLocalProps,
		impressionsTag = p0.impressionsTag,
		selectionBehaviorLeft = p0.selectionBehaviorLeft,
		selectionBehaviorRight = p0.selectionBehaviorRight
	})
end

return reactModule.memo(if require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway then function(p2) --[[ line: 54 | named "SduiStickyHeader" ]]
	-- upvalues: buildWrappedItems (ref), reactModule (ref), useScrollAwayHeaderPosition (ref), view (ref), divider (ref), orientation (ref)
	local var6 = buildWrappedItems(p2)
	local var7, var8 = reactModule.useBinding(UDim2.new(1, 0, 0, 0))
	local scrollAway = p2.sduiContext.scrollAway
	local var9 = if scrollAway then scrollAway.scrollAwayHeight else nil
	local var10 = useScrollAwayHeaderPosition({
		enabled = scrollAway ~= nil,
		scrollAwayHeight = var9,
		headerHeightBinding = if scrollAway then scrollAway.headerHeightBinding else nil
	})
	local var11 = reactModule.useCallback(function(p3) --[[ line: 65 ]]
		-- upvalues: var8 (ref)
		var8(UDim2.new(1, 0, 0, p3.AbsoluteSize.Y))
	end, {})
	local var12 = if var9 then math.max(0, var9) else 0
	local var13 = reactModule.useMemo(function() --[[ line: 71 ]]
		-- upvalues: var7 (ref), var12 (ref)
		return var7:map(function(p4) --[[ line: 72 ]]
			-- upvalues: var12 (copy)
			return UDim2.new(1, 0, 0, p4.Y.Offset + var12)
		end)
	end, { var7, var12 })
	
	if next(var6) == nil then
		return nil
	end
	local backgroundStyle = p2.backgroundStyle
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Size = var7,
		LayoutOrder = p2.layoutOrder or 1,
		ZIndex = p2.zIndex or 1
	}, {
		Translation = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Size = var7,
			Position = var10
		}, {
			Background = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = var13,
				BackgroundColor3 = if backgroundStyle then backgroundStyle.Color3 else nil,
				BackgroundTransparency = if backgroundStyle and backgroundStyle.Transparency ~= nil then backgroundStyle.Transparency else 0
			}),
			Content = reactModule.createElement(view, {
				tag = p2.contentTag,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				onAbsoluteSizeChanged = var11,
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				TopSpacer = if p2.paddingTop and p2.paddingTop > 0 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, p2.paddingTop)
				}) else nil,
				StickyContent = reactModule.createElement(view, {
					tag = "size-full-0 auto-y",
					LayoutOrder = 2,
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, p2.gapBetweenItems)
					}
				}, var6),
				BottomSpacer = if p2.paddingBottom and p2.paddingBottom > 0 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, p2.paddingBottom)
				}) else nil,
				StickyDivider = reactModule.createElement(divider, { LayoutOrder = 4, orientation = orientation.Horizontal })
			})
		})
	})
end else function(p1) --[[ line: 154 | named "SduiStickyHeaderLegacy" ]]
	-- upvalues: buildWrappedItems (ref), reactModule (ref), divider (ref), orientation (ref), view (ref)
	local var5 = buildWrappedItems(p1)
	var5.StickyDivider = reactModule.createElement(divider, {
		LayoutOrder = 1e999,
		orientation = orientation.Horizontal
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder or 1,
		ZIndex = p1.zIndex or 1
	}, {
		Content = reactModule.createElement(view, {
			tag = p1.contentTag,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			backgroundStyle = p1.backgroundStyle,
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}
		}, {
			TopSpacer = if p1.paddingTop and p1.paddingTop > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, p1.paddingTop)
			}) else nil,
			StickyContent = reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = 2,
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, p1.gapBetweenItems)
				}
			}, var5),
			BottomSpacer = if p1.paddingBottom and p1.paddingBottom > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, p1.paddingBottom)
			}) else nil
		})
	})
end)