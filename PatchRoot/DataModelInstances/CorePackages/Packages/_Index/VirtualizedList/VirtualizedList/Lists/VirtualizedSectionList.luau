-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:12 2026 Pacific Standard Time.

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

function virtualizedSectionList.init(p0) --[[ line: 206 ]]
	-- upvalues: invariantModule (ref), keyExtractor (ref), object (ref), array (ref), boolean (ref), reactModule (ref), ItemWithSeparator (write)
	p0._updateHighlightMap = {}
	p0._updatePropsMap = {}
	p0._listRef = nil
	
	function p0._captureRef(p1) --[[ line: 210 ]]
		-- upvalues: p0 (ref)
		p0._listRef = p1
	end
	
	function p0._keyExtractor(_, p2) --[[ line: 214 ]]
		-- upvalues: p0 (ref)
		local var7 = p0:_subExtractor(p2)
		
		return if var7 then var7.key else tostring(p2)
	end
	
	function p0._convertViewable(p3) --[[ line: 219 ]]
		-- upvalues: invariantModule (copy), p0 (ref), keyExtractor (copy), object (copy)
		invariantModule(p3.index ~= nil, "Received a broken ViewToken")
		local index = p0:_subExtractor(p3.index)
		
		if index then
			local keyExtractor_1 = index.section.keyExtractor
			
			return object.assign({}, p3, {
				index = index.index,
				key = if keyExtractor_1 ~= nil then (if p0.props.keyExtractor then p0.props.keyExtractor else keyExtractor)(p3.item, if index.index == nil then 1 else index.index) else keyExtractor_1(p3.item, index.index),
				section = index.section
			})
		end
		return nil
	end
	
	function p0._onViewableItemsChanged(p4) --[[ line: 242 ]]
		-- upvalues: p0 (ref), array (copy), boolean (copy)
		local viewableItems = p4.viewableItems
		local changed = p4.changed
		local onViewableItemsChanged = p0.props.onViewableItemsChanged
		
		if onViewableItemsChanged ~= nil then
			onViewableItemsChanged({
				viewableItems = array.filter(array.map(viewableItems, p0._convertViewable, p0), boolean.toJSBoolean),
				changed = array.filter(array.map(changed, p0._convertViewable, p0), boolean.toJSBoolean)
			})
		end
	end
	
	function p0._renderItem(p5) --[[ line: 259 ]]
		-- upvalues: p0 (ref), boolean (copy), invariantModule (copy), reactModule (copy), ItemWithSeparator (copy)
		return function(p6) --[[ line: 260 ]]
			-- upvalues: p0 (copy), boolean (copy), p5 (ref), invariantModule (copy), reactModule (copy), ItemWithSeparator (copy)
			local item = p6.item
			local index = p6.index
			local var9 = p0:_subExtractor(index)
			
			if not var9 then
				return nil
			end
			local index_1 = var9.index
			
			if index_1 ~= nil then
				local renderItem = var9.section.renderItem or p0.props.renderItem
				local var11 = p0:_getSeparatorComponent(index, var9, p5)
				invariantModule(renderItem, "no renderItem!")
				
				return reactModule.createElement(ItemWithSeparator, {
					SeparatorComponent = var11,
					LeadingSeparatorComponent = if index_1 == 1 then p0.props.SectionSeparatorComponent else nil,
					cellKey = var9.key,
					index = index_1,
					item = item,
					leadingItem = var9.leadingItem,
					leadingSection = var9.leadingSection,
					prevCellKey = (p0:_subExtractor(index - 1) or {}).key,
					setSelfHighlightCallback = p0._setUpdateHighlightFor,
					setSelfUpdatePropsCallback = p0._setUpdatePropsFor,
					updateHighlightFor = p0._updateHighlightFor,
					updatePropsFor = p0._updatePropsFor,
					renderItem = renderItem,
					section = var9.section,
					trailingItem = var9.trailingItem,
					trailingSection = var9.trailingSection,
					inverted = boolean.toJSBoolean(p0.props.inverted),
					horizontal = p0.props.horizontal
				})
			end
			local section = var9.section
			
			if var9.header == true then
				local renderSectionHeader = p0.props.renderSectionHeader
				
				return if boolean.toJSBoolean(renderSectionHeader) then renderSectionHeader({ section = section }) else nil
			end
			local renderSectionFooter = p0.props.renderSectionFooter
			
			return if boolean.toJSBoolean(renderSectionFooter) then renderSectionFooter({ section = section }) else nil
		end
	end
	
	function p0._updatePropsFor(p7, p8) --[[ line: 312 ]]
		-- upvalues: p0 (ref)
		local var12 = p0._updatePropsMap[p7]
		
		if var12 ~= nil then
			var12(p8)
		end
	end
	
	function p0._updateHighlightFor(p9, p10) --[[ line: 319 ]]
		-- upvalues: p0 (ref)
		local var13 = p0._updateHighlightMap[p9]
		
		if var13 ~= nil then
			var13(p10)
		end
	end
	
	function p0._setUpdateHighlightFor(p11, p12) --[[ line: 326 ]]
		-- upvalues: p0 (ref)
		if p12 == nil then
			p0._updateHighlightMap[p11] = nil
			
			return
		end
		p0._updateHighlightMap[p11] = p12
	end
	
	function p0._setUpdatePropsFor(p13, p14) --[[ line: 334 ]]
		-- upvalues: p0 (ref)
		if p14 == nil then
			p0._updatePropsMap[p13] = nil
			
			return
		end
		p0._updatePropsMap[p13] = p14
	end
