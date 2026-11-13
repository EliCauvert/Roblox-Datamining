local PointerDragModule = require("./pointer_drag")
local _ = require("./control_types")
local ActivationModule = require("./activation")
local ScrollLockModule = require("./scroll_lock")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./collection_types")
local _ = require("./input_props")
local _ = require("./collection_table_metrics")
local _ = require("./collection_table_columns")

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: PointerDragModule (copy), ScrollLockModule (copy), ActivationModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction1 = p1.read
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local Input = p7.input
	local PreferredInput = p7.preferredInput
	local PointerDragModuleResult = PointerDragModule(p1)
	
	local function _(p9)
		-- upvalues: p3 (copy), p5 (copy)
		if p3.onWidthsChange then
			p3.onWidthsChange(p9)
			
			return
		else
			p5:set(p9)
		end
	end
	
	return (Compose.keyed({
		from = function(p9)
			-- upvalues: ReadFunction (copy), p3 (copy)
			return ReadFunction(p3.columns, p9)
		end,
		key = function(p9)
			return p9.id
		end,
		render = function(p9, p10)
			-- upvalues: TypesUDim2 (copy), TypesEnum (copy), ReadSourceFunction (copy), p4 (copy), ReadFunction1 (copy), p3 (copy), p2 (copy), p1 (copy), Compose (copy), p8 (copy), Input (copy), Runtime (copy), TypesVector2 (copy), PreferredInput (copy), Host (copy), PointerDragModuleResult (copy), ScrollLockModule (upval), p5 (copy), ReadFunction (copy), p7 (copy), p6 (copy), ActivationModule (upval)
			local PeekResult = p9:peek()
			local TableHeading = p1.styled(p2.Button({
				Name = "Sort",
				Size = TypesUDim2.fromScale(1, 1),
				AutomaticSize = TypesEnum.AutomaticSize.None,
				TextXAlignment = function(Callback)
					-- upvalues: p9 (copy), TypesEnum (upval)
					local Align = Callback(p9).align or "start"
					
					return if Align == "end" then TypesEnum.TextXAlignment.Right elseif Align == "center" then TypesEnum.TextXAlignment.Center else TypesEnum.TextXAlignment.Left
				end,
				label = function(Callback): string
					-- upvalues: p9 (copy), ReadSourceFunction (upval), p4 (upval), ReadFunction1 (upval)
					local CallbackResult = Callback(p9)
					local Source = ReadSourceFunction(p4, Callback)
					
					return tostring(ReadFunction1(CallbackResult.label or CallbackResult.id, Callback)) .. (if Source and Source.column == CallbackResult.id then if Source.direction == "descending" then " ↓" else " ↑" else "")
				end,
				enabled = function(Callback): boolean
					-- upvalues: p9 (copy)
					return Callback(p9).sortable ~= false
				end,
				onActivate = function()
					-- upvalues: PeekResult (copy), ReadSourceFunction (upval), p4 (upval), p3 (upval)
					if PeekResult.sortable == false then return end
					local Source = ReadSourceFunction(p4)
					local IsAscending: boolean = Source and (Source.column == PeekResult.id and Source.direction == "ascending")
					local config = {
						column = PeekResult.id,
						direction = if IsAscending then "descending" else "ascending"
					}
					
					if p3.onSortChange then
						p3.onSortChange(config)
						
						return
					else
						p4:set(config)
					end
				end
			}), "TableHeading")
			local Frame = nil
			local LayoutUnitResult = nil
			local Resize = nil
			local FormulaResult = Compose.formula(function(Callback)
				-- upvalues: p9 (copy), p8 (upval)
				local CallbackResult = Callback(p9)
				
				return if CallbackResult.width == nil then p8.minimumOf(CallbackResult) else CallbackResult.minWidth or 48
			end)
			
			if PeekResult.resizable ~= false then
				local X = 0
				local XRatio = 0
				local HoldOwnedAncestorsResult: (() -> ())? = nil
				
				local function finishResize()
					-- upvalues: HoldOwnedAncestorsResult (ref)
					if HoldOwnedAncestorsResult then
						HoldOwnedAncestorsResult()
						HoldOwnedAncestorsResult = nil
					end
				end
				
				Compose.cleanup(finishResize)
				
				if Input then
					Runtime.connect(Input, "WindowFocusReleased", finishResize)
				end
				Resize = Host.TextButton({
					Name = "Resize",
					Text = "",
					Attributes = {
						AccessibleLabel = function(Callback): string
							-- upvalues: p9 (copy), ReadFunction1 (upval)
							local CallbackResult = Callback(p9)
							
							return "Resize " .. tostring(ReadFunction1(CallbackResult.label or CallbackResult.id, Callback))
						end
					},
					Selectable = false,
					AnchorPoint = TypesVector2.new(0.5, 0),
					Position = TypesUDim2.fromScale(1, 0),
					Size = function(Callback)
						-- upvalues: TypesUDim2 (upval), PreferredInput (upval), TypesEnum (upval)
						return TypesUDim2.new(0, if PreferredInput and Callback(PreferredInput) == TypesEnum.PreferredInput.Touch then 44 else 12, 1, 0)
					end,
					BackgroundTransparency = 1,
					ZIndex = 3,
					Host.UIDragDetector({
						Enabled = function(p11)
							-- upvalues: PointerDragModuleResult (upval)
							return PointerDragModuleResult(p11)
						end,
						DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslateLine,
						DragAxis = TypesVector2.new(1, 0),
						ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
						DragStart = function(p11)
							-- upvalues: X (ref), XRatio (ref), Frame (ref), LayoutUnitResult (ref), HoldOwnedAncestorsResult (ref), ScrollLockModule (upval)
							X = p11.X
							XRatio = Frame.AbsoluteSize.X / LayoutUnitResult:peek()
							
							if HoldOwnedAncestorsResult then
								HoldOwnedAncestorsResult()
								HoldOwnedAncestorsResult = nil
							end
							HoldOwnedAncestorsResult = ScrollLockModule.holdOwnedAncestors(Frame)
						end,
						DragContinue = function(p11)
							-- upvalues: p9 (copy), ReadSourceFunction (upval), p5 (upval), XRatio (ref), X (ref), LayoutUnitResult (ref), FormulaResult (copy), p3 (upval)
							local PeekResult = p9:peek()
							local Copy = table.clone(ReadSourceFunction(p5))
							Copy[PeekResult.id] = math.clamp(XRatio + (p11.X - X) / LayoutUnitResult:peek(), FormulaResult:peek(), PeekResult.maxWidth or 1000000)
							
							if p3.onWidthsChange then
								p3.onWidthsChange(Copy)
								
								return
							else
								p5:set(Copy)
							end
						end,
						DragEnd = finishResize
					})
				})
			end
			Frame = p1.styled(p8.columnFrame(p9, p10, TableHeading, Resize), "TableHeader")
			Runtime.decorate(Frame, {
				ZIndex = function(Callback): number
					-- upvalues: ReadFunction (upval), p3 (upval), p10 (copy)
					return #ReadFunction(p3.columns, Callback) - Callback(p10) + 1
				end
			})
			LayoutUnitResult = p1.layoutUnit(Frame)
			Compose.cleanup((Runtime.mount(function()
				-- upvalues: p1 (upval), Host (upval), TypesVector2 (upval), TypesUDim2 (upval), p10 (copy)
				return p1.styled(Host.Frame({
					Name = "ColumnDivider",
					ZIndex = 2,
					AnchorPoint = TypesVector2.new(0, 0.5),
					Position = TypesUDim2.fromScale(0, 0.5),
					Size = function(p11)
						-- upvalues: TypesUDim2 (upval), p1 (upval)
						return TypesUDim2.new(0, p1.metric("strokes.hairline", p11), 0.6, 0)
					end,
					Visible = function(Callback): boolean
						-- upvalues: p10 (upval)
						return Callback(p10) > 1
					end
				}), "divider")
			end, Frame)))
			p7.recordHeight(p6, PeekResult.id, TableHeading, 16)
			
			if Resize then
				local CellResult = Compose.cell(false)
				Runtime.connect(Resize, "SelectionGained", function()
					-- upvalues: CellResult (copy)
					CellResult:set(true)
				end)
				Runtime.connect(Resize, "SelectionLost", function()
					-- upvalues: CellResult (copy)
					CellResult:set(false)
				end)
				
				local function adjust(p11)
					-- upvalues: p9 (copy), ReadSourceFunction (upval), p5 (upval), Frame (ref), LayoutUnitResult (ref), FormulaResult (copy), p3 (upval)
					local PeekResult = p9:peek()
					local Copy = table.clone(ReadSourceFunction(p5))
					Copy[PeekResult.id] = math.clamp((Copy[PeekResult.id] or Frame.AbsoluteSize.X / LayoutUnitResult:peek()) + p11, FormulaResult:peek(), PeekResult.maxWidth or 1000000)
					
					if p3.onWidthsChange then
						p3.onWidthsChange(Copy)
						
						return
					else
						p5:set(Copy)
					end
				end
				
				p1.action(Resize, "NarrowColumn", { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft }, CellResult, function()
					-- upvalues: adjust (copy)
					adjust(-8)
				end, { priority = 300, capture = true })
				p1.action(Resize, "WidenColumn", { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }, CellResult, function()
					-- upvalues: adjust (copy)
					adjust(8)
				end, { priority = 300, capture = true })
				local CellResult1 = Compose.cell(false)
				Runtime.connect(TableHeading, "SelectionGained", function()
					-- upvalues: CellResult1 (copy)
					CellResult1:set(true)
				end)
				Runtime.connect(TableHeading, "SelectionLost", function()
					-- upvalues: CellResult1 (copy)
					CellResult1:set(false)
				end)
				
				local function engaged(Callback)
					-- upvalues: CellResult (copy), CellResult1 (copy)
					return Callback(CellResult) or Callback(CellResult1)
				end
				
				p1.action(Resize, "NarrowColumnKey", { TypesEnum.KeyCode.Comma, TypesEnum.KeyCode.ButtonL1 }, engaged, function()
					-- upvalues: adjust (copy)
					adjust(-8)
				end, { priority = 300 })
				p1.action(Resize, "WidenColumnKey", { TypesEnum.KeyCode.Period, TypesEnum.KeyCode.ButtonR1 }, engaged, function()
					-- upvalues: adjust (copy)
					adjust(8)
				end, { priority = 300 })
				p1.action(Resize, "SortColumn", {
					TypesEnum.KeyCode.Up,
					TypesEnum.KeyCode.Down,
					TypesEnum.KeyCode.DPadUp,
					TypesEnum.KeyCode.DPadDown
				}, CellResult, function()
					-- upvalues: ActivationModule (upval), TableHeading (copy)
					ActivationModule.trigger(TableHeading)
				end, { priority = 300, capture = true })
				p1.action(Resize, "ReleaseColumn", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, CellResult, function()
					-- upvalues: p1 (upval), TableHeading (copy)
					if p1.config.guiService then
						p1.selection.set(TableHeading)
					end
				end, { priority = 300 })
			end
			return Frame
		end
	}))
end