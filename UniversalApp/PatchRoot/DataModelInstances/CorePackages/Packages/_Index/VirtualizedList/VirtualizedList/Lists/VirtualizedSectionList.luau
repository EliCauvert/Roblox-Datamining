local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local invariantModule = require(parent.jsUtils.invariant)
local _ = require(script.Parent.ViewabilityHelper)
local keyExtractor = require(script.Parent.VirtualizeUtils).keyExtractor
local viewModule = require(parent.Components.View.View)
local virtualizedListModule = require(script.Parent.VirtualizedList)
local reactModule = require(parent_1.React)
local ItemWithSeparator = nil
local virtualizedSectionList = reactModule.PureComponent:extend("VirtualizedSectionList")

function virtualizedSectionList.init(p1)
	-- upvalues: invariantModule (ref), keyExtractor (ref), object (ref), array (ref), boolean (ref), reactModule (ref), ItemWithSeparator (write)
	p1._updateHighlightMap = {}
	p1._updatePropsMap = {}
	p1._listRef = nil
	
	function p0._captureRef(p2)
		-- upvalues: p1 (ref)
		p1._listRef = p2
	end
	
	function p0._keyExtractor(_, p2)
		-- upvalues: p1 (ref)
		local var1 = p1:_subExtractor(p2)
		
		return if var1 then var1.key else tostring(p2)
	end
	
	function p0._convertViewable(p2)
		-- upvalues: invariantModule (copy), p1 (ref), keyExtractor (copy), object (copy)
		invariantModule(p2.index ~= nil, "Received a broken ViewToken")
		local index = p1:_subExtractor(p2.index)
		
		if index then
			local keyExtractor_1 = index.section.keyExtractor
			
			return object.assign({}, p2, {
				index = index.index,
				key = if keyExtractor_1 ~= nil then (if p1.props.keyExtractor then p1.props.keyExtractor else keyExtractor)(p2.item, if index.index == nil then 1 else index.index) else keyExtractor_1(p2.item, index.index),
				section = index.section
			})
		end
		return nil
	end
	
	function p0._onViewableItemsChanged(p2)
		-- upvalues: p1 (ref), array (copy), boolean (copy)
		local viewableItems = p2.viewableItems
		local changed = p2.changed
		local onViewableItemsChanged = p1.props.onViewableItemsChanged
		
		if onViewableItemsChanged ~= nil then
			onViewableItemsChanged({
				viewableItems = array.filter(array.map(viewableItems, p1._convertViewable, p1), boolean.toJSBoolean),
				changed = array.filter(array.map(changed, p1._convertViewable, p1), boolean.toJSBoolean)
			})
		end
	end
	
	function p0._renderItem(p2)
		-- upvalues: p1 (ref), boolean (copy), invariantModule (copy), reactModule (copy), ItemWithSeparator (copy)
		return function(p3)
			-- upvalues: p1 (copy), boolean (copy), p2 (ref), invariantModule (copy), reactModule (copy), ItemWithSeparator (copy)
			local item = p3.item
			local index = p3.index
			local var1 = p1:_subExtractor(index)
			
			if not var1 then
				return nil
			end
			local index_1 = var1.index
			
			if index_1 ~= nil then
				local renderItem = var1.section.renderItem or p1.props.renderItem
				local var2 = p1:_getSeparatorComponent(index, var1, p2)
				invariantModule(renderItem, "no renderItem!")
				
				return reactModule.createElement(ItemWithSeparator, {
					SeparatorComponent = var2,
					LeadingSeparatorComponent = if index_1 == 1 then p1.props.SectionSeparatorComponent else nil,
					cellKey = var1.key,
					index = index_1,
					item = item,
					leadingItem = var1.leadingItem,
					leadingSection = var1.leadingSection,
					prevCellKey = (p1:_subExtractor(index - 1) or {}).key,
					setSelfHighlightCallback = p1._setUpdateHighlightFor,
					setSelfUpdatePropsCallback = p1._setUpdatePropsFor,
					updateHighlightFor = p1._updateHighlightFor,
					updatePropsFor = p1._updatePropsFor,
					renderItem = renderItem,
					section = var1.section,
					trailingItem = var1.trailingItem,
					trailingSection = var1.trailingSection,
					inverted = boolean.toJSBoolean(p1.props.inverted),
					horizontal = p1.props.horizontal
				})
			end
			local section = var1.section
			
			if var1.header == true then
				local renderSectionHeader = p1.props.renderSectionHeader
				
				return if boolean.toJSBoolean(renderSectionHeader) then renderSectionHeader({ section = section }) else nil
			end
			local renderSectionFooter = p1.props.renderSectionFooter
			
			return if boolean.toJSBoolean(renderSectionFooter) then renderSectionFooter({ section = section }) else nil
		end
	end
	
	function p0._updatePropsFor(p2, p3)
		-- upvalues: p1 (ref)
		local var1 = p1._updatePropsMap[p2]
		
		if var1 ~= nil then
			var1(p3)
		end
	end
	
	function p0._updateHighlightFor(p2, p3)
		-- upvalues: p1 (ref)
		local var1 = p1._updateHighlightMap[p2]
		
		if var1 ~= nil then
			var1(p3)
		end
	end
	
	function p0._setUpdateHighlightFor(p2, p3)
		-- upvalues: p1 (ref)
		if p3 == nil then
			p1._updateHighlightMap[p2] = nil
			
			return
		end
		p1._updateHighlightMap[p2] = p3
	end
	
	function p0._setUpdatePropsFor(p2, p3)
		-- upvalues: p1 (ref)
		if p3 == nil then
			p1._updatePropsMap[p2] = nil
			
			return
		end
		p1._updatePropsMap[p2] = p3
	end
