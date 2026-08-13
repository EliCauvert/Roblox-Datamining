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
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway
local sduiStickyHeaderDividerLayoutOrderConstant = game:DefineFastFlag("SduiStickyHeaderDividerLayoutOrderConstant", false)

local function buildWrappedItems(p0) --[[ line: 44 ]]
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

return reactModule.memo(if fFlagLuaAppSduiStickyHeaderScrollAway then function(p2) --[[ line: 58 | named "SduiStickyHeader" ]]
	-- upvalues: buildWrappedItems (ref), reactModule (ref), useScrollAwayHeaderPosition (ref), view (ref), divider (ref), orientation (ref)
	local var7 = buildWrappedItems(p2)
	local var8, var9 = reactModule.useBinding(UDim2.new(1, 0, 0, 0))
	local scrollAway = p2.sduiContext.scrollAway
	local var10 = if scrollAway then scrollAway.scrollAwayHeight else nil
	local var11 = useScrollAwayHeaderPosition({
		enabled = scrollAway ~= nil,
		scrollAwayHeight = var10,
		headerHeightBinding = if scrollAway then scrollAway.headerHeightBinding else nil
	})
	local var12 = reactModule.useCallback(function(p3) --[[ line: 69 ]]
		-- upvalues: var9 (ref)
		var9(UDim2.new(1, 0, 0, p3.AbsoluteSize.Y))
	end, {})
	local var13 = if var10 then math.max(0, var10) else 0
	local var14 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: var8 (ref), var13 (ref)
		return var8:map(function(p4) --[[ line: 76 ]]
			-- upvalues: var13 (copy)
			return UDim2.new(1, 0, 0, p4.Y.Offset + var13)
		end)
	end, { var8, var13 })
	
	if next(var7) == nil then
		return nil
	end
	local backgroundStyle = p2.backgroundStyle
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Size = var8,
		LayoutOrder = p2.layoutOrder or 1,
		ZIndex = p2.zIndex or 1
	}, {
		Translation = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Size = var8,
			Position = var11
		}, {
			Background = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = var14,
				BackgroundColor3 = if backgroundStyle then backgroundStyle.Color3 else nil,
				BackgroundTransparency = if backgroundStyle and backgroundStyle.Transparency ~= nil then backgroundStyle.Transparency else 0
			}),
			Content = reactModule.createElement(view, {
				tag = p2.contentTag,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				onAbsoluteSizeChanged = var12,
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
				}, var7),
				BottomSpacer = if p2.paddingBottom and p2.paddingBottom > 0 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, p2.paddingBottom)
				}) else nil,
				StickyDivider = reactModule.createElement(divider, { LayoutOrder = 4, orientation = orientation.Horizontal })
			})
		})
	})
end else function(p1) --[[ line: 158 | named "SduiStickyHeaderLegacy" ]]
	-- upvalues: buildWrappedItems (ref), reactModule (ref), divider (ref), orientation (ref), sduiStickyHeaderDividerLayoutOrderConstant (ref), view (ref)
	local var6 = buildWrappedItems(p1)
	var6.StickyDivider = reactModule.createElement(divider, {
		orientation = orientation.Horizontal,
		LayoutOrder = if sduiStickyHeaderDividerLayoutOrderConstant then 1000000 else 1e999
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
			}, var6),
			BottomSpacer = if p1.paddingBottom and p1.paddingBottom > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, p1.paddingBottom)
			}) else nil
		})
	})
end)