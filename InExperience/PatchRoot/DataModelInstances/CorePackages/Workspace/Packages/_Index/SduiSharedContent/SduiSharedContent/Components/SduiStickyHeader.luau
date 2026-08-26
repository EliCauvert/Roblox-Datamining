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

local function buildWrappedItems(p1)
	-- upvalues: buildSduiFeedChildrenModule (ref)
	return buildSduiFeedChildrenModule({
		componentType = "StickyHeader",
		negateImpressionIndex = true,
		configs = p1.stickyItems,
		sduiContext = p1.sduiContext,
		debugName = p1.debugName or "StickyHeader",
		extraLocalProps = p1.extraLocalProps,
		impressionsTag = p1.impressionsTag,
		selectionBehaviorLeft = p1.selectionBehaviorLeft,
		selectionBehaviorRight = p1.selectionBehaviorRight
	})
end

return reactModule.memo(if fFlagLuaAppSduiStickyHeaderScrollAway then function(p1)
	-- upvalues: buildWrappedItems (ref), reactModule (ref), useScrollAwayHeaderPosition (ref), view (ref), divider (ref), orientation (ref)
	local var1 = buildWrappedItems(p1)
	local var2, var3 = reactModule.useBinding(UDim2.new(1, 0, 0, 0))
	local scrollAway = p1.sduiContext.scrollAway
	local var4 = if scrollAway then scrollAway.scrollAwayHeight else nil
	local var5 = useScrollAwayHeaderPosition({
		enabled = scrollAway ~= nil,
		scrollAwayHeight = var4,
		headerHeightBinding = if scrollAway then scrollAway.headerHeightBinding else nil
	})
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(UDim2.new(1, 0, 0, p2.AbsoluteSize.Y))
	end, {})
	local var7 = if var4 then math.max(0, var4) else 0
	local var8 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var7 (ref)
		return var2:map(function(p2)
			-- upvalues: var7 (copy)
			return UDim2.new(1, 0, 0, p2.Y.Offset + var7)
		end)
	end, { var2, var7 })
	
	if next(var1) == nil then
		return nil
	end
	local backgroundStyle = p1.backgroundStyle
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Size = var2,
		LayoutOrder = p1.layoutOrder or 1,
		ZIndex = p1.zIndex or 1
	}, {
		Translation = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Size = var2,
			Position = var5
		}, {
			Background = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = var8,
				BackgroundColor3 = if backgroundStyle then backgroundStyle.Color3 else nil,
				BackgroundTransparency = if backgroundStyle and backgroundStyle.Transparency ~= nil then backgroundStyle.Transparency else 0
			}),
			Content = reactModule.createElement(view, {
				tag = p1.contentTag,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				onAbsoluteSizeChanged = var6,
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
				}, var1),
				BottomSpacer = if p1.paddingBottom and p1.paddingBottom > 0 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, p1.paddingBottom)
				}) else nil,
				StickyDivider = reactModule.createElement(divider, { LayoutOrder = 4, orientation = orientation.Horizontal })
			})
		})
	})
end else function(p1)
	-- upvalues: buildWrappedItems (ref), reactModule (ref), divider (ref), orientation (ref), sduiStickyHeaderDividerLayoutOrderConstant (ref), view (ref)
	local var1 = buildWrappedItems(p1)
	var1.StickyDivider = reactModule.createElement(divider, {
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
			}, var1),
			BottomSpacer = if p1.paddingBottom and p1.paddingBottom > 0 then reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, p1.paddingBottom)
			}) else nil
		})
	})
end)