end

function virtualizedSectionList.scrollToLocation(p1, p2)
	-- upvalues: object (ref)
	local itemIndex = p2.itemIndex
	local var1 = 1
	while var1 < p2.sectionIndex do
		itemIndex += p1.props.getItemCount(p1.props.sections[var1].data) + 2
		var1 += 1
	end
	local viewOffset = p2.viewOffset or 0
	
	if p1._listRef == nil then return end
	if p2.itemIndex > 1 and p1.props.stickySectionHeadersEnabled then
		viewOffset += p1._listRef.__getFrameMetricsApprox(itemIndex - p2.itemIndex).length
	end
	p1._listRef:scrollToIndex(object.assign({}, p2, { viewOffset = viewOffset, index = itemIndex }))
end

function virtualizedSectionList.getListRef(p3)
	return p3._listRef
end

function virtualizedSectionList.render(p3)
	-- upvalues: object (ref), reactModule (ref), virtualizedListModule (ref)
	local _ = p3.props.renderItem
	local _ = p3.props.sections
	local var2 = object.assign({}, p3.props, {
		ItemSeparatorComponent = object.None,
		SectionSeparatorComponent = object.None,
		renderItem = object.None,
		renderSectionFooter = object.None,
		renderSectionHeader = object.None,
		sections = object.None,
		stickySectionHeadersEnabled = object.None
	})
	local var3 = if p3.props.ListHeaderComponent then 1 else 0
	local var4 = if p3.props.stickySectionHeadersEnabled then {} else nil
	local var5 = 0
	
	for i, v in ipairs(p3.props.sections) do
		if var4 ~= nil then
			table.insert(var4, var5 + var3)
		end
		var5 = var5 + 2 + p3.props.getItemCount(v.data)
	end
	return reactModule.createElement(virtualizedListModule, object.assign({}, var2, {
		keyExtractor = p3._keyExtractor,
		stickyHeaderIndices = var4,
		renderItem = p3._renderItem(var5),
		data = p3.props.sections,
		getItem = function(p4, p5)
			-- upvalues: p3 (ref)
			return p3:_getItem(p3.props, p4, p5)
		end,
		getItemCount = function()
			-- upvalues: var5 (write)
			return var5
		end,
		onViewableItemsChanged = if p3.props.onViewableItemsChanged then p3._onViewableItemsChanged else nil,
		ref = p3._captureRef
	}))
end

function virtualizedSectionList._getItem(_, p4, p5, p6)
	if not p5 then
		return nil
	end
	local var6 = p6 - 1
	local var7 = 1
	while var7 <= #p5 do
		local var8 = p5[var7]
		local data = var8.data
		local itemCount = p4.getItemCount(data)
		
		if var6 ~= 0 and var6 ~= itemCount + 1 then
			if var6 > itemCount then
				var6 -= itemCount + 2
				var7 += 1
				continue
			end
			return p4.getItem(data, var6)
		end
		return var8
	end
	return nil
end

function virtualizedSectionList._subExtractor(p7, p8)
	-- upvalues: boolean (ref), keyExtractor (ref)
	local var9 = p8
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local props = p7.props
	local getItem = props.getItem
	local getItemCount = props.getItemCount
	local keyExtractor_1 = props.keyExtractor
	local sections = props.sections
	local var10 = 1
	while var10 <= #sections do
		local var11 = sections[var10]
		local data = var11.data
		local var12 = if boolean.toJSBoolean(var11.key) then tostring(var11.key) else tostring(var10)
		var9 -= 1
		
		if getItemCount(data) + 1 < var9 then
			var9 -= getItemCount(data) + 1
			continue
		end
		return if var9 == 0 then {
			index = nil,
			header = true,
			section = var11,
			key = var12 .. ":header",
			trailingSection = sections[var10 + 1]
		} elseif var9 == getItemCount(data) + 1 then {
			index = nil,
			header = false,
			section = var11,
			key = var12 .. ":footer",
			trailingSection = sections[var10 + 1]
		} else {
			section = var11,
			key = var12 .. ":" .. tostring((var11.keyExtractor or (keyExtractor_1 or keyExtractor))(getItem(data, var9), var9)),
			index = var9,
			leadingItem = getItem(data, var9 - 1),
			leadingSection = sections[var10 - 1],
			trailingItem = getItem(data, var9 + 1),
			trailingSection = sections[var10 + 1]
		}
	end
	return nil
