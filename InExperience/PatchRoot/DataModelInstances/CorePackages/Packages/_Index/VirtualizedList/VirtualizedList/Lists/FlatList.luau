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

local function _(p1)
	return if p1 == nil then false else p1
end

local _ = function(p1)
	return if p1 == nil then 1 else p1
end

local flatList = reactModule.PureComponent:extend("FlatList")

function flatList.init(p1, _)
	-- upvalues: keyExtractor (ref), array (ref), invariantModule (ref), reactModule (ref), viewModule (ref), styleSheetModule (ref), object (ref)
	p1._virtualizedListPairs = {}
	
	function p2._captureRef(p2)
		-- upvalues: p1 (ref)
		p1._listRef = p2
	end
	
	function p2._getItem(p2, p3)
		-- upvalues: p1 (ref)
		local numColumns = p1.props.numColumns
		local var1 = if numColumns ~= nil then 1 else numColumns
		
		if var1 <= 1 then
			return p2[p3]
		end
		local t = {}
		
		for i = 1, var1 do
			local var2 = p2[(p3 - 1) * var1 + i]
			
			if var2 ~= nil then
				table.insert(t, var2)
			end
		end
		return t
	end
	
	function p2._getItemCount(p4)
		-- upvalues: p1 (ref)
		if p4 == nil then
			return 0
		end
		local numColumns = p1.props.numColumns
		local var3 = if numColumns ~= nil then 1 else numColumns
		
		return if var3 > 1 then math.ceil(#p4 / var3) else #p4
	end
	
	function p2._keyExtractor(p4, p5)
		-- upvalues: p1 (ref), keyExtractor (copy), array (copy), invariantModule (copy)
		local numColumns = p1.props.numColumns
		local var3 = if numColumns ~= nil then 1 else numColumns
		local var4 = if p1.props.keyExtractor ~= nil then keyExtractor else p1.props.keyExtractor
		
		if var3 <= 1 then
			return var4(p4, p5)
		elseif array.isArray(p4) then
			return array.join(array.map(p4, function(p6, p7)
				-- upvalues: var4 (ref), p5 (ref), var3 (ref)
				return var4(p6, (p5 - 1) * var3 + p7)
			end), ":")
		end
		invariantModule(array.isArray(p4), "FlatList: Encountered internal consistency error, expected each item to consist of an array with 1-%s columns; instead, received a single item.", var3)
		
		return nil
	end
	
	function p2._renderer()
		-- upvalues: p1 (ref), reactModule (copy), invariantModule (copy), array (copy), viewModule (copy), styleSheetModule (copy), object (copy)
		local listItemComponent = p1.props.ListItemComponent
		local renderItem = p1.props.renderItem
		local columnWrapperStyle = p1.props.columnWrapperStyle
		local numColumns = p1.props.numColumns
		local var3 = if numColumns ~= nil then 1 else numColumns
		
		local function renderer(p4)
			-- upvalues: listItemComponent (ref), reactModule (copy), renderItem (ref)
			return if listItemComponent then reactModule.createElement(listItemComponent, p4) elseif renderItem then renderItem(p4) else nil
		end
		
		return {
			[if listItemComponent then "ListItemComponent" else "renderItem"] = function(p4)
				-- upvalues: var3 (ref), reactModule (copy), p1 (copy), invariantModule (copy), array (copy), viewModule (copy), styleSheetModule (copy), columnWrapperStyle (ref), object (copy), listItemComponent (ref), renderItem (ref), renderer (ref)
				if var3 > 1 then
					local UIListLayout = reactModule.createElement("UIListLayout", {
						key = if p1.props.horizontal then "UIListVerticalLayout" else "UIListHorizontalLayout",
						Name = if p1.props.horizontal then "UIListVerticalLayout" else "UIListHorizontalLayout",
						FillDirection = if p1.props.horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					})
					local item = p4.item
					local index = p4.index
					invariantModule(array.isArray(item), "Expected array of items with numColumns > 1")
					
					return reactModule.createElement(viewModule, { style = styleSheetModule.compose(columnWrapperStyle) }, array.concat({ UIListLayout }, array.map(item, function(p5, p6)
						-- upvalues: object (copy), index (ref), var3 (copy), p4 (ref), listItemComponent (copy), reactModule (copy), renderItem (copy)
						local t = {
							item = object.assign({}, p5, { LayoutOrder = p6 }),
							index = (index - 1) * var3 + p6,
							separators = p4.separators
						}
						local var4 = if listItemComponent then reactModule.createElement(listItemComponent, t) elseif renderItem then renderItem(t) else nil
						
						return if var4 == nil then nil else reactModule.createElement(reactModule.Fragment, { key = p6 }, var4)
					end)))
				end
				return renderer(p4)
			end
		}
	end
	
	p1:_checkProps(p1.props)
	
	if p1.props.viewabilityConfigCallbackPairs then
		p1._virtualizedListPairs = array.map(p1.props.viewabilityConfigCallbackPairs, function(p4)
			-- upvalues: p1 (ref)
			return {
				viewabilityConfig = p4.viewabilityConfig,
				onViewableItemsChanged = p1:_createOnViewableItemsChanged(p4.onViewableItemsChanged)
			}
		end)
		
		return
	elseif p1.props.onViewableItemsChanged then
		table.insert(p1._virtualizedListPairs, {
			viewabilityConfig = p1.props.viewabilityConfig,
			onViewableItemsChanged = p1:_createOnViewableItemsChanged(p1.props.onViewableItemsChanged)
		})
	end
end

function flatList.scrollToEnd(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToEnd(p5)
	end
end

function flatList.scrollToIndex(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToIndex(p5)
	end
end

function flatList.scrollToItem(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToItem(p5)
	end
end

function flatList.scrollToOffset(value, p4)
	if value._listRef then
		value._listRef:scrollToOffset(p4)
	end
end

function flatList.recordInteraction(p4)
	if p4._listRef then
		p4._listRef:recordInteraction()
	end
end

function flatList.flashScrollIndicators(p4)
	if p4._listRef then
		p4._listRef:flashScrollIndicators()
	end
end

function flatList.getScrollResponder(p4)
	if p4._listRef then
		return p4._listRef:getScrollResponder()
	end
end

function flatList.getNativeScrollRef(p4)
	if p4._listRef then
		return p4._listRef:getScrollRef()
	end
end

function flatList.getScrollableNode(p4)
	if p4._listRef then
		return p4._listRef:getScrollableNode()
	end
end

function flatList.setNativeProps(value, p4)
	if value._listRef then
		value._listRef:setNativeProps(p4)
	end
end

function flatList.componentDidUpdate(p4, p5)
	-- upvalues: invariantModule (ref), deepDifferModule (ref)
	invariantModule(p5.numColumns == p4.props.numColumns, "Changing numColumns on the fly is not supported. Change the key prop on FlatList when changing the number of columns to force a fresh render of the component.")
	invariantModule(p5.onViewableItemsChanged == p4.props.onViewableItemsChanged, "Changing onViewableItemsChanged on the fly is not supported")
	invariantModule(not deepDifferModule(p5.viewabilityConfig, p4.props.viewabilityConfig), "Changing viewabilityConfig on the fly is not supported")
	invariantModule(p5.viewabilityConfigCallbackPairs == p4.props.viewabilityConfigCallbackPairs, "Changing viewabilityConfigCallbackPairs on the fly is not supported")
	p4:_checkProps(p4.props)
end

function flatList._checkProps(p4, p5)
	-- upvalues: invariantModule (ref)
	local getItem = p5.getItem
	local getItemCount = p5.getItemCount
	local horizontal = p5.horizontal
	local columnWrapperStyle = p5.columnWrapperStyle
	local onViewableItemsChanged = p5.onViewableItemsChanged
	local viewabilityConfigCallbackPairs = p5.viewabilityConfigCallbackPairs
	local numColumns = p4.props.numColumns
	local var3 = if numColumns ~= nil then 1 else numColumns
	invariantModule(not getItem and not getItemCount, "FlatList does not support custom data formats.")
	
	if var3 > 1 then
		invariantModule(not horizontal, "numColumns does not support horizontal.")
	else
		invariantModule(not columnWrapperStyle, "columnWrapperStyle not supported for single column lists")
	end
	invariantModule(not (onViewableItemsChanged and viewabilityConfigCallbackPairs), "FlatList does not support setting both onViewableItemsChanged and viewabilityConfigCallbackPairs.")
end

function flatList._pushMultiColumnViewable(p4, p5, p6)
	-- upvalues: keyExtractor (ref), array (ref), invariantModule (ref), object (ref)
	local numColumns = p4.props.numColumns
	local var3 = if numColumns ~= nil then 1 else numColumns
	local var4 = if p4.props.keyExtractor ~= nil then keyExtractor else p4.props.keyExtractor
	array.forEach(p6.item, function(p7, p8)
		-- upvalues: invariantModule (copy), p6 (ref), var3 (ref), p5 (ref), object (copy), var4 (ref)
		invariantModule(p6.index ~= nil, "Missing index!")
		local var5 = (p6.index - 1) * var3 + p8
		table.insert(p5, object.assign({}, p6, { item = p7, key = var4(p7, var5), index = var5 }))
	end)
end

function flatList._createOnViewableItemsChanged(p4, p5)
	-- upvalues: array (ref)
	return function(p6)
		-- upvalues: p4 (ref), p5 (ref), array (copy)
		local numColumns = p4.props.numColumns
		local var3 = if numColumns ~= nil then 1 else numColumns
		
		if p5 ~= nil then
			if var3 > 1 then
				local t = {}
				local t_1 = {}
				array.forEach(p6.viewableItems, function(p7)
					-- upvalues: p4 (copy), t_1 (ref)
					return p4:_pushMultiColumnViewable(t_1, p7)
				end)
				array.forEach(p6.changed, function(p7)
					-- upvalues: p4 (copy), t (ref)
					return p4:_pushMultiColumnViewable(t, p7)
				end)
				p5({ viewableItems = t_1, changed = t })
				
				return
			end
			p5(p6)
		end
	end
end

function flatList.render(p4)
	-- upvalues: object (ref), reactModule (ref), virtualizedListModule (ref), t (ref)
	local props = p4.props
	local _ = props.numColumns
	local _ = props.columnWrapperStyle
	local removeClippedSubviews = props.removeClippedSubviews
	
	return reactModule.createElement(virtualizedListModule, object.assign({}, object.assign({}, props, {
		numColumns = object.None,
		columnWrapperStyle = object.None,
		removeClippedSubviews = object.None
	}), {
		getItem = p4._getItem,
		getItemCount = p4._getItemCount,
		keyExtractor = p4._keyExtractor,
		ref = p4._captureRef,
		viewabilityConfigCallbackPairs = p4._virtualizedListPairs,
		removeClippedSubviews = if removeClippedSubviews ~= nil then t.OS == "android" else removeClippedSubviews
	}, p4._renderer()))
end

return flatList