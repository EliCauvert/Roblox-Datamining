local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./input_props")
local ColorPickerKitModule = require("./color_picker_kit")
local _ = require("./color_picker_state")
local _ = require("./color_picker_panel")
local CELL = ColorPickerKitModule.CELL
local GAP = ColorPickerKitModule.GAP
local PAD = ColorPickerKitModule.PAD
local MARGIN = ColorPickerKitModule.MARGIN
local MAXCOLUMNS = ColorPickerKitModule.MAX_COLUMNS

return function(p1, p2, p3, p4, p5, Callback, Native)
	-- upvalues: MAXCOLUMNS (copy), GAP (copy), PAD (copy), CELL (copy), MARGIN (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Chrome = p4.chrome
	local Spec = p5.spec
	local Labelled = p5.labelled
	local Placement = p5.placement
	local Columns = p5.columns
	local EnabledFunction = p5.enabled
	local TouchFunction = p5.touch
	local PresentedFunction = p5.presented
	local RequestPresentedFunction = p5.requestPresented
	local CloseFunction = p5.close
	
	local function panelWidth(p6, Vector, p7, p8): number
		-- upvalues: MAXCOLUMNS (upval), p5 (copy), GAP (upval), p3 (copy), PAD (upval), CELL (upval), MARGIN (upval)
		local NewMAXCOLUMNS = MAXCOLUMNS * p5.cellSize(p6) + (MAXCOLUMNS - 1) * GAP + p3.inset(PAD, "left", nil, p6) + p3.inset(PAD, "right", nil, p6)
		
		return if p7 then if p8 then if Vector.X > 0 then math.min(NewMAXCOLUMNS, Vector.X - 2 * PAD) else NewMAXCOLUMNS else Vector.X - 2 * PAD elseif Vector.X > 0 then math.min(NewMAXCOLUMNS, (math.max(CELL, Vector.X - 2 * MARGIN))) else NewMAXCOLUMNS
	end
	
	local function place(Callback, p6, Callback1, AbsoluteSizeResult, AbsolutePositionResult, AbsolutePositionResult1, AbsoluteSizeResult1, p7)
		-- upvalues: TypesVector2 (copy), panelWidth (copy), PAD (upval), GAP (upval), MARGIN (upval), CELL (upval)
		local CallbackResult = Callback(AbsoluteSizeResult)
		local CallbackResultDelta = Callback(AbsolutePositionResult1) - Callback(AbsolutePositionResult)
		local CallbackResult1 = Callback(AbsoluteSizeResult1)
		
		if CallbackResult.X > 0 and CallbackResult.Y > 0 then
			CallbackResultDelta = TypesVector2.new(math.clamp(CallbackResultDelta.X, 0, (math.max(0, CallbackResult.X - CallbackResult1.X))), (math.clamp(CallbackResultDelta.Y, 0, (math.max(0, CallbackResult.Y - CallbackResult1.Y)))))
		end
		local NewChromeResult = p6.chrome(Callback) + p6.tech(Callback)
		local PanelWidthResult = panelWidth(Callback, CallbackResult, Callback1(Callback), p7)
		
		if Callback1(Callback) then
			local Smallest = if CallbackResult.Y > 0 then math.min(NewChromeResult, CallbackResult.Y - 2 * PAD) else NewChromeResult
			
			return if p7 then {
				edge = "center",
				x = math.max(PAD, (CallbackResult.X - PanelWidthResult) / 2),
				y = math.max(PAD, (CallbackResult.Y - Smallest) / 2),
				w = PanelWidthResult,
				h = Smallest
			} else {
				edge = "sheet",
				x = PAD,
				y = math.max(PAD, CallbackResult.Y - Smallest - PAD),
				w = PanelWidthResult,
				h = Smallest
			}
		end
		local YDelta = CallbackResult.Y - (CallbackResultDelta.Y + CallbackResult1.Y + GAP) - MARGIN
		local YDelta1 = CallbackResultDelta.Y - GAP - MARGIN
		local ClampedValue = math.clamp(CallbackResultDelta.X, MARGIN, (math.max(MARGIN, CallbackResult.X - PanelWidthResult - MARGIN)))
		
		if NewChromeResult <= YDelta then
			return {
				edge = "bottom",
				x = ClampedValue,
				y = CallbackResultDelta.Y + CallbackResult1.Y + GAP,
				w = PanelWidthResult,
				h = NewChromeResult
			}
		elseif NewChromeResult <= YDelta1 then
			return {
				edge = "top",
				x = ClampedValue,
				y = CallbackResultDelta.Y - GAP - NewChromeResult,
				w = PanelWidthResult,
				h = NewChromeResult
			}
		else
			local IsXBelow = CallbackResultDelta.X + CallbackResult1.X + GAP + PanelWidthResult <= CallbackResult.X - MARGIN
			local IsXAbove = CallbackResultDelta.X - GAP - PanelWidthResult >= MARGIN
			
			if IsXBelow or IsXAbove then
				local Smallest = math.min(NewChromeResult, (math.max(2 * CELL, CallbackResult.Y - 2 * MARGIN)))
				
				return {
					edge = if IsXBelow then "right" else "left",
					x = if IsXBelow then CallbackResultDelta.X + CallbackResult1.X + GAP else CallbackResultDelta.X - GAP - PanelWidthResult,
					y = math.clamp(CallbackResultDelta.Y, MARGIN, (math.max(MARGIN, CallbackResult.Y - Smallest - MARGIN))),
					w = PanelWidthResult,
					h = Smallest
				}
			elseif YDelta1 <= YDelta then
				return {
					edge = "bottom",
					x = ClampedValue,
					y = CallbackResultDelta.Y + CallbackResult1.Y + GAP,
					w = PanelWidthResult,
					h = math.max(2 * CELL, YDelta)
				}
			else
				local Largest = math.max(2 * CELL, YDelta1)
				
				return {
					edge = "top",
					x = ClampedValue,
					y = CallbackResultDelta.Y - GAP - Largest,
					w = PanelWidthResult,
					h = Largest
				}
			end
		end
	end
	
	local List = {}
	
	if Labelled then
		table.insert(List, p1.text({
			Name = "Title",
			Text = function(p6)
				-- upvalues: Chrome (copy), Spec (copy)
				return Chrome.labelText(Spec, p6)
			end,
			Size = TypesUDim2.new(0, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.XY,
			TextTruncate = TypesEnum.TextTruncate.AtEnd,
			Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		}))
	end
	local v1: number = if Labelled then 24 else 32
	table.insert(List, p4.swatch("Swatch", TypesUDim2.fromOffset(v1, v1), p5.currentPaint))
	
	if Labelled then
		table.insert(List, p1.styled(p1.text({
			Name = "Value",
			Text = function(p6)
				-- upvalues: p5 (copy)
				return p5.valueText(p6)
			end,
			TextTruncate = TypesEnum.TextTruncate.AtEnd,
			AutomaticSize = TypesEnum.AutomaticSize.XY
		}), "secondary"))
		table.insert(List, p1.icon("chevron.down", { Name = "Chevron" }))
	end
	local RowResult = p1.row(List, {
		Name = "Row",
		Size = if Labelled then TypesUDim2.fromScale(1, 1) else TypesUDim2.fromOffset(0, 0),
		AutomaticSize = if Labelled then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.XY,
		p1.padding(if Labelled then 10 else 6, 0)
	})
	local v2 = assert(RowResult:FindFirstChildWhichIsA("UIListLayout"))
	v2.VerticalAlignment = TypesEnum.VerticalAlignment.Center
	v2.HorizontalAlignment = if Labelled then TypesEnum.HorizontalAlignment.Left else TypesEnum.HorizontalAlignment.Center
	local Plate = p2.Button("Well")({
		name = function(p6)
			-- upvalues: p5 (copy)
			return p5.semanticName(p6)
		end,
		appearance = if Labelled then nil else "utility",
		enabled = function(p6)
			-- upvalues: EnabledFunction (copy)
			return EnabledFunction(p6)
		end,
		Size = function(p6)
			-- upvalues: CELL (upval), p1 (copy), Spec (copy), Labelled (copy), TypesUDim2 (copy)
			local Largest = math.max(CELL, (p1.controlSize(Spec.controlSize, "height", p6)))
			
			return if Labelled then TypesUDim2.new(1, 0, 0, Largest) else TypesUDim2.fromOffset(CELL, CELL)
		end,
		AutomaticSize = TypesEnum.AutomaticSize.None,
		onActivate = function()
			-- upvalues: RequestPresentedFunction (copy)
			RequestPresentedFunction(true)
		end,
		RowResult
	})
	
	if Labelled then
		Chrome.paint("ColorPicker", Plate, Spec)
	end
	local ColumnResult = if Spec.hint == nil and Spec.errorText == nil then p1.column({ Plate }, Native) else Chrome.wrap({
		control = "ColorPicker",
		spec = { hint = Spec.hint, errorText = Spec.errorText },
		plate = Plate,
		focus = function()
			-- upvalues: RequestPresentedFunction (copy)
			RequestPresentedFunction(true)
		end,
		enabled = EnabledFunction,
		native = Native
	})
	local AvailableResult = p3.available(Plate)
	local Flag = false
	Compose.watch(function(Callback)
		-- upvalues: AvailableResult (copy), Flag (ref), PresentedFunction (copy), CloseFunction (copy)
		if Callback(AvailableResult) then
			Flag = true
			
			return
		end
		if Flag and PresentedFunction() then
			CloseFunction("anchorLost")
		end
	end)
	p3.attach(ColumnResult, {
		p3.overlay(Plate, PresentedFunction, function()
			-- upvalues: p3 (copy), Plate (copy), p1 (copy), Compose (copy), TypesVector2 (copy), TouchFunction (copy), panelWidth (copy), Callback (copy), place (copy), Placement (copy), Runtime (copy), TypesUDim2 (copy), Columns (copy), CloseFunction (copy)
			local ParentResult = p3.parent(Plate)
			local AbsoluteSizeResult = if ParentResult then p1.observe.AbsoluteSize(ParentResult) else Compose.cell(TypesVector2.zero)
			local AbsolutePositionResult = if ParentResult then p1.observe.AbsolutePosition(ParentResult) else Compose.cell(TypesVector2.zero)
			local AbsolutePositionResult1 = p1.observe.AbsolutePosition(Plate)
			local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Plate)
			local TenFootResult = p1.tenFoot()
			
			local function sheet(Callback)
				-- upvalues: AbsoluteSizeResult (copy), TenFootResult (copy), TouchFunction (upval)
				local CallbackResult = Callback(AbsoluteSizeResult)
				
				return TenFootResult(Callback) or TouchFunction(Callback) and (CallbackResult.X > 0 and CallbackResult.X < 600)
			end
			
			local CellResult = Compose.cell(1e999)
			local CallbackResult = Callback(true, sheet, CellResult, Compose.formula(function(Callback)
				-- upvalues: AbsoluteSizeResult (copy), panelWidth (upval), TenFootResult (copy), TouchFunction (upval)
				local CallbackResult = Callback(AbsoluteSizeResult)
				
				if CallbackResult.X > 0 then
					local CallbackResult1 = Callback(AbsoluteSizeResult)
					
					return (panelWidth(Callback, CallbackResult, TenFootResult(Callback) or TouchFunction(Callback) and (CallbackResult1.X > 0 and CallbackResult1.X < 600), TenFootResult(Callback)))
				else
					return 0
				end
			end):peek())
			local FormulaResult = Compose.formula(function(p6)
				-- upvalues: place (upval), CallbackResult (copy), sheet (copy), AbsoluteSizeResult (copy), AbsolutePositionResult (copy), AbsolutePositionResult1 (copy), AbsoluteSizeResult1 (copy), TenFootResult (copy)
				return (place(p6, CallbackResult, sheet, AbsoluteSizeResult, AbsolutePositionResult, AbsolutePositionResult1, AbsoluteSizeResult1, TenFootResult(p6)))
			end)
			Compose.watch(function(Callback)
				-- upvalues: FormulaResult (copy), CellResult (copy), CallbackResult (copy), Placement (upval)
				local CallbackResult1 = Callback(FormulaResult)
				CellResult:set(CallbackResult1.h - CallbackResult.chrome(Callback))
				Placement:set(CallbackResult1.edge)
			end)
			Compose.cleanup(function()
				-- upvalues: Placement (upval)
				Placement:set("closed")
			end)
			Runtime.decorate(CallbackResult.panel, {
				Size = function(Callback)
					-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(FormulaResult)
					
					return TypesUDim2.fromOffset(CallbackResult.w, CallbackResult.h)
				end,
				Position = function(Callback)
					-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
					local CallbackResult = Callback(FormulaResult)
					
					return TypesUDim2.fromOffset(CallbackResult.x, CallbackResult.y)
				end,
				Attributes = {
					placement = function(Callback)
						-- upvalues: FormulaResult (copy)
						return Callback(FormulaResult).edge
					end
				}
			})
			local Frame = assert(CallbackResult.panel:FindFirstChild("Technique", true))
			assert(Frame:IsA("GuiObject"))
			local IsHAbove = false
			local SettledResult = p1.runtime.settled({
				sample = function(): string
					-- upvalues: FormulaResult (copy), Frame (copy), CallbackResult (copy), IsHAbove (ref), Columns (upval)
					local PeekResult = FormulaResult:peek()
					local AbsoluteSize = Frame.AbsoluteSize
					local Modes = CallbackResult.panel:FindFirstChild("Modes", true)
					local UIListLayout = if Modes then Modes:FindFirstChildWhichIsA("UIListLayout", true) else nil
					local IsYBelow = true
					local v3 = ""
					
					if Modes and Modes:IsA("GuiObject") and UIListLayout then
						local Parent = UIListLayout.Parent
						local Y = if Parent and Parent:IsA("GuiObject") then Parent.AbsoluteSize.Y else 0
						IsYBelow = UIListLayout.AbsoluteContentSize.Y <= Y + 1
						v3 = `{UIListLayout.AbsoluteContentSize.Y}:{Y}`
					end
					IsHAbove = IsYBelow and (AbsoluteSize.X > 0 and (AbsoluteSize.Y > 0 and PeekResult.w > 0) and PeekResult.h > 0)
					
					return `{PeekResult.x}:{PeekResult.y}:{PeekResult.w}:{PeekResult.h}:{Columns:peek()}:{AbsoluteSize}:{v3}:{CallbackResult.panel.AbsolutePosition}:{CallbackResult.panel.AbsoluteSize}`
				end,
				equals = function(p6, p7): boolean
					-- upvalues: IsHAbove (ref)
					return IsHAbove and p6 == p7
				end,
				timeout = p1.metric("motion.restLimit")
			})
			p1.fadeTo(CallbackResult.panel, function(Callback): number
				-- upvalues: SettledResult (copy)
				return if Callback(SettledResult) then 0 else 1
			end)
			p1.styled(CallbackResult.panel, "panel")
			p3.skin(CallbackResult.panel)
			
			return p3.modal(function()
				-- upvalues: CallbackResult (copy)
				return CallbackResult.panel
			end, function()
				-- upvalues: CloseFunction (upval)
				CloseFunction("cancel")
			end, {
				Name = "ColorPickerModal",
				backgroundTransparency = function(Callback): number
					-- upvalues: AbsoluteSizeResult (copy), TenFootResult (copy), TouchFunction (upval)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local TenFootResultResult = TenFootResult(Callback) or TouchFunction(Callback) and (CallbackResult.X > 0 and CallbackResult.X < 600)
					
					return if TenFootResultResult then 0.5 else 1
				end,
				onOutside = function()
					-- upvalues: CloseFunction (upval)
					CloseFunction("outside")
				end
			})
		end)
	})
	
	return ColumnResult
end