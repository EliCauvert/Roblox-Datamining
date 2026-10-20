local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local InvariantModule = require(Parent.jsUtils.invariant)
local _ = require(script.Parent.ViewabilityHelper)
local KeyExtractor = require(script.Parent.VirtualizeUtils).keyExtractor
local ViewModule = require(Parent.Components.View.View)
local VirtualizedListModule = require(script.Parent.VirtualizedList)
local ReactModule = require(Parent1.React)
local ItemWithSeparator = nil
local VirtualizedSectionList = ReactModule.PureComponent:extend("VirtualizedSectionList")

function VirtualizedSectionList.init(p1)
	-- upvalues: InvariantModule (copy), KeyExtractor (copy), Object (copy), Array (copy), Boolean (copy), ReactModule (copy), ItemWithSeparator (ref)
	p1._updateHighlightMap = {}
	p1._updatePropsMap = {}
	p1._listRef = nil
	
	function p1._captureRef(_listRef)
		-- upvalues: p1 (copy)
		p1._listRef = _listRef
	end
	
	function p1:_keyExtractor(p2)
		-- upvalues: p1 (copy)
		local SubExtractorResult = p1:_subExtractor(p2)
		
		return if SubExtractorResult then SubExtractorResult.key else tostring(p2)
	end
	
	function p1._convertViewable(p2)
		-- upvalues: InvariantModule (upval), p1 (copy), KeyExtractor (upval), Object (upval)
		InvariantModule(p2.index ~= nil, "Received a broken ViewToken")
		local SubExtractorResult = p1:_subExtractor(p2.index)
		
		if SubExtractorResult then
			local KeyExtractorFunction = SubExtractorResult.section.keyExtractor
			local KeyExtractor1 = if p1.props.keyExtractor then p1.props.keyExtractor else KeyExtractor
			
			return Object.assign({}, p2, {
				index = SubExtractorResult.index,
				key = if KeyExtractorFunction == nil then KeyExtractor1(p2.item, if SubExtractorResult.index == nil then 1 else SubExtractorResult.index) else KeyExtractorFunction(p2.item, SubExtractorResult.index),
				section = SubExtractorResult.section
			})
		else
			return nil
		end
	end
	
	function p1._onViewableItemsChanged(p2)
		-- upvalues: p1 (copy), Array (upval), Boolean (upval)
		local ViewableItems = p2.viewableItems
		local Changed = p2.changed
		local OnViewableItemsChangedFunction: (any) -> () = p1.props.onViewableItemsChanged
		
		if OnViewableItemsChangedFunction ~= nil then
			OnViewableItemsChangedFunction({
				viewableItems = Array.filter(Array.map(ViewableItems, p1._convertViewable, p1), Boolean.toJSBoolean),
				changed = Array.filter(Array.map(Changed, p1._convertViewable, p1), Boolean.toJSBoolean)
			})
		end
	end
	
	function p1._renderItem(NewItemCount)
		-- upvalues: p1 (copy), Boolean (upval), InvariantModule (upval), ReactModule (upval), ItemWithSeparator (upval)
		return function(p2)
			-- upvalues: p1 (upval), Boolean (upval), NewItemCount (copy), InvariantModule (upval), ReactModule (upval), ItemWithSeparator (upval)
			local Item = p2.item
			local Index: number = p2.index
			local SubExtractorResult = p1:_subExtractor(Index)
			
			if not SubExtractorResult then
				return nil
			end
			local Index1 = SubExtractorResult.index
			
			if Index1 ~= nil then
				local RenderItem = SubExtractorResult.section.renderItem or p1.props.renderItem
				local SeparatorComponent = p1:_getSeparatorComponent(Index, SubExtractorResult, NewItemCount)
				InvariantModule(RenderItem, "no renderItem!")
				
				return ReactModule.createElement(ItemWithSeparator, {
					SeparatorComponent = SeparatorComponent,
					LeadingSeparatorComponent = if Index1 == 1 then p1.props.SectionSeparatorComponent else nil,
					cellKey = SubExtractorResult.key,
					index = Index1,
					item = Item,
					leadingItem = SubExtractorResult.leadingItem,
					leadingSection = SubExtractorResult.leadingSection,
					prevCellKey = (p1:_subExtractor(Index - 1) or {}).key,
					setSelfHighlightCallback = p1._setUpdateHighlightFor,
					setSelfUpdatePropsCallback = p1._setUpdatePropsFor,
					updateHighlightFor = p1._updateHighlightFor,
					updatePropsFor = p1._updatePropsFor,
					renderItem = RenderItem,
					section = SubExtractorResult.section,
					trailingItem = SubExtractorResult.trailingItem,
					trailingSection = SubExtractorResult.trailingSection,
					inverted = Boolean.toJSBoolean(p1.props.inverted),
					horizontal = p1.props.horizontal
				})
			end
			local Section = SubExtractorResult.section
			
			if SubExtractorResult.header == true then
				local RenderSectionHeaderFunction = p1.props.renderSectionHeader
				
				return if Boolean.toJSBoolean(RenderSectionHeaderFunction) then RenderSectionHeaderFunction({ section = Section }) else nil
			else
				local RenderSectionFooterFunction = p1.props.renderSectionFooter
				
				return if Boolean.toJSBoolean(RenderSectionFooterFunction) then RenderSectionFooterFunction({ section = Section }) else nil
			end
		end
	end
	
	function p1._updatePropsFor(p2, p3)
		-- upvalues: p1 (copy)
		local UpdateProps: (any) -> () = p1._updatePropsMap[p2]
		
		if UpdateProps ~= nil then
			UpdateProps(p3)
		end
	end
	
	function p1._updateHighlightFor(p2, p3)
		-- upvalues: p1 (copy)
		local UpdateHighlight: (any) -> () = p1._updateHighlightMap[p2]
		
		if UpdateHighlight ~= nil then
			UpdateHighlight(p3)
		end
	end
	
	function p1._setUpdateHighlightFor(p2, p3)
		-- upvalues: p1 (copy)
		if p3 == nil then
			p1._updateHighlightMap[p2] = nil
			
			return
		else
			p1._updateHighlightMap[p2] = p3
		end
	end
	
	function p1._setUpdatePropsFor(p2, p3)
		-- upvalues: p1 (copy)
		if p3 == nil then
			p1._updatePropsMap[p2] = nil
			
			return
		else
			p1._updatePropsMap[p2] = p3
		end
	end
