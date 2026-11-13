local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./input_props")
local _ = require("./navigation_props")
local ColorPickerKitModule = require("./color_picker_kit")
local _ = require("./color_picker_state")
local ColorPickerSlidersModule = require("./color_picker_sliders")
local ColorPickerSpectrumModule = require("./color_picker_spectrum")
local ColorPickerSwatchesModule = require("./color_picker_swatches")
local ColorPickerReadoutModule = require("./color_picker_readout")
local MODELABEL = ColorPickerKitModule.MODE_LABEL
local GAP = ColorPickerKitModule.GAP
local PAD = ColorPickerKitModule.PAD
local SPACE = ColorPickerKitModule.SPACE
local MAXCOLUMNS = ColorPickerKitModule.MAX_COLUMNS

return function(p1, p2, p3, p4, p5)
	-- upvalues: ColorPickerSlidersModule (copy), ColorPickerSpectrumModule (copy), ColorPickerSwatchesModule (copy), ColorPickerReadoutModule (copy), PAD (copy), GAP (copy), MAXCOLUMNS (copy), MODELABEL (copy), SPACE (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim = p1.types.UDim
	local TypesUDim2 = p1.types.UDim2
	local Modes = p5.modes
	local Draft = p5.draft
	local ModeCell = p5.modeCell
	local Columns = p5.columns
	local TouchFunction = p5.touch
	local CloseFunction = p5.close
	local ColorPickerSlidersModuleResult = ColorPickerSlidersModule(p1, p2, p4, p5)
	local ColorPickerSpectrumModuleResult = ColorPickerSpectrumModule(p1, p2, p3, p4, p5, ColorPickerSlidersModuleResult)
	local ColorPickerSwatchesModuleResult = ColorPickerSwatchesModule(p1, p2, p3, p4, p5)
	local ColorPickerReadoutModuleResult = ColorPickerReadoutModule(p1, p2, p4, p5)
	local SwatchesView = ColorPickerSwatchesModuleResult.swatchesView
	local SlidersView = ColorPickerSlidersModuleResult.slidersView
	local BrickView = ColorPickerSwatchesModuleResult.brickView
	
	return function(p6, Callback, p7, p8: number)
		-- upvalues: p3 (copy), PAD (upval), Columns (copy), GAP (upval), p5 (copy), MAXCOLUMNS (upval), SwatchesView (copy), ColorPickerSpectrumModuleResult (copy), SlidersView (copy), BrickView (copy), Modes (copy), Compose (copy), ModeCell (copy), Host (copy), MODELABEL (upval), TypesUDim2 (copy), TypesEnum (copy), p1 (copy), p2 (copy), ColorPickerReadoutModuleResult (copy), Runtime (copy), TouchFunction (copy), ColorPickerSlidersModuleResult (copy), Draft (copy), CloseFunction (copy), TypesUDim (copy), SPACE (upval)
		if p8 and p8 > 0 then
			Columns:set((math.clamp(math.floor((p8 - p3.inset(PAD, "left") - p3.inset(PAD, "right") + GAP) / (p5.cellSize() + GAP)), 1, MAXCOLUMNS)))
		end
		local config = {
			swatches = SwatchesView,
			spectrum = ColorPickerSpectrumModuleResult,
			sliders = SlidersView,
			brick = BrickView
		}
		local List = {}
		local config1 = { Name = "Technique", BackgroundTransparency = 1 }
		
		for _, mode in Modes do
			local CellResult = Compose.cell(ModeCell:peek() == mode)
			
			if not CellResult:peek() then
				Compose.watch(function(Callback)
					-- upvalues: ModeCell (upval), mode (copy), CellResult (copy)
					if Callback(ModeCell) == mode then
						CellResult:set(true)
					end
				end)
			end
			local v1 = Host.Frame(`Show{MODELABEL[mode]}`)({
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Visible = function(Callback): boolean
					-- upvalues: ModeCell (upval), mode (copy)
					return Callback(ModeCell) == mode
				end,
				Compose.show(CellResult, config[mode])
			})
			table.insert(List, v1)
			config1[#config1 + 1] = v1
		end
		local AbsoluteSizeResults = {}
		
		for _, value in List do
			table.insert(AbsoluteSizeResults, p1.observe.AbsoluteSize(value))
		end
		local FrameResult = Host.Frame(config1)
		local LayoutUnitResult = p1.layoutUnit(FrameResult)
		
		local function _(Callback)
			-- upvalues: Modes (upval), ModeCell (upval), AbsoluteSizeResults (copy), LayoutUnitResult (copy)
			local FoundIndex: number? = table.find(Modes, Callback(ModeCell))
			
			return if FoundIndex then Callback(AbsoluteSizeResults[FoundIndex]).Y / Callback(LayoutUnitResult) else 0
		end
		
		local function tech(Callback)
			-- upvalues: p6 (copy), Modes (upval), p5 (upval), GAP (upval), ModeCell (upval), AbsoluteSizeResults (copy), LayoutUnitResult (copy)
			if p6 and #Modes > 1 then
				return 6 * p5.cellSize(Callback) + 5 * GAP
			else
				local FoundIndex: number? = table.find(Modes, Callback(ModeCell))
				
				return if FoundIndex then Callback(AbsoluteSizeResults[FoundIndex]).Y / Callback(LayoutUnitResult) else 0
			end
		end
		
		local List1 = {}
		
		local _ = function(Node)
			-- upvalues: p1 (upval), List1 (copy)
			table.insert(List1, { node = Node, size = p1.observe.AbsoluteSize(Node) })
			
			return Node
		end
		
		local List11 = {}
		
		if #Modes > 1 then
			local Options = {}
			
			for _, mode1 in Modes do
				table.insert(Options, { value = mode1, label = MODELABEL[mode1] })
			end
			local Modes1 = p2.Picker({
				Name = "Modes",
				style = "automatic",
				LayoutOrder = 1,
				selected = ModeCell,
				options = Options
			})
			table.insert(List1, { node = Modes1, size = p1.observe.AbsoluteSize(Modes1) })
			table.insert(List11, Modes1)
		end
		if #Modes ~= 1 or (Modes[1] ~= "swatches" or (p5.spec.swatches == nil or (p5.saving or p5.hasAlpha))) then
			local ColorPickerReadoutModuleResultResult = ColorPickerReadoutModuleResult()
			Runtime.decorate(ColorPickerReadoutModuleResultResult, {
				LayoutOrder = function(p9): number
					-- upvalues: TouchFunction (upval)
					return if TouchFunction(p9) then 2 else 5
				end
			})
			table.insert(List1, {
				node = ColorPickerReadoutModuleResultResult,
				size = p1.observe.AbsoluteSize(ColorPickerReadoutModuleResultResult)
			})
			table.insert(List11, ColorPickerReadoutModuleResultResult)
		end
		local ScrollFrame = {
			Name = "Body",
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			ClipsDescendants = true,
			Size = function(Callback)
				-- upvalues: p6 (copy), Modes (upval), p5 (upval), GAP (upval), ModeCell (upval), AbsoluteSizeResults (copy), LayoutUnitResult (copy), TypesUDim2 (upval), p7 (copy)
				local YRatio = nil
				if p6 and #Modes > 1 then
					YRatio = 6 * p5.cellSize(Callback) + 5 * GAP
				else
					local FoundIndex: number? = table.find(Modes, Callback(ModeCell))
					YRatio = if FoundIndex then Callback(AbsoluteSizeResults[FoundIndex]).Y / Callback(LayoutUnitResult) else 0
				end
				local Ceiled = math.ceil(YRatio)
				
				return TypesUDim2.new(1, 0, 0, if p6 then math.min(Ceiled, (math.max(0, Callback(p7)))) else Ceiled)
			end,
			FrameResult
		}
		local AbsoluteWindowSizeResult = nil
		local ScrollingFrameResult = nil
		
		if p6 then
			ScrollFrame.ScrollBarThickness = 4
			ScrollFrame.VerticalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar
			ScrollFrame.ScrollingDirection = TypesEnum.ScrollingDirection.Y
			ScrollFrame.AutomaticCanvasSize = TypesEnum.AutomaticSize.Y
			ScrollFrame.CanvasSize = TypesUDim2.fromOffset(0, 0)
			ScrollingFrameResult = Host.ScrollingFrame(ScrollFrame)
			AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollingFrameResult)
		else
			ScrollingFrameResult = Host.Frame(ScrollFrame)
			AbsoluteWindowSizeResult = p1.observe.AbsoluteSize(ScrollingFrameResult)
		end
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteWindowSizeResult (ref), LayoutUnitResult (copy), Columns (upval), GAP (upval), p5 (upval), MAXCOLUMNS (upval)
			local XRatio = Callback(AbsoluteWindowSizeResult).X / Callback(LayoutUnitResult)
			
			if XRatio > 0 then
				Columns:set((math.clamp(math.floor((XRatio + GAP) / (p5.cellSize(Callback) + GAP)), 1, MAXCOLUMNS)))
			end
		end)
		Runtime.decorate(FrameResult, {
			Size = function(Callback)
				-- upvalues: TypesUDim2 (upval), AbsoluteWindowSizeResult (ref), LayoutUnitResult (copy), Modes (upval), ModeCell (upval), AbsoluteSizeResults (copy)
				local FromOffsetFunction = TypesUDim2.fromOffset
				local XRatio = Callback(AbsoluteWindowSizeResult).X / Callback(LayoutUnitResult)
				local FoundIndex: number? = table.find(Modes, Callback(ModeCell))
				
				return FromOffsetFunction(XRatio, if FoundIndex then Callback(AbsoluteSizeResults[FoundIndex]).Y / Callback(LayoutUnitResult) else 0)
			end
		})
		table.insert(List11, ScrollingFrameResult)
		
		if p5.hasAlpha then
			local OpacitySliderResult = ColorPickerSlidersModuleResult.opacitySlider()
			table.insert(List1, {
				node = OpacitySliderResult,
				size = p1.observe.AbsoluteSize(OpacitySliderResult)
			})
			table.insert(List11, OpacitySliderResult)
		end
		local List2 = {}
		
		if Draft then
			table.insert(List2, p2.Button({
				Name = "Cancel",
				label = "Cancel",
				role = "cancel",
				onActivate = function()
					-- upvalues: p6 (copy), CloseFunction (upval), p5 (upval)
					if p6 then
						CloseFunction("cancel")
						
						return
					else
						p5.restore()
					end
				end
			}))
			table.insert(List2, p2.Button("Apply")({
				label = "Apply",
				appearance = "emphasis",
				onActivate = function()
					-- upvalues: p5 (upval), p6 (copy), CloseFunction (upval)
					p5.apply()
					
					if p6 then
						CloseFunction("apply")
					end
				end
			}))
		elseif p6 then
			table.insert(List2, p2.Button("Done")({
				label = "Done",
				onActivate = function()
					-- upvalues: CloseFunction (upval)
					CloseFunction("activate")
				end
			}))
		end
		if #List2 > 0 then
			local RowResult = p1.row(List2, {
				Name = "Actions",
				LayoutOrder = 6,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Visible = if Draft then true else function(p9)
					-- upvalues: Callback (copy)
					return Callback(p9)
				end
			})
			assert(RowResult:FindFirstChildWhichIsA("UIListLayout")).HorizontalAlignment = TypesEnum.HorizontalAlignment.Right
			table.insert(List1, {
				node = RowResult,
				size = p1.observe.AbsoluteSize(RowResult)
			})
			table.insert(List11, RowResult)
		end
		local config2 = {
			Name = "Panel",
			BackgroundTransparency = if p6 then 0 else 1,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = if p6 then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y,
			Host.UIListLayout({
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = TypesUDim.new(0, SPACE)
			})
		}
		
		if p6 then
			config2[#config2 + 1] = p1.padding(PAD, PAD)
			config2[#config2 + 1] = p1.corner()
		end
		for _, value1 in List11 do
			config2[#config2 + 1] = value1
		end
		local FadeResult = if p6 then p1.fade(config2) else Host.Frame(config2)
		local List3 = {}
		
		for _, value2 in List1 do
			table.insert(List3, p1.observe.Visible(value2.node))
		end
		return {
			panel = FadeResult,
			chrome = function(Callback): number
				-- upvalues: List1 (copy), List3 (copy), LayoutUnitResult (copy), SPACE (upval), p6 (copy), p3 (upval), PAD (upval)
				local NewY = 0
				local Count = 1
				
				for i, value in List1 do
					if Callback(List3[i]) then
						NewY += Callback(value.size).Y / Callback(LayoutUnitResult)
						Count += 1
					end
				end
				return NewY + (Count - 1) * SPACE + (if p6 then p3.inset(PAD, "top", nil, Callback) + p3.inset(PAD, "bottom", nil, Callback) else 0)
			end,
			tech = tech
		}
	end
end