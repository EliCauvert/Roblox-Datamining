local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCompat)
local collectionViewsModule = require(parent.CollectionViews)
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local calculateItemWidth = collectionViewsModule.calculateItemWidth
local sduiPlaceholder = require(parent.SduiSharedContent).SduiPlaceholder
local usePreferredTextSizeLineBudget = require(parent.SduiSharedUtilities).usePreferredTextSizeLineBudget
local sharedFlagsModule = require(parent.SharedFlags)
local fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = sharedFlagsModule.FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx
local fFlagSduiCollectionCarouselPlaceholderItem = sharedFlagsModule.FFlagSduiCollectionCarouselPlaceholderItem
local fFlagSduiPreferredTextSizeLineBudgets = sharedFlagsModule.FFlagSduiPreferredTextSizeLineBudgets
local luaAppSduiCarouselPlaceholderHeaderMinWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMinWidthPct", 30)
local luaAppSduiCarouselPlaceholderHeaderMaxWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct", 60)
local uDim = UDim.new(1, 72)

local function SduiCollectionCarouselItemPlaceholderRow(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return p1.itemSizeBinding:map(function(p2)
			return UDim2.new(0, p2.X, 0, p2.Y)
		end)
	end, { p1.itemSizeBinding })
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.gutter)
		})
	}
	
	for i = 1, if p1.carouselPeek > 0 then p1.itemsPerRow + 1 else p1.itemsPerRow do
		t[`Item{i}`] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = i,
			Size = var1
		}, {
			ItemPlaceholder = reactModule.cloneElement(p1.itemPlaceholderComponent, { transparencyBinding = p1.transparencyBinding })
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p1.layoutOrder,
		Size = p1.rowSizeBinding
	}, t)
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), fFlagSduiPreferredTextSizeLineBudgets (ref), usePreferredTextSizeLineBudget (ref), useCollectionLayout (ref), signalsReactModule (ref), uDim (ref), fFlagSduiCollectionCarouselPlaceholderItem (ref), reactModule (ref), calculateItemWidth (ref), luaAppSduiCarouselPlaceholderHeaderMinWidthPct (ref), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (ref), sduiPlaceholder (ref), fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (ref), SduiCollectionCarouselItemPlaceholderRow (ref)
	local var2
	local var3 = useTokens()
	local scale = var3.Config.UI.Scale
	local var4 = if fFlagSduiPreferredTextSizeLineBudgets then usePreferredTextSizeLineBudget(p2.preferredTextSizeLineCount) else nil
	local var5 = useCollectionLayout(p2.collectionItemSize)
	local var6 = signalsReactModule.useSignalBinding(var5.getContainerWidth)
	local itemHeightFromWidth = p2.itemHeightFromWidth or uDim
	local var7 = nil
	local _ = nil
	
	if fFlagSduiCollectionCarouselPlaceholderItem then
		var7 = reactModule.useMemo(function()
			-- upvalues: var6 (ref), calculateItemWidth (copy), var5 (ref), itemHeightFromWidth (ref), scale (ref), var4 (write)
			return var6:map(function(p3)
				-- upvalues: calculateItemWidth (copy), var5 (copy), itemHeightFromWidth (copy), scale (copy), var4 (copy)
				local var8 = calculateItemWidth(var5.itemsPerRow, var5.gutter, var5.margin, p3, 0, var5.carouselPeek)
				
				return Vector2.new(var8, math.max(var8 * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale + (var4 or 0), 0))
			end)
		end, {
			var6, var5.itemsPerRow, var5.gutter, var5.margin, var5.carouselPeek,
			itemHeightFromWidth, scale,
			if fFlagSduiPreferredTextSizeLineBudgets then var4 else nil
		})
		var2 = reactModule.useMemo(function()
			-- upvalues: var7 (write)
			return var7:map(function(p3)
				return UDim2.new(1, 0, 0, p3.Y)
			end)
		end, { var7 })
	else
		var2 = reactModule.useMemo(function()
			-- upvalues: var6 (ref), calculateItemWidth (copy), var5 (ref), itemHeightFromWidth (ref), scale (ref), var4 (write)
			return var6:map(function(p3)
				-- upvalues: calculateItemWidth (copy), var5 (copy), itemHeightFromWidth (copy), scale (copy), var4 (copy)
				return UDim2.new(1, 0, 0, math.max(calculateItemWidth(var5.itemsPerRow, var5.gutter, var5.margin, p3, 0, var5.carouselPeek) * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale + (var4 or 0), 0))
			end)
		end, {
			var6, var5.itemsPerRow, var5.gutter, var5.margin, var5.carouselPeek,
			itemHeightFromWidth, scale,
			if fFlagSduiPreferredTextSizeLineBudgets then var4 else nil
		})
	end
	return reactModule.createElement("Frame", {
		AnchorPoint = p2.anchorPoint,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p2.layoutOrder,
		Position = p2.position,
		Size = UDim2.fromScale(1, 0),
		ZIndex = p2.zIndex,
		[reactModule.Tag] = if p2.testId then `data-testid={p2.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if fFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then 0 else var3.Padding.Medium)
		}),
		Header = if fFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then nil else reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 1,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = UDim2.new(reactModule.useMemo(function()
				-- upvalues: luaAppSduiCarouselPlaceholderHeaderMinWidthPct (copy), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (copy)
				local var8 = luaAppSduiCarouselPlaceholderHeaderMinWidthPct / 100
				
				return var8 + math.random() * (luaAppSduiCarouselPlaceholderHeaderMaxWidthPct / 100 - var8)
			end, {}), 0, 0, fIntLuaAppSduiCarouselPlaceholderHeaderHeightPx * scale),
			transparencyBinding = p2.transparencyBinding
		}),
		Row = if fFlagSduiCollectionCarouselPlaceholderItem and p2.itemPlaceholderComponent then reactModule.createElement(SduiCollectionCarouselItemPlaceholderRow, {
			layoutOrder = 2,
			carouselPeek = var5.carouselPeek,
			gutter = var5.gutter,
			itemPlaceholderComponent = p2.itemPlaceholderComponent,
			itemSizeBinding = var7,
			itemsPerRow = var5.itemsPerRow,
			rowSizeBinding = var2,
			transparencyBinding = p2.transparencyBinding
		}) else reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 2,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = var2,
			transparencyBinding = p2.transparencyBinding
		})
	})
end)