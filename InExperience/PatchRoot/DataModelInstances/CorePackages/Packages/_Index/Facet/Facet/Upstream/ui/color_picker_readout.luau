local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./input_props")
local _ = require("./navigation_props")
local _ = require("./navigation_types")
local ColorPickerKitModule = require("./color_picker_kit")
local _ = require("./color_picker_state")
local Options = {
	{ value = "rgb", label = "RGB" },
	{ value = "hsv", label = "HSV" },
	{ value = "hex", label = "Hex" }
}
local CELL = ColorPickerKitModule.CELL
local GAP = ColorPickerKitModule.GAP

return function(p1, p2, p3, p4)
	-- upvalues: Options (copy), CELL (copy), GAP (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local Color = p3.color
	local HasAlpha = p4.hasAlpha
	local Held = p4.held
	local AlphaHeld = p4.alphaHeld
	local Canon = p4.canon
	local FormatCell = p4.formatCell
	local HexError = p4.hexError
	local InteractiveFunction = p4.interactive
	local ProposeFunction = p4.propose
	local CommitFunction = p4.commit
	
	local function numberField(FieldName, Label, Max, Callback, Callback1)
		-- upvalues: Compose (copy), Held (copy), Canon (copy), InteractiveFunction (copy), TypesUDim2 (copy), ProposeFunction (copy), CommitFunction (copy), p2 (copy)
		local CellResult = Compose.cell("")
		local CellResult1 = Compose.cell(0)
		
		local function resync()
			-- upvalues: Held (upval), Callback (copy), Canon (upval), CellResult1 (copy), CellResult (copy)
			local PeekResult = Held:peek()
			local CallbackResult = if PeekResult == nil then nil else Callback(PeekResult, Canon:peek())
			CellResult1:set(CallbackResult or 0)
			CellResult:set(if CallbackResult == nil then "" else tostring(CallbackResult))
		end
		
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: Held (upval), Canon (upval), resync (copy)
			Callback(Held)
			Callback(Canon)
			resync()
		end)
		
		return p2.NumberInput({
			min = 0,
			precision = 0,
			Name = FieldName,
			label = Label,
			value = CellResult,
			numericValue = CellResult1,
			max = Max,
			enabled = function(p5)
				-- upvalues: InteractiveFunction (upval)
				return InteractiveFunction(p5)
			end,
			Size = TypesUDim2.fromScale(0, 0),
			onCommit = function(p5)
				-- upvalues: Callback1 (copy), ProposeFunction (upval), CommitFunction (upval), resync (copy)
				local CallbackResult = Callback1(p5)
				
				if CallbackResult ~= nil and ProposeFunction(CallbackResult) then
					CommitFunction()
				end
				resync()
			end
		})
	end
	
	local function fieldsRow(p5)
		-- upvalues: p1 (copy), TypesUDim2 (copy), TypesEnum (copy)
		local RowResult = p1.row(p5, {
			Name = "Fields",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).HorizontalFlex = TypesEnum.UIFlexAlignment.Fill
		
		return RowResult
	end
	
	local function rgbFields()
		-- upvalues: numberField (copy), Color (copy), Held (copy), Canon (copy), fieldsRow (copy)
		local function channel(p5, Label)
			-- upvalues: numberField (upval), Color (upval), Held (upval), Canon (upval)
			return numberField(`Field{Label}`, Label, 255, function(p6)
				-- upvalues: p5 (copy), Color (upval)
				return (select(p5, Color.channels(p6)))
			end, function(p6)
				-- upvalues: Color (upval), Held (upval), Canon (upval), p5 (copy)
				local ChannelsResult, ChannelsResult2, ChannelsResult3 = Color.channels(Held:peek() or Color.toColor(Canon:peek()))
				local config = {
					ChannelsResult,
					ChannelsResult2,
					ChannelsResult3,
					[p5] = p6
				}
				
				return Color.hsvOf(Color.fromBytes(config[1], config[2], config[3]), Canon:peek())
			end)
		end
		
		local v1 = 1
		local v2 = 1
		local FieldR = numberField("FieldR", "R", 255, function(p5)
			-- upvalues: v1 (copy), Color (upval)
			return (select(v1, Color.channels(p5)))
		end, function(p5)
			-- upvalues: Color (upval), Held (upval), Canon (upval), v2 (copy)
			local ChannelsResult, ChannelsResult2, ChannelsResult3 = Color.channels(Held:peek() or Color.toColor(Canon:peek()))
			local config = {
				ChannelsResult,
				ChannelsResult2,
				ChannelsResult3,
				[v2] = p5
			}
			
			return Color.hsvOf(Color.fromBytes(config[1], config[2], config[3]), Canon:peek())
		end)
		local v3 = 2
		local v4 = 2
		
		return (fieldsRow({
			FieldR,
			numberField("FieldG", "G", 255, function(p5)
				-- upvalues: v3 (copy), Color (upval)
				return (select(v3, Color.channels(p5)))
			end, function(p5)
				-- upvalues: Color (upval), Held (upval), Canon (upval), v4 (copy)
				local ChannelsResult, ChannelsResult2, ChannelsResult3 = Color.channels(Held:peek() or Color.toColor(Canon:peek()))
				local config = {
					ChannelsResult,
					ChannelsResult2,
					ChannelsResult3,
					[v4] = p5
				}
				
				return Color.hsvOf(Color.fromBytes(config[1], config[2], config[3]), Canon:peek())
			end),
			channel(3, "B")
		}))
	end
	
	local function hsvFields()
		-- upvalues: numberField (copy), Canon (copy), fieldsRow (copy)
		local function channel(p5, Label, Max)
			-- upvalues: numberField (upval), Canon (upval)
			return numberField(`Field{Label}`, Label, Max, function(_, p6): number
				-- upvalues: p5 (copy), Max (copy)
				return (math.floor((if p5 == "h" then p6.h elseif p5 == "s" then p6.s else p6.v) * Max + 0.5))
			end, function(p6)
				-- upvalues: Canon (upval), p5 (copy), Max (copy)
				local Copy = table.clone(Canon:peek())
				
				if p5 == "h" then
					Copy.h = p6 / Max
					
					return Copy
				elseif p5 == "s" then
					Copy.s = p6 / Max
					
					return Copy
				else
					Copy.v = p6 / Max
					
					return Copy
				end
			end)
		end
		
		local v1 = "h"
		local Max = 360
		
		local function v47(_, p5): number
			-- upvalues: v1 (copy), Max (copy)
			return (math.floor((if v1 == "h" then p5.h elseif v1 == "s" then p5.s else p5.v) * Max + 0.5))
		end
		
		local v2 = "h"
		local Max1 = 360
		local FieldH = numberField("FieldH", "H", 360, v47, function(p5)
			-- upvalues: Canon (upval), v2 (copy), Max1 (copy)
			local Copy = table.clone(Canon:peek())
			
			if v2 == "h" then
				Copy.h = p5 / Max1
				
				return Copy
			elseif v2 == "s" then
				Copy.s = p5 / Max1
				
				return Copy
			else
				Copy.v = p5 / Max1
				
				return Copy
			end
		end)
		local v3 = "s"
		local Max2 = 100
		
		local function v53(_, p5): number
			-- upvalues: v3 (copy), Max2 (copy)
			return (math.floor((if v3 == "h" then p5.h elseif v3 == "s" then p5.s else p5.v) * Max2 + 0.5))
		end
		
		local v4 = "s"
		local Max3 = 100
		
		return (fieldsRow({
			FieldH,
			numberField("FieldS", "S", 100, v53, function(p5)
				-- upvalues: Canon (upval), v4 (copy), Max3 (copy)
				local Copy = table.clone(Canon:peek())
				
				if v4 == "h" then
					Copy.h = p5 / Max3
					
					return Copy
				elseif v4 == "s" then
					Copy.s = p5 / Max3
					
					return Copy
				else
					Copy.v = p5 / Max3
					
					return Copy
				end
			end),
			channel("v", "V", 100)
		}))
	end
	
	local function hexFields()
		-- upvalues: Compose (copy), Held (copy), Color (copy), HasAlpha (copy), AlphaHeld (copy), FormatCell (copy), HexError (copy), TypesUDim2 (copy), TypesEnum (copy), InteractiveFunction (copy), ProposeFunction (copy), Canon (copy), p4 (copy), CommitFunction (copy), fieldsRow (copy), p2 (copy)
		local CellResult = Compose.cell("")
		
		local function _()
			-- upvalues: Held (upval), Color (upval), HasAlpha (upval), AlphaHeld (upval)
			local PeekResult = Held:peek()
			
			return if PeekResult == nil then "" else Color.hex(PeekResult, if HasAlpha then AlphaHeld:peek() else nil)
		end
		
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: Held (upval), AlphaHeld (upval), FormatCell (upval), CellResult (copy), Color (upval), HasAlpha (upval), HexError (upval)
			Callback(Held)
			Callback(AlphaHeld)
			Callback(FormatCell)
			local PeekResult = Held:peek()
			CellResult:set(if PeekResult == nil then "" else Color.hex(PeekResult, if HasAlpha then AlphaHeld:peek() else nil))
			HexError:set("")
		end)
		
		return (fieldsRow({
			p2.TextInput({
				Name = "FieldHex",
				label = "Hex",
				value = CellResult,
				errorText = HexError,
				Size = TypesUDim2.fromScale(1, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				enabled = function(p5)
					-- upvalues: InteractiveFunction (upval)
					return InteractiveFunction(p5)
				end,
				onCommit = function(p5)
					-- upvalues: Color (upval), HasAlpha (upval), HexError (upval), ProposeFunction (upval), Canon (upval), p4 (upval), CommitFunction (upval), CellResult (copy), Held (upval), AlphaHeld (upval)
					local ParseHexResult, ParseHexResult2, ParseHexResult3 = Color.parseHex(p5, HasAlpha)
					
					if ParseHexResult == nil then
						HexError:set(ParseHexResult3 or "Check this colour.")
						
						return
					end
					HexError:set("")
					local ProposeResult = ProposeFunction(Color.hsvOf(ParseHexResult, Canon:peek()), ParseHexResult)
					
					if ParseHexResult2 ~= nil then
						ProposeResult = p4.proposeAlpha(ParseHexResult2) or ProposeResult
					end
					if ProposeResult then
						CommitFunction()
					end
					local PeekResult = Held:peek()
					CellResult:set(if PeekResult == nil then "" else Color.hex(PeekResult, if HasAlpha then AlphaHeld:peek() else nil))
				end
			})
		}))
	end
	
	return function()
		-- upvalues: rgbFields (copy), hsvFields (copy), hexFields (copy), TypesUDim2 (copy), TypesEnum (copy), Options (upval), Compose (copy), FormatCell (copy), Host (copy), p1 (copy), CELL (upval), p2 (copy), Runtime (copy), p3 (copy), GAP (upval), p4 (copy)
		local config = { rgb = rgbFields, hsv = hsvFields, hex = hexFields }
		local config1 = {
			Name = "Values",
			BackgroundTransparency = 1,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		}
		
		for _, option in Options do
			local CellResult = Compose.cell(FormatCell:peek() == option.value)
			
			if not CellResult:peek() then
				Compose.watch(function(Callback)
					-- upvalues: FormatCell (upval), option (copy), CellResult (copy)
					if Callback(FormatCell) == option.value then
						CellResult:set(true)
					end
				end)
			end
			config1[#config1 + 1] = Host.CanvasGroup("Fields" .. p1.read(option.label))({
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				GroupTransparency = function(Callback): number
					-- upvalues: FormatCell (upval), option (copy)
					return if Callback(FormatCell) == option.value then 0 else 1
				end,
				Interactable = function(Callback): boolean
					-- upvalues: FormatCell (upval), option (copy)
					return Callback(FormatCell) == option.value
				end,
				Compose.show(CellResult, function()
					-- upvalues: config (copy), option (copy)
					local Content = config[option.value]()
					Content.Name = "Content"
					
					return Content
				end)
			})
		end
		local FrameResult = Host.Frame(config1)
		local Format = p2.Picker({
			Name = "Format",
			style = "segmented",
			selected = FormatCell,
			options = Options,
			Size = TypesUDim2.fromOffset(0, CELL),
			AutomaticSize = TypesEnum.AutomaticSize.None
		})
		Runtime.mount(function()
			-- upvalues: Host (upval), TypesEnum (upval)
			return Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		end, Format)
		local RowResult = p1.row({
			p3.swatch("Preview", TypesUDim2.fromOffset(2 * CELL + GAP, CELL), p4.currentPaint),
			Format
		}, {
			Name = "Head",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
		assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).VerticalAlignment = TypesEnum.VerticalAlignment.Center
		
		return p1.column({ RowResult, FrameResult }, {
			Name = "Readout",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
	end
end