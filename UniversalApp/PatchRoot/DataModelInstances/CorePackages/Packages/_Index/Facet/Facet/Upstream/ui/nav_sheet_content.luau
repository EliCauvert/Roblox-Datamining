local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./overlay_types")
local _ = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local _ = require("./navigation_props")
local _ = require("./input_props")
local _ = require("./nav_sheet_gesture")

return function(p1, p2, p3)
	-- upvalues: OverlayPartsModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	return function(p4, p5)
		-- upvalues: Compose (copy), p2 (copy), OverlayPartsModule (upval), p1 (copy), TypesEnum (copy), Host (copy), TypesUDim2 (copy), Runtime (copy), p3 (copy), TypesVector2 (copy), ReadFunction (copy)
		local Grabber = p5.grabber
		local CanDismissFunction = p5.canDismiss
		local CloseFunction = p5.close
		local Unit = p5.unit
		local Extent = p5.extent
		local PadFunction = p5.pad
		local StandingFunction = p5.standing
		local HugHeight = p5.hugHeight
		local Tallest = p5.tallest
		local List = {}
		local CellResult = Compose.cell(false)
		local v1 = nil
		local Hero = p4.hero
		local IsSticky: boolean = Hero ~= nil and Hero.sticky == true
		local HasHero: boolean = p4.header == false and Hero ~= nil
		local v2 = nil
		
		local function showClose(p6)
			-- upvalues: p4 (copy), p5 (copy), CanDismissFunction (copy)
			return p4.closeButton ~= false and (p4.closeButton ~= nil or not p5.showGrabber(p6) and CanDismissFunction(p6))
		end
		
		local function _(p6)
			-- upvalues: v2 (ref)
			v2 = p6
			p6.SelectionOrder = -1
			
			return p6
		end
		
		local function closeControl()
			-- upvalues: p4 (copy), CloseFunction (copy), p2 (upval), HasHero (copy), v2 (ref), showClose (copy), OverlayPartsModule (upval), p1 (upval), TypesEnum (upval)
			local CloseButton = p4.closeButton
			
			local function activate()
				-- upvalues: CloseFunction (upval)
				CloseFunction("close")
			end
			
			if CloseButton == false then
				return nil
			elseif CloseButton == nil or CloseButton == true then
				local v3 = p2.Button("Close")({
					name = "Close",
					icon = "close",
					LayoutOrder = 2,
					Visible = showClose,
					appearance = if HasHero then "inverse" else nil,
					Size = OverlayPartsModule.closeTarget(p1),
					AutomaticSize = TypesEnum.AutomaticSize.None,
					onActivate = activate
				})
				v2 = v3
				v3.SelectionOrder = -1
				
				return v3
			else
				local v4 = p2.Button("Close")({
					icon = "close",
					LayoutOrder = 2,
					label = CloseButton,
					appearance = if HasHero then "inverse" else "utility",
					onActivate = activate
				})
				v2 = v4
				v4.SelectionOrder = -1
				
				return v4
			end
		end
		
		local function heroFrame()
			-- upvalues: Hero (copy), OverlayPartsModule (upval), p1 (upval), Host (upval), TypesEnum (upval), HasHero (copy), TypesUDim2 (upval), Runtime (upval), p3 (upval), closeControl (copy), TypesVector2 (upval)
			local v3 = assert(Hero)
			local Hero1 = OverlayPartsModule.media(p1, v3, "Hero")
			
			if v3.content then
				local List = {
					Host.UIListLayout({ SortOrder = TypesEnum.SortOrder.LayoutOrder }),
					Host.UIPadding({
						PaddingLeft = p1.types.UDim.new(0, 16),
						PaddingRight = p1.types.UDim.new(0, 16),
						PaddingBottom = p1.types.UDim.new(0, 12)
					})
				}
				
				if HasHero then
					table.insert(List, Host.Frame("Strip")({
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						Size = function(p6)
							-- upvalues: TypesUDim2 (upval), p1 (upval)
							return TypesUDim2.new(1, 0, 0, math.max(44, p1.metric("targetSizes.minimum", p6)) + 8)
						end
					}))
				end
				local ContentFunction = v3.content
				local ContentResult = if type(ContentFunction) == "function" then ContentFunction() else ContentFunction
				
				if ContentResult:IsA("GuiObject") then
					Runtime.decorate(ContentResult, { LayoutOrder = 1 })
				end
				table.insert(List, ContentResult)
				p3.attach(Hero1, {
					Host.Frame("Art")({
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1),
						table.unpack(List)
					})
				})
			end
			if HasHero then
				local CloseControlResult = closeControl()
				
				if CloseControlResult then
					p3.attach(Hero1, {
						Host.Frame("Utilities")({
							BackgroundTransparency = 1,
							AnchorPoint = TypesVector2.new(1, 0),
							Position = TypesUDim2.new(1, -8, 0, 8),
							Size = TypesUDim2.fromOffset(0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.XY,
							ZIndex = 3,
							CloseControlResult
						})
					})
				end
			end
			return Hero1
		end
		
		if IsSticky then
			table.insert(List, (heroFrame()))
		end
		if not HasHero then
			local List1 = {}
			
			if p4.header == nil then
				table.insert(List1, p1.text({
					Name = "Title",
					LayoutOrder = 1,
					Visible = function(Callback): boolean
						-- upvalues: CellResult (copy)
						return not Callback(CellResult)
					end,
					Text = function(p6)
						-- upvalues: ReadFunction (upval), p4 (copy)
						return ReadFunction(p4.title, p6) or ""
					end,
					TextWrapped = true,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
				}, nil, "heading"))
			elseif p4.header ~= false then
				local HeaderFunction = p4.header
				local HeaderResult = if type(HeaderFunction) == "function" then HeaderFunction() else HeaderFunction
				
				if HeaderResult:IsA("GuiObject") then
					p3.attach(HeaderResult, {
						Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
					})
				end
				table.insert(List1, HeaderResult)
			end
			local CloseControlResult = closeControl()
			
			if CloseControlResult then
				table.insert(List1, CloseControlResult)
			end
			if #List1 > 0 then
				local config = {
					Name = "Header",
					BackgroundTransparency = 1,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				}
				config[#config + 1] = Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					HorizontalAlignment = TypesEnum.HorizontalAlignment.Right,
					VerticalAlignment = TypesEnum.VerticalAlignment.Center,
					SortOrder = TypesEnum.SortOrder.LayoutOrder,
					Padding = p1.types.UDim.new(0, 8)
				})
				
				for _, value in List1 do
					config[#config + 1] = value
				end
				table.insert(List, Host.Frame(config))
			end
		end
		local v3: number = if p4.contentInset == "none" then 0 else 8
		local FormulaResult = Compose.formula(function(Callback): number
			-- upvalues: p5 (copy), OverlayPartsModule (upval), p1 (upval), p4 (copy), Extent (copy)
			return math.max(0, (math.min(OverlayPartsModule.width(p1, p4.width, Callback), Callback(Extent).X))) + (p5.outset("left", Callback) + p5.outset("right", Callback))
		end)
		
		local function contentPadding()
			-- upvalues: p1 (upval), FormulaResult (copy), PadFunction (copy), v3 (copy), Host (upval)
			local function horizontal(Callback)
				-- upvalues: p1 (upval), FormulaResult (upval), PadFunction (upval), v3 (upval)
				local Largest = math.max(0, p1.metric("motion.materialize.lift", Callback) - 1)
				
				return if v3 < math.max(0, Callback(FormulaResult) - PadFunction("left", Callback) - PadFunction("right", Callback)) * Largest then p1.types.UDim.new(Largest, 0) else p1.types.UDim.new(0, v3)
			end
			
			return Host.UIPadding({
				PaddingLeft = if v3 == 0 then p1.types.UDim.new(0, 0) else horizontal,
				PaddingRight = if v3 == 0 then p1.types.UDim.new(0, 0) else horizontal,
				PaddingTop = p1.types.UDim.new(0, v3),
				PaddingBottom = p1.types.UDim.new(0, v3)
			})
		end
		
		local UIListLayoutResult = Host.UIListLayout({ SortOrder = TypesEnum.SortOrder.LayoutOrder })
		local ContentPaddingResult = contentPadding()
		local List2 = { UIListLayoutResult }
		local ContentResult = if type(p4.content) == "function" then p4.content() else p4.content
		local v4 = nil
		local ContentResult1 = ContentResult
		
		if ContentResult:IsA("GuiObject") and ContentResult.Size.Y.Scale > 0 then
			v4 = Host.Frame("SheetScrollViewport")({
				BackgroundTransparency = 1,
				Size = TypesUDim2.new(1, 0, 0, 0),
				ContentResult
			})
			ContentResult1 = assert(v4)
		end
		if Hero and not IsSticky then
			table.insert(List2, (heroFrame()))
			local config = {
				Name = "Inset",
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = TypesUDim2.new(1, 0, 0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.Y
			}
			config[#config + 1] = Host.UIListLayout({ SortOrder = TypesEnum.SortOrder.LayoutOrder })
			config[#config + 1] = contentPadding()
			config[#config + 1] = ContentResult1
			table.insert(List2, Host.Frame(config))
		else
			table.insert(List2, ContentPaddingResult)
			table.insert(List2, ContentResult1)
		end
		local UIFlexItemResult = Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
		local ScrollerResult = OverlayPartsModule.scroller(p1, {
			Name = "SheetContent",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollingDirection = TypesEnum.ScrollingDirection.Y,
			ScrollBarThickness = 6,
			ClipsDescendants = true,
			Selectable = false,
			SelectionGroup = false,
			UIFlexItemResult
		}, List2, { name = "SheetFlow" })
		
		if v4 then
			local AbsoluteWindowSizeResult = p1.observe.AbsoluteWindowSize(ScrollerResult)
			Runtime.decorate(v4, {
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), AbsoluteWindowSizeResult (copy), Unit (copy), v3 (copy)
					return TypesUDim2.new(1, 0, 0, (math.max(0, Callback(AbsoluteWindowSizeResult).Y / Callback(Unit) - v3 * 2)))
				end
			})
		end
		local function linkDismissal()
			-- upvalues: ScrollerResult (copy), p5 (copy), Grabber (copy), p4 (copy), CanDismissFunction (copy), v2 (ref), p3 (upval), v1 (ref), ContentResult (copy), p1 (upval), Compose (upval), Runtime (upval)
			local v5 = nil
			local NextSelectionUp = nil
			local NextSelectionUp1 = nil
			local List = {}
			
			local function Callback() end
			
			local function watch(Gui)
				-- upvalues: List (copy), Callback (ref), ScrollerResult (upval)
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				
				if Gui == nil then return end
				table.insert(List, Gui.AncestryChanged:Connect(function()
					-- upvalues: Callback (upval)
					Callback()
				end))
				
				for _, PropertyName in { "Selectable", "Interactable" } do
					table.insert(List, Gui:GetPropertyChangedSignal(PropertyName):Connect(Callback))
				end
				local Gui1 = Gui
				while Gui1 and Gui1 ~= ScrollerResult do
					if Gui1:IsA("GuiObject") then
						table.insert(List, Gui1:GetPropertyChangedSignal("Visible"):Connect(Callback))
					end
					Gui1 = Gui1.Parent
				end
			end
			
			local function linkContent(p6)
				-- upvalues: p5 (upval), Grabber (upval), p4 (upval), CanDismissFunction (upval), v2 (upval), p3 (upval), ScrollerResult (upval), v1 (upval), ContentResult (upval), v5 (ref), NextSelectionUp (ref), NextSelectionUp1 (ref), watch (copy)
				local Grabber1 = nil
				if p5.showGrabber(p6) then
					Grabber1 = Grabber
				else
					local HasCloseButton = p4.closeButton ~= false and (p4.closeButton ~= nil or not p5.showGrabber(p6) and CanDismissFunction(p6))
					Grabber1 = if HasCloseButton then v2 else nil
				end
				local FirstSelectableResult = p3.firstSelectable(ScrollerResult) or (if v1 then p3.firstSelectable(v1) else nil)
				
				if FirstSelectableResult == Grabber1 then
					FirstSelectableResult = p3.firstSelectable(ContentResult)
				end
				if FirstSelectableResult == v5 and Grabber1 == NextSelectionUp then return end
				if NextSelectionUp and v5 and v5.NextSelectionUp == NextSelectionUp then
					v5.NextSelectionUp = NextSelectionUp1
				end
				if NextSelectionUp then
					local NextSelectionUp2 = NextSelectionUp
					NextSelectionUp2.NextSelectionDown = nil
					NextSelectionUp2.NextSelectionRight = nil
				end
				v5 = FirstSelectableResult
				NextSelectionUp = Grabber1
				watch(v5)
				
				if NextSelectionUp then
					local NextSelectionUp3 = NextSelectionUp
					NextSelectionUp3.NextSelectionDown = FirstSelectableResult
					NextSelectionUp3.NextSelectionRight = FirstSelectableResult
				end
				if FirstSelectableResult and NextSelectionUp then
					NextSelectionUp1 = FirstSelectableResult.NextSelectionUp
					FirstSelectableResult.NextSelectionUp = NextSelectionUp
				end
			end
			
			Callback = p1.afterLayout(function()
				-- upvalues: linkContent (copy)
				linkContent(nil)
			end)
			Compose.watch(linkContent)
			Runtime.connect(ScrollerResult, "DescendantAdded", function()
				-- upvalues: linkContent (copy)
				linkContent(nil)
			end)
			Compose.cleanup(function()
				-- upvalues: List (copy), NextSelectionUp (ref), v5 (ref), NextSelectionUp1 (ref)
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				
				if NextSelectionUp and v5 and v5.NextSelectionUp == NextSelectionUp then
					v5.NextSelectionUp = NextSelectionUp1
				end
			end)
		end
		
		table.insert(List, ScrollerResult)
		
		local function usable(p6)
			-- upvalues: OverlayPartsModule (upval), p1 (upval)
			return OverlayPartsModule.usable(p1, p6)
		end
		
		local function press(p6)
			-- upvalues: OverlayPartsModule (upval), p1 (upval)
			if OverlayPartsModule.usable(p1, p6) then
				p6.onActivate()
			end
		end
		
		local Actions = p4.actions or {}
		
		if #Actions > 0 then
			local Frame = OverlayPartsModule.actions(p1, p2, Actions, p4.actionLayout, function(Callback): number
				-- upvalues: FormulaResult (copy), PadFunction (copy)
				return (math.max(0, Callback(FormulaResult) - PadFunction("left", Callback) - PadFunction("right", Callback)))
			end, press).frame
			v1 = Frame
			table.insert(List, Frame)
		end
		local Guide = nil
		local LayoutSizeResult = nil
		local v6 = nil
		
		if p4.guide ~= nil then
			assert(type(p4.guide) == "table", "Facet.Sheet: guide takes ButtonGuide options")
			assert(p4.guideAlignment == nil or (p4.guideAlignment == "start" or p4.guideAlignment == "end"), "Facet.Sheet: guideAlignment must be start or end")
			local ButtonGuide = table.clone(p4.guide)
			
			for i in ButtonGuide do
				assert(type(i) ~= "string" or string.match(i, "^%u") == nil, "Facet.Sheet: guide takes ButtonGuide options; the Sheet places the guide")
			end
			ButtonGuide.Name = "ButtonGuide"
			local ButtonGuideResult = p2.ButtonGuide(ButtonGuide)
			local VisibleResult = p1.observe.Visible(ButtonGuideResult)
			local FormulaResult1 = Compose.formula(function(Callback): boolean
				-- upvalues: VisibleResult (copy)
				return Callback(VisibleResult) == true
			end)
			local v7 = Host.Frame("Guide")({
				BackgroundTransparency = 1,
				Selectable = false,
				AnchorPoint = TypesVector2.new(0, 1),
				Position = function(p6)
					-- upvalues: TypesUDim2 (upval), PadFunction (copy), StandingFunction (copy)
					return TypesUDim2.fromOffset(PadFunction("left", p6), StandingFunction(p6) - PadFunction("bottom", p6))
				end,
				Size = function(p6)
					-- upvalues: TypesUDim2 (upval), PadFunction (copy)
					return TypesUDim2.new(1, -PadFunction("left", p6) - PadFunction("right", p6), 0, 0)
				end,
				AutomaticSize = TypesEnum.AutomaticSize.Y,
				Visible = FormulaResult1,
				Host.UIListLayout({
					FillDirection = TypesEnum.FillDirection.Horizontal,
					HorizontalAlignment = if p4.guideAlignment == "start" then TypesEnum.HorizontalAlignment.Left else TypesEnum.HorizontalAlignment.Right,
					SortOrder = TypesEnum.SortOrder.LayoutOrder
				}),
				ButtonGuideResult
			})
			Guide = v7
			v6 = FormulaResult1
			LayoutSizeResult = p1.layoutSize(v7, Unit)
		end
		local function guideReserve(Callback): number
			-- upvalues: v6 (ref), LayoutSizeResult (ref)
			local v8 = v6
			local LayoutSizeResult1 = LayoutSizeResult
			
			return if v8 == nil or LayoutSizeResult1 == nil or not Callback(v8) then 0 else Callback(LayoutSizeResult1).Y + 8
		end
		
		linkDismissal()
		local AbsoluteContentSizeResult = p1.observe.AbsoluteContentSize(UIListLayoutResult)
		local v8: number = if Hero == nil or IsSticky then v3 * 2 else 0
		
		local _ = function(p6)
			-- upvalues: PadFunction (copy)
			return PadFunction("top", p6) + PadFunction("bottom", p6)
		end
		
		local RoomResult = OverlayPartsModule.room(p1, List, ScrollerResult, function(Callback)
			-- upvalues: AbsoluteContentSizeResult (copy), Unit (copy), v8 (copy)
			return Callback(AbsoluteContentSizeResult).Y / Callback(Unit) + v8
		end, function(Callback): number
			-- upvalues: StandingFunction (copy), PadFunction (copy), v6 (ref), LayoutSizeResult (ref)
			local v9 = v6
			local LayoutSizeResult1 = LayoutSizeResult
			
			return (math.max(0, StandingFunction(Callback) - (PadFunction("top", Callback) + PadFunction("bottom", Callback)) - (if v9 == nil or LayoutSizeResult1 == nil or not Callback(v9) then 0 else Callback(LayoutSizeResult1).Y + 8)))
		end, true, Unit)
		Runtime.decorate(UIFlexItemResult, {
			FlexMode = function(Callback)
				-- upvalues: RoomResult (copy), TypesEnum (upval)
				return if Callback(RoomResult.tight) then TypesEnum.UIFlexMode.None else TypesEnum.UIFlexMode.Fill
			end
		})
		Compose.watch(function(Callback)
			-- upvalues: AbsoluteContentSizeResult (copy), Unit (copy), v8 (copy), RoomResult (copy), PadFunction (copy), v6 (ref), LayoutSizeResult (ref), HugHeight (copy)
			local v9 = v6
			local LayoutSizeResult1 = LayoutSizeResult
			local NewY = Callback(AbsoluteContentSizeResult).Y / Callback(Unit) + v8 + Callback(RoomResult.pinned) + (PadFunction("top", Callback) + PadFunction("bottom", Callback)) + (if v9 == nil or LayoutSizeResult1 == nil or not Callback(v9) then 0 else Callback(LayoutSizeResult1).Y + 8) + 8
			local PeekResult: number = HugHeight:peek()
			
			if NewY > 0 and (PeekResult == nil or math.abs(PeekResult - NewY) > 0.5) then
				HugHeight:set(NewY)
			end
		end)
		
		if p4.scrollPolicy == "atLargestDetent" then
			Runtime.decorate(ScrollerResult, {
				ScrollingEnabled = function(Callback): boolean
					-- upvalues: Tallest (copy), RoomResult (copy)
					return Callback(Tallest) and not Callback(RoomResult.tight)
				end,
				Active = Tallest
			})
		end
		local function usableWithin(FirstSelectableResult, Gui): boolean
			local Gui1 = FirstSelectableResult
			while Gui1 and Gui1 ~= Gui do
				if Gui1:IsA("GuiObject") and (not Gui1.Visible or not Gui1.Interactable) then
					return false
				end
				Gui1 = Gui1.Parent
			end
			return Gui1 == Gui
		end
		
		local _ = function(Gui)
			-- upvalues: p3 (upval), v2 (ref), ContentResult (copy), usableWithin (copy)
			if Gui == nil then
				return nil
			end
			local FirstSelectableResult = p3.firstSelectable(Gui)
			
			if FirstSelectableResult and FirstSelectableResult == v2 then
				FirstSelectableResult = p3.firstSelectable(ContentResult)
			end
			return if FirstSelectableResult and FirstSelectableResult ~= v2 and usableWithin(FirstSelectableResult, Gui) then FirstSelectableResult else nil
		end
		
		local v9 = nil
		
		local _ = function()
			-- upvalues: v9 (ref), p4 (copy)
			if v9 == nil then
				local InitialFocusFunction = p4.initialFocus
				local InitialFocusResult = if type(InitialFocusFunction) == "function" then InitialFocusFunction() else InitialFocusFunction
				assert(InitialFocusResult == nil or type(InitialFocusResult) == "string", "Facet.Sheet: initialFocus must return a control's name or nil")
				v9 = InitialFocusResult or false
			end
			return if v9 then v9 else nil
		end
		
		local function named(Gui, InitialActionResult)
			-- upvalues: p3 (upval), v2 (ref), usableWithin (copy)
			if Gui == nil then
				return nil
			end
			local FirstSelectableResult = nil
			for _, descendant in Gui:GetDescendants() do
				if descendant.Name == InitialActionResult then
					FirstSelectableResult = p3.firstSelectable(descendant)
					
					if FirstSelectableResult and FirstSelectableResult ~= v2 and usableWithin(FirstSelectableResult, Gui) then
						return FirstSelectableResult
					end
				end
			end
			return nil
		end
		
		return {
			entry = function()
				-- upvalues: v9 (ref), p4 (copy), named (copy), ScrollerResult (copy), v1 (ref), Actions (copy), OverlayPartsModule (upval), p1 (upval), p3 (upval), v2 (ref), ContentResult (copy), usableWithin (copy)
				if v9 == nil then
					local InitialFocusFunction = p4.initialFocus
					local InitialFocusResult = if type(InitialFocusFunction) == "function" then InitialFocusFunction() else InitialFocusFunction
					assert(InitialFocusResult == nil or type(InitialFocusResult) == "string", "Facet.Sheet: initialFocus must return a control's name or nil")
					v9 = InitialFocusResult or false
				end
				local v10 = if v9 then v9 else nil
				
				if v10 then
					local NamedResult = named(ScrollerResult, v10) or named(v1, v10)
					
					if NamedResult then
						return NamedResult
					end
				end
				local List = {}
				
				for _, action in Actions do
					table.insert(List, {
						id = action.id,
						role = action.role,
						usable = OverlayPartsModule.usable(p1, action)
					})
				end
				local InitialActionResult = OverlayPartsModule.initialAction(List)
				local v11 = nil
				
				if ScrollerResult == nil then
					v11 = nil
				else
					local FirstSelectableResult = p3.firstSelectable(ScrollerResult)
					
					if FirstSelectableResult and FirstSelectableResult == v2 then
						FirstSelectableResult = p3.firstSelectable(ContentResult)
					end
					v11 = if FirstSelectableResult and FirstSelectableResult ~= v2 and usableWithin(FirstSelectableResult, ScrollerResult) then FirstSelectableResult else nil
				end
				if not v11 then
					v11 = if InitialActionResult then named(v1, InitialActionResult) else nil
					
					if not v11 then
						local Gui = v1
						
						if Gui == nil then
							return nil
						end
						local FirstSelectableResult = p3.firstSelectable(Gui)
						
						if FirstSelectableResult and FirstSelectableResult == v2 then
							FirstSelectableResult = p3.firstSelectable(ContentResult)
						end
						if FirstSelectableResult and FirstSelectableResult ~= v2 and usableWithin(FirstSelectableResult, Gui) then
							return FirstSelectableResult
						end
						v11 = nil
					end
				end
				return v11
			end,
			plaqued = CellResult,
			usable = usable,
			press = press,
			panelWidth = FormulaResult,
			contentSize = AbsoluteContentSizeResult,
			room = RoomResult,
			guide = Guide,
			guideReserve = guideReserve
		}
	end
end