end

function VirtualizedSectionList.scrollToLocation(p1, p2)
	-- upvalues: Object (copy)
	local ItemIndex = p2.itemIndex
	local Count = 1
	while Count < p2.sectionIndex do
		ItemIndex += p1.props.getItemCount(p1.props.sections[Count].data) + 2
		Count += 1
	end
	local ViewOffset = p2.viewOffset or 0
	
	if p1._listRef == nil then return end
	if p2.itemIndex > 1 and p1.props.stickySectionHeadersEnabled then
		ViewOffset += p1._listRef.__getFrameMetricsApprox(ItemIndex - p2.itemIndex).length
	end
	p1._listRef:scrollToIndex((Object.assign({}, p2, { viewOffset = ViewOffset, index = ItemIndex })))
end

function VirtualizedSectionList.getListRef(p3)
	return p3._listRef
end

function VirtualizedSectionList.render(p3)
	-- upvalues: Object (copy), ReactModule (copy), VirtualizedListModule (copy)
	local _ = p3.props.renderItem
	local _ = p3.props.sections
	local AssignResult = Object.assign({}, p3.props, {
		ItemSeparatorComponent = Object.None,
		SectionSeparatorComponent = Object.None,
		renderItem = Object.None,
		renderSectionFooter = Object.None,
		renderSectionHeader = Object.None,
		sections = Object.None,
		stickySectionHeadersEnabled = Object.None
	})
	local v1: number = if p3.props.ListHeaderComponent then 1 else 0
	local T = if p3.props.stickySectionHeadersEnabled then {} else nil
	local NewItemCount = 0
	
	for _, section in ipairs(p3.props.sections) do
		if T ~= nil then
			table.insert(T, NewItemCount + v1)
		end
		NewItemCount += 2
		NewItemCount += p3.props.getItemCount(section.data)
	end
	return ReactModule.createElement(VirtualizedListModule, Object.assign({}, AssignResult, {
		keyExtractor = p3._keyExtractor,
		stickyHeaderIndices = T,
		renderItem = p3._renderItem(NewItemCount),
		data = p3.props.sections,
		getItem = function(p4, Total)
			-- upvalues: p3 (copy)
			return p3:_getItem(p3.props, p4, Total)
		end,
		getItemCount = function()
			-- upvalues: NewItemCount (ref)
			return NewItemCount
		end,
		onViewableItemsChanged = if p3.props.onViewableItemsChanged then p3._onViewableItemsChanged else nil,
		ref = p3._captureRef
	}))
end

function VirtualizedSectionList:_getItem(Props, p4, p5: number)
	if not p4 then
		return nil
	end
	local Total = p5 - 1
	local Count = 1
	local v2 = nil
	local Data = nil
	while Count <= #p4 do
		v2 = p4[Count]
		Data = v2.data
		local ItemCount: number = Props.getItemCount(Data)
		
		if Total == 0 or Total == ItemCount + 1 then
			return v2
		end
		if Total <= ItemCount then
			return Props.getItem(Data, Total)
		end
		Total -= ItemCount + 2
		Count += 1
	end
	return nil
end

function VirtualizedSectionList._subExtractor(p6, Index)
	-- upvalues: Boolean (copy), KeyExtractor (copy)
	local Index1: number = Index
	local Props = p6.props
	local GetItemFunction = Props.getItem
	local GetItemCountFunction = Props.getItemCount
	local KeyExtractor1 = Props.keyExtractor
	local Sections = Props.sections
	local Count = 1
	local Section = nil
	local Data = nil
	local Text = nil
	while Count <= #Sections do
		Section = Sections[Count]
		Data = Section.data
		Text = if Boolean.toJSBoolean(Section.key) then tostring(Section.key) else tostring(Count)
		Index1 -= 1
		
		if GetItemCountFunction(Data) + 1 >= Index1 then
			return if Index1 == 0 then {
				index = nil,
				header = true,
				section = Section,
				key = Text .. ":header",
				trailingSection = Sections[Count + 1]
			} elseif Index1 == GetItemCountFunction(Data) + 1 then {
				index = nil,
				header = false,
				section = Section,
				key = Text .. ":footer",
				trailingSection = Sections[Count + 1]
			} else {
				section = Section,
				key = Text .. ":" .. tostring((Section.keyExtractor or (KeyExtractor1 or KeyExtractor))(GetItemFunction(Data, Index1), Index1)),
				index = Index1,
				leadingItem = GetItemFunction(Data, Index1 - 1),
				leadingSection = Sections[Count - 1],
				trailingItem = GetItemFunction(Data, Index1 + 1),
				trailingSection = Sections[Count + 1]
			}
		end
		Index1 -= GetItemCountFunction(Data) + 1
		Count += 1
	end
	return nil
end

function VirtualizedSectionList._getSeparatorComponent(p7, Index, SubExtractorResult, p8)
	-- upvalues: Boolean (copy)
	if not SubExtractorResult then
		SubExtractorResult = p7:_subExtractor(Index)
	end
	if SubExtractorResult then
		local ItemSeparatorComponent = Boolean.toJSBoolean(SubExtractorResult.section.ItemSeparatorComponent) and SubExtractorResult.section.ItemSeparatorComponent or p7.props.ItemSeparatorComponent
		local SectionSeparatorComponent = p7.props.SectionSeparatorComponent
		local IsIndexMatch = Index == p8
		local IsIndexMatch1 = SubExtractorResult.index == p7.props.getItemCount(SubExtractorResult.section.data)
		
		return if SectionSeparatorComponent and IsIndexMatch1 then SectionSeparatorComponent elseif ItemSeparatorComponent and not IsIndexMatch1 and not IsIndexMatch then ItemSeparatorComponent else nil
	else
		return nil
	end
end

ItemWithSeparator = function(p7)
	-- upvalues: ReactModule (copy), Object (copy), ViewModule (copy)
	local LeadingSeparatorComponent = p7.LeadingSeparatorComponent
	local SeparatorComponent = p7.SeparatorComponent
	local CellKey = p7.cellKey
	local PrevCellKey = p7.prevCellKey
	local SetSelfHighlightCallbackFunction = p7.setSelfHighlightCallback
	local UpdateHighlightForFunction = p7.updateHighlightFor
	local SetSelfUpdatePropsCallbackFunction = p7.setSelfUpdatePropsCallback
	local UpdatePropsForFunction = p7.updatePropsFor
	local Item = p7.item
	local Index = p7.index
	local Section = p7.section
	local Inverted = p7.inverted
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({
		LayoutOrder = -1,
		leadingItem = p7.leadingItem,
		leadingSection = p7.leadingSection,
		section = p7.section,
		trailingItem = p7.item,
		trailingSection = p7.trailingSection
	})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState({
		LayoutOrder = 1,
		leadingItem = p7.item,
		leadingSection = p7.leadingSection,
		section = p7.section,
		trailingItem = p7.trailingItem,
		trailingSection = p7.trailingSection
	})
	ReactModule.useEffect(function()
		-- upvalues: SetSelfHighlightCallbackFunction (copy), CellKey (copy), UseStateResult2_1 (copy), SetSelfUpdatePropsCallbackFunction (copy), UseStateResult2_3 (copy)
		SetSelfHighlightCallbackFunction(CellKey, UseStateResult2_1)
		SetSelfUpdatePropsCallbackFunction(CellKey, UseStateResult2_3)
		
		return function()
			-- upvalues: SetSelfUpdatePropsCallbackFunction (upval), CellKey (upval), SetSelfHighlightCallbackFunction (upval)
			SetSelfUpdatePropsCallbackFunction(CellKey, nil)
			SetSelfHighlightCallbackFunction(CellKey, nil)
		end
	end, {
		CellKey,
		SetSelfHighlightCallbackFunction,
		UseStateResult2_3,
		SetSelfUpdatePropsCallbackFunction
	})
	local RenderItemResult = p7.renderItem({
		item = Item,
		index = Index,
		section = Section,
		separators = {
			highlight = function()
				-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), PrevCellKey (copy), UpdateHighlightForFunction (copy)
				UseStateResult2(true)
				UseStateResult2_1(true)
				
				if PrevCellKey ~= nil then
					UpdateHighlightForFunction(PrevCellKey, true)
				end
			end,
			unhighlight = function()
				-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), PrevCellKey (copy), UpdateHighlightForFunction (copy)
				UseStateResult2(false)
				UseStateResult2_1(false)
				
				if PrevCellKey ~= nil then
					UpdateHighlightForFunction(PrevCellKey, false)
				end
			end,
			updateProps = function(p8, p9)
				-- upvalues: LeadingSeparatorComponent (copy), UseStateResult2_2 (copy), Object (upval), UseStateResult3 (copy), PrevCellKey (copy), UpdatePropsForFunction (copy), SeparatorComponent (copy), UseStateResult2_3 (copy), UseStateResult4 (copy)
				if p8 == "leading" then
					if LeadingSeparatorComponent ~= nil then
						UseStateResult2_2(Object.assign({}, UseStateResult3, p9))
						
						return
					end
					if PrevCellKey ~= nil then
						UpdatePropsForFunction(PrevCellKey, Object.assign({}, UseStateResult3, p9))
						
						return
					end
				elseif p8 == "trailing" and SeparatorComponent ~= nil then
					UseStateResult2_3(Object.assign({}, UseStateResult4, p9))
				end
			end
		}
	})
	local Element = LeadingSeparatorComponent ~= nil and ReactModule.createElement(LeadingSeparatorComponent, Object.assign({ highlighted = UseStateResult }, UseStateResult3))
	local Element1 = SeparatorComponent ~= nil and ReactModule.createElement(SeparatorComponent, Object.assign({ highlighted = UseStateResult1 }, UseStateResult4))
	
	return if Element or Element1 then ReactModule.createElement(ViewModule, {
		Size = if p7.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
		AutomaticSize = if p7.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y
	}, ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = if p7.horizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	}), if Inverted == false then Element else Element1, RenderItemResult, if Inverted == false then Element1 else Element) else RenderItemResult
end

return VirtualizedSectionList