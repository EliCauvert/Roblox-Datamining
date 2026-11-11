local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local config = { OS = "roblox" }
local DeepDifferModule = require(Parent.Utilities.differ.deepDiffer)
local ReactModule = require(Parent1.React)
local VirtualizedListModule = require(Parent.Lists.VirtualizedList)
local ViewModule = require(Parent.Components.View.View)
local StyleSheetModule = require(Parent.StyleSheet.StyleSheet)
local InvariantModule = require(Parent.jsUtils.invariant)
local ScrollView = Parent.Components.ScrollView
local _ = require(ScrollView.ScrollView)
local _ = require(ScrollView.ScrollViewNativeComponent)
local _ = require(Parent.Lists.ViewabilityHelper)
local _ = require(Parent.Lists.VirtualizedList)
local KeyExtractor = require(script.Parent.VirtualizeUtils).keyExtractor

local function _(p1)
	return p1 ~= nil and p1
end

local _ = function(p1)
	return if p1 == nil then 1 else p1
end

local FlatList = ReactModule.PureComponent:extend("FlatList")

function FlatList.init(p1, _)
	-- upvalues: KeyExtractor (copy), Array (copy), InvariantModule (copy), ReactModule (copy), ViewModule (copy), StyleSheetModule (copy), Object (copy)
	p1._virtualizedListPairs = {}
	
	function p1._captureRef(_listRef)
		-- upvalues: p1 (copy)
		p1._listRef = _listRef
	end
	
	function p1._getItem(p2, p3: number)
		-- upvalues: p1 (copy)
		local NumColumns = p1.props.numColumns
		local NumColumns1 = if NumColumns == nil then 1 else NumColumns
		
		if NumColumns1 <= 1 then
			return p2[p3]
		end
		local List = {}
		
		for i = 1, NumColumns1 do
			local v1 = p2[(p3 - 1) * NumColumns1 + i]
			
			if v1 ~= nil then
				table.insert(List, v1)
			end
		end
		return List
	end
	
	function p1._getItemCount(p4): number
		-- upvalues: p1 (copy)
		if p4 == nil then
			return 0
		else
			local NumColumns = p1.props.numColumns
			local NumColumns1 = if NumColumns == nil then 1 else NumColumns
			
			return if NumColumns1 > 1 then math.ceil(#p4 / NumColumns1) else #p4
		end
	end
	
	function p1._keyExtractor(p4, p5)
		-- upvalues: p1 (copy), KeyExtractor (upval), Array (upval), InvariantModule (upval)
		local NumColumns = p1.props.numColumns
		local NumColumns1 = if NumColumns == nil then 1 else NumColumns
		local KeyExtractor1 = if p1.props.keyExtractor == nil then KeyExtractor else p1.props.keyExtractor
		
		if NumColumns1 <= 1 then
			return KeyExtractor1(p4, p5)
		elseif Array.isArray(p4) then
			return Array.join(Array.map(p4, function(p6, p7)
				-- upvalues: KeyExtractor1 (copy), p5 (copy), NumColumns1 (copy)
				return KeyExtractor1(p6, (p5 - 1) * NumColumns1 + p7)
			end), ":")
		else
			InvariantModule(Array.isArray(p4), "FlatList: Encountered internal consistency error, expected each item to consist of an array with 1-%s columns; instead, received a single item.", NumColumns1)
			
			return nil
		end
	end
	
	function p1._renderer()
		-- upvalues: p1 (copy), ReactModule (upval), InvariantModule (upval), Array (upval), ViewModule (upval), StyleSheetModule (upval), Object (upval)
		local ListItemComponent = p1.props.ListItemComponent
		local RenderItemFunction = p1.props.renderItem
		local ColumnWrapperStyle = p1.props.columnWrapperStyle
		local NumColumns = p1.props.numColumns
		local NumColumns1 = if NumColumns == nil then 1 else NumColumns
		
		local function renderer(p4)
			-- upvalues: ListItemComponent (copy), ReactModule (upval), RenderItemFunction (copy)
			return if ListItemComponent then ReactModule.createElement(ListItemComponent, p4) elseif RenderItemFunction then RenderItemFunction(p4) else nil
		end
		
		return {
			[if ListItemComponent then "ListItemComponent" else "renderItem"] = function(p4)
				-- upvalues: NumColumns1 (copy), ReactModule (upval), p1 (upval), InvariantModule (upval), Array (upval), ViewModule (upval), StyleSheetModule (upval), ColumnWrapperStyle (copy), Object (upval), ListItemComponent (copy), RenderItemFunction (copy), renderer (copy)
				if NumColumns1 > 1 then
					local UIListLayout = ReactModule.createElement("UIListLayout", {
						key = if p1.props.horizontal then "UIListVerticalLayout" else "UIListHorizontalLayout",
						Name = if p1.props.horizontal then "UIListVerticalLayout" else "UIListHorizontalLayout",
						FillDirection = if p1.props.horizontal then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					})
					local Item = p4.item
					local Index = p4.index
					InvariantModule(Array.isArray(Item), "Expected array of items with numColumns > 1")
					
					return ReactModule.createElement(ViewModule, { style = StyleSheetModule.compose(ColumnWrapperStyle) }, Array.concat({ UIListLayout }, Array.map(Item, function(p5, Key)
						-- upvalues: Object (upval), Index (copy), NumColumns1 (upval), p4 (copy), ListItemComponent (upval), ReactModule (upval), RenderItemFunction (upval)
						local config = {
							item = Object.assign({}, p5, { LayoutOrder = Key }),
							index = (Index - 1) * NumColumns1 + Key,
							separators = p4.separators
						}
						local Element = if ListItemComponent then ReactModule.createElement(ListItemComponent, config) elseif RenderItemFunction then RenderItemFunction(config) else nil
						
						return if Element == nil then nil else ReactModule.createElement(ReactModule.Fragment, { key = Key }, Element)
					end)))
				else
					return renderer(p4)
				end
			end
		}
	end
	
	p1:_checkProps(p1.props)
	
	if p1.props.viewabilityConfigCallbackPairs then
		p1._virtualizedListPairs = Array.map(p1.props.viewabilityConfigCallbackPairs, function(p4)
			-- upvalues: p1 (copy)
			return {
				viewabilityConfig = p4.viewabilityConfig,
				onViewableItemsChanged = p1:_createOnViewableItemsChanged(p4.onViewableItemsChanged)
			}
		end)
		
		return
	end
	if p1.props.onViewableItemsChanged then
		table.insert(p1._virtualizedListPairs, {
			viewabilityConfig = p1.props.viewabilityConfig,
			onViewableItemsChanged = p1:_createOnViewableItemsChanged(p1.props.onViewableItemsChanged)
		})
	end
end

function FlatList.scrollToEnd(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToEnd(p5)
	end
end

function FlatList.scrollToIndex(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToIndex(p5)
	end
end

function FlatList.scrollToItem(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToItem(p5)
	end
end

function FlatList.scrollToOffset(p4, p5)
	if p4._listRef then
		p4._listRef:scrollToOffset(p5)
	end
end

function FlatList.recordInteraction(p4)
	if p4._listRef then
		p4._listRef:recordInteraction()
	end
end

function FlatList.flashScrollIndicators(p4)
	if p4._listRef then
		p4._listRef:flashScrollIndicators()
	end
end

function FlatList.getScrollResponder(p4)
	if not p4._listRef then return end
	return p4._listRef:getScrollResponder()
end

function FlatList.getNativeScrollRef(p4)
	if not p4._listRef then return end
	return p4._listRef:getScrollRef()
end

function FlatList.getScrollableNode(p4)
	if not p4._listRef then return end
	return p4._listRef:getScrollableNode()
end

function FlatList.setNativeProps(p4, p5)
	if p4._listRef then
		p4._listRef:setNativeProps(p5)
	end
end

function FlatList.componentDidUpdate(p4, p5)
	-- upvalues: InvariantModule (copy), DeepDifferModule (copy)
	InvariantModule(p5.numColumns == p4.props.numColumns, "Changing numColumns on the fly is not supported. Change the key prop on FlatList when changing the number of columns to force a fresh render of the component.")
	InvariantModule(p5.onViewableItemsChanged == p4.props.onViewableItemsChanged, "Changing onViewableItemsChanged on the fly is not supported")
	InvariantModule(not DeepDifferModule(p5.viewabilityConfig, p4.props.viewabilityConfig), "Changing viewabilityConfig on the fly is not supported")
	InvariantModule(p5.viewabilityConfigCallbackPairs == p4.props.viewabilityConfigCallbackPairs, "Changing viewabilityConfigCallbackPairs on the fly is not supported")
	p4:_checkProps(p4.props)
end

function FlatList._checkProps(p4, Props)
	-- upvalues: InvariantModule (copy)
	local GetItemCount = Props.getItemCount
	local Horizontal = Props.horizontal
	local ColumnWrapperStyle = Props.columnWrapperStyle
	local OnViewableItemsChanged = Props.onViewableItemsChanged
	local ViewabilityConfigCallbackPairs = Props.viewabilityConfigCallbackPairs
	local NumColumns = p4.props.numColumns
	local NumColumns1 = if NumColumns == nil then 1 else NumColumns
	InvariantModule(not Props.getItem and not GetItemCount, "FlatList does not support custom data formats.")
	
	if NumColumns1 > 1 then
		InvariantModule(not Horizontal, "numColumns does not support horizontal.")
	else
		InvariantModule(not ColumnWrapperStyle, "columnWrapperStyle not supported for single column lists")
	end
	InvariantModule(not (OnViewableItemsChanged and ViewabilityConfigCallbackPairs), "FlatList does not support setting both onViewableItemsChanged and viewabilityConfigCallbackPairs.")
end

function FlatList._pushMultiColumnViewable(p4, List, p5)
	-- upvalues: KeyExtractor (copy), Array (copy), InvariantModule (copy), Object (copy)
	local NumColumns = p4.props.numColumns
	local NumColumns1 = if NumColumns == nil then 1 else NumColumns
	local KeyExtractor1 = if p4.props.keyExtractor == nil then KeyExtractor else p4.props.keyExtractor
	Array.forEach(p5.item, function(Item, p6)
		-- upvalues: InvariantModule (upval), p5 (copy), NumColumns1 (copy), List (copy), Object (upval), KeyExtractor1 (copy)
		InvariantModule(p5.index ~= nil, "Missing index!")
		local NewIndex = (p5.index - 1) * NumColumns1 + p6
		table.insert(List, Object.assign({}, p5, {
			item = Item,
			key = KeyExtractor1(Item, NewIndex),
			index = NewIndex
		}))
	end)
end

function FlatList._createOnViewableItemsChanged(p4, Callback)
	-- upvalues: Array (copy)
	return function(p5)
		-- upvalues: p4 (copy), Callback (copy), Array (upval)
		local NumColumns = p4.props.numColumns
		local NumColumns1 = if NumColumns == nil then 1 else NumColumns
		
		if Callback ~= nil then
			if NumColumns1 > 1 then
				local Changed = {}
				local ViewableItems = {}
				Array.forEach(p5.viewableItems, function(p6)
					-- upvalues: p4 (upval), ViewableItems (copy)
					return p4:_pushMultiColumnViewable(ViewableItems, p6)
				end)
				Array.forEach(p5.changed, function(p6)
					-- upvalues: p4 (upval), Changed (copy)
					return p4:_pushMultiColumnViewable(Changed, p6)
				end)
				Callback({ viewableItems = ViewableItems, changed = Changed })
				
				return
			else
				Callback(p5)
			end
		end
	end
end

function FlatList.render(p4)
	-- upvalues: Object (copy), ReactModule (copy), VirtualizedListModule (copy), config (copy)
	local Props = p4.props
	local _ = Props.numColumns
	local _ = Props.columnWrapperStyle
	local RemoveClippedSubviews = Props.removeClippedSubviews
	
	return ReactModule.createElement(VirtualizedListModule, Object.assign({}, Object.assign({}, Props, {
		numColumns = Object.None,
		columnWrapperStyle = Object.None,
		removeClippedSubviews = Object.None
	}), {
		getItem = p4._getItem,
		getItemCount = p4._getItemCount,
		keyExtractor = p4._keyExtractor,
		ref = p4._captureRef,
		viewabilityConfigCallbackPairs = p4._virtualizedListPairs,
		removeClippedSubviews = if RemoveClippedSubviews == nil then config.OS == "android" else RemoveClippedSubviews
	}, p4._renderer()))
end

return FlatList