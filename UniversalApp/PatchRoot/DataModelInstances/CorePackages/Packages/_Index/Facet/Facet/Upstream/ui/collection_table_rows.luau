local _ = require("./control_types")
local LayoutKitModule = require("./layout_kit")
local _ = require("./collection_reorder")
local CollectionPolicyModule = require("./collection_policy")
local ActivationModule = require("./activation")
local _ = require("./collection_tree")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./engine_types")
local _ = require("./collection_types")
local _ = require("./collection_table_metrics")
local _ = require("./collection_table_columns")
local CollectionHighlightModule = require("./collection_highlight")

return function(p1, p2, p3)
	-- upvalues: LayoutKitModule (copy), CollectionHighlightModule (copy), CollectionPolicyModule (copy), ActivationModule (copy)
	local OfResult = LayoutKitModule.of(p1)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction3 = p1.read
	local ReadFunction = p1.read
	local ReadFunction2 = p1.read
	local ReadFunction1 = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesEnum = p1.types.Enum
	local Spec = p3.spec
	local RowPolicySpec = p3.rowPolicySpec
	local Selection = p3.selection
	local Coordinator = p3.coordinator
	local CollectionHighlightModuleResult = if Spec.selection == nil and Spec.onSelectionChange == nil and Spec.selectionMode == nil then nil else CollectionHighlightModule(Compose, Selection, true, function(p4, p5)
		local IsNotNone = p5 ~= "none"
		local Row = p4.row
		local Painted = p4.painted
		
		if Row:GetAttribute("FacetSelected") ~= IsNotNone then
			Row:SetAttribute("FacetSelected", IsNotNone)
		end
		if IsNotNone ~= Painted:HasTag("facet-selected") then
			if IsNotNone then
				Painted:AddTag("facet-selected")
				
				return
			end
			Painted:RemoveTag("facet-selected")
		end
	end)
	local RowMeasures = p3.rowMeasures
	local ActionGutters = p3.actionGutters
	local TruncatedRows = p3.truncatedRows
	local MountedRows = p3.mountedRows
	local UnitScale = p3.unitScale
	local ScrolledX = p3.scrolledX
	local Editors = p3.editors
	local FieldFunction = p3.field
	local Tree = p3.tree
	local Editor = p3.editor
	local LaneWidthFunction = p3.laneWidth
	local Metrics = p3.metrics
	local Layout = p3.layout
	local CellPadding = Metrics.cellPadding
	local MinimumRow = Metrics.minimumRow
	local Collapsed = Layout.collapsed
	local DisclosureWidth = Layout.disclosureWidth
	local SetPrimaryMeasureFunction = Layout.setPrimaryMeasure
	local ReadResult = if type(Spec.columns) == "function" or Compose.isValue(Spec.columns) then nil else ReadFunction(Spec.columns)
	local self = setmetatable({}, { __mode = "ks" })
	local v1 = 0
	local UchRows = false
	
	local function _(p4, p5)
		-- upvalues: TypesUDim2 (copy)
		return TypesUDim2.new(1, p4, if p5 then 0 else 1, 0)
	end
	
	Compose.watch(function(Callback)
		-- upvalues: Layout (copy), Metrics (copy), v1 (ref), UchRows (ref), TypesUDim2 (copy), TypesEnum (copy), self (copy)
		local CallbackResult = Callback(Layout.disclosureShare)
		local UchRows1 = Metrics.touchRows(Callback)
		
		if CallbackResult == v1 and UchRows1 == UchRows then return end
		v1 = CallbackResult
		UchRows = UchRows1
		local NewTypesUDim = TypesUDim2.new(1, CallbackResult, if UchRows1 then 0 else 1, 0)
		local Y = if UchRows1 then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.None
		for i in self do
			i.Size = NewTypesUDim
			i.AutomaticSize = Y
		end
	end)
	local TableRows = {}
	local FromScaleResult = TypesUDim2.fromScale(1, 1)
	local v2 = 0
	Compose.watch(function(Callback)
		-- upvalues: LaneWidthFunction (copy), TypesUDim2 (copy), DisclosureWidth (copy), ScrolledX (copy), FromScaleResult (ref), v2 (ref), TableRows (copy)
		local LaneWidthResult = LaneWidthFunction(Callback)
		local NewTypesUDim = if LaneWidthResult then TypesUDim2.new(0, LaneWidthResult, 1, 0) else TypesUDim2.new(1, -Callback(DisclosureWidth), 1, 0)
		local CallbackResult = Callback(ScrolledX)
		
		if NewTypesUDim == FromScaleResult and CallbackResult == v2 then return end
		FromScaleResult = NewTypesUDim
		v2 = CallbackResult
		local FromOffsetResult = TypesUDim2.fromOffset(-CallbackResult, 0)
		local FromOffsetResult1 = TypesUDim2.fromOffset(CallbackResult, 0)
		
		for i, tableRow in TableRows do
			i.Size = NewTypesUDim
			i.Position = FromOffsetResult
			tableRow.Position = FromOffsetResult1
		end
	end)
	
	return function(p4, p5, p6)
		-- upvalues: Compose (copy), MountedRows (copy), TruncatedRows (copy), TableRows (copy), MinimumRow (copy), Collapsed (copy), ReadFunction (copy), Spec (copy), RowMeasures (copy), ReadFunction2 (copy), Editors (copy), FieldFunction (copy), CollectionPolicyModule (upval), p1 (copy), v1 (ref), UchRows (ref), TypesUDim2 (copy), TypesEnum (copy), self (copy), Layout (copy), Host (copy), UnitScale (copy), CellPadding (copy), Runtime (copy), ReadFunction1 (copy), Metrics (copy), SetPrimaryMeasureFunction (copy), Tree (copy), FromScaleResult (ref), v2 (ref), OfResult (copy), ReadResult (copy), DisclosureWidth (copy), p2 (copy), Editor (copy), RowPolicySpec (copy), Coordinator (copy), ActionGutters (copy), ReadFunction3 (copy), CollectionHighlightModuleResult (copy), ActivationModule (upval)
		local TextHeightResults = {}
		local t = {}
		local CellResult = Compose.cell(0)
		
		local function _(Key, p7)
			-- upvalues: TextHeightResults (copy), CellResult (copy)
			TextHeightResults[Key] = p7
			CellResult:set(CellResult:peek() + 1)
		end
		
		local CellResult1 = Compose.cell({})
		local Key = nil
		
		local _ = function(Key)
			-- upvalues: MountedRows (upval)
			if Key ~= nil then
				local v3 = (MountedRows[Key] or 1) - 1
				
				if v3 > 0 then
					MountedRows[Key] = v3
					
					return
				end
				MountedRows[Key] = nil
			end
		end
		
		local function track(Key1, PeekResult)
			-- upvalues: Key (ref), MountedRows (upval), TruncatedRows (upval)
			if Key ~= Key1 then
				local Key2 = Key
				
				if Key2 ~= nil then
					local v3 = (MountedRows[Key2] or 1) - 1
					
					if v3 > 0 then
						MountedRows[Key2] = v3
					else
						MountedRows[Key2] = nil
					end
				end
				Key = Key1
				MountedRows[Key1] = (MountedRows[Key1] or 0) + 1
			end
			local PeekResult1 = if next(PeekResult) then PeekResult else nil
			
			if TruncatedRows:peek()[Key1] ~= PeekResult1 then
				local Copy = table.clone(TruncatedRows:peek())
				
				if PeekResult1 then
					Copy[Key1] = PeekResult1
				else
					Copy[Key1] = nil
				end
				TruncatedRows:set(Copy)
			end
		end
		
		local v3 = nil
		Compose.cleanup(function()
			-- upvalues: Key (ref), MountedRows (upval), v3 (ref), TableRows (upval)
			local Key1 = Key
			
			if Key1 ~= nil then
				local v4 = (MountedRows[Key1] or 1) - 1
				
				if v4 > 0 then
					MountedRows[Key1] = v4
				else
					MountedRows[Key1] = nil
				end
			end
			if v3 then
				TableRows[v3] = nil
			end
		end)
		
		local _ = function()
			-- upvalues: Compose (upval), CellResult (copy), MinimumRow (upval), Collapsed (upval), CellResult1 (copy), ReadFunction (upval), Spec (upval), TextHeightResults (copy), t (copy), p6 (copy), track (copy), RowMeasures (upval)
			Compose.watch(function(Callback)
				-- upvalues: CellResult (upval), MinimumRow (upval), Collapsed (upval), CellResult1 (upval), ReadFunction (upval), Spec (upval), TextHeightResults (upval), t (upval), p6 (upval), track (upval), RowMeasures (upval)
				Callback(CellResult)
				local CallbackResult = Callback(MinimumRow)
				local CallbackResult1 = Callback(Collapsed)
				local PeekResult = CellResult1:peek()
				local Flag = false
				
				for _, value in ReadFunction(Spec.columns, Callback) do
					local Id = value.id
					local TextHeightResult = TextHeightResults[Id]
					
					if TextHeightResult and not CallbackResult1[Id] then
						CallbackResult = math.max(CallbackResult, TextHeightResult(Callback) or 0)
					end
					local Entry = t[Id]
					
					if Entry and PeekResult[Id] == true ~= Entry(Callback) then
						if not Flag then
							PeekResult = table.clone(PeekResult)
							Flag = true
						end
						PeekResult[Id] = not PeekResult[Id] or nil
					end
				end
				if Flag then
					CellResult1:set(PeekResult)
				end
				local CallbackResult2 = Callback(p6)
				track(CallbackResult2, PeekResult)
				
				if (Callback(MinimumRow) < CallbackResult or RowMeasures:peek()[CallbackResult2] ~= nil) and RowMeasures:peek()[CallbackResult2] ~= CallbackResult then
					local Copy = table.clone(RowMeasures:peek())
					Copy[CallbackResult2] = CallbackResult
					RowMeasures:set(Copy)
				end
			end)
		end
		
		local function renderColumn(p7, p8)
			-- upvalues: ReadFunction2 (upval), Editors (upval), FieldFunction (upval), Spec (upval), CollectionPolicyModule (upval), p4 (copy), p5 (copy), Compose (upval), p1 (upval), v1 (upval), UchRows (upval), TypesUDim2 (upval), TypesEnum (upval), self (upval), Layout (upval), Host (upval), p6 (copy), UnitScale (upval), CellPadding (upval), MinimumRow (upval), Runtime (upval), TextHeightResults (copy), CellResult (copy), ReadFunction1 (upval), Metrics (upval), SetPrimaryMeasureFunction (upval), t (copy), Tree (upval)
			local ReadResult = ReadFunction2(p7)
			local RenderFunction = ReadResult.render
			local RenderResult = if RenderFunction == nil and ReadResult.editor then Editors.render(ReadResult, function(p9)
				-- upvalues: FieldFunction (upval), ReadResult (copy)
				return FieldFunction(p9, ReadResult)
			end, assert(Spec.onCellChange), function(Callback): boolean
				-- upvalues: CollectionPolicyModule (upval), Spec (upval), p4 (upval)
				return not CollectionPolicyModule.disabled(Spec.disabled, Callback(p4))
			end) else nil
			local Callback1 = if RenderFunction then function(p9)
				-- upvalues: RenderFunction (copy), p4 (upval), p5 (upval), Compose (upval)
				return RenderFunction(p4, p5, Compose.cell(p9))
			end elseif RenderResult then function(p9)
				-- upvalues: RenderResult (copy), p4 (upval), p5 (upval)
				return RenderResult(p4, p5, p9)
			end else nil
			local Callback = if Callback1 then function(p9)
				-- upvalues: Compose (upval), Callback1 (copy)
				return Compose.switch(p9, {}, function()
					-- upvalues: Callback1 (upval), p9 (copy)
					return Callback1(p9:peek())
				end)
			end else nil
			
			local function _(Callback): string
				-- upvalues: FieldFunction (upval), p4 (upval), ReadFunction2 (upval), p7 (copy)
				local FieldResult = FieldFunction(Callback(p4), ReadFunction2(p7, Callback))
				
				return if FieldResult == nil then "" else tostring(FieldResult)
			end
			
			local function words(Callback): string
				-- upvalues: FieldFunction (upval), p4 (upval), ReadFunction2 (upval), p7 (copy)
				local List = {}
				local GmatchFunction = string.gmatch
				local FieldResult = FieldFunction(Callback(p4), ReadFunction2(p7, Callback))
				local Text: string = if FieldResult == nil then "" else tostring(FieldResult)
				for i in GmatchFunction(Text, "%S+") do
					table.insert(List, i)
				end
				return table.concat(List, "\n")
			end
			
			local function probe(Name, Words, p9)
				-- upvalues: p1 (upval), v1 (upval), UchRows (upval), TypesUDim2 (upval), TypesEnum (upval), self (upval)
				local TableValue = p1.styled(p1.text({
					TextWrapped = false,
					TextTransparency = 1,
					Interactable = false,
					Name = Name,
					Size = if p9 then TypesUDim2.new(1, v1, if UchRows then 0 else 1, 0) else TypesUDim2.fromScale(1, 0),
					AutomaticSize = if p9 and not UchRows then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y,
					Text = Words or ""
				}), "TableValue")
				
				if p9 then
					self[TableValue] = true
				end
				return TableValue
			end
			
			local CellResult1 = Compose.cell(nil)
			local ShowResult = if Callback or ReadResult.wrap == false then nil else Compose.show(function(p9)
				-- upvalues: Layout (upval), ReadFunction2 (upval), p7 (copy)
				return Layout.textWrap(ReadFunction2(p7, p9), p9)
			end, function()
				-- upvalues: probe (copy), words (copy), p1 (upval), Compose (upval), CellResult1 (copy)
				local LongestWord = probe("LongestWord", words, false)
				local TextFitsResult = p1.observe.TextFits(LongestWord)
				Compose.watch(function(Callback)
					-- upvalues: CellResult1 (upval), TextFitsResult (copy)
					CellResult1:set(Callback(TextFitsResult))
				end)
				Compose.cleanup(function()
					-- upvalues: CellResult1 (upval)
					CellResult1:set(nil)
				end)
				
				return LongestWord
			end)
			local Undisclosed = if Callback then nil else probe("Undisclosed", nil, true)
			local TableCellInset = if Callback then p1.styled(Host.Frame("Inset")({
				BackgroundTransparency = 1,
				Callback(p6),
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Vertical,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					SortOrder = TypesEnum.SortOrder.LayoutOrder
				})
			}), "TableCellInset") else p1.styled(p1.text({
				Name = "Value",
				TextXAlignment = function(p9)
					-- upvalues: ReadFunction2 (upval), p7 (copy), TypesEnum (upval)
					local Align = ReadFunction2(p7, p9).align or "start"
					
					return if Align == "end" then TypesEnum.TextXAlignment.Right elseif Align == "center" then TypesEnum.TextXAlignment.Center else TypesEnum.TextXAlignment.Left
				end,
				TextTruncate = TypesEnum.TextTruncate.AtEnd,
				TextWrapped = function(Callback): boolean
					-- upvalues: Layout (upval), ReadFunction2 (upval), p7 (copy), CellResult1 (copy)
					return Layout.textWrap(ReadFunction2(p7, Callback), Callback) and Callback(CellResult1) ~= false
				end,
				Size = TypesUDim2.fromScale(1, 1),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				Text = function(Callback): string
					-- upvalues: FieldFunction (upval), p4 (upval), ReadFunction2 (upval), p7 (copy), Undisclosed (copy)
					local FieldResult = FieldFunction(Callback(p4), ReadFunction2(p7, Callback))
					local Text: string = if FieldResult == nil then "" else tostring(FieldResult)
					assert(Undisclosed).Text = Text
					
					return Text
				end
			}), "TableValue")
			
			if Callback then
				local GuiObject = TableCellInset:FindFirstChildWhichIsA("GuiObject") or TableCellInset
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(GuiObject)
				local v4 = assert(Compose.currentOwner())
				local WithOwnerResult = nil
				local AutomaticSizeResult = p1.observe.AutomaticSize(GuiObject)
				local WithOwnerResult1 = nil
				local v5 = nil
				
				TextHeightResults[ReadResult.id] = function(Callback)
					-- upvalues: AutomaticSizeResult (copy), TypesEnum (upval), WithOwnerResult1 (ref), Compose (upval), v4 (copy), p1 (upval), GuiObject (copy), v5 (ref), AbsoluteSizeResult1 (copy), UnitScale (upval), CellPadding (upval), MinimumRow (upval), Runtime (upval), WithOwnerResult (ref)
					local CallbackResult = Callback(AutomaticSizeResult)
					
					if CallbackResult ~= TypesEnum.AutomaticSize.Y and CallbackResult ~= TypesEnum.AutomaticSize.XY then
						if WithOwnerResult1 == nil then
							WithOwnerResult1 = Compose.withOwner(v4, function()
								-- upvalues: p1 (upval), GuiObject (upval)
								return p1.observe.Size(GuiObject)
							end)
						end
						if Callback(assert(WithOwnerResult1)).Y.Scale ~= 0 then
							return v5
						end
					end
					local Y = Callback(AbsoluteSizeResult1).Y
					local NewY = Y / Callback(UnitScale) + CellPadding
					
					if v5 == NewY or Y == 0 and v5 == nil and NewY <= Callback(MinimumRow) then
						return v5
					end
					if Y == 0 and Runtime.host.frames then
						if WithOwnerResult == nil then
							WithOwnerResult = Compose.withOwner(v4, function()
								-- upvalues: Runtime (upval), AbsoluteSizeResult1 (upval), GuiObject (upval)
								return Runtime.settled({
									restart = AbsoluteSizeResult1,
									sample = function()
										-- upvalues: GuiObject (upval)
										return GuiObject.AbsoluteSize
									end
								})
							end)
						end
						if not Callback(assert(WithOwnerResult)) then
							return v5
						end
					end
					v5 = NewY
					
					return NewY
				end
				
				CellResult:set(CellResult:peek() + 1)
			end
			if not Callback and ReadFunction1(p8) == 1 then
				local TextBoundsResult = p1.observe.TextBounds(assert(Undisclosed))
				Compose.watch(function(Callback)
					-- upvalues: TableCellInset (ref), CellPadding (upval), Metrics (upval), UnitScale (upval), SetPrimaryMeasureFunction (upval), p6 (upval), Undisclosed (copy), TextBoundsResult (copy)
					local UIPadding = TableCellInset:FindFirstChildWhichIsA("UIPadding")
					SetPrimaryMeasureFunction(p6:peek(), assert(Undisclosed), math.ceil(Callback(TextBoundsResult).X / Callback(UnitScale)), if UIPadding then UIPadding:GetStyled("PaddingLeft").Offset + UIPadding:GetStyled("PaddingRight").Offset else math.max(CellPadding, Callback(Metrics.textInsetSize).X / Callback(UnitScale)))
				end)
			end
			if not Callback then
				assert(TableCellInset:IsA("TextLabel"))
				local TextFitsResult = p1.observe.TextFits(assert(Undisclosed))
				local TextBoundsResult1 = p1.observe.TextBounds(assert(Undisclosed))
				local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(assert(Undisclosed))
				local v6 = false
				
				t[ReadResult.id] = function(Callback): boolean
					-- upvalues: Tree (upval), AbsoluteSizeResult2 (copy), TextBoundsResult1 (copy), CellPadding (upval), UnitScale (upval), v6 (ref), TextFitsResult (copy)
					if not Tree or Callback(AbsoluteSizeResult2).X > 0 and Callback(TextBoundsResult1).Y > 0 and Callback(TextBoundsResult1).Y + CellPadding * Callback(UnitScale) <= Callback(AbsoluteSizeResult2).Y then
						v6 = Callback(TextFitsResult) == false
					end
					return v6
				end
				
				TextHeightResults[ReadResult.id] = Metrics.textHeight(TableCellInset, CellPadding)
				CellResult:set(CellResult:peek() + 1)
			end
			if Tree and ReadFunction1(p8) == 1 then
				TableCellInset = Tree.wrap(TableCellInset, p4, p6:peek())
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(TableCellInset)
				
				TextHeightResults[ReadResult.id] = function(Callback)
					-- upvalues: AbsoluteSizeResult (copy), UnitScale (upval)
					return Callback(AbsoluteSizeResult).Y / Callback(UnitScale)
				end
				
				CellResult:set(CellResult:peek() + 1)
			end
			local TableCell = p1.styled(Layout.columnFrame(p7, p8, TableCellInset, ShowResult, Undisclosed), "TableCell")
			TableCell.ClipsDescendants = true
			
			return TableCell
		end
		
		local List = {
			Name = "Row",
			Size = FromScaleResult,
			Position = TypesUDim2.fromOffset(-v2, 0),
			BackgroundTransparency = 1,
			Attributes = { FacetSelected = false },
			OfResult.list({}, false)
		}
		
		if ReadResult then
			for i, value in ReadResult do
				table.insert(List, (renderColumn(value, i)))
			end
		else
			table.insert(List, Compose.keyed({
				from = function(p9)
					-- upvalues: ReadFunction (upval), Spec (upval)
					return ReadFunction(Spec.columns, p9)
				end,
				key = function(p9)
					return p9.id
				end,
				render = renderColumn
			}))
		end
		local FrameResult = Host.Frame(List)
		Compose.watch(function(Callback)
			-- upvalues: CellResult (copy), MinimumRow (upval), Collapsed (upval), CellResult1 (copy), ReadFunction (upval), Spec (upval), TextHeightResults (copy), t (copy), p6 (copy), track (copy), RowMeasures (upval)
			Callback(CellResult)
			local CallbackResult = Callback(MinimumRow)
			local CallbackResult1 = Callback(Collapsed)
			local PeekResult = CellResult1:peek()
			local Flag = false
			
			for _, value in ReadFunction(Spec.columns, Callback) do
				local Id = value.id
				local TextHeightResult = TextHeightResults[Id]
				
				if TextHeightResult and not CallbackResult1[Id] then
					CallbackResult = math.max(CallbackResult, TextHeightResult(Callback) or 0)
				end
				local Entry = t[Id]
				
				if Entry and PeekResult[Id] == true ~= Entry(Callback) then
					if not Flag then
						PeekResult = table.clone(PeekResult)
						Flag = true
					end
					PeekResult[Id] = not PeekResult[Id] or nil
				end
			end
			if Flag then
				CellResult1:set(PeekResult)
			end
			local CallbackResult2 = Callback(p6)
			track(CallbackResult2, PeekResult)
			
			if (Callback(MinimumRow) < CallbackResult or RowMeasures:peek()[CallbackResult2] ~= nil) and RowMeasures:peek()[CallbackResult2] ~= CallbackResult then
				local Copy = table.clone(RowMeasures:peek())
				Copy[CallbackResult2] = CallbackResult
				RowMeasures:set(Copy)
			end
		end)
		local config = {
			Name = "DisclosingRow",
			Size = TypesUDim2.fromScale(1, 1),
			ClipsDescendants = true,
			FrameResult,
			Compose.show(function(Callback): boolean
				-- upvalues: DisclosureWidth (upval)
				return Callback(DisclosureWidth) > 0
			end, function()
				-- upvalues: Compose (upval), p2 (upval), TypesUDim2 (upval), TypesEnum (upval), p1 (upval), Collapsed (upval), ReadFunction (upval), Spec (upval), CellResult1 (copy), p4 (copy), p5 (copy), p6 (copy), FieldFunction (upval)
				local CellResult = Compose.cell(false)
				local Button = p2.Button("Details")({
					icon = "status.info",
					name = "Show details",
					appearance = "utility",
					Size = TypesUDim2.new(0, 48, 1, 0),
					Position = TypesUDim2.new(1, -48, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.None
				})
				assert(Button:IsA("GuiButton"))
				
				return p2.Popover({
					isPresented = CellResult,
					onPresentedChange = function(p9)
						-- upvalues: CellResult (copy)
						CellResult:set(p9)
					end,
					trigger = Button,
					content = function()
						-- upvalues: p1 (upval), Compose (upval), Collapsed (upval), ReadFunction (upval), Spec (upval), CellResult1 (upval), TypesEnum (upval), p4 (upval), p5 (upval), p6 (upval), TypesUDim2 (upval), FieldFunction (upval)
						return p1.column({
							Compose.keyed({
								from = function(Callback)
									-- upvalues: Collapsed (upval), ReadFunction (upval), Spec (upval), CellResult1 (upval)
									local CallbackResult = Callback(Collapsed)
									local List = {}
									
									for _, value in ReadFunction(Spec.columns, Callback) do
										if CallbackResult[value.id] or Callback(CellResult1)[value.id] then
											table.insert(List, value)
										end
									end
									return List
								end,
								key = function(p9)
									return p9.id
								end,
								render = function(p9, LayoutOrder)
									-- upvalues: p1 (upval), TypesEnum (upval), p4 (upval), p5 (upval), p6 (upval), TypesUDim2 (upval), FieldFunction (upval)
									return p1.column({
										p1.text({
											Text = function(Callback): string
												-- upvalues: p9 (copy)
												return (tostring(Callback(p9).label or Callback(p9).id))
											end,
											AutomaticSize = TypesEnum.AutomaticSize.XY
										}),
										if p9:peek().detailRender then assert(p9:peek().detailRender)(p4, p5, p6) else p1.text({
											Name = "FullValue",
											TextWrapped = true,
											Size = TypesUDim2.new(1, 0, 0, 0),
											AutomaticSize = TypesEnum.AutomaticSize.Y,
											Text = function(Callback): string
												-- upvalues: p9 (copy), p4 (upval), FieldFunction (upval)
												local CallbackResult = Callback(p9)
												local CallbackResult1 = Callback(p4)
												local ValueResult = if CallbackResult.value then CallbackResult.value(CallbackResult1) else FieldFunction(CallbackResult1, CallbackResult)
												
												return if ValueResult == nil then "" else tostring(ValueResult)
											end
										})
									}, {
										Name = p9:peek().id,
										LayoutOrder = LayoutOrder,
										Size = TypesUDim2.new(1, 0, 0, 0),
										AutomaticSize = TypesEnum.AutomaticSize.Y
									})
								end
							})
						}, {
							Size = TypesUDim2.new(1, 0, 0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.Y
						})
					end
				})
			end)
		}
		
		if Editor then
			config.BackgroundTransparency = 1
		end
		local FrameResult1 = Host.Frame(config)
		local WrapResult = CollectionPolicyModule.actions(p1, RowPolicySpec, p4, p6:peek(), FrameResult1, p2.RowActions, Coordinator)
		local CellActions = WrapResult:FindFirstChild("CellActions")
		
		if CellActions and CellActions:IsA("GuiObject") then
			local VisibleResult = p1.observe.Visible(CellActions)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(CellActions)
			Compose.watch(function(Callback)
				-- upvalues: VisibleResult (copy), AbsoluteSizeResult (copy), UnitScale (upval), ActionGutters (upval), p6 (copy)
				local XRatio = if Callback(VisibleResult) then Callback(AbsoluteSizeResult).X / Callback(UnitScale) else 0
				
				if ActionGutters:peek()[p6:peek()] ~= XRatio then
					local Copy = table.clone(ActionGutters:peek())
					Copy[p6:peek()] = XRatio
					ActionGutters:set(Copy)
				end
			end)
			Compose.cleanup(function()
				-- upvalues: ActionGutters (upval), p6 (copy)
				local Copy = table.clone(ActionGutters:peek())
				Copy[p6:peek()] = nil
				ActionGutters:set(Copy)
			end)
		end
		if Editor then
			WrapResult = Editor.wrap(WrapResult, p4, p6:peek(), true)
		end
		local TableRow = p1.styled(if Editor then WrapResult else FrameResult1, "TableRow")
		TableRow.Position = TypesUDim2.fromOffset(v2, 0)
		TableRows[FrameResult] = TableRow
		v3 = FrameResult
		
		if Spec.alternatingRows then
			Compose.watch(function(Callback)
				-- upvalues: ReadFunction3 (upval), Spec (upval), p5 (copy), TableRow (copy)
				if ReadFunction3(Spec.alternatingRows, Callback) == true and Callback(p5).index % 2 == 0 then
					TableRow:AddTag("facet-tablerow-alternate")
					
					return
				end
				if TableRow:HasTag("facet-tablerow-alternate") then
					TableRow:RemoveTag("facet-tablerow-alternate")
				end
			end)
		end
		if CollectionHighlightModuleResult then
			CollectionHighlightModuleResult.bind(p6, { row = FrameResult, painted = TableRow })
		end
		if Editor then
			local PressFunction = Editor.press
			Compose.cleanup(ActivationModule.providePress(WrapResult, function(p9)
				-- upvalues: PressFunction (copy), p6 (copy)
				PressFunction(p6:peek(), p9)
			end))
		end
		return WrapResult
	end
end