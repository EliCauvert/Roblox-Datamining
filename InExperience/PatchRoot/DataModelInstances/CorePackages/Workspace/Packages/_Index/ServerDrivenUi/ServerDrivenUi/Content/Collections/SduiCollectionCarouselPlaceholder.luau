local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCompat)
local collectionViewsModule = require(parent.CollectionViews)
local useCollectionLayout = collectionViewsModule.useCollectionLayout
local calculateItemWidth = collectionViewsModule.calculateItemWidth
local sduiPlaceholder = require(parent.SduiSharedContent).SduiPlaceholder
local luaAppSduiCarouselPlaceholderHeaderHeightPx = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderHeightPx", 30)
local luaAppSduiCarouselPlaceholderHeaderMinWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMinWidthPct", 30)
local luaAppSduiCarouselPlaceholderHeaderMaxWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct", 60)
local uDim = UDim.new(1, 72)

return reactModule.memo(function(p0) --[[ line: 54 | named "SduiCollectionCarouselPlaceholder" ]]
	-- upvalues: useTokens (ref), useCollectionLayout (ref), signalsReactModule (ref), uDim (ref), reactModule (ref), calculateItemWidth (ref), luaAppSduiCarouselPlaceholderHeaderMinWidthPct (ref), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (ref), sduiPlaceholder (ref), luaAppSduiCarouselPlaceholderHeaderHeightPx (ref)
	local var7 = useTokens()
	local scale = var7.Config.UI.Scale
	local var8 = useCollectionLayout(p0.collectionItemSize)
	local var9 = signalsReactModule.useSignalBinding(var8.getContainerWidth)
	local itemHeightFromWidth = p0.itemHeightFromWidth or uDim
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p0.anchorPoint,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Size = UDim2.fromScale(1, 0),
		ZIndex = p0.zIndex,
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var7.Padding.Medium)
		}),
		Header = reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 1,
			backgroundStyle = p0.backgroundStyle,
			cornerRadius = p0.cornerRadius,
			size = UDim2.new(reactModule.useMemo(function() --[[ line: 94 ]]
				-- upvalues: luaAppSduiCarouselPlaceholderHeaderMinWidthPct (copy), luaAppSduiCarouselPlaceholderHeaderMaxWidthPct (copy)
				local var11 = luaAppSduiCarouselPlaceholderHeaderMinWidthPct / 100
				
				return var11 + math.random() * (luaAppSduiCarouselPlaceholderHeaderMaxWidthPct / 100 - var11)
			end, {}), 0, 0, luaAppSduiCarouselPlaceholderHeaderHeightPx * scale),
			transparencyBinding = p0.transparencyBinding
		}),
		Row = reactModule.createElement(sduiPlaceholder, {
			layoutOrder = 2,
			backgroundStyle = p0.backgroundStyle,
			cornerRadius = p0.cornerRadius,
			size = reactModule.useMemo(function() --[[ line: 65 ]]
				-- upvalues: var9 (ref), calculateItemWidth (copy), var8 (ref), itemHeightFromWidth (ref), scale (ref)
				return var9:map(function(p1) --[[ line: 66 ]]
					-- upvalues: calculateItemWidth (copy), var8 (copy), itemHeightFromWidth (copy), scale (copy)
					return UDim2.new(1, 0, 0, math.max(calculateItemWidth(var8.itemsPerRow, var8.gutter, var8.margin, p1, 0, var8.carouselPeek) * itemHeightFromWidth.Scale + itemHeightFromWidth.Offset * scale, 0))
				end)
			end, {
				var9, var8.itemsPerRow, var8.gutter, var8.margin, var8.carouselPeek,
				itemHeightFromWidth, scale
			}),
			transparencyBinding = p0.transparencyBinding
		})
	})
end)