end

function virtualizedSectionList._getSeparatorComponent(p9, p10, p11, p12)
	-- upvalues: boolean (ref)
	if not p11 then
		p11 = p9:_subExtractor(p10)
	end
	if not p11 then
		return nil
	end
	local var13 = if boolean.toJSBoolean(p11.section.ItemSeparatorComponent) then p11.section.ItemSeparatorComponent else p9.props.ItemSeparatorComponent
	local sectionSeparatorComponent = p9.props.SectionSeparatorComponent
	local var14 = p11.index == p9.props.getItemCount(p11.section.data)
	
	return if sectionSeparatorComponent and var14 then sectionSeparatorComponent elseif var13 and not var14 and not (p10 == p12) then var13 else nil
end

ItemWithSeparator = function(p9)
	-- upvalues: reactModule (ref), object (ref), viewModule (ref)
	local leadingSeparatorComponent = p9.LeadingSeparatorComponent
	local separatorComponent = p9.SeparatorComponent
	local cellKey = p9.cellKey
	local prevCellKey = p9.prevCellKey
	local setSelfHighlightCallback = p9.setSelfHighlightCallback
	local updateHighlightFor = p9.updateHighlightFor
	local setSelfUpdatePropsCallback = p9.setSelfUpdatePropsCallback
	local updatePropsFor = p9.updatePropsFor
	local item = p9.item
	local index = p9.index
	local section = p9.section
	local inverted = p9.inverted
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState({
		LayoutOrder = -1,
		leadingItem = p9.leadingItem,
		leadingSection = p9.leadingSection,
		section = p9.section,
		trailingItem = p9.item,
		trailingSection = p9.trailingSection
	})
	local var19, var20 = reactModule.useState({
		LayoutOrder = 1,
		leadingItem = p9.item,
		leadingSection = p9.leadingSection,
		section = p9.section,
		trailingItem = p9.trailingItem,
		trailingSection = p9.trailingSection
	})
	reactModule.useEffect(function()
		-- upvalues: setSelfHighlightCallback (ref), cellKey (ref), var16 (ref), setSelfUpdatePropsCallback (ref), var20 (ref)
		setSelfHighlightCallback(cellKey, var16)
		setSelfUpdatePropsCallback(cellKey, var20)
		
		return function()
			-- upvalues: setSelfUpdatePropsCallback (copy), cellKey (copy), setSelfHighlightCallback (copy)
			setSelfUpdatePropsCallback(cellKey, nil)
			setSelfHighlightCallback(cellKey, nil)
		end
	end, {
		cellKey,
		setSelfHighlightCallback,
		var20,
		setSelfUpdatePropsCallback
	})
	local var21 = p9.renderItem({
		item = item,
		index = index,
		section = section,
		separators = {
			highlight = function()
				-- upvalues: var14 (ref), var16 (ref), prevCellKey (ref), updateHighlightFor (ref)
				var14(true)
				var16(true)
				
				if prevCellKey ~= nil then
					updateHighlightFor(prevCellKey, true)
				end
			end,
			unhighlight = function()
				-- upvalues: var14 (ref), var16 (ref), prevCellKey (ref), updateHighlightFor (ref)
				var14(false)
				var16(false)
				
				if prevCellKey ~= nil then
					updateHighlightFor(prevCellKey, false)
				end
			end,
			updateProps = function(p10, p11)
				-- upvalues: leadingSeparatorComponent (ref), var18 (ref), object (copy), var17 (ref), prevCellKey (ref), updatePropsFor (ref), separatorComponent (ref), var20 (ref), var19 (ref)
				if p10 == "leading" then
					if leadingSeparatorComponent ~= nil then
						var18(object.assign({}, var17, p11))
						
						return
					elseif prevCellKey == nil then
						return
					else
						updatePropsFor(prevCellKey, object.assign({}, var17, p11))
						
						return
					end
				elseif p10 == "trailing" and separatorComponent ~= nil then
					var20(object.assign({}, var19, p11))
				end
			end
		}
	})
	local var22 = leadingSeparatorComponent ~= nil and reactModule.createElement(leadingSeparatorComponent, object.assign({ highlighted = var13 }, var17))
	local var23 = separatorComponent ~= nil and reactModule.createElement(separatorComponent, object.assign({ highlighted = var15 }, var19))
	
	return if var22 or var23 then reactModule.createElement(viewModule, {
		Size = if p9.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p9.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y
	}, reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if p9.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}), if inverted == false then var22 else var23, var21, if inverted == false then var23 else var22) else var21
end

return virtualizedSectionList