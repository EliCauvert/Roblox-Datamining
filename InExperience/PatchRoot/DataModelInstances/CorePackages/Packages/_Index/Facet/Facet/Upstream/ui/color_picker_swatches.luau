local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local ColorPickerKitModule = require("./color_picker_kit")
local _ = require("./color_picker_state")
local GAP = ColorPickerKitModule.GAP
local SPACE = ColorPickerKitModule.SPACE

return function(p1, p2, p3, p4, p5)
	-- upvalues: GAP (copy), SPACE (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local ReadSourceFunction = p1.readSource
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Color = p4.color
	local Spec = p5.spec
	local Removing = p5.removing
	local Gui = p5.gui
	local Selected = p5.selected
	local Held = p5.held
	local Canon = p5.canon
	local Columns = p5.columns
	local Editing = p5.editing
	local SwatchList = p5.swatchList
	local InteractiveFunction = p5.interactive
	local ProposeFunction = p5.propose
	
	local function landAfterRemoval(Object, p6: number)
		-- upvalues: Gui (copy), p1 (copy)
		if not Gui then return end
		local List = {}
		
		for _, Gui1 in Object:GetChildren() do
			if Gui1:IsA("GuiObject") then
				table.insert(List, Gui1)
			end
		end
		table.sort(List, function(A, B): boolean
			return A.LayoutOrder < B.LayoutOrder
		end)
		local Entry = List[math.min(p6, #List)]
		
		if Entry then
			p1.selection.set(Entry)
		end
	end
	
	local function gridView(p7, Callback, Removing, p8)
		-- upvalues: Compose (copy), Columns (copy), p5 (copy), GAP (upval), p1 (copy), Spec (copy), landAfterRemoval (copy), ReadSourceFunction (copy), Held (copy), Editing (copy), SwatchList (copy), Color (copy), p2 (copy), TypesUDim2 (copy), TypesEnum (copy), InteractiveFunction (copy), Host (copy), TypesVector2 (copy), ProposeFunction (copy), Canon (copy), p4 (copy), p3 (copy), TypesUDim (copy), Selected (copy)
		local FormulaResult = Compose.formula(function(p9): boolean
			-- upvalues: p8 (copy), Callback (copy)
			if p8 == "swatches" then
				for _, value in Callback(p9) do
					if value.label ~= nil then
						return true
					end
				end
			end
			return false
		end)
		
		local function _(Callback): number
			-- upvalues: FormulaResult (copy), Columns (upval)
			return if Callback(FormulaResult) then math.min(2, Callback(Columns)) else 1
		end
		
		local _ = function(Callback)
			-- upvalues: FormulaResult (copy), Columns (upval), p5 (upval), GAP (upval)
			local Smallest: number = if Callback(FormulaResult) then math.min(2, Callback(Columns)) else 1
			
			return Smallest * p5.cellSize(Callback) + (Smallest - 1) * GAP
		end
		
		local _ = function(p10): number
			-- upvalues: p1 (upval)
			return (math.ceil(p1.metric("typography.caption.size", p10) * 2.4))
		end
		
		local t = {}
		local Object = nil
		
		local function removeAt(PeekResult, PeekResult1)
			-- upvalues: p5 (upval), Spec (upval), Object (ref), landAfterRemoval (upval)
			if not p5.mayEdit() then return end
			local OnRemoveSwatchFunction: (any) -> () = Spec.onRemoveSwatch
			
			if OnRemoveSwatchFunction == nil then return end
			OnRemoveSwatchFunction({
				color = PeekResult.color,
				label = PeekResult.label,
				key = PeekResult.key
			})
			
			if Object:FindFirstChild(PeekResult.key) == nil then
				landAfterRemoval(Object, PeekResult1)
			end
		end
		
		local function saveCell(Index)
			-- upvalues: ReadSourceFunction (upval), Held (upval), Editing (upval), SwatchList (upval), Color (upval), p2 (upval), p5 (upval), TypesUDim2 (upval), FormulaResult (copy), Columns (upval), GAP (upval), p1 (upval), TypesEnum (upval), InteractiveFunction (upval), Spec (upval), Host (upval), TypesVector2 (upval)
			local function fresh(p10): boolean
				-- upvalues: ReadSourceFunction (upval), Held (upval), Editing (upval), SwatchList (upval), Color (upval)
				local Source = ReadSourceFunction(Held, p10)
				
				if Source == nil or ReadSourceFunction(Editing, p10) then
					return false
				end
				for _, value in ReadSourceFunction(SwatchList, p10) do
					if Color.same(value.color, Source) or value.key == Color.hex(Source) then
						return false
					end
				end
				return true
			end
			
			return p1.styled(p2.Button("Save")({
				name = "Save colour",
				appearance = "utility",
				Size = function(Callback)
					-- upvalues: p5 (upval), TypesUDim2 (upval), FormulaResult (upval), Columns (upval), GAP (upval), p1 (upval)
					local Smallest: number = if Callback(FormulaResult) then math.min(2, Callback(Columns)) else 1
					
					return TypesUDim2.fromOffset(Smallest * p5.cellSize(Callback) + (Smallest - 1) * GAP, p5.cellSize(Callback) + (if Callback(FormulaResult) then GAP + math.ceil(p1.metric("typography.caption.size", Callback) * 2.4) else 0))
				end,
				AutomaticSize = TypesEnum.AutomaticSize.None,
				LayoutOrder = function(Callback)
					-- upvalues: Index (copy)
					return Callback(Index)
				end,
				enabled = function(p11)
					-- upvalues: InteractiveFunction (upval), fresh (copy)
					return InteractiveFunction(p11) and fresh(p11)
				end,
				onActivate = function()
					-- upvalues: Held (upval), Spec (upval), fresh (copy)
					local PeekResult = Held:peek()
					local OnSaveSwatchFunction: (any) -> () = Spec.onSaveSwatch
					
					if PeekResult ~= nil and OnSaveSwatchFunction ~= nil and fresh() then
						OnSaveSwatchFunction(PeekResult)
					end
				end,
				p1.styled(Host.Frame("Plus")({
					Size = TypesUDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					p1.corner(),
					Host.UIStroke({
						Thickness = 1,
						ApplyStrokeMode = TypesEnum.ApplyStrokeMode.Border
					}),
					p1.icon("increment", {
						Name = "Mark",
						AnchorPoint = TypesVector2.new(0.5, 0.5),
						Position = TypesUDim2.fromScale(0.5, 0.5)
					})
				}), "color-swatch")
			}), "color-cell")
		end
		
		Object = Host.Frame(p7)({
			BackgroundTransparency = 1,
			Size = function(Callback1)
				-- upvalues: Columns (upval), FormulaResult (copy), Callback (copy), TypesUDim2 (upval), p5 (upval), GAP (upval)
				local Largest = math.max(1, (math.min(math.floor(Callback1(Columns) / (if Callback1(FormulaResult) then math.min(2, Callback1(Columns)) else 1)), #Callback(Callback1))))
				local Smallest: number = if Callback1(FormulaResult) then math.min(2, Callback1(Columns)) else 1
				
				return TypesUDim2.fromOffset(Largest * (Smallest * p5.cellSize(Callback1) + (Smallest - 1) * GAP) + (Largest - 1) * GAP, 0)
			end,
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			Host.UIListLayout({
				Wraps = true,
				FillDirection = TypesEnum.FillDirection.Horizontal,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = TypesUDim.new(0, GAP)
			}),
			Compose.keyed({
				from = Callback,
				key = function(p10)
					return p10.key
				end,
				render = function(Item, Index, p10)
					-- upvalues: saveCell (copy), p5 (upval), p8 (copy), Held (upval), Color (upval), p2 (upval), Removing (copy), Editing (upval), p1 (upval), TypesUDim2 (upval), FormulaResult (copy), Columns (upval), GAP (upval), TypesEnum (upval), InteractiveFunction (upval), removeAt (copy), ProposeFunction (upval), Canon (upval), p4 (upval), Compose (upval), TypesVector2 (upval), p3 (upval), t (copy)
					if p10 == "\0save" then
						return saveCell(Index)
					end
					local v1 = p2.Button(p10)({
						name = function(Callback)
							-- upvalues: Item (copy), Color (upval), Removing (upval), Editing (upval), p1 (upval)
							local CallbackResult = Callback(Item)
							local Label = CallbackResult.label or Color.hex(CallbackResult.color)
							
							return if Removing and Callback(Editing) then p1.phrase("Facet.RemoveItem", "Remove {item}", { item = Label }, Callback) else Label
						end,
						appearance = "utility",
						Size = function(Callback)
							-- upvalues: p5 (upval), TypesUDim2 (upval), FormulaResult (upval), Columns (upval), GAP (upval), p1 (upval)
							local Smallest: number = if Callback(FormulaResult) then math.min(2, Callback(Columns)) else 1
							
							return TypesUDim2.fromOffset(Smallest * p5.cellSize(Callback) + (Smallest - 1) * GAP, p5.cellSize(Callback) + (if Callback(FormulaResult) then GAP + math.ceil(p1.metric("typography.caption.size", Callback) * 2.4) else 0))
						end,
						AutomaticSize = TypesEnum.AutomaticSize.None,
						LayoutOrder = function(Callback)
							-- upvalues: Index (copy)
							return Callback(Index)
						end,
						selected = function(Callback)
							-- upvalues: p5 (upval), p8 (upval), Held (upval), Color (upval), Item (copy)
							if Callback(p5.modeCell) == p8 then
								local CallbackResult = Callback(Held)
								
								return CallbackResult ~= nil and Color.same(CallbackResult, Callback(Item).color)
							else
								return false
							end
						end,
						enabled = function(p11)
							-- upvalues: InteractiveFunction (upval)
							return InteractiveFunction(p11)
						end,
						onActivate = function()
							-- upvalues: Item (copy), Removing (upval), Editing (upval), removeAt (upval), Index (copy), ProposeFunction (upval), Color (upval), Canon (upval), p5 (upval)
							local PeekResult = Item:peek()
							
							if Removing and Editing:peek() then
								removeAt(PeekResult, Index:peek())
								
								return
							end
							if ProposeFunction(Color.hsvOf(PeekResult.color, Canon:peek()), PeekResult.color) then
								p5.commit()
							end
						end,
						p4.solid("Swatch", function(Callback)
							-- upvalues: FormulaResult (upval), TypesUDim2 (upval), p5 (upval)
							return if Callback(FormulaResult) then TypesUDim2.new(1, 0, 0, p5.cellSize(Callback)) else TypesUDim2.fromScale(1, 1)
						end, function(Callback)
							-- upvalues: Item (copy)
							return Callback(Item).color
						end),
						Compose.show(FormulaResult, function()
							-- upvalues: p1 (upval), Item (copy), Color (upval), TypesUDim2 (upval), p5 (upval), GAP (upval), TypesEnum (upval)
							return p1.text({
								Name = "Label",
								TextWrapped = true,
								Text = function(Callback)
									-- upvalues: Item (upval), Color (upval)
									local CallbackResult = Callback(Item)
									
									return CallbackResult.label or Color.hex(CallbackResult.color)
								end,
								Position = function(p11)
									-- upvalues: TypesUDim2 (upval), p5 (upval), GAP (upval)
									return TypesUDim2.fromOffset(0, p5.cellSize(p11) + GAP)
								end,
								Size = function(p11)
									-- upvalues: TypesUDim2 (upval), p1 (upval)
									return TypesUDim2.new(1, 0, 0, (math.ceil(p1.metric("typography.caption.size", p11) * 2.4)))
								end,
								TextTruncate = TypesEnum.TextTruncate.AtEnd
							}, nil, "caption")
						end),
						Compose.show(function(Callback): boolean
							-- upvalues: p5 (upval), p8 (upval), Held (upval), Color (upval), Item (copy), Removing (upval), Editing (upval)
							local SameResult = nil
							if Callback(p5.modeCell) == p8 then
								local CallbackResult = Callback(Held)
								SameResult = CallbackResult ~= nil and Color.same(CallbackResult, Callback(Item).color)
							else
								SameResult = false
							end
							return SameResult and not (Removing and Callback(Editing))
						end, function()
							-- upvalues: p1 (upval), TypesVector2 (upval), FormulaResult (upval), TypesUDim2 (upval), p5 (upval)
							return p1.icon("checkmark", {
								Name = "Check",
								AnchorPoint = TypesVector2.new(0.5, 0.5),
								Position = function(Callback)
									-- upvalues: FormulaResult (upval), TypesUDim2 (upval), p5 (upval)
									return if Callback(FormulaResult) then TypesUDim2.new(0.5, 0, 0, p5.cellSize(Callback) / 2) else TypesUDim2.fromScale(0.5, 0.5)
								end
							})
						end)
					})
					
					if Removing then
						p3.attach(v1, {
							p1.icon("close", {
								Name = "Remove",
								AnchorPoint = TypesVector2.new(0.5, 0.5),
								Position = TypesUDim2.fromScale(0.5, 0.5),
								Visible = Editing
							})
						})
					end
					p1.styled(v1, "color-cell")
					t[v1] = { item = Item, index = Index }
					Compose.cleanup(function()
						-- upvalues: t (upval), v1 (copy)
						t[v1] = nil
					end)
					
					return v1
				end
			})
		})
		
		if Removing then
			local _ = function(p10)
				-- upvalues: p1 (upval), Selected (upval), t (copy)
				local Source = p1.readSource(Selected, p10)
				
				return if Source then t[Source] else nil
			end
			
			p1.action(Object, "ColorSwatchRemove", {
				TypesEnum.KeyCode.Delete,
				TypesEnum.KeyCode.Backspace,
				TypesEnum.KeyCode.ButtonX
			}, function(Callback)
				-- upvalues: Editing (upval), InteractiveFunction (upval), p1 (upval), Selected (upval), t (copy)
				local CallbackResult = Callback(Editing)
				
				if CallbackResult then
					CallbackResult = InteractiveFunction(Callback)
					
					if CallbackResult then
						local Source = p1.readSource(Selected, Callback)
						CallbackResult = (if Source then t[Source] else nil) ~= nil
					end
				end
				return CallbackResult
			end, function()
				-- upvalues: p1 (upval), Selected (upval), t (copy), Editing (upval), removeAt (copy)
				local Source = p1.readSource(Selected, nil)
				local Entry = if Source then t[Source] else nil
				
				if Entry and Editing:peek() then
					removeAt(Entry.item:peek(), Entry.index:peek())
				end
			end, { priority = 2300 })
		end
		return Object
	end
	
	local function _(Object)
		-- upvalues: TypesEnum (copy)
		assert(Object:FindFirstChildWhichIsA("UIListLayout")).HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
		
		return Object
	end
	
	return {
		swatchesView = function()
			-- upvalues: SwatchList (copy), p5 (copy), p4 (copy), Removing (copy), p2 (copy), Editing (copy), InteractiveFunction (copy), gridView (copy), p1 (copy), TypesUDim2 (copy), TypesEnum (copy)
			local function From(Callback)
				-- upvalues: SwatchList (upval), p5 (upval), p4 (upval)
				local Copy = table.clone(Callback(SwatchList))
				
				if p5.saving then
					table.insert(Copy, { key = "\0save", color = p4.WHITE })
				end
				return Copy
			end
			
			local List = {}
			
			if Removing then
				table.insert(List, p2.Button("Edit")({
					appearance = "link",
					label = function(Callback): string
						-- upvalues: Editing (upval)
						return if Callback(Editing) then "Done" else "Edit"
					end,
					enabled = function(p10)
						-- upvalues: InteractiveFunction (upval)
						return InteractiveFunction(p10)
					end,
					onActivate = function()
						-- upvalues: Editing (upval)
						Editing:set(not Editing:peek())
					end
				}))
			end
			table.insert(List, (gridView("Swatches", From, Removing, "swatches")))
			local ColumnResult = p1.column(List, {
				Name = "Saved",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
			
			return ColumnResult
		end,
		brickView = function()
			-- upvalues: Color (copy), p1 (copy), p5 (copy), Held (copy), TypesEnum (copy), SPACE (upval), gridView (copy), TypesUDim2 (copy)
			local BrickResult = Color.brick()
			local ColumnResult = p1.column({
				p1.styled(p1.row({
					p1.text({
						Name = "BrickName",
						Text = function(Callback)
							-- upvalues: p5 (upval), Held (upval)
							return p5.brickName(Callback(Held)) or "No engine colour matches"
						end,
						AutomaticSize = TypesEnum.AutomaticSize.XY
					})
				}, { Name = "NameField", p1.padding(SPACE, 6) }), "field"),
				(gridView("BrickGrid", function()
					-- upvalues: BrickResult (copy)
					return BrickResult
				end, false, "brick"))
			}, {
				Name = "Brick",
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			})
			assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).HorizontalAlignment = TypesEnum.HorizontalAlignment.Center
			
			return ColumnResult
		end
	}
end