end

function virtualizedSectionList.scrollToLocation(p15, p16) --[[ line: 343 ]]
	-- upvalues: object (ref)
	local itemIndex = p16.itemIndex
	local var14 = 1
	while var14 < p16.sectionIndex do
		itemIndex += p15.props.getItemCount(p15.props.sections[var14].data) + 2
		var14 += 1
	end
	local viewOffset = p16.viewOffset or 0
	
	if p15._listRef == nil then return end
	if p16.itemIndex > 1 and p15.props.stickySectionHeadersEnabled then
		viewOffset += p15._listRef.__getFrameMetricsApprox(itemIndex - p16.itemIndex).length
	end
	p15._listRef:scrollToIndex(object.assign({}, p16, { viewOffset = viewOffset, index = itemIndex }))
end

function virtualizedSectionList.getListRef(p17) --[[ line: 365 ]]
	return p17._listRef
end

function virtualizedSectionList.render(p18) --[[ line: 369 ]]
	-- upvalues: object (ref), reactModule (ref), virtualizedListModule (ref)
	local _ = p18.props.renderItem
	local _ = p18.props.sections
	local var16 = object.assign({}, p18.props, {
		ItemSeparatorComponent = object.None,
		SectionSeparatorComponent = object.None,
		renderItem = object.None,
		renderSectionFooter = object.None,
		renderSectionHeader = object.None,
		sections = object.None,
		stickySectionHeadersEnabled = object.None
	})
	local var17 = if p18.props.ListHeaderComponent then 1 else 0
	local var18 = if p18.props.stickySectionHeadersEnabled then {} else nil
	local var19 = 0
	
	for i, v in ipairs(p18.props.sections) do
		if var18 ~= nil then
			table.insert(var18, var19 + var17)
		end
		var19 = var19 + 2 + p18.props.getItemCount(v.data)
	end
	return reactModule.createElement(virtualizedListModule, object.assign({}, var16, {
		keyExtractor = p18._keyExtractor,
		stickyHeaderIndices = var18,
		renderItem = p18._renderItem(var19),
		data = p18.props.sections,
		getItem = function(p19, p20) --[[ line: 406 ]]
			-- upvalues: p18 (ref)
			return p18:_getItem(p18.props, p19, p20)
		end,
		getItemCount = function() --[[ line: 409 ]]
			-- upvalues: var19 (write)
			return var19
		end,
		onViewableItemsChanged = if p18.props.onViewableItemsChanged then p18._onViewableItemsChanged else nil,
		ref = p18._captureRef
	}))
end

function virtualizedSectionList._getItem(_, p21, p22, p23) --[[ line: 418 ]]
	if not p22 then
		return nil
	end
	local var20 = p23 - 1
	local var21 = 1
	while var21 <= #p22 do
		local var22 = p22[var21]
		local data = var22.data
		local itemCount = p21.getItemCount(data)
		
		if var20 ~= 0 and var20 ~= itemCount + 1 then
			if var20 > itemCount then
				var20 -= itemCount + 2
				var21 += 1
				continue
			end
			return p21.getItem(data, var20)
		end
		return var22
	end
	return nil
end

function virtualizedSectionList._subExtractor(p24, p25) --[[ line: 449 ]]
	-- upvalues: boolean (ref), keyExtractor (ref)
	local var24 = p25
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local props = p24.props
	local getItem = props.getItem
	local getItemCount = props.getItemCount
	local keyExtractor_1 = props.keyExtractor
	local sections = props.sections
	local var25 = 1
	while var25 <= #sections do
		local var26 = sections[var25]
		local data = var26.data
		local var27 = if boolean.toJSBoolean(var26.key) then tostring(var26.key) else tostring(var25)
		var24 -= 1
		
		if getItemCount(data) + 1 < var24 then
			var24 -= getItemCount(data) + 1
			continue
		end
		return if var24 == 0 then {
			index = nil,
			header = true,
			section = var26,
			key = var27 .. ":header",
			trailingSection = sections[var25 + 1]
		} elseif var24 == getItemCount(data) + 1 then {
			index = nil,
			header = false,
			section = var26,
			key = var27 .. ":footer",
			trailingSection = sections[var25 + 1]
		} else {
			section = var26,
			key = var27 .. ":" .. tostring((var26.keyExtractor or (keyExtractor_1 or keyExtractor))(getItem(data, var24), var24)),
			index = var24,
			leadingItem = getItem(data, var24 - 1),
			leadingSection = sections[var25 - 1],
			trailingItem = getItem(data, var24 + 1),
			trailingSection = sections[var25 + 1]
		}
	end
	return nil
end

function virtualizedSectionList._getSeparatorComponent(p26, p27, p28, p29) --[[ line: 511 ]]
	-- upvalues: boolean (ref)
	if not p28 then
		p28 = p26:_subExtractor(p27)
	end
	if not p28 then
		return nil
	end
	local var28 = if boolean.toJSBoolean(p28.section.ItemSeparatorComponent) then p28.section.ItemSeparatorComponent else p26.props.ItemSeparatorComponent
	local sectionSeparatorComponent = p26.props.SectionSeparatorComponent
	local var29 = p28.index == p26.props.getItemCount(p28.section.data)
	
	return if sectionSeparatorComponent and var29 then sectionSeparatorComponent elseif var28 and not var29 and not (p27 == p29) then var28 else nil
end

ItemWithSeparator = function(p30) --[[ line: 563 | named "ItemWithSeparator" ]]
	-- upvalues: reactModule (ref), object (ref), viewModule (ref)
	local leadingSeparatorComponent = p30.LeadingSeparatorComponent
	local separatorComponent = p30.SeparatorComponent
	local cellKey = p30.cellKey
	local prevCellKey = p30.prevCellKey
	local setSelfHighlightCallback = p30.setSelfHighlightCallback
	local updateHighlightFor = p30.updateHighlightFor
	local setSelfUpdatePropsCallback = p30.setSelfUpdatePropsCallback
	local updatePropsFor = p30.updatePropsFor
	local item = p30.item
	local index = p30.index
	local section = p30.section
	local inverted = p30.inverted
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState({
		LayoutOrder = -1,
		leadingItem = p30.leadingItem,
		leadingSection = p30.leadingSection,
		section = p30.section,
		trailingItem = p30.item,
		trailingSection = p30.trailingSection
	})
	local var36, var37 = reactModule.useState({
		LayoutOrder = 1,
		leadingItem = p30.item,
		leadingSection = p30.leadingSection,
		section = p30.section,
		trailingItem = p30.trailingItem,
		trailingSection = p30.trailingSection
	})
	reactModule.useEffect(function() --[[ line: 601 ]]
		-- upvalues: setSelfHighlightCallback (ref), cellKey (ref), var33 (ref), setSelfUpdatePropsCallback (ref), var37 (ref)
		setSelfHighlightCallback(cellKey, var33)
		setSelfUpdatePropsCallback(cellKey, var37)
		
		return function() --[[ line: 604 ]]
			-- upvalues: setSelfUpdatePropsCallback (copy), cellKey (copy), setSelfHighlightCallback (copy)
			setSelfUpdatePropsCallback(cellKey, nil)
			setSelfHighlightCallback(cellKey, nil)
		end
	end, {
		cellKey,
		setSelfHighlightCallback,
		var37,
		setSelfUpdatePropsCallback
	})
	local var38 = p30.renderItem({
		item = item,
		index = index,
		section = section,
		separators = {
			highlight = function() --[[ line: 611 ]]
				-- upvalues: var31 (ref), var33 (ref), prevCellKey (ref), updateHighlightFor (ref)
				var31(true)
				var33(true)
				
				if prevCellKey ~= nil then
					updateHighlightFor(prevCellKey, true)
				end
			end,
			unhighlight = function() --[[ line: 618 ]]
				-- upvalues: var31 (ref), var33 (ref), prevCellKey (ref), updateHighlightFor (ref)
				var31(false)
				var33(false)
				
				if prevCellKey ~= nil then
					updateHighlightFor(prevCellKey, false)
				end
			end,
			updateProps = function(p31, p32) --[[ line: 625 ]]
				-- upvalues: leadingSeparatorComponent (ref), var35 (ref), object (copy), var34 (ref), prevCellKey (ref), updatePropsFor (ref), separatorComponent (ref), var37 (ref), var36 (ref)
				if p31 == "leading" then
					if leadingSeparatorComponent ~= nil then
						var35(object.assign({}, var34, p32))
						
						return
					elseif prevCellKey == nil then
						return
					else
						updatePropsFor(prevCellKey, object.assign({}, var34, p32))
						
						return
					end
				elseif p31 == "trailing" and separatorComponent ~= nil then
					var37(object.assign({}, var36, p32))
				end
			end
		}
	})
	local var39 = leadingSeparatorComponent ~= nil and reactModule.createElement(leadingSeparatorComponent, object.assign({ highlighted = var30 }, var34))
	local var40 = separatorComponent ~= nil and reactModule.createElement(separatorComponent, object.assign({ highlighted = var32 }, var36))
	
	return if var39 or var40 then reactModule.createElement(viewModule, {
		Size = if p30.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p30.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y
	}, reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if p30.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}), if inverted == false then var39 else var40, var38, if inverted == false then var40 else var39) else var38
end

return virtualizedSectionList