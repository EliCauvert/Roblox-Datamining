local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local ReducedFunction = require("./motion").reduced
local _ = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./navigation_props")
local NavMenuItemsModule = require("./nav_menu_items")
local NavMenuRowsModule = require("./nav_menu_rows")
local OverlayArrivalModule = require("./overlay_arrival")

local function _(List, Id)
	for _, value in List do
		if value.divider ~= true and value.id == Id then
			return value
		end
	end
	return nil
end

return function(p1, p2, p3)
	-- upvalues: NavMenuItemsModule (copy), NavMenuRowsModule (copy), OverlayArrivalModule (copy), ReducedFunction (copy), OverlayPartsModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local ReadSourceFunction = p1.readSource
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesUDim = p1.types.UDim
	local NavMenuItemsModuleResult = NavMenuItemsModule(p1)
	local ActionItemFunction = NavMenuItemsModuleResult.actionItem
	local MenuItemsFunction = NavMenuItemsModuleResult.menuItems
	local ResolveWidthFunction = NavMenuItemsModuleResult.resolveWidth
	local NavMenuRowsModuleResult = NavMenuRowsModule(p1, p2, p3)
	
	local function padding(p4)
		-- upvalues: TypesUDim (copy), p1 (copy)
		return TypesUDim.new(0, p1.metric("space.xs", p4))
	end
	
	return function(p4, Callback, p5, p6, p7, p8, p9, Enabled)
		-- upvalues: ReadFunction (copy), ActionItemFunction (copy), MenuItemsFunction (copy), p1 (copy), Compose (copy), OverlayArrivalModule (upval), p3 (copy), ReducedFunction (upval), Runtime (copy), ReadSourceFunction (copy), ReadFunction (copy), ReadFunction (copy), TypesUDim (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), p2 (copy), OverlayPartsModule (upval), NavMenuRowsModuleResult (copy), ReadFunction (copy), ResolveWidthFunction (copy), TypesVector2 (copy), padding (copy)
		local Menu = p1.motionTiming("menu")
		local Sheet = p1.motionTiming("sheet")
		local P10 = p8 or { enter = Menu.enter, exit = Menu.exit }
		local Present = p1.motionEase("present")
		local MotionDistancesMenuSlide = p1.metric("motion.distances.menuSlide")
		local MotionMaterializeMenu = p1.metric("motion.materialize.menu")
		local CellResult = Compose.cell(false)
		
		if p7 then
			OverlayArrivalModule.prepare(p7, CellResult)
		end
		local AppearanceResult = if p7 then p3.appearance(p7, P10, CellResult) else nil
		local HitFloorResult = p1.hitFloor()
		local CellResult1 = Compose.cell({})
		local CellResult2 = Compose.cell({})
		local RowNodes = {}
		local Callback1 = nil
		local Removed = nil
		local CellResult3 = Compose.cell(false)
		local ReducedResult = ReducedFunction(p1)
		local TimelineResult = Runtime.timeline({ autoplay = false, duration = Menu.enter })
		local CellResult4 = Compose.cell(0)
		local CellResult5 = Compose.cell(true)
		local Flag = false
		local Count = 0
		Compose.watch(function(Callback)
			-- upvalues: CellResult1 (copy), Count (ref), CellResult4 (copy), Flag (ref)
			local Count1 = #Callback(CellResult1)
			
			if Count1 ~= Count then
				CellResult4:set(if Count < Count1 then 1 else -1)
				Count = Count1
				Flag = true
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: CellResult5 (copy), Flag (ref), TimelineResult (copy)
			if Callback(CellResult5) and Flag then
				Flag = false
				TimelineResult:restart()
			end
		end)
		local v1 = 1
		
		local function level(Callback)
			-- upvalues: p7 (copy), ReadSourceFunction (upval), v1 (ref), CellResult4 (copy), ReducedResult (copy), CellResult5 (copy), Present (copy), TimelineResult (copy)
			if p7 and ReadSourceFunction(p7.exiting, Callback) then
				return v1
			elseif (if Callback then Callback(CellResult4) else CellResult4:peek()) == 0 or ReducedResult(Callback) then
				v1 = 1
				
				return 1
			elseif ReadSourceFunction(CellResult5, Callback) then
				v1 = Present(ReadSourceFunction(TimelineResult.progress, Callback))
				
				return v1
			else
				v1 = 0
				
				return 0
			end
		end
		
		local Config = if AppearanceResult then {
			opacity = function(p10)
				-- upvalues: AppearanceResult (copy), ReadSourceFunction (upval), CellResult3 (copy), level (copy)
				return AppearanceResult.opacity(p10) * (if ReadSourceFunction(CellResult3, p10) then 1 else level(p10))
			end,
			travel = function(p10)
				-- upvalues: AppearanceResult (copy), ReadSourceFunction (upval), CellResult3 (copy), level (copy)
				return AppearanceResult.travel(p10) * (if ReadSourceFunction(CellResult3, p10) then 1 else level(p10))
			end
		} else nil
		local FormulaResult = Compose.formula(function(p10)
			-- upvalues: MenuItemsFunction (copy), ReadFunction (copy), p4 (copy)
			return MenuItemsFunction(ReadFunction(p4.items, p10), p10)
		end)
		local FormulaResult1 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult (copy), CellResult1 (copy), ReadFunction (copy)
			local CallbackResult = Callback(FormulaResult)
			local v2 = nil
			
			for _, value in Callback(CellResult1) do
				v2 = nil
				
				for _, value1 in CallbackResult do
					if value1.divider ~= true and value1.id == value then
						v2 = value1
						break
					end
				end
				if not v2 or not v2.children then break end
				CallbackResult = ReadFunction(v2.children, Callback)
			end
			return CallbackResult
		end)
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult (copy), CellResult1 (copy), ReadFunction (copy)
			local CallbackResult = Callback(FormulaResult)
			local Ids = {}
			local v3 = nil
			
			for _, value in CellResult1:peek() do
				v3 = nil
				
				for _, value1 in CallbackResult do
					if value1.divider ~= true and value1.id == value then
						v3 = value1
						break
					end
				end
				if not v3 or not v3.children then break end
				table.insert(Ids, value)
				CallbackResult = ReadFunction(v3.children, Callback)
			end
			if #Ids ~= #CellResult1:peek() then
				CellResult1:set(Ids)
			end
		end)
		
		local function back()
			-- upvalues: CellResult1 (copy), Callback (copy), Removed (ref)
			local Copy = table.clone(CellResult1:peek())
			
			if #Copy == 0 then
				Callback()
				
				return
			else
				Removed = table.remove(Copy)
				CellResult1:set(Copy)
			end
		end
		
		local CellResult6 = Compose.cell({})
		
		local function landing(PeekResult): string?
			-- upvalues: ActionItemFunction (copy), ReadSourceFunction (upval), ReadFunction (upval)
			for _, value in PeekResult do
				if value.divider ~= true then
					local ActionItemResult = ActionItemFunction(value)
					
					if (if ActionItemResult.selected == nil then ReadFunction(ActionItemResult.marked) == true else ReadSourceFunction(ActionItemResult.selected) == ActionItemResult.value) and ReadFunction(ActionItemResult.enabled) ~= false then
						return (tostring(value.id))
					end
				end
			end
			return nil
		end
		
		local config = {
			hitFloor = HitFloorResult,
			sheeted = CellResult3,
			path = CellResult1,
			rowNodes = RowNodes,
			widths = CellResult6,
			enter = function(p10, p11, p12)
				-- upvalues: Callback1 (ref)
				Callback1(p10, p11, p12)
			end,
			close = Callback
		}
		
		local function rowPadding(Callback)
			-- upvalues: CellResult3 (copy), TypesUDim (upval), p1 (upval)
			return if Callback(CellResult3) then TypesUDim.new(0, 8) else TypesUDim.new(0, p1.metric("space.xs", Callback))
		end
		
		local Object = Host.Frame("MenuRows")({
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y,
			Host.UIListLayout({
				FillDirection = TypesEnum.FillDirection.Vertical,
				SortOrder = TypesEnum.SortOrder.LayoutOrder,
				Padding = function(Callback)
					-- upvalues: TypesUDim (upval), CellResult3 (copy)
					return TypesUDim.new(0, if Callback(CellResult3) then 8 else 0)
				end
			}),
			Compose.show(function(): boolean
				-- upvalues: p4 (copy)
				return p4.query ~= nil
			end, function()
				-- upvalues: p2 (upval), p4 (copy)
				return p2.TextInput("Search")({
					placeholder = "Search",
					LayoutOrder = -2,
					value = assert(p4.query)
				})
			end),
			Compose.show(function(Callback)
				-- upvalues: CellResult1 (copy), CellResult3 (copy)
				return #Callback(CellResult1) > 0 and Callback(CellResult3)
			end, function()
				-- upvalues: OverlayPartsModule (upval), p1 (upval), p2 (upval), p4 (copy), back (copy), TypesUDim2 (upval)
				return OverlayPartsModule.back(p1, p2, p4.backLabel, back, { LayoutOrder = -1, Size = TypesUDim2.new(1, 0, 0, 44) })
			end),
			Compose.keyed({
				from = Compose.formula(function(Callback)
					-- upvalues: FormulaResult1 (copy), ReadFunction (upval), ActionItemFunction (copy)
					local List = {}
					local IsNotDivider = false
					
					for i, Item in Callback(FormulaResult1) do
						local Text = tostring(Item.id or i)
						local IsDivider = Item.divider == true
						local ReadResult = nil
						
						if not IsDivider then
							ReadResult = ReadFunction(ActionItemFunction(Item).sectionTitle, Callback)
							IsDivider = ReadResult == nil or ReadResult == ""
						end
						if not IsDivider then
							table.insert(List, { key = "Section:" .. Text, heading = ReadResult })
							IsNotDivider = false
						end
						table.insert(List, {
							key = Text,
							item = Item,
							ruled = IsNotDivider and Item.divider ~= true
						})
						IsNotDivider = Item.divider ~= true
					end
					return List
				end),
				key = function(p10): string
					local Item = p10.item
					
					return (if Item and Item.divider ~= true and Item.description ~= nil then "D:" else "P:") .. p10.key
				end,
				render = function(p10, p11)
					-- upvalues: NavMenuRowsModuleResult (upval), config (copy)
					return NavMenuRowsModuleResult.entry(p10, p11, config)
				end
			}),
			Host.UIPadding({
				PaddingTop = rowPadding,
				PaddingBottom = rowPadding,
				PaddingLeft = rowPadding,
				PaddingRight = rowPadding
			})
		})
		
		if Enabled ~= nil and Enabled ~= false then
			p3.attach(Object, {
				Compose.show(function(Callback)
					-- upvalues: Enabled (copy), CellResult3 (copy)
					return Enabled == true or Callback(CellResult3)
				end, function()
					-- upvalues: p2 (upval), OverlayPartsModule (upval), p1 (upval), TypesEnum (upval), Callback (copy)
					return p2.Button("CloseCommand")({
						name = "Close",
						icon = "close",
						LayoutOrder = 2147483647,
						Size = OverlayPartsModule.closeRow(p1),
						AutomaticSize = TypesEnum.AutomaticSize.None,
						onActivate = function(_, _)
							-- upvalues: Callback (upval)
							Callback()
						end
					})
				end)
			})
		end
		local CellResult7 = Compose.cell(0)
		
		local function panelWidth(Callback): number
			-- upvalues: CellResult6 (copy), ReadFunction (upval), p4 (copy), CellResult7 (copy), ResolveWidthFunction (upval)
			local Largest = 0
			
			for _, value in Callback(CellResult6) do
				Largest = math.max(Largest, value)
			end
			local ClampedValue = math.clamp(Largest + 48, 220, 400)
			local ReadResult = ReadFunction(p4.width, Callback)
			local CallbackResult: number = Callback(CellResult7)
			
			if ReadResult == nil then
				return if CallbackResult > 0 then math.min(ClampedValue, CallbackResult) else ClampedValue
			else
				local ResolveWidthResult: number = ResolveWidthFunction(ReadResult, ClampedValue, CallbackResult, Callback)
				
				return if CallbackResult > 0 then math.min(ResolveWidthResult, CallbackResult) else ResolveWidthResult
			end
		end
		
		Runtime.decorate(Object, {
			Position = function(Callback)
				-- upvalues: CellResult4 (copy), CellResult3 (copy), ReducedResult (copy), TypesUDim2 (upval), MotionDistancesMenuSlide (copy), level (copy)
				local CallbackResult = Callback(CellResult4)
				
				return if Callback(CellResult3) and CallbackResult ~= 0 and not ReducedResult(Callback) then TypesUDim2.fromOffset(CallbackResult * MotionDistancesMenuSlide * (1 - level(Callback)), 0) else TypesUDim2.fromOffset(0, 0)
			end
		})
		local ScrollFrame = Host.ScrollingFrame("MenuScroll")({
			Selectable = false,
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			BorderSizePixel = 0,
			AutomaticCanvasSize = TypesEnum.AutomaticSize.Y,
			CanvasSize = TypesUDim2.fromOffset(0, 0),
			ScrollingDirection = TypesEnum.ScrollingDirection.Y,
			ScrollBarThickness = 4,
			VerticalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar,
			Object
		})
		local MenuLevel = p1.fade({
			Name = "MenuLevel",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			ScrollFrame
		}, nil, false)
		p1.fadeTo(MenuLevel, function(Callback): number
			-- upvalues: CellResult3 (copy), level (copy)
			return if Callback(CellResult3) then 1 - level(Callback) else 0
		end)
		local Frame = Host.Frame("MenuPanel")({
			Size = TypesUDim2.fromOffset(280, 0),
			BorderSizePixel = 0,
			if Config then p1.styled(p1.fade({
				Name = "MenuGroup",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromScale(1, 1),
				GroupTransparency = function(p10): number
					-- upvalues: Config (copy)
					return 1 - Config.opacity(p10)
				end,
				MenuLevel
			}, true, false), "menu-group") else MenuLevel
		})
		
		if Config then
			p3.attach(Frame, {
				Host.UIGradient("PresentationFade")({
					Transparency = function(p10)
						-- upvalues: p1 (upval), Config (copy)
						return p1.types.NumberSequence.new(1 - Config.opacity(p10))
					end
				})
			})
		end
		p1.styled(Frame, "menu")
		p3.skin(Frame, nil, {
			reserve = function(): number
				return 0
			end
		})
		local v4 = ""
		local AtRestResult, AtRestResult2 = p3.atRest(if Config then Config.travel else function(): number
			return 1
		end, CellResult, { Frame, Object }, function(Callback): string
			-- upvalues: CellResult1 (copy), p7 (copy), v4 (ref)
			local Joined = table.concat(Callback(CellResult1), "/")
			
			if p7 and Callback(p7.exiting) then
				return v4
			else
				v4 = Joined
				
				return Joined
			end
		end)
		local AtRestResultEntry = AtRestResult[1]
		local AtRestResultEntry1 = AtRestResult[2]
		local CellResult8 = Compose.cell(AtRestResultEntry1:peek())
		local SettledResult = p1.runtime.settled({
			sample = function(): string
				-- upvalues: AtRestResultEntry1 (copy)
				return (tostring(AtRestResultEntry1:peek()))
			end,
			ready = function(): boolean
				-- upvalues: AtRestResultEntry1 (copy)
				local PeekResult = AtRestResultEntry1:peek()
				
				return PeekResult.X > 0 and PeekResult.Y > 0
			end,
			restart = function(Callback): string
				-- upvalues: AtRestResultEntry1 (copy)
				return (tostring(Callback(AtRestResultEntry1)))
			end
		})
		Compose.watch(function(Callback)
			-- upvalues: AtRestResultEntry1 (copy), AtRestResult2 (copy), SettledResult (copy), CellResult8 (copy)
			local CallbackResult = Callback(AtRestResultEntry1)
			
			if not Callback(AtRestResult2) or Callback(SettledResult) then
				CellResult8:set(CallbackResult)
			end
		end)
		
		Callback1 = function(p10, p11, p12)
			-- upvalues: CellResult1 (copy), RowNodes (copy), CellResult2 (copy), Frame (copy), Removed (ref)
			local Copy = table.clone(p12 or CellResult1:peek())
			table.insert(Copy, p10)
			local P27 = p11 or RowNodes[p10]
			local Copy1 = table.clone(CellResult2:peek())
			Copy1[#Copy] = if P27 then P27.AbsolutePosition.Y - Frame.AbsolutePosition.Y else 0
			CellResult2:set(Copy1)
			Removed = nil
			CellResult1:set(Copy)
		end
		
		Compose.watch(function(Callback)
			-- upvalues: CellResult5 (copy), AtRestResult2 (copy)
			CellResult5:set(Callback(AtRestResult2))
		end)
		local AbsolutePositionResult = p1.observe.AbsolutePosition(p5)
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(p5)
		
		local function _(Callback)
			-- upvalues: p9 (copy), AbsolutePositionResult (copy), TypesVector2 (upval), AbsoluteSizeResult (copy)
			local CallbackResult = if p9 then Callback(p9) else nil
			local CallbackResult1 = if CallbackResult then CallbackResult else Callback(AbsolutePositionResult)
			
			if CallbackResult then
				return CallbackResult1, TypesVector2.zero
			else
				return CallbackResult1, (Callback(AbsoluteSizeResult))
			end
		end
		
		local ModalResult = if p6 then Host.Frame("SuggestionsOverlay")({
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1),
			ZIndex = 100,
			Frame
		}) else p3.modal(function()
			-- upvalues: Frame (copy)
			return Frame
		end, back, {
			backgroundTransparency = function(Callback): number
				-- upvalues: CellResult3 (copy)
				return if Callback(CellResult3) then 0.5 else 1
			end,
			appearance = if Config then Config.opacity else nil,
			onOutside = Callback,
			exiting = if p7 then p7.exiting else nil,
			initialFocus = landing(FormulaResult1:peek())
		})
		
		if p6 then
			p1.modalPortal(ModalResult, p5)
			Runtime.decorate(Frame, { ZIndex = 101 })
		end
		local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(ModalResult)
		local AbsolutePositionResult1 = p1.observe.AbsolutePosition(ModalResult)
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else Compose.cell(nil)
		local ParentResult = p1.observe.Parent(ModalResult)
		local FormulaResult2 = Compose.formula(function(Callback): boolean
			-- upvalues: ReadFunction (upval), p4 (copy), ParentResult (copy), AbsoluteSizeResult1 (copy), CellResult1 (copy), panelWidth (copy), PreferredInputResult (copy), TypesEnum (upval)
			local ReadResult = ReadFunction(p4.presentation, Callback)
			
			if ReadResult and ReadResult ~= "automatic" then
				return ReadResult == "sheet"
			else
				local CallbackResult = Callback(ParentResult)
				
				return (not CallbackResult or not CallbackResult:IsA("SurfaceGui")) and (Callback(AbsoluteSizeResult1).X > 0 and Callback(AbsoluteSizeResult1).X < math.max(600, #Callback(CellResult1) * 288 + panelWidth(Callback) + 16) or (Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch or Callback(PreferredInputResult) == TypesEnum.PreferredInput.Gamepad))
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult2 (copy), CellResult3 (copy), P10 (copy), Sheet (copy), Menu (copy)
			local CallbackResult = Callback(FormulaResult2)
			CellResult3:set(CallbackResult)
			P10.enter = if CallbackResult then Sheet.enter else Menu.enter
			P10.exit = if CallbackResult then Sheet.exit else Menu.exit
		end)
		local GuiService = p3.service("GuiService")
		
		local _ = function(Callback: (any) -> ())
			-- upvalues: AbsolutePositionResult1 (copy), ParentResult (copy), AbsoluteSizeResult1 (copy), AbsolutePositionResult (copy), ModalResult (copy)
			Callback(AbsolutePositionResult1)
			Callback(ParentResult)
			Callback(AbsoluteSizeResult1)
			Callback(AbsolutePositionResult)
			
			return ModalResult.AbsolutePosition
		end
		
		local function insets(Callback: (any) -> ())
			-- upvalues: GuiService (copy), ParentResult (copy), AbsoluteSizeResult1 (copy), ModalResult (copy), TypesEnum (upval)
			Callback(ParentResult)
			Callback(AbsoluteSizeResult1)
			local ScreenGui = ModalResult:FindFirstAncestorWhichIsA("ScreenGui")
			
			if GuiService == nil or ScreenGui == nil or not ScreenGui:IsA("ScreenGui") then
				return 0, 0, 0, 0
			end
			local Success, Result, Result3 = pcall(function()
				-- upvalues: GuiService (copy), ScreenGui (copy), TypesEnum (upval)
				return GuiService:GetInsetArea(ScreenGui.ScreenInsets), GuiService:GetInsetArea(TypesEnum.ScreenInsets.CoreUISafeInsets)
			end)
			
			if Success then
				local MinDelta = Result3.Min - Result.Min
				local MaxDelta = Result.Max - Result3.Max
				
				return math.max(0, MinDelta.X), math.max(0, MinDelta.Y), math.max(0, MaxDelta.X), (math.max(0, MaxDelta.Y))
			elseif ScreenGui.IgnoreGuiInset ~= true and ScreenGui.ScreenInsets ~= TypesEnum.ScreenInsets.None then
				return 0, 0, 0, 0
			else
				local Success1, Result1, Result3_1 = pcall(function()
					-- upvalues: GuiService (copy)
					return GuiService:GetGuiInset()
				end)
				
				if Success1 and typeof(Result1) == "Vector2" and typeof(Result3_1) == "Vector2" then
					return Result1.X, Result1.Y, Result3_1.X, Result3_1.Y
				else
					return 0, 0, 0, 0
				end
			end
		end
		
		Compose.watch(function(Callback)
			-- upvalues: insets (copy), CellResult7 (copy), AbsoluteSizeResult1 (copy)
			local InsetsResult, _, InsetsResult3 = insets(Callback)
			CellResult7:set((math.max(0, Callback(AbsoluteSizeResult1).X - InsetsResult - InsetsResult3 - 16)))
		end)
		
		local function designed(Callback)
			-- upvalues: p3 (upval), insets (copy), CellResult8 (copy), AbsoluteSizeResult1 (copy), p4 (copy), panelWidth (copy)
			local function _(p10)
				-- upvalues: p3 (upval), Callback (copy)
				return p3.inset(0, p10, nil, Callback)
			end
			
			local _, InsetsResult2, _, InsetsResult4 = insets(Callback)
			
			return panelWidth(Callback) + p3.inset(0, "left", nil, Callback) + p3.inset(0, "right", nil, Callback), (math.min(Callback(CellResult8).Y + p3.inset(0, "top", nil, Callback) + p3.inset(0, "bottom", nil, Callback), math.max(44, Callback(AbsoluteSizeResult1).Y - 24 - InsetsResult2 - InsetsResult4), if p4.maxHeight then math.max(60, p4.maxHeight) else 1e999))
		end
		
		local FormulaResult3 = Compose.formula(function(Callback)
			-- upvalues: AtRestResultEntry (copy), designed (copy), FormulaResult2 (copy), TypesVector2 (upval)
			local CallbackResult = Callback(AtRestResultEntry)
			local DesignedResult, DesignedResult2 = designed(Callback)
			
			return if CallbackResult.X > 0 and CallbackResult.Y <= 0 and DesignedResult > 0 and not Callback(FormulaResult2) then TypesVector2.new(CallbackResult.X, DesignedResult2 * CallbackResult.X / DesignedResult) else CallbackResult
		end)
		local v5 = nil
		local Zero = TypesVector2.zero
		
		local function place(Callback)
			-- upvalues: p7 (copy), v5 (ref), Zero (ref), p9 (copy), AbsolutePositionResult (copy), TypesVector2 (upval), AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), FormulaResult3 (copy), AbsolutePositionResult1 (copy), ParentResult (copy), ModalResult (copy), insets (copy), FormulaResult2 (copy), CellResult1 (copy), p4 (copy), CellResult4 (copy), CellResult2 (copy)
			if p7 and Callback(p7.exiting) and v5 then
				return v5, Zero
			end
			local CallbackResult = if p9 then Callback(p9) else nil
			local CallbackResult1 = if CallbackResult then CallbackResult else Callback(AbsolutePositionResult)
			local Zero1 = if CallbackResult then TypesVector2.zero else Callback(AbsoluteSizeResult)
			local CallbackResult2 = Callback(AbsoluteSizeResult1)
			local CallbackResult21 = Callback(FormulaResult3)
			Callback(AbsolutePositionResult1)
			Callback(ParentResult)
			Callback(AbsoluteSizeResult1)
			Callback(AbsolutePositionResult)
			local AbsolutePosition = ModalResult.AbsolutePosition
			local InsetsResult, InsetsResult2, InsetsResult3, InsetsResult4 = insets(Callback)
			local NewTypesVector = TypesVector2.new(InsetsResult + 8, InsetsResult2 + 8)
			local NewTypesVector1 = TypesVector2.new(CallbackResult2.X - InsetsResult3 - 8, CallbackResult2.Y - InsetsResult4 - 8)
			
			if Callback(FormulaResult2) then
				local NewTypesVector2 = TypesVector2.new(InsetsResult + 12, (math.max(12 + InsetsResult2, CallbackResult2.Y - InsetsResult4 - CallbackResult21.Y - 12)))
				v5 = NewTypesVector2
				Zero = TypesVector2.zero
				
				return NewTypesVector2, TypesVector2.zero
			end
			local XDelta = CallbackResult1.X - AbsolutePosition.X
			local YDelta = CallbackResult1.Y - AbsolutePosition.Y
			local Count = #Callback(CellResult1)
			local v6: number = if p9 and Callback(p9) then 0 else 4
			local Value = XDelta + Count * 288
			local NewYDelta = YDelta + Zero1.Y + v6
			local IsYBelow = false
			local IsXBelow = true
			local Edge = p4.edge or "bottom"
			local Align = p4.align or "start"
			
			local function _(p10, p11, p12)
				-- upvalues: Align (copy)
				return if Align == "center" then p10 + (p11 - p12) / 2 elseif Align == "end" then p10 + p11 - p12 else p10
			end
			
			local IsCountAbove: boolean = Count > 0 or (Edge == "top" or Edge == "bottom")
			
			if Count > 0 or Edge == "bottom" and Align == "start" then
				if CallbackResult2.Y > 0 and NewTypesVector1.Y < NewYDelta + CallbackResult21.Y then
					NewYDelta = YDelta - CallbackResult21.Y - v6
					IsYBelow = true
				end
			elseif IsCountAbove then
				local X: number = Zero1.X
				local X1: number = CallbackResult21.X
				Value = if Align == "center" then XDelta + (X - X1) / 2 elseif Align == "end" then XDelta + X - X1 else XDelta
				local NewYDelta1 = YDelta + Zero1.Y + v6
				local YDeltaDelta = YDelta - CallbackResult21.Y - v6
				IsYBelow = Edge == "bottom" and CallbackResult2.Y > 0 and NewTypesVector1.Y < NewYDelta1 + CallbackResult21.Y and NewTypesVector.Y <= YDeltaDelta or (Edge ~= "top" or YDeltaDelta >= NewTypesVector.Y or CallbackResult2.Y > 0 and NewYDelta1 + CallbackResult21.Y > NewTypesVector1.Y) and Edge == "top"
				NewYDelta = if IsYBelow then YDeltaDelta else NewYDelta1
			else
				local Y = Zero1.Y
				local Y1 = CallbackResult21.Y
				NewYDelta = if Align == "center" then YDelta + (Y - Y1) / 2 elseif Align == "end" then YDelta + Y - Y1 else YDelta
				local NewXDelta = XDelta + Zero1.X + 4
				local XDeltaDelta = XDelta - CallbackResult21.X - 4
				IsXBelow = (Edge ~= "trailing" or CallbackResult2.X <= 0 or NewTypesVector1.X >= NewXDelta + CallbackResult21.X or NewTypesVector.X > XDeltaDelta) and (Edge == "leading" and XDeltaDelta < NewTypesVector.X and (CallbackResult2.X <= 0 or NewXDelta + CallbackResult21.X <= NewTypesVector1.X) or Edge == "trailing")
				Value = if IsXBelow then NewXDelta else XDeltaDelta
				
				if CallbackResult2.Y > 0 then
					NewYDelta = math.clamp(NewYDelta, NewTypesVector.Y, (math.max(NewTypesVector.Y, NewTypesVector1.Y - CallbackResult21.Y)))
				end
			end
			if CallbackResult2.X > 0 then
				if Count > 0 then
					Value = math.clamp(XDelta, NewTypesVector.X, (math.max(NewTypesVector.X, NewTypesVector1.X - CallbackResult21.X - Count * 288))) + Count * 288
				else
					Value = math.clamp(Value, NewTypesVector.X, (math.max(NewTypesVector.X, NewTypesVector1.X - CallbackResult21.X)))
				end
			end
			if CallbackResult2.Y > 0 then
				NewYDelta = math.clamp(NewYDelta, NewTypesVector.Y, (math.max(NewTypesVector.Y, NewTypesVector1.Y - CallbackResult21.Y)))
			end
			local Largest = math.max(NewTypesVector.Y, NewYDelta)
			local CallbackResult3 = if p7 then Callback(p7.exiting) else false
			local NewTypesVector3 = nil
			
			if IsCountAbove and (Count > 0 or Callback(CellResult4) < 0) and (not CallbackResult3 or Count ~= 0) then
				local IsCallbackResultBelow = Callback(CellResult4) < 0
				NewTypesVector3 = TypesVector2.new(if IsCallbackResultBelow then CallbackResult21.X else 0, (math.clamp(Callback(CellResult2)[if IsCallbackResultBelow then Count + 1 else Count] or 0, 0, CallbackResult21.Y)))
			else
				NewTypesVector3 = if IsCountAbove then TypesVector2.new(math.clamp((if Count > 0 or Align == "start" then XDelta + Count * 288 elseif Align == "end" then XDelta + Zero1.X else XDelta + Zero1.X / 2) - Value, 0, CallbackResult21.X), if IsYBelow then CallbackResult21.Y else 0) else TypesVector2.new(if IsXBelow then 0 else CallbackResult21.X, (math.clamp((if Align == "start" then YDelta elseif Align == "end" then YDelta + Zero1.Y else YDelta + Zero1.Y / 2) - Largest, 0, CallbackResult21.Y)))
			end
			local NewTypesVector31 = TypesVector2.new(Value, Largest)
			v5 = NewTypesVector31
			Zero = NewTypesVector3
			
			return NewTypesVector31, NewTypesVector3
		end
		
		local Frame1 = {
			Size = function(Callback)
				-- upvalues: designed (copy), FormulaResult2 (copy), insets (copy), TypesUDim2 (upval)
				local DesignedResult, DesignedResult2 = designed(Callback)
				
				if Callback(FormulaResult2) then
					local InsetsResult, _, InsetsResult3 = insets(Callback)
					
					return TypesUDim2.new(1, -24 - InsetsResult - InsetsResult3, 0, DesignedResult2)
				else
					return TypesUDim2.fromOffset(DesignedResult, DesignedResult2)
				end
			end
		}
		Runtime.decorate(Frame, Frame1)
		
		if Config then
			p3.popover(Frame, Config.travel, place, {
				pinned = true,
				from = MotionMaterializeMenu,
				rested = AtRestResult2,
				size = FormulaResult3,
				geometry = { Size = Frame1.Size, AutomaticSize = Frame1.AutomaticSize },
				rise = function(Callback): number?
					-- upvalues: FormulaResult2 (copy), insets (copy), AtRestResultEntry (copy)
					if Callback(FormulaResult2) then
						local _, _, _, InsetsResult4 = insets(Callback)
						
						return Callback(AtRestResultEntry).Y + 12 + InsetsResult4
					else
						return nil
					end
				end
			})
		else
			Runtime.decorate(Frame, {
				Position = function(p10)
					-- upvalues: place (copy), TypesUDim2 (upval)
					local PlaceResult = place(p10)
					
					return TypesUDim2.fromOffset(PlaceResult.X, PlaceResult.Y)
				end
			})
		end
		local GuiService1 = p3.service("GuiService")
		local ObserveResult = if GuiService1 then p1.selection.observe() else Compose.cell(nil)
		
		local function selectedBranch(p10)
			-- upvalues: p1 (upval), ObserveResult (copy), FormulaResult1 (copy), ReadFunction (upval)
			local Source = p1.readSource(ObserveResult, p10)
			
			for _, value in p1.readSource(FormulaResult1, p10) do
				if value.divider ~= true and Source and value.id == Source.Name and value.children and ReadFunction(value.enabled, p10) ~= false then
					return value
				end
			end
			return nil
		end
		
		p3.attach(ModalResult, {
			Compose.show(function(Callback): boolean
				-- upvalues: selectedBranch (copy), CellResult1 (copy)
				return selectedBranch(Callback) ~= nil or #Callback(CellResult1) > 0
			end, function()
				-- upvalues: p1 (upval), ModalResult (copy), TypesEnum (upval), selectedBranch (copy), Callback1 (ref), CellResult1 (copy), back (copy), Compose (upval)
				p1.action(ModalResult, "MenuRight", { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }, function(p11): boolean
					-- upvalues: selectedBranch (upval)
					return selectedBranch(p11) ~= nil
				end, function()
					-- upvalues: selectedBranch (upval), Callback1 (upval)
					local SelectedBranchResult = selectedBranch()
					
					if SelectedBranchResult then
						Callback1(assert(SelectedBranchResult.id))
					end
				end, { priority = 2100, capture = true })
				p1.action(ModalResult, "MenuLeft", { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft }, function(Callback): boolean
					-- upvalues: CellResult1 (upval)
					return #Callback(CellResult1) > 0
				end, back, { priority = 2100, capture = true })
				
				return Compose.fragment(function()
					return {}
				end)
			end)
		})
		local SelectingResult = p3.selecting()
		local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(ScrollFrame)
		local UIListLayout = Object:FindFirstChildWhichIsA("UIListLayout")
		local AbsoluteContentSizeResult = if UIListLayout then p1.observe.AbsoluteContentSize(UIListLayout) else Compose.cell(TypesVector2.zero)
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult1 (copy), ParentResult (copy), GuiService1 (copy), p6 (copy), SelectingResult (copy), Removed (ref), p3 (upval), Frame (copy), landing (copy), Object (copy), AbsoluteContentSizeResult (copy), ReadFunction (upval), ActionItemFunction (copy), ModalResult (copy), p1 (upval)
			local CallbackResult = Callback(FormulaResult1)
			Callback(ParentResult)
			
			if GuiService1 and not p6 and SelectingResult(Callback) then
				local FirstSelectableResult = if Removed then p3.firstSelectable(Frame, Removed) else nil
				
				if not FirstSelectableResult then
					local LandingResult = landing(CallbackResult)
					FirstSelectableResult = if LandingResult then p3.firstSelectable(Frame, LandingResult) else nil
					
					if LandingResult and not FirstSelectableResult and Object:FindFirstChild(LandingResult) == nil then
						Callback(AbsoluteContentSizeResult)
						
						return
					end
				end
				repeat
					if not FirstSelectableResult then
						for _, value in CallbackResult do
							if value.divider ~= true and ReadFunction(value.enabled, Callback) ~= false then
								local ActionItemResult = ActionItemFunction(value)
								
								if if ActionItemResult.selected then ActionItemResult.selected:peek() == ActionItemResult.value else ReadFunction(ActionItemResult.marked, Callback) == true then
									FirstSelectableResult = p3.firstSelectable(Frame, (tostring(ActionItemResult.id)))
									
									if FirstSelectableResult then break end
								else
									continue
								end
							else
								continue
							end
						end
					end
					if FirstSelectableResult then break end
					for _, value1 in CallbackResult do
						if not value1.divider and ReadFunction(value1.enabled, Callback) ~= false then
							FirstSelectableResult = p3.firstSelectable(Frame, (tostring(value1.id)))
							
							if FirstSelectableResult then continue end
						else
							continue
						end
					end
					break
				until true
				if FirstSelectableResult and ModalResult.Parent then
					p1.selection.set(FirstSelectableResult)
				end
			end
		end)
		local v7 = nil
		local HeartbeatConnection = nil
		Compose.cleanup(function()
			-- upvalues: HeartbeatConnection (ref)
			if HeartbeatConnection then
				HeartbeatConnection:Disconnect()
				HeartbeatConnection = nil
			end
		end)
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteContentSizeResult (copy), CellResult1 (copy), v7 (ref), landing (copy), FormulaResult1 (copy), AbsoluteSizeResult2 (copy), AtRestResultEntry1 (copy), Object (copy), ScrollFrame (copy), UIListLayout (copy), TypesVector2 (upval), p1 (upval), HeartbeatConnection (ref)
			local CallbackResult = Callback(AbsoluteContentSizeResult)
			local Text = table.concat(Callback(CellResult1), "/") .. "@" .. tostring(if CallbackResult then CallbackResult.Y else 0)
			
			if v7 == Text then return end
			local LandingResult = landing(Callback(FormulaResult1))
			
			if LandingResult == nil then
				v7 = Text
				
				return
			end
			Callback(AbsoluteSizeResult2)
			Callback(AtRestResultEntry1)
			local LandingResult1 = Object:FindFirstChild(LandingResult)
			
			if LandingResult1 == nil or not LandingResult1:IsA("GuiObject") then return end
			local function target(): number?
				-- upvalues: ScrollFrame (upval), Object (upval), LandingResult1 (copy), UIListLayout (upval)
				local Y: number = ScrollFrame.AbsoluteSize.Y
				local Y1: number = Object.AbsoluteSize.Y
				
				if Y <= 0 or Y1 <= 0 or LandingResult1.Parent ~= Object then
					return nil
				end
				local Offset = if UIListLayout then UIListLayout.Padding.Offset else 0
				local NewY = Object.AbsolutePosition.Y - ScrollFrame.AbsolutePosition.Y + ScrollFrame.CanvasPosition.Y
				local Largest = math.max(Y1 + NewY, ScrollFrame.AbsoluteCanvasSize.Y)
				local UIPadding = Object:FindFirstChildWhichIsA("UIPadding")
				
				if UIPadding then
					local Success, Result = pcall(function()
						-- upvalues: UIPadding (copy)
						return UIPadding:GetStyled("PaddingTop")
					end)
					NewY += if Success then Result.Offset else UIPadding.PaddingTop.Offset
				end
				local NewY1: number = NewY
				
				for _, Gui in Object:GetChildren() do
					if Gui ~= LandingResult1 and Gui:IsA("GuiObject") and Gui.Visible and Gui.LayoutOrder < LandingResult1.LayoutOrder then
						NewY1 += Gui.AbsoluteSize.Y + Offset
					end
				end
				return (math.clamp(NewY1 + LandingResult1.AbsoluteSize.Y / 2 - Y / 2, 0, (math.max(0, Largest - Y))))
			end
			
			local TargetResult = target()
			
			if TargetResult == nil then return end
			ScrollFrame.CanvasPosition = TypesVector2.new(ScrollFrame.CanvasPosition.X, TargetResult)
			v7 = Text
			local Services = p1.config.services
			local RunService = Services and Services.RunService
			
			if RunService then
				local Count = 2
				
				if HeartbeatConnection then
					HeartbeatConnection:Disconnect()
					HeartbeatConnection = nil
				end
				HeartbeatConnection = RunService.Heartbeat:Connect(function()
					-- upvalues: Count (ref), target (copy), ScrollFrame (upval), TypesVector2 (upval), HeartbeatConnection (upval)
					Count -= 1
					local TargetResult = target()
					
					if TargetResult and ScrollFrame.CanvasPosition.Y ~= TargetResult then
						ScrollFrame.CanvasPosition = TypesVector2.new(ScrollFrame.CanvasPosition.X, TargetResult)
					end
					if Count <= 0 and HeartbeatConnection then
						HeartbeatConnection:Disconnect()
						HeartbeatConnection = nil
					end
				end)
			end
		end)
		p3.attach(ModalResult, {
			Compose.keyed({
				from = function(Callback)
					-- upvalues: FormulaResult2 (copy), FormulaResult (copy), CellResult1 (copy), ReadFunction (copy)
					if Callback(FormulaResult2) then
						return {}
					end
					local List = {}
					local CallbackResult = Callback(FormulaResult)
					local List1 = {}
					local v8 = nil
					
					for Depth, value in Callback(CellResult1) do
						table.insert(List, {
							id = table.concat(List1, "/"),
							items = CallbackResult,
							prefix = table.clone(List1),
							depth = Depth
						})
						v8 = nil
						
						for _, value1 in CallbackResult do
							if value1.divider ~= true and value1.id == value then
								v8 = value1
								break
							end
						end
						if not v8 or not v8.children then break end
						CallbackResult = ReadFunction(v8.children, Callback)
						table.insert(List1, value)
					end
					return List
				end,
				key = function(p11)
					return p11.id
				end,
				render = function(p11)
					-- upvalues: Compose (upval), p1 (upval), Host (upval), TypesUDim2 (upval), TypesEnum (upval), place (copy), insets (copy), CellResult1 (copy), AbsoluteSizeResult1 (copy), TypesVector2 (upval), padding (upval), NavMenuRowsModuleResult (upval), config (copy)
					local CellResult = Compose.cell(0)
					local Menu = p1.styled(Host.ScrollingFrame("AncestorMenu")({
						ZIndex = 103,
						CanvasSize = TypesUDim2.fromOffset(0, 0),
						AutomaticCanvasSize = TypesEnum.AutomaticSize.Y,
						ScrollingDirection = TypesEnum.ScrollingDirection.Y,
						ScrollBarThickness = 4,
						Selectable = false,
						BorderSizePixel = 0,
						Size = TypesUDim2.fromOffset(280, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y,
						Position = function(Callback)
							-- upvalues: place (upval), insets (upval), CellResult (copy), TypesUDim2 (upval), CellResult1 (upval), p11 (copy), AbsoluteSizeResult1 (upval)
							local PlaceResult = place(Callback)
							local _, InsetsResult2, _, InsetsResult4 = insets(Callback)
							
							return TypesUDim2.fromOffset(PlaceResult.X - (#Callback(CellResult1) - Callback(p11).depth + 1) * 288, (math.clamp(PlaceResult.Y, InsetsResult2 + 8, (math.max(InsetsResult2 + 8, Callback(AbsoluteSizeResult1).Y - InsetsResult4 - 8 - Callback(CellResult))))))
						end,
						Host.UISizeConstraint({
							MaxSize = function(Callback)
								-- upvalues: insets (upval), TypesVector2 (upval), AbsoluteSizeResult1 (upval)
								local _, InsetsResult2, _, InsetsResult4 = insets(Callback)
								
								return TypesVector2.new(280, (math.max(44, Callback(AbsoluteSizeResult1).Y - InsetsResult2 - InsetsResult4 - 16)))
							end
						}),
						Host.UIListLayout({
							FillDirection = TypesEnum.FillDirection.Vertical,
							SortOrder = TypesEnum.SortOrder.LayoutOrder
						}),
						Host.UIPadding({
							PaddingTop = padding,
							PaddingBottom = padding,
							PaddingLeft = padding,
							PaddingRight = padding
						}),
						Compose.keyed({
							from = function(Callback)
								-- upvalues: p11 (copy)
								return Callback(p11).items
							end,
							key = function(p12, p13)
								return p12.id or p13
							end,
							render = function(p12, p13)
								-- upvalues: NavMenuRowsModuleResult (upval), p11 (copy), config (upval)
								return NavMenuRowsModuleResult.ancestor(p12, p13, p11, config)
							end
						})
					}), "menu")
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(Menu)
					Compose.watch(function(Callback)
						-- upvalues: CellResult (copy), AbsoluteSizeResult (copy)
						CellResult:set(Callback(AbsoluteSizeResult).Y)
					end)
					
					return Menu
				end
			})
		})
		
		return ModalResult
	end
end