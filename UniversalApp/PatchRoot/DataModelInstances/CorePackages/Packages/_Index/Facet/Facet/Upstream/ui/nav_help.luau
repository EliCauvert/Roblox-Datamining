local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local HelpModule = require("./help")
local _ = require("./input_types")
local OverlayPlacementModule = require("./overlay_placement")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./nav_surface_kit")
local _ = require("./nav_overlay_presence")
local _ = require("./nav_overlay_portal")
local _ = require("./nav_popover_placement")
local TextMeasureModule = require("./text_measure")

return function(p1, p2, p3, p4, Callback)
	-- upvalues: HelpModule (copy), TextMeasureModule (copy), OverlayPartsModule (copy), OverlayPlacementModule (copy)
	local ReadFunction = p1.read
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Gui = p2.gui
	local Input = p2.input
	local AppearanceFunction = p3.appearance
	local AtRestFunction = p3.atRest
	local OverlayFunction = p4.overlay
	local ParentFunction = p4.parent
	local SharedResource = Compose.createSharedResource(function()
		-- upvalues: Compose (copy), TypesEnum (copy), Input (copy), Runtime (copy), p1 (copy)
		local Tbl = {}
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(0)
		local CellResult2 = Compose.cell(true)
		
		local function _(MouseButton): boolean
			-- upvalues: TypesEnum (upval)
			return MouseButton == TypesEnum.UserInputType.MouseButton1 or (MouseButton == TypesEnum.UserInputType.MouseButton2 or MouseButton == TypesEnum.UserInputType.MouseButton3)
		end
		
		local function disturb()
			-- upvalues: CellResult1 (copy)
			CellResult1:set(CellResult1:peek() + 1)
		end
		
		local function begin(Input)
			-- upvalues: TypesEnum (upval), Tbl (copy), CellResult (copy), CellResult1 (copy)
			local UserInputType = Input.UserInputType
			
			if UserInputType == TypesEnum.UserInputType.MouseButton1 or (UserInputType == TypesEnum.UserInputType.MouseButton2 or UserInputType == TypesEnum.UserInputType.MouseButton3) then
				Tbl[Input.UserInputType.Name] = true
				CellResult:set(true)
				CellResult1:set(CellResult1:peek() + 1)
			end
		end
		
		local function finish(Input)
			-- upvalues: TypesEnum (upval), Tbl (copy), CellResult (copy), CellResult1 (copy)
			local UserInputType = Input.UserInputType
			
			if UserInputType == TypesEnum.UserInputType.MouseButton1 or (UserInputType == TypesEnum.UserInputType.MouseButton2 or UserInputType == TypesEnum.UserInputType.MouseButton3) then
				Tbl[Input.UserInputType.Name] = nil
				CellResult:set(next(Tbl) ~= nil)
				CellResult1:set(CellResult1:peek() + 1)
			end
		end
		
		local function change(Input)
			-- upvalues: TypesEnum (upval), CellResult1 (copy)
			if Input.UserInputType == TypesEnum.UserInputType.MouseMovement or Input.UserInputType == TypesEnum.UserInputType.MouseWheel then
				CellResult1:set(CellResult1:peek() + 1)
			end
		end
		
		if Input then
			if Input.GetMouseButtonsPressed then
				for _, Input1 in Input:GetMouseButtonsPressed() do
					local UserInputType = Input1.UserInputType
					
					if UserInputType == TypesEnum.UserInputType.MouseButton1 or (UserInputType == TypesEnum.UserInputType.MouseButton2 or UserInputType == TypesEnum.UserInputType.MouseButton3) then
						Tbl[Input1.UserInputType.Name] = true
						CellResult:set(true)
						CellResult1:set(CellResult1:peek() + 1)
					end
				end
			end
			Runtime.connect(Input, "InputBegan", begin)
			Runtime.connect(Input, "InputEnded", finish)
			Runtime.connect(Input, "InputChanged", change)
		end
		local InputParent = p1.config.inputParent
		local InputParent1 = if InputParent and InputParent:IsA("PluginGui") then InputParent else Input
		
		if InputParent1 then
			Runtime.connect(InputParent1, "WindowFocusReleased", function()
				-- upvalues: CellResult2 (copy), Tbl (copy), CellResult (copy), CellResult1 (copy)
				CellResult2:set(false)
				table.clear(Tbl)
				CellResult:set(false)
				CellResult1:set(CellResult1:peek() + 1)
			end)
			Runtime.connect(InputParent1, "WindowFocused", function()
				-- upvalues: CellResult2 (copy), CellResult1 (copy)
				CellResult2:set(true)
				CellResult1:set(CellResult1:peek() + 1)
			end)
		end
		return {
			pressed = CellResult,
			activity = CellResult1,
			focused = CellResult2,
			begin = begin,
			finish = finish,
			change = change,
			disturb = disturb
		}, nil
	end)
	HelpModule.register(p1, function(Frame: Frame, p5, p6)
		-- upvalues: Compose (copy), p1 (copy), Gui (copy), Input (copy), TypesEnum (copy), HelpModule (upval), Runtime (copy), p2 (copy), TypesVector2 (copy), SharedResource (copy), OverlayFunction (copy), AppearanceFunction (copy), ParentFunction (copy), TypesUDim2 (copy), TextMeasureModule (upval), ReadFunction (copy), Host (copy), AtRestFunction (copy), OverlayPartsModule (upval), OverlayPlacementModule (upval), Callback (copy)
		local v1 = if type(p5) == "table" and not Compose.isValue(p5) then p5 else nil
		local Body = if v1 then v1.body else p5
		local Gate = p6 and p6.gate
		local GuiStateResult = p1.observe.GuiState(Frame)
		local ObserveResult = if Gui and Gui.GetPropertyChangedSignal then p1.selection.observe() else nil
		local PreferredInputResult = if Input and Input.GetPropertyChangedSignal then p1.observe.PreferredInput(Input) else nil
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(nil)
		
		local function press(Entry, Begin)
			-- upvalues: TypesEnum (upval), p1 (upval), Gate (copy), CellResult1 (copy), Frame (copy), CellResult (copy), HelpModule (upval)
			if Begin == TypesEnum.UserInputState.Begin and p1.read(Gate) ~= false then
				local Entry1 = Entry[1]
				CellResult1:set(if Entry1 then Entry1 - Frame.AbsolutePosition else Frame.AbsoluteSize / 2)
				CellResult:set(true)
				HelpModule.hold(Frame, true)
			end
		end
		
		if Frame:IsA("GuiButton") then
			Runtime.connect(Frame, "TouchLongPress", function(p7, p8)
				-- upvalues: press (copy)
				press(p7, p8)
			end)
		elseif Input then
			Runtime.connect(Input, "TouchLongPress", function(Entry, p7)
				-- upvalues: Frame (copy), p2 (upval), Gui (upval), TypesVector2 (upval), press (copy)
				local Entry1 = Entry[1]
				local ScreenGui = Frame:FindFirstAncestorWhichIsA("ScreenGui")
				
				if Entry1 == nil or ScreenGui == nil or not p2.displayed(Frame) then return end
				local GuiInset = if ScreenGui.IgnoreGuiInset and Gui then Gui:GetGuiInset() else TypesVector2.zero
				local AbsolutePositionDelta = Frame.AbsolutePosition - GuiInset
				local AbsoluteSize = Frame.AbsoluteSize
				
				if AbsolutePositionDelta.X <= Entry1.X and Entry1.X <= AbsolutePositionDelta.X + AbsoluteSize.X and AbsolutePositionDelta.Y <= Entry1.Y and Entry1.Y <= AbsolutePositionDelta.Y + AbsoluteSize.Y then
					press({ Entry1 + GuiInset }, p7)
				end
			end)
		end
		Runtime.connect(Frame, "InputBegan", function()
			-- upvalues: HelpModule (upval), Frame (copy)
			HelpModule.hold(Frame, false)
		end)
		local SharedResourceResult = SharedResource()
		Runtime.connect(Frame, "InputBegan", SharedResourceResult.begin)
		Runtime.connect(Frame, "InputEnded", SharedResourceResult.finish)
		Runtime.connect(Frame, "InputChanged", SharedResourceResult.change)
		Runtime.connect(Frame, "MouseMoved", SharedResourceResult.disturb)
		Compose.watch(function(Callback)
			-- upvalues: SharedResourceResult (copy), CellResult (copy), CellResult1 (copy)
			if Callback(SharedResourceResult.pressed) or not Callback(SharedResourceResult.focused) then
				CellResult:set(false)
				CellResult1:set(nil)
			end
		end)
		
		if Input then
			Runtime.connect(Input, "InputBegan", function(Input)
				-- upvalues: CellResult (copy), TypesEnum (upval), CellResult1 (copy)
				if CellResult:peek() and Input.UserInputType == TypesEnum.UserInputType.Touch then
					CellResult:set(false)
					CellResult1:set(nil)
				end
			end)
		end
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: PreferredInputResult (copy), TypesEnum (upval), SharedResourceResult (copy), ObserveResult (copy), GuiStateResult (copy), Frame (copy)
			if (if PreferredInputResult then Callback(PreferredInputResult) else nil) == TypesEnum.PreferredInput.Touch or Callback(SharedResourceResult.pressed) or not Callback(SharedResourceResult.focused) then
				return false
			else
				local CallbackResult = if ObserveResult then Callback(ObserveResult) else nil
				
				return Callback(GuiStateResult) == TypesEnum.GuiState.Hover or CallbackResult ~= nil and (CallbackResult == Frame or Frame:IsDescendantOf(CallbackResult))
			end
		end)
		local TimelineResult = Runtime.timeline({ duration = 0.45, autoplay = false })
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult (copy), SharedResourceResult (copy), TimelineResult (copy)
			if Callback(FormulaResult) then
				Callback(SharedResourceResult.activity)
				TimelineResult:restart()
				
				return
			else
				TimelineResult:pause()
				TimelineResult:seek(0)
			end
		end)
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: p1 (upval), Gate (copy), CellResult (copy), FormulaResult (copy), TimelineResult (copy)
			return p1.read(Gate, Callback) ~= false and (Callback(CellResult) or Callback(FormulaResult) and Callback(TimelineResult.progress) >= 1)
		end)
		local Shown = p6 and p6.shown
		
		if Shown then
			Compose.watch(function(Callback)
				-- upvalues: Shown (copy), FormulaResult1 (copy)
				Shown:set(Callback(FormulaResult1))
			end)
		end
		local Motion = {
			enter = p1.metric("motion.normal"),
			exit = p1.metric("motion.fast")
		}
		p2.attach(Frame, {
			OverlayFunction(Frame, FormulaResult1, function(p7)
				-- upvalues: Compose (upval), AppearanceFunction (upval), Motion (copy), ParentFunction (upval), Frame (copy), p1 (upval), TypesUDim2 (upval), TextMeasureModule (upval), Runtime (upval), TypesEnum (upval), ReadFunction (upval), Body (copy), p6 (copy), Host (upval), v1 (copy), AtRestFunction (upval), OverlayPartsModule (upval), CellResult1 (copy), OverlayPlacementModule (upval), Callback (upval), TypesVector2 (upval)
				local CellResult = Compose.cell(false)
				local AppearanceResult = AppearanceFunction(p7, Motion, CellResult)
				local v2 = assert(ParentFunction(Frame))
				local AbsolutePositionResult = p1.observe.AbsolutePosition(Frame)
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(Frame)
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(v2)
				local AbsolutePositionResult1 = p1.observe.AbsolutePosition(v2)
				local CellResult2 = Compose.cell({})
				
				local function width(Callback)
					-- upvalues: CellResult2 (copy), TypesUDim2 (upval), AbsoluteSizeResult1 (copy)
					local Largest = 0
					
					for _, value in Callback(CellResult2) do
						Largest = math.max(Largest, math.ceil(Callback(value).X) + 1)
					end
					return TypesUDim2.fromOffset(math.min(264, math.max(0, Callback(AbsoluteSizeResult1).X - 32), Largest), 0)
				end
				
				local function wrap(HelpCooldown)
					-- upvalues: CellResult2 (copy), TextMeasureModule (upval), p1 (upval), Runtime (upval), width (copy), TypesEnum (upval)
					local Copy = table.clone(CellResult2:peek())
					table.insert(Copy, TextMeasureModule.natural(p1, HelpCooldown))
					CellResult2:set(Copy)
					Runtime.decorate(HelpCooldown, {
						TextWrapped = true,
						Size = width,
						AutomaticSize = TypesEnum.AutomaticSize.Y
					})
					
					return HelpCooldown
				end
				
				local WrapResult = wrap(p1.text({
					Name = "HelpText",
					TextWrapped = true,
					Text = function(p8)
						-- upvalues: ReadFunction (upval), Body (upval)
						return ReadFunction(Body, p8) or ""
					end,
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}))
				p1.textRole(WrapResult, "caption")
				local Frame1 = {
					ZIndex = 96,
					Name = p6 and p6.name or "Help",
					GroupTransparency = function(p8): number
						-- upvalues: AppearanceResult (copy)
						return 1 - AppearanceResult.opacity(p8)
					end,
					AutomaticSize = TypesEnum.AutomaticSize.XY,
					Size = TypesUDim2.fromOffset(0, 0)
				}
				Frame1[#Frame1 + 1] = p1.padding(8, 6)
				Frame1[#Frame1 + 1] = Host.UIListLayout({
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					Padding = p1.types.UDim.new(0, 4)
				})
				
				if v1 and v1.title ~= nil then
					local Title = v1.title
					local WrapResult1 = wrap(p1.text({
						Name = "HelpTitle",
						LayoutOrder = 1,
						Text = function(p8)
							-- upvalues: ReadFunction (upval), Title (copy)
							return ReadFunction(Title, p8) or ""
						end,
						AutomaticSize = TypesEnum.AutomaticSize.XY
					}))
					p1.textRole(WrapResult1, "heading")
					
					if v1.titleTone then
						WrapResult1:AddTag("facet-tone-" .. v1.titleTone)
					end
					Frame1[#Frame1 + 1] = WrapResult1
				end
				Runtime.decorate(WrapResult, {
					LayoutOrder = 2,
					Visible = function(p8): boolean
						-- upvalues: ReadFunction (upval), Body (upval)
						return (ReadFunction(Body, p8) or "") ~= ""
					end
				})
				Frame1[#Frame1 + 1] = WrapResult
				
				if v1 then
					local LayoutOrder = 3
					
					local function detail(Name, Text, p8, Tone)
						-- upvalues: wrap (copy), p1 (upval), LayoutOrder (ref), TypesEnum (upval), Frame1 (copy)
						local WrapResult = wrap(p1.text({
							Name = Name,
							LayoutOrder = LayoutOrder,
							Text = Text,
							AutomaticSize = TypesEnum.AutomaticSize.XY
						}))
						p1.textRole(WrapResult, "caption")
						
						if p8 then
							WrapResult:AddTag("facet-secondary")
						end
						if Tone then
							WrapResult:AddTag("facet-tone-" .. Tone)
						end
						Frame1[#Frame1 + 1] = WrapResult
						LayoutOrder += 1
					end
					
					local Rows = v1.rows or {}
					for i, row in Rows do
						detail("HelpRow" .. i, function(p8)
							-- upvalues: ReadFunction (upval), row (copy)
							local ReadResult = ReadFunction(row.label, p8) or ""
							local ReadResult1 = ReadFunction(row.value, p8) or ""
							
							return if ReadResult1 == "" then ReadResult else ReadResult .. ": " .. ReadResult1
						end, nil, row.tone)
					end
					if v1.cost then
						local WrapResult2 = wrap(p1.text({
							Name = "HelpCost",
							LayoutOrder = LayoutOrder,
							Text = v1.cost,
							AutomaticSize = TypesEnum.AutomaticSize.XY
						}))
						p1.textRole(WrapResult2, "caption")
						Frame1[#Frame1 + 1] = WrapResult2
						LayoutOrder += 1
					end
					if v1.cooldown then
						local WrapResult3 = wrap(p1.text({
							Name = "HelpCooldown",
							LayoutOrder = LayoutOrder,
							Text = v1.cooldown,
							AutomaticSize = TypesEnum.AutomaticSize.XY
						}))
						p1.textRole(WrapResult3, "caption")
						Frame1[#Frame1 + 1] = WrapResult3
						LayoutOrder += 1
					end
					if v1.flavour then
						detail("HelpFlavour", v1.flavour, true)
					end
				end
				if v1 and v1.shortcut then
					local List = {}
					
					for _, value in v1.shortcut do
						table.insert(List, table.concat(value, "+"))
					end
					local WrapResult4 = wrap(p1.text({
						Name = "HelpShortcut",
						LayoutOrder = 1000,
						Text = table.concat(List, " or "),
						AutomaticSize = TypesEnum.AutomaticSize.XY
					}))
					p1.textRole(WrapResult4, "caption")
					WrapResult4:AddTag("facet-secondary")
					Frame1[#Frame1 + 1] = WrapResult4
				end
				local FadeResult = p1.fade(Frame1, true)
				local AtRestResult, AtRestResult2 = AtRestFunction(AppearanceResult.travel, CellResult, { FadeResult, WrapResult })
				local AtRestResultEntry = AtRestResult[1]
				local Edge = if v1 and v1.edge then v1.edge else "top"
				local Align = if v1 and v1.align then v1.align else "center"
				local FormulaResult = Compose.formula(function(Callback)
					-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), AbsolutePositionResult1 (copy), AtRestResultEntry (copy), OverlayPartsModule (upval), p1 (upval), CellResult1 (upval), OverlayPlacementModule (upval), Edge (copy), Align (copy)
					local CallbackResult = Callback(AbsolutePositionResult)
					local CallbackResult1 = Callback(AbsoluteSizeResult)
					local CallbackResult2 = Callback(AbsoluteSizeResult1)
					local CallbackResult3 = Callback(AbsolutePositionResult1)
					local CallbackResult4 = Callback(AtRestResultEntry)
					local TailSizeResult: number = OverlayPartsModule.tailSize(p1, Callback)
					local CallbackResult5 = Callback(CellResult1)
					
					if CallbackResult5 then
						local CallbackResultDelta = CallbackResult + CallbackResult5 - CallbackResult3
						
						return OverlayPlacementModule.touch({ x = CallbackResultDelta.X, y = CallbackResultDelta.Y }, { w = CallbackResult4.X, h = CallbackResult4.Y }, {
							x = 8,
							y = 8,
							w = math.max(0, CallbackResult2.X - 16),
							h = math.max(0, CallbackResult2.Y - 16)
						}, p1.metric("targetSizes.minimum", Callback) + p1.metric("space.s", Callback))
					else
						return OverlayPlacementModule.solve({
							tailInset = 6,
							source = {
								x = CallbackResult.X - CallbackResult3.X,
								y = CallbackResult.Y - CallbackResult3.Y,
								w = CallbackResult1.X,
								h = CallbackResult1.Y
							},
							size = { w = CallbackResult4.X, h = CallbackResult4.Y },
							safe = {
								x = 8,
								y = 8,
								w = math.max(0, CallbackResult2.X - 16),
								h = math.max(0, CallbackResult2.Y - 16)
							},
							edge = Edge,
							align = Align,
							gap = 6 + TailSizeResult * 1.4142135623730951 / 2,
							tail = TailSizeResult * 1.4142135623730951
						})
					end
				end)
				p1.styled(FadeResult, "tooltip")
				
				return Host.Folder("HelpOverlay")({
					FadeResult,
					table.unpack((OverlayPartsModule.tail(p1, "HelpTail", function(Callback)
						-- upvalues: FormulaResult (copy), TypesVector2 (upval)
						local CallbackResult = Callback(FormulaResult)
						
						if CallbackResult.tailSuppressed or CallbackResult.tailX == nil or CallbackResult.tailY == nil then
							return nil, CallbackResult.edge
						else
							return TypesVector2.new(CallbackResult.tailX, CallbackResult.tailY), CallbackResult.edge
						end
					end, AppearanceResult.opacity, function(): number
						return 96
					end, {
						role = "tooltip",
						node = FadeResult,
						scale = Callback(FadeResult, AppearanceResult.travel, function(Callback)
							-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsolutePositionResult1 (copy), AtRestResultEntry (copy), FormulaResult (copy), TypesVector2 (upval)
							local CallbackResult = Callback(AbsolutePositionResult)
							local CallbackResult1 = Callback(AbsoluteSizeResult)
							local CallbackResult2 = Callback(AbsolutePositionResult1)
							local CallbackResult3 = Callback(AtRestResultEntry)
							local CallbackResult4 = Callback(FormulaResult)
							local XDelta = CallbackResult.X - CallbackResult2.X + CallbackResult1.X / 2 - CallbackResult4.x
							local YDelta = CallbackResult.Y - CallbackResult2.Y + CallbackResult1.Y / 2 - CallbackResult4.y
							
							return TypesVector2.new(CallbackResult4.x, CallbackResult4.y), if CallbackResult4.edge == "bottom" then TypesVector2.new(math.clamp(XDelta, 0, CallbackResult3.X), 0) elseif CallbackResult4.edge == "top" then TypesVector2.new(math.clamp(XDelta, 0, CallbackResult3.X), CallbackResult3.Y) elseif CallbackResult4.edge == "right" then TypesVector2.new(0, (math.clamp(YDelta, 0, CallbackResult3.Y))) else TypesVector2.new(CallbackResult3.X, (math.clamp(YDelta, 0, CallbackResult3.Y)))
						end, {
							pinned = true,
							rested = AtRestResult2,
							size = AtRestResultEntry,
							geometry = { Size = Frame1.Size, AutomaticSize = Frame1.AutomaticSize }
						}),
						corner = function(Callback)
							-- upvalues: FormulaResult (copy), TypesVector2 (upval)
							local CallbackResult = Callback(FormulaResult)
							
							return TypesVector2.new(CallbackResult.x, CallbackResult.y)
						end,
						size = AtRestResultEntry,
						radius = function(p8): number
							-- upvalues: p1 (upval)
							return (math.min(6, (p1.metric("radii.control", p8))))
						end
					})))
				})
			end, { motion = Motion })
		})
	end)
end