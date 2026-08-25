local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local t = { OS = "roblox" }
local deepDifferModule = require(parent.Utilities.differ.deepDiffer)
local reactModule = require(parent_1.React)
local virtualizedListModule = require(parent.Lists.VirtualizedList)
local viewModule = require(parent.Components.View.View)
local styleSheetModule = require(parent.StyleSheet.StyleSheet)
local invariantModule = require(parent.jsUtils.invariant)
local scrollView = parent.Components.ScrollView
local _ = require(scrollView.ScrollView)
local _ = require(scrollView.ScrollViewNativeComponent)
local _ = require(parent.Lists.ViewabilityHelper)
local _ = require(parent.Lists.VirtualizedList)
local keyExtractor = require(script.Parent.VirtualizeUtils).keyExtractor

local function _(p0)
	return if p0 == nil then false else p0
end

local _ = function(p1)
	return if p1 == nil then 1 else p1
end

local flatList = reactModule.PureComponent:extend("FlatList")

function flatList.init(p2, _)
	-- upvalues: keyExtractor (ref), array (ref), invariantModule (ref), reactModule (ref), viewModule (ref), styleSheetModule (ref), object (ref)
	p2._virtualizedListPairs = {}
	
	function p2._captureRef(p3)
		-- upvalues: p2 (ref)
		p2._listRef = p3
	end
	
	function p2._getItem(p4, p5)
		-- upvalues: p2 (ref)
		local numColumns = p2.props.numColumns
		local var9 = if numColumns ~= nil then 1 else numColumns
		
		if var9 <= 1 then
			return p4[p5]
		end
		local t = {}
		
		for i = 1, var9 do
			local var11 = p4[(p5 - 1) * var9 + i]
			
			if var11 ~= nil then
				table.insert(t, var11)
			end
		end
		return t
	end
	
	function p2._getItemCount(p6)
		-- upvalues: p2 (ref)
		if p6 == nil then
			return 0
		end
		local numColumns = p2.props.numColumns
		local var12 = if numColumns ~= nil then 1 else numColumns
		
		return if var12 > 1 then math.ceil(#p6 / var12) else #p6
	end
	
	function p2._keyExtractor(p7, p8)
		-- upvalues: p2 (ref), keyExtractor (copy), array (copy), invariantModule (copy)
		local numColumns = p2.props.numColumns
		local var13 = if numColumns ~= nil then 1 else numColumns
		local var14 = if p2.props.keyExtractor ~= nil then keyExtractor else p2.props.keyExtractor
		
		if var13 <= 1 then
			return var14(p7, p8)
		elseif array.isArray(p7) then
			return array.join(array.map(p7, function(p9, p10)
				-- upvalues: var14 (ref), p8 (ref), var13 (ref)
				return var14(p9, (p8 - 1) * var13 + p10)
			end), ":")
		end
		invariantModule(array.isArray(p7), "FlatList: Encountered internal consistency error, expected each item to consist of an array with 1-%s columns; instead, received a single item.", var13)
		
		return nil
	end
	
	function p2._renderer()
		-- upvalues: p2 (ref), reactModule (copy), invariantModule (copy), array (copy), viewModule (copy), styleSheetModule (copy), object (copy)
		local listItemComponent = p2.props.ListItemComponent
		local renderItem = p2.props.renderItem
		local columnWrapperStyle = p2.props.columnWrapperStyle
		local numColumns = p2.props.numColumns
		local var15 = if numColumns ~= nil then 1 else numColumns
		
		local function renderer(p11)
			-- upvalues: listItemComponent (ref), reactModule (copy), renderItem (ref)
			return if listItemComponent then reactModule.createElement(listItemComponent, p11) elseif renderItem then renderItem(p11) else nil
		end
		
		return {
			[if listItemComponent then "ListItemComponent" else "renderItem"] = function(p12)
				-- upvalues: var15 (ref), reactModule (copy), p2 (copy), invariantModule (copy), array (copy), viewModule (copy), styleSheetModule (copy), columnWrapperStyle (ref), object (copy), listItemComponent (ref), renderItem (ref), renderer (ref)
				if var15 > 1 then
					local UIListLayout = reactModule.createElement("UIListLayout", {
						key = if p2.props.horizontal then "UIListVerticalLayout" else "UIListHorizontalLayout",
						Name = if p2.props.horizontal then "UIListVerticalLayout" else "UIListHorizontalLayout",
						FillDirection = if p2.props.horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					})
					local item = p12.item
					local index = p12.index
					invariantModule(array.isArray(item), "Expected array of items with numColumns > 1")
					
					return reactModule.createElement(viewModule, { style = styleSheetModule.compose(columnWrapperStyle) }, array.concat({ UIListLayout }, array.map(item, function(p13, p14)
						-- upvalues: object (copy), index (ref), var15 (copy), p12 (ref), listItemComponent (copy), reactModule (copy), renderItem (copy)
						local t = {
							item = object.assign({}, p13, { LayoutOrder = p14 }),
							index = (index - 1) * var15 + p14,
							separators = p12.separators
						}
						local var19 = if listItemComponent then reactModule.createElement(listItemComponent, t) elseif renderItem then renderItem(t) else nil
						
						return if var19 == nil then nil else reactModule.createElement(reactModule.Fragment, { key = p14 }, var19)
					end)))
				end
				return renderer(p12)
			end
		}
	end
	
	p2:_checkProps(p2.props)
	
	if p2.props.viewabilityConfigCallbackPairs then
		p2._virtualizedListPairs = array.map(p2.props.viewabilityConfigCallbackPairs, function(p15)
			-- upvalues: p2 (ref)
			return {
				viewabilityConfig = p15.viewabilityConfig,
				onViewableItemsChanged = p2:_createOnViewableItemsChanged(p15.onViewableItemsChanged)
			}
		end)
		
		return
	elseif p2.props.onViewableItemsChanged then
		table.insert(p2._virtualizedListPairs, {
			viewabilityConfig = p2.props.viewabilityConfig,
			onViewableItemsChanged = p2:_createOnViewableItemsChanged(p2.props.onViewableItemsChanged)
		})
	end
end

function flatList.scrollToEnd(p16, p17)
	if p16._listRef then
		p16._listRef:scrollToEnd(p17)
	end
end

function flatList.scrollToIndex(p18, p19)
	if p18._listRef then
		p18._listRef:scrollToIndex(p19)
	end
end

function flatList.scrollToItem(p20, p21)
	if p20._listRef then
		p20._listRef:scrollToItem(p21)
	end
end

function flatList.scrollToOffset(value, p22)
	if value._listRef then
		value._listRef:scrollToOffset(p22)
	end
end

function flatList.recordInteraction(p23)
	if p23._listRef then
		p23._listRef:recordInteraction()
	end
end

function flatList.flashScrollIndicators(p24)
	if p24._listRef then
		p24._listRef:flashScrollIndicators()
	end
end

function flatList.getScrollResponder(p25)
	if p25._listRef then
		return p25._listRef:getScrollResponder()
	end
end

function flatList.getNativeScrollRef(p26)
	if p26._listRef then
		return p26._listRef:getScrollRef()
	end
end

function flatList.getScrollableNode(p27)
	if p27._listRef then
		return p27._listRef:getScrollableNode()
	end
end

function flatList.setNativeProps(value, p28)
	if value._listRef then
		value._listRef:setNativeProps(p28)
	end
end

function flatList.componentDidUpdate(p29, p30)
	-- upvalues: invariantModule (ref), deepDifferModule (ref)
	invariantModule(p30.numColumns == p29.props.numColumns, "Changing numColumns on the fly is not supported. Change the key prop on FlatList when changing the number of columns to force a fresh render of the component.")
	invariantModule(p30.onViewableItemsChanged == p29.props.onViewableItemsChanged, "Changing onViewableItemsChanged on the fly is not supported")
	invariantModule(not deepDifferModule(p30.viewabilityConfig, p29.props.viewabilityConfig), "Changing viewabilityConfig on the fly is not supported")
	invariantModule(p30.viewabilityConfigCallbackPairs == p29.props.viewabilityConfigCallbackPairs, "Changing viewabilityConfigCallbackPairs on the fly is not supported")
	p29:_checkProps(p29.props)
end

function flatList._checkProps(p31, p32)
	-- upvalues: invariantModule (ref)
	local getItem = p32.getItem
	local getItemCount = p32.getItemCount
	local horizontal = p32.horizontal
	local columnWrapperStyle = p32.columnWrapperStyle
	local onViewableItemsChanged = p32.onViewableItemsChanged
	local viewabilityConfigCallbackPairs = p32.viewabilityConfigCallbackPairs
	local numColumns = p31.props.numColumns
	local var20 = if numColumns ~= nil then 1 else numColumns
	invariantModule(not getItem and not getItemCount, "FlatList does not support custom data formats.")
	
	if var20 > 1 then
		invariantModule(not horizontal, "numColumns does not support horizontal.")
	else
		invariantModule(not columnWrapperStyle, "columnWrapperStyle not supported for single column lists")
	end
	invariantModule(not (onViewableItemsChanged and viewabilityConfigCallbackPairs), "FlatList does not support setting both onViewableItemsChanged and viewabilityConfigCallbackPairs.")
end

function flatList._pushMultiColumnViewable(p33, p34, p35)
	-- upvalues: keyExtractor (ref), array (ref), invariantModule (ref), object (ref)
	local numColumns = p33.props.numColumns
	local var21 = if numColumns ~= nil then 1 else numColumns
	local var22 = if p33.props.keyExtractor ~= nil then keyExtractor else p33.props.keyExtractor
	array.forEach(p35.item, function(p36, p37)
		-- upvalues: invariantModule (copy), p35 (ref), var21 (ref), p34 (ref), object (copy), var22 (ref)
		invariantModule(p35.index ~= nil, "Missing index!")
		local var23 = (p35.index - 1) * var21 + p37
		table.insert(p34, object.assign({}, p35, { item = p36, key = var22(p36, var23), index = var23 }))
	end)
end

function flatList._createOnViewableItemsChanged(p38, p39)
	-- upvalues: array (ref)
	return function(p40)
		-- upvalues: p38 (ref), p39 (ref), array (copy)
		local numColumns = p38.props.numColumns
		local var24 = if numColumns ~= nil then 1 else numColumns
		
		if p39 ~= nil then
			if var24 > 1 then
				local t = {}
				local t_1 = {}
				array.forEach(p40.viewableItems, function(p41)
					-- upvalues: p38 (copy), t_1 (ref)
					return p38:_pushMultiColumnViewable(t_1, p41)
				end)
				array.forEach(p40.changed, function(p42)
					-- upvalues: p38 (copy), t (ref)
					return p38:_pushMultiColumnViewable(t, p42)
				end)
				p39({ viewableItems = t_1, changed = t })
				
				return
			end
			p39(p40)
		end
	end
end

function flatList.render(p43)
	-- upvalues: object (ref), reactModule (ref), virtualizedListModule (ref), t (ref)
	local props = p43.props
	local _ = props.numColumns
	local _ = props.columnWrapperStyle
	local removeClippedSubviews = props.removeClippedSubviews
	
	return reactModule.createElement(virtualizedListModule, object.assign({}, object.assign({}, props, {
		numColumns = object.None,
		columnWrapperStyle = object.None,
		removeClippedSubviews = object.None
	}), {
		getItem = p43._getItem,
		getItemCount = p43._getItemCount,
		keyExtractor = p43._keyExtractor,
		ref = p43._captureRef,
		viewabilityConfigCallbackPairs = p43._virtualizedListPairs,
		removeClippedSubviews = if removeClippedSubviews ~= nil then t.OS == "android" else removeClippedSubviews
	}, p43._renderer()))
end

return flatList