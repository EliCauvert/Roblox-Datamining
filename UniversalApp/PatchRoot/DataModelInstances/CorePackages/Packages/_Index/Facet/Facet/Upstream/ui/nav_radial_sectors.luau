local NavRadialGeometryModule = require("./nav_radial_geometry")
local _ = require("./layout_kit")
local _ = require("./types")
local _ = require("./radial_types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./nav_radial_menu")
local _ = require("./nav_radial_layout")

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: NavRadialGeometryModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Spec = p5.spec
	local Session = p5.session
	local ReducedFunction = p5.reduced
	local Appearance = p5.appearance
	local ContentFit = p5.contentFit
	local Entry = ({
		below = {
			anchor = TypesVector2.new(0.5, 0),
			at = TypesVector2.new(0.5, 1),
			gap = TypesVector2.new(0, 1)
		},
		above = {
			anchor = TypesVector2.new(0.5, 1),
			at = TypesVector2.new(0.5, 0),
			gap = TypesVector2.new(0, -1)
		},
		leading = {
			anchor = TypesVector2.new(1, 0.5),
			at = TypesVector2.new(0, 0.5),
			gap = TypesVector2.new(-1, 0)
		},
		trailing = {
			anchor = TypesVector2.new(0, 0.5),
			at = TypesVector2.new(1, 0.5),
			gap = TypesVector2.new(1, 0)
		},
		topLeading = {
			anchor = TypesVector2.new(1, 1),
			at = TypesVector2.new(0, 0),
			gap = TypesVector2.new(1, 1)
		},
		topTrailing = {
			anchor = TypesVector2.new(0, 1),
			at = TypesVector2.new(1, 0),
			gap = TypesVector2.new(-1, 1)
		}
	})[Spec.captionPlacement or "below"]
	assert(Entry, "Facet.RadialMenu: captionPlacement must be below, above, leading, trailing, topLeading or topTrailing")
	local Anchor = Entry.anchor
	local At = Entry.at
	local Gap = Entry.gap
	local Preferred = p5.preferred
	local Candidate = p5.candidate
	local Naming = p5.naming
	local Following = p6.following
	local Center = p6.center
	local CaptionPaddingFunction = p6.captionPadding
	local WordWidths = p6.wordWidths
	local Sectors = p6.sectors
	local Fallback = p6.fallback
	local CaptionWidths = p6.captionWidths
	local TimelineResult = Runtime.timeline({ duration = p1.metric("motion.radial.enter") })
	Compose.watch(function(Callback: (any) -> ())
		-- upvalues: p6 (copy), TimelineResult (copy), Following (copy)
		Callback(p6.centerTarget)
		
		if TimelineResult.completed:peek() then
			Following:set(true)
		end
	end)
	local MotionMaterializeRadialSpread = p1.metric("motion.materialize.radialSpread")
	local TweenResult = Runtime.tween(function(Callback): number
		-- upvalues: p8 (copy)
		return if p8 and Callback(p8.exiting) then 1 else 0
	end, { seconds = p1.metric("motion.radial.exit") })
	
	local function spread(Callback): number
		-- upvalues: ReducedFunction (copy), p1 (copy), TimelineResult (copy), TweenResult (copy), MotionMaterializeRadialSpread (copy)
		if ReducedFunction(Callback) then
			return 1
		else
			local Present = p1.motionEase("present", Callback)
			
			return MotionMaterializeRadialSpread + (1 - MotionMaterializeRadialSpread) * (Present(Callback(TimelineResult.progress)) * (1 - Present(Callback(TweenResult))))
		end
	end
	
	local function transparency(Callback): number
		-- upvalues: ReducedFunction (copy), TimelineResult (copy), TweenResult (copy)
		return if ReducedFunction(Callback) then 0 else math.max(1 - Callback(TimelineResult.progress), Callback(TweenResult))
	end
	
	local Buttons = {}
	local CellResult = Compose.cell({})
	local CellResult1 = Compose.cell({})
	
	local function _(p9)
		-- upvalues: Spec (copy), ReadFunction (copy), p1 (copy)
		return if Spec.iconSize == nil then p1.controlSize(nil, "iconSize", p9) else ReadFunction(Spec.iconSize, p9)
	end
	
	local function iconic(Callback, p9): boolean
		-- upvalues: p5 (copy), CaptionPaddingFunction (copy), Buttons (copy), NavRadialGeometryModule (upval), CellResult1 (copy), WordWidths (copy)
		if p9.list then
			return false
		end
		if p5.glyphOnly(p9.item) then
			return true
		end
		local Item = p9.item
		
		if Item.icon == nil and (Item.compactLabel == nil or Item.compactLabel.icon == nil) or p9.sharedIcon == true then
			return false
		end
		local CaptionPaddingResult = CaptionPaddingFunction(Callback)
		local Button = Buttons[p9.key]
		local UIPadding = Button and Button:FindFirstChildWhichIsA("UIPadding")
		
		if UIPadding then
			CaptionPaddingResult = UIPadding:GetStyled("PaddingLeft").Offset + UIPadding:GetStyled("PaddingRight").Offset
		end
		return math.min(NavRadialGeometryModule.labelBounds(p9, 40).w, Callback(CellResult1)[p9.key] or 1e999) < (Callback(WordWidths)[p9.key] or 0) + CaptionPaddingResult
	end
	
	local FocusScope = Compose.createFocusScope({
		autoFocus = false,
		from = Sectors,
		key = function(p9)
			return p9.key
		end,
		disabled = function(p9): boolean
			-- upvalues: ReadFunction (copy)
			return ReadFunction(p9.item.enabled) == false
		end,
		position = function(Vector)
			local X = if Vector.list then 0 else Vector.x
			
			if Vector.list then
				return X, Vector.index * 48
			else
				return X, Vector.y
			end
		end
	})
	local SelectingResult = p3.selecting()
	Compose.watch(function(Callback)
		-- upvalues: SelectingResult (copy), FocusScope (copy), Sectors (copy)
		if SelectingResult(Callback) and Callback(FocusScope.current) == nil and #Callback(Sectors) > 0 then
			FocusScope.first()
		end
	end)
	local GuiService = p3.service("GuiService")
	local CellResult2 = Compose.cell(0)
	
	local function headerHeight(Callback): number
		-- upvalues: p1 (copy), p5 (copy), CellResult2 (copy)
		return (math.max(p1.metric("targetSizes.minimum", Callback), p5.painted(Callback), math.ceil((Callback(CellResult2))) + p1.metric("space.s", Callback)))
	end
	
	local ListHeader = Host.Frame("ListHeader")({
		BackgroundTransparency = 1,
		LayoutOrder = -1,
		Size = function(Callback)
			-- upvalues: Fallback (copy), TypesUDim2 (copy), p1 (copy), p5 (copy), CellResult2 (copy)
			return if Callback(Fallback) then TypesUDim2.new(1, 0, 0, (math.max(p1.metric("targetSizes.minimum", Callback), p5.painted(Callback), math.ceil((Callback(CellResult2))) + p1.metric("space.s", Callback)))) else TypesUDim2.fromScale(1, 1)
		end
	})
	local FormulaResult = Compose.formula(function(Callback): number
		-- upvalues: p1 (copy), WordWidths (copy), Sectors (copy), CaptionPaddingFunction (copy), p6 (copy)
		local ControlsPopupPanelWidth = p1.metric("controls.popup.panelWidth", Callback)
		local CallbackResult = Callback(WordWidths)
		
		for _, value in Callback(Sectors) do
			local Item = value.item
			local Icon = Item.icon or Item.compactLabel and Item.compactLabel.icon
			ControlsPopupPanelWidth = math.max(ControlsPopupPanelWidth, (CallbackResult[value.key] or 0) + CaptionPaddingFunction(Callback) + (if Icon then p1.controlSize(nil, "iconSize", Callback) + p1.metric("space.s", Callback) else 0) + 2 * p1.metric("space.m", Callback) + 8)
		end
		return (math.min(ControlsPopupPanelWidth, (math.max(0, Callback(p6.viewport).X - 32))))
	end)
	local Frames = p1.runtime.host.frames
	local CellResult3 = Compose.cell(Frames == nil or p1.config.services.TextService == nil)
	
	if Frames and not CellResult3:peek() then
		Compose.watch(function(Callback)
			-- upvalues: Fallback (copy), CellResult3 (copy), Frames (copy), Compose (copy)
			if Callback(Fallback) and not CellResult3:peek() then
				local Count = 0
				local Callback1 = nil
				Callback1 = Frames.onFrame(function()
					-- upvalues: Count (ref), Callback1 (ref), CellResult3 (upval)
					Count += 1
					
					if Count >= 10 then
						Callback1()
						CellResult3:set(true)
					end
				end)
				Compose.cleanup(Callback1)
				
				return
			end
		end)
	end
	local RadialPanel = Host.ScrollingFrame({
		Name = "RadialPanel",
		BackgroundTransparency = function(Callback): number
			-- upvalues: Fallback (copy)
			return if Callback(Fallback) then 0 else 1
		end,
		Size = function(Callback)
			-- upvalues: Fallback (copy), TypesUDim2 (copy), p1 (copy), p5 (copy), CellResult2 (copy), Sectors (copy), FormulaResult (copy), p6 (copy)
			return if Callback(Fallback) then TypesUDim2.fromOffset(Callback(FormulaResult), (math.min(math.max(p1.metric("targetSizes.minimum", Callback), p5.painted(Callback), math.ceil((Callback(CellResult2))) + p1.metric("space.s", Callback)) + #Callback(Sectors) * 48 + 16, (math.max(0, Callback(p6.viewport).Y - 32))))) else TypesUDim2.fromScale(1, 1)
		end,
		Position = function(Callback)
			-- upvalues: Fallback (copy), TypesUDim2 (copy), FormulaResult (copy)
			return if Callback(Fallback) then TypesUDim2.new(0.5, -Callback(FormulaResult) / 2, 0, 16) else TypesUDim2.fromOffset(0, 0)
		end,
		Active = function(Callback)
			-- upvalues: Fallback (copy), Spec (copy)
			return Callback(Fallback) or not Spec.centerPassThrough
		end,
		Interactable = p5.opened,
		Selectable = false,
		CanvasSize = TypesUDim2.fromOffset(0, 0),
		AutomaticCanvasSize = function(Callback)
			-- upvalues: Fallback (copy), TypesEnum (copy)
			return if Callback(Fallback) then TypesEnum.AutomaticSize.Y else TypesEnum.AutomaticSize.None
		end,
		ScrollingEnabled = Fallback,
		ClipsDescendants = Fallback,
		ScrollBarThickness = function(Callback): number
			-- upvalues: Fallback (copy)
			return if Callback(Fallback) then 6 else 0
		end,
		Attributes = {
			Presentation = function(Callback): string
				-- upvalues: Fallback (copy)
				return if Callback(Fallback) then "list" else "radial"
			end
		},
		Visible = function(Callback): boolean
			-- upvalues: Fallback (copy), CellResult3 (copy), WordWidths (copy), Sectors (copy), p1 (copy)
			if not Callback(Fallback) or Callback(CellResult3) then
				return true
			end
			local CallbackResult = Callback(WordWidths)
			
			for _, value in Callback(Sectors) do
				if p1.read(value.item.label, Callback) ~= "" and CallbackResult[value.key] == nil then
					return false
				end
			end
			return true
		end,
		ListHeader,
		Compose.show(Fallback, function()
			-- upvalues: Compose (copy), p4 (copy), p1 (copy)
			return Compose.fragment(function()
				-- upvalues: p4 (upval), p1 (upval)
				return { p4.list({ gap = 4 }, true), p1.padding(8, 8) }
			end)
		end),
		Compose.keyed({
			from = function(p9)
				-- upvalues: ReadFunction (copy), Spec (copy), p5 (copy)
				local List = {}
				
				local function visit(List1, Text)
					-- upvalues: List (copy), visit (copy), ReadFunction (upval), p9 (copy), Spec (upval), p5 (upval)
					for _, value in List1 do
						local Text1 = Text .. "/" .. value.id
						table.insert(List, Text1)
						
						if value.children then
							visit(ReadFunction(value.children, p9), if Text == "" then value.id else Text1)
						end
					end
					if Spec.center and Spec.center ~= "back" and not p5.corner then
						table.insert(List, Text .. "/$navigation")
					end
				end
				
				visit(ReadFunction(Spec.items, p9), "")
				
				return List
			end,
			render = function(p10)
				-- upvalues: Compose (copy), Sectors (copy), Host (copy), TypesUDim2 (copy), Runtime (copy), p1 (copy), Session (copy), TimelineResult (copy), NavRadialGeometryModule (upval), ReducedFunction (copy), Candidate (copy), FocusScope (copy), ReadFunction (copy), Appearance (copy), iconic (copy), WordWidths (copy), CaptionPaddingFunction (copy), p2 (copy), TypesVector2 (copy), Spec (copy), Fallback (copy), p5 (copy), Preferred (copy), TypesEnum (copy), Naming (copy), Center (copy), spread (copy), Buttons (copy), Anchor (copy), At (copy), Gap (copy), p3 (copy), p7 (copy), CaptionWidths (copy), TweenResult (copy), ContentFit (copy), CellResult (copy), CellResult1 (copy)
				local CellResult2 = Compose.cell(nil)
				local CellResult3 = Compose.cell(nil)
				local CellResult4 = Compose.cell(false)
				local FormulaResult = Compose.formula(function(Callback)
					-- upvalues: Sectors (upval), p10 (copy)
					local CallbackResult = Callback(Sectors)
					local CallbackResultEntry = nil
					
					for i = 1, #CallbackResult do
						CallbackResultEntry = CallbackResult[i]
						
						if CallbackResultEntry.key == Callback(p10) then
							return CallbackResultEntry
						end
					end
					return nil
				end)
				Compose.watch(function(Callback)
					-- upvalues: FormulaResult (copy), CellResult2 (copy)
					local CallbackResult = Callback(FormulaResult)
					
					if CallbackResult then
						CellResult2:set(CallbackResult)
					end
				end)
				
				return Host.Frame("SectorSlot" .. p10:peek())({
					BackgroundTransparency = 1,
					Visible = CellResult4,
					Interactable = function(Callback): boolean
						-- upvalues: FormulaResult (copy)
						return Callback(FormulaResult) ~= nil
					end,
					LayoutOrder = function(Callback)
						-- upvalues: CellResult2 (copy)
						local CallbackResult = Callback(CellResult2)
						
						return if CallbackResult then CallbackResult.index else 0
					end,
					Size = function(Callback)
						-- upvalues: CellResult2 (copy), TypesUDim2 (upval)
						local CallbackResult = Callback(CellResult2)
						
						return if CallbackResult and CallbackResult.list then TypesUDim2.new(1, 0, 0, 44) else TypesUDim2.fromScale(1, 1)
					end,
					Compose.presence(function(Callback)
						-- upvalues: FormulaResult (copy)
						return Callback(FormulaResult)
					end, function(p11)
						-- upvalues: CellResult2 (copy), CellResult4 (copy), Compose (upval), Runtime (upval), p1 (upval), Session (upval), TimelineResult (upval), NavRadialGeometryModule (upval), ReducedFunction (upval), Candidate (upval), FocusScope (upval), ReadFunction (upval), Appearance (upval), iconic (upval), WordWidths (upval), CaptionPaddingFunction (upval), CellResult3 (copy), p2 (upval), TypesVector2 (upval), Spec (upval), Fallback (upval), p5 (upval), Preferred (upval), TypesEnum (upval), Naming (upval), Center (upval), TypesUDim2 (upval), spread (upval), Buttons (upval), Host (upval), Anchor (upval), At (upval), Gap (upval), p3 (upval), p7 (upval), CaptionWidths (upval), TweenResult (upval), FormulaResult (copy), ContentFit (upval), CellResult (upval), Sectors (upval), CellResult1 (upval)
						local function currentSector(Callback)
							-- upvalues: CellResult2 (upval)
							return assert(if Callback then Callback(CellResult2) else CellResult2:peek())
						end
						
						CellResult4:set(true)
						Compose.cleanup(function()
							-- upvalues: CellResult4 (upval)
							CellResult4:set(false)
						end)
						local CellResult5 = Compose.cell(false)
						local TweenResult1 = Runtime.tween(function(Callback): number
							-- upvalues: CellResult5 (copy), p11 (copy)
							return if Callback(CellResult5) and not Callback(p11.exiting) then 1 else 0
						end, { seconds = p1.metric("motion.radial.exit") })
						local TweenResult2 = Runtime.tween(function(Callback): number
							-- upvalues: CellResult5 (copy)
							return if Callback(CellResult5) then 1 else 0
						end, { seconds = p1.metric("motion.radial.slot") })
						local v1 = assert(currentSector())
						local BranchOrigin = Session.branchOrigin
						local Shape = if BranchOrigin and BranchOrigin.path == table.concat(v1.path, "/") then BranchOrigin.shape else nil
						local PeekResult = Shape == nil and TimelineResult.completed:peek()
						
						local function unfold(Callback, Tbl)
							-- upvalues: Shape (copy), p1 (upval), p11 (copy), TweenResult1 (copy), TweenResult2 (copy), NavRadialGeometryModule (upval)
							local v2 = assert(Shape)
							local Present = p1.motionEase("present", Callback)
							local PresentResult = if Callback(p11.exiting) then 1 - Present(1 - Callback(TweenResult1)) else Present(Callback(TweenResult2))
							local MotionUnfoldStart: number = p1.metric("motion.unfoldStart", Callback)
							local NewMotionUnfoldStart = MotionUnfoldStart + (1 - MotionUnfoldStart) * PresentResult
							local InnerRatio = (v2.inner + v2.outer) / 2
							local NewInnerRatio = InnerRatio + (math.sqrt(Tbl.x * Tbl.x + Tbl.y * Tbl.y) - InnerRatio) * PresentResult
							local NewAngle = v2.angle + NavRadialGeometryModule.delta(Tbl.angle, v2.angle) * NewMotionUnfoldStart
							local Copy = table.clone(Tbl)
							Copy.angle = NewAngle
							Copy.span = Tbl.span * NewMotionUnfoldStart
							Copy.inner = v2.inner + (Tbl.inner - v2.inner) * PresentResult
							Copy.outer = v2.outer + (Tbl.outer - v2.outer) * PresentResult
							Copy.x = math.sin((math.rad(NewAngle))) * NewInnerRatio
							Copy.y = -math.cos((math.rad(NewAngle))) * NewInnerRatio
							
							return Copy
						end
						
						local function _(p12, p13): boolean
							-- upvalues: Shape (copy), PeekResult (copy), ReducedFunction (upval)
							return if Shape == nil then PeekResult and (not p13.list and not ReducedFunction(p12)) else not p13.list and not ReducedFunction(p12)
						end
						
						local function travel(Callback, Vector)
							-- upvalues: Shape (copy), PeekResult (copy), ReducedFunction (upval), unfold (copy), p1 (upval), TweenResult2 (copy)
							if not (if Shape == nil then PeekResult and (not Vector.list and not ReducedFunction(Callback)) else not Vector.list and not ReducedFunction(Callback)) then
								return 0, 0
							elseif Shape then
								local UnfoldResult = unfold(Callback, Vector)
								
								return UnfoldResult.x - Vector.x, UnfoldResult.y - Vector.y
							else
								local ScaledMotionMaterializeBranch = p1.metric("motion.materialize.branch", Callback) * (1 - Callback(TweenResult2))
								
								return -Vector.x * ScaledMotionMaterializeBranch, -Vector.y * ScaledMotionMaterializeBranch
							end
						end
						
						local function chosen(Callback): boolean
							-- upvalues: CellResult2 (upval), Candidate (upval), FocusScope (upval), ReadFunction (upval)
							local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
							
							return Callback(Candidate) == v2.key or (Callback(FocusScope.current) == v2.key or (ReadFunction(v2.item.checked, Callback) == true or v2.item.selected ~= nil and ReadFunction(v2.item.selected, Callback) == v2.item.value))
						end
						
						local function box(Callback, p12)
							-- upvalues: Appearance (upval), iconic (upval), WordWidths (upval), CaptionPaddingFunction (upval), NavRadialGeometryModule (upval), CellResult3 (upval)
							if Appearance == "buttons" then
								local Largest = math.max(44, p12.size, if iconic(Callback, p12) then 0 else (Callback(WordWidths)[p12.key] or 0) + CaptionPaddingFunction(Callback))
								
								return Largest, Largest
							else
								local IconicResult = iconic(Callback, p12)
								local LabelBoundsResult = NavRadialGeometryModule.labelBounds(Callback(CellResult3) or p12, if IconicResult then 160 else 40)
								
								return if IconicResult then LabelBoundsResult.h else LabelBoundsResult.w, LabelBoundsResult.h
							end
						end
						
						local ButtonResult = p2.Button({
							TextWrapped = false,
							ZIndex = 105,
							Name = v1.id,
							corners = if Appearance == "buttons" then "pill" else nil,
							appearance = if Appearance == "wedges" then "utility" else nil,
							ClipsDescendants = Appearance == "wedges",
							label = function(Callback)
								-- upvalues: CellResult2 (upval), iconic (upval), ReadFunction (upval)
								local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
								
								return if iconic(Callback, v2) then "" else ReadFunction(v2.item.label, Callback) or ""
							end,
							name = function(Callback)
								-- upvalues: ReadFunction (upval), CellResult2 (upval)
								return ReadFunction(assert(if Callback then Callback(CellResult2) else CellResult2:peek()).item.label, Callback) or ""
							end,
							icon = v1.item.icon or v1.item.compactLabel and v1.item.compactLabel.icon,
							AnchorPoint = function(Callback)
								-- upvalues: CellResult2 (upval), TypesVector2 (upval)
								return if assert(if Callback then Callback(CellResult2) else CellResult2:peek()).list then TypesVector2.zero else TypesVector2.new(0.5, 0.5)
							end,
							BackgroundTransparency = if Appearance == "wedges" or Spec.buttonSurface == "none" then function(Callback): number
								-- upvalues: Fallback (upval)
								return if Callback(Fallback) then 0 else 1
							end else nil,
							LayoutOrder = function(Callback)
								-- upvalues: CellResult2 (upval)
								return assert(if Callback then Callback(CellResult2) else CellResult2:peek()).index
							end,
							InputBegan = function(p12)
								-- upvalues: p5 (upval)
								p5.beginPointer(p12)
							end,
							MouseEnter = function()
								-- upvalues: Session (upval), Preferred (upval), TypesEnum (upval), Candidate (upval), CellResult2 (upval), Naming (upval), p5 (upval)
								if not Session.capture and not Session.analog and (Preferred == nil or Preferred:peek() ~= TypesEnum.PreferredInput.Touch) then
									Candidate:set(assert((CellResult2:peek())).key)
									Naming:set(p5.pointing())
								end
							end,
							MouseLeave = function()
								-- upvalues: Session (upval), Candidate (upval), Naming (upval)
								if not Session.capture and not Session.analog then
									Candidate:set(nil)
									Naming:set(false)
								end
							end,
							AutomaticSize = TypesEnum.AutomaticSize.None,
							Position = function(Callback)
								-- upvalues: Center (upval), CellResult2 (upval), TypesUDim2 (upval), spread (upval), travel (copy)
								local CallbackResult = Callback(Center)
								local Vector = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
								
								if Vector.list then
									return TypesUDim2.fromOffset(0, 0)
								else
									local SpreadResult = spread(Callback)
									local TravelResult, TravelResult2 = travel(Callback, Vector)
									
									return TypesUDim2.fromOffset(CallbackResult.X + Vector.x * SpreadResult + TravelResult, CallbackResult.Y + Vector.y * SpreadResult + TravelResult2)
								end
							end,
							Size = function(Callback)
								-- upvalues: CellResult2 (upval), TypesUDim2 (upval), box (copy)
								local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
								
								if v2.list then
									return TypesUDim2.new(1, -8, 0, 44)
								else
									local BoxResult, BoxResult2 = box(Callback, v2)
									
									return TypesUDim2.fromOffset(BoxResult, BoxResult2)
								end
							end,
							enabled = function(Callback): boolean
								-- upvalues: ReadFunction (upval), CellResult2 (upval)
								return ReadFunction(assert(if Callback then Callback(CellResult2) else CellResult2:peek()).item.enabled, Callback) ~= false
							end,
							selected = chosen,
							onActivate = function(p12)
								-- upvalues: p5 (upval), CellResult2 (upval)
								p5.nativeActivate(assert((CellResult2:peek())), p12)
							end,
							SelectionGained = function()
								-- upvalues: FocusScope (upval), CellResult2 (upval), Candidate (upval)
								FocusScope.focus(assert((CellResult2:peek())).key)
								Candidate:set(assert((CellResult2:peek())).key)
							end
						})
						ButtonResult:AddTag("facet-radial-label")
						Compose.watch(function(Callback)
							-- upvalues: Fallback (upval), ButtonResult (copy)
							if Callback(Fallback) then
								ButtonResult:AddTag("facet-radial-row")
								
								return
							end
							if ButtonResult:HasTag("facet-radial-row") then
								ButtonResult:RemoveTag("facet-radial-row")
							end
						end)
						Buttons[v1.key] = ButtonResult
						
						if Spec.captions and Appearance == "buttons" then
							local Text = p1.text({
								Name = "Text",
								TextWrapped = false,
								Interactable = false,
								ZIndex = 107,
								Text = function(Callback)
									-- upvalues: ReadFunction (upval), CellResult2 (upval)
									return ReadFunction(assert(if Callback then Callback(CellResult2) else CellResult2:peek()).item.label, Callback) or ""
								end,
								Size = TypesUDim2.fromOffset(0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.XY
							})
							p1.textRole(Text, "caption")
							local Tooltip = p1.styled(Host.Frame({
								Name = "ItemCaption",
								AnchorPoint = Anchor,
								Position = function(p12)
									-- upvalues: p1 (upval), TypesUDim2 (upval), At (upval), Gap (upval)
									local SpaceXs = p1.metric("space.xs", p12)
									
									return TypesUDim2.new(At.X, Gap.X * SpaceXs, At.Y, Gap.Y * SpaceXs)
								end,
								Size = TypesUDim2.fromOffset(0, 0),
								AutomaticSize = TypesEnum.AutomaticSize.XY,
								Interactable = false,
								Visible = function(Callback)
									-- upvalues: CellResult2 (upval), iconic (upval)
									local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
									
									return not v2.list and iconic(Callback, v2)
								end,
								ZIndex = 106,
								p1.padding(8, 4)
							}), "tooltip")
							p3.attach(Tooltip, { Text })
							p3.attach(ButtonResult, { Tooltip })
						end
						local UISizeConstraint = ButtonResult:FindFirstChildWhichIsA("UISizeConstraint")
						
						if UISizeConstraint then
							UISizeConstraint:Destroy()
						end
						local LeadingIcon = ButtonResult:FindFirstChild("LeadingIcon", true)
						
						if LeadingIcon then
							Runtime.decorate(LeadingIcon, {
								Visible = function(Callback)
									-- upvalues: CellResult2 (upval), iconic (upval)
									local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
									
									return v2.list or iconic(Callback, v2)
								end,
								Size = function(Callback)
									-- upvalues: CellResult2 (upval), p1 (upval), iconic (upval), TypesUDim2 (upval), box (copy), Spec (upval), ReadFunction (upval)
									local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
									local IconSize: number = p1.controlSize(nil, "iconSize", Callback)
									
									if v2.list or not iconic(Callback, v2) then
										return TypesUDim2.fromOffset(IconSize, IconSize)
									else
										local BoxResult, BoxResult2 = box(Callback, v2)
										local Smallest = math.min(if Spec.iconSize == nil then p1.controlSize(nil, "iconSize", Callback) else ReadFunction(Spec.iconSize, Callback), (math.max(math.min(BoxResult, BoxResult2) - 4, IconSize)))
										
										return TypesUDim2.fromOffset(Smallest, Smallest)
									end
								end
							})
						end
						Compose.watch(function(Callback)
							-- upvalues: CellResult2 (upval), iconic (upval), ButtonResult (copy)
							local v2 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
							
							if v2.list or not iconic(Callback, v2) then
								ButtonResult:RemoveTag("facet-button-glyph")
								
								return
							else
								ButtonResult:AddTag("facet-button-glyph")
							end
						end)
						
						if Appearance == "wedges" then
							p1.styled(ButtonResult, "radial-item")
						end
						Compose.cleanup(function()
							-- upvalues: Buttons (upval), v1 (copy)
							Buttons[v1.key] = nil
						end)
						p5.skin(ButtonResult, Spec.skin and Spec.skin.item, function(Callback): boolean
							-- upvalues: Candidate (upval), CellResult2 (upval)
							return Callback(Candidate) == assert(if Callback then Callback(CellResult2) else CellResult2:peek()).key
						end)
						Compose.watch(function(Callback)
							-- upvalues: Candidate (upval), CellResult2 (upval), ButtonResult (copy)
							if Callback(Candidate) == assert(if Callback then Callback(CellResult2) else CellResult2:peek()).key then
								ButtonResult:AddTag("facet-radial-candidate")
								
								return
							else
								ButtonResult:RemoveTag("facet-radial-candidate")
							end
						end)
						local Title = ButtonResult:FindFirstChild("Title", true)
						local Title1 = if Title and Title:IsA("TextLabel") then Title else ButtonResult
						local Text = p1.styled(Host.TextLabel({
							Name = "CaptionMeasure",
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							TextWrapped = false,
							TextTransparency = 1,
							Interactable = false,
							TextXAlignment = TypesEnum.TextXAlignment.Left,
							Text = function(Callback)
								-- upvalues: ReadFunction (upval), CellResult2 (upval)
								return ReadFunction(assert(if Callback then Callback(CellResult2) else CellResult2:peek()).item.label, Callback) or ""
							end,
							FontFace = p1.observeStyled.FontFace(Title1),
							TextSize = p1.observeStyled.TextSize(Title1),
							TextTruncate = TypesEnum.TextTruncate.None,
							Size = TypesUDim2.fromOffset(0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.XY
						}), "Text")
						p3.attach(ButtonResult, { Text })
						local LayoutBoundsResult = p1.layoutBounds(Text, p7)
						local LayoutBoundsResult1 = p1.layoutBounds(Title1, p7)
						local FormulaResult1 = Compose.formula(function(Callback)
							-- upvalues: LayoutBoundsResult (copy), LayoutBoundsResult1 (copy), TypesVector2 (upval)
							local CallbackResult = Callback(LayoutBoundsResult)
							local CallbackResult1 = Callback(LayoutBoundsResult1)
							
							return TypesVector2.new(math.max(CallbackResult.X, CallbackResult1.X), (math.max(CallbackResult.Y, CallbackResult1.Y)))
						end)
						Compose.watch(function(Callback)
							-- upvalues: LayoutBoundsResult (copy), FormulaResult1 (copy), CaptionWidths (upval), v1 (copy), WordWidths (upval)
							local X: number = Callback(LayoutBoundsResult).X
							local X1: number = Callback(FormulaResult1).X
							
							if X > 0 and CaptionWidths:peek()[v1.key] ~= X then
								local Copy = table.clone(CaptionWidths:peek())
								Copy[v1.key] = X
								CaptionWidths:set(Copy)
							end
							if X1 > 0 and WordWidths:peek()[v1.key] ~= X1 then
								local Copy = table.clone(WordWidths:peek())
								Copy[v1.key] = X1
								WordWidths:set(Copy)
							end
						end)
						local v2 = Host.Path2D("Sector")({
							Closed = false,
							ZIndex = 102,
							Thickness = v1.outer - v1.inner
						})
						p1.styled(v2, "radial-sector")
						local CurrentOwnerResult = Compose.currentOwner()
						local WithOwnerResults = {}
						local CellResult6 = Compose.cell(false)
						
						local _ = function(Key)
							-- upvalues: WithOwnerResults (copy), Compose (upval), CurrentOwnerResult (copy), Host (upval), v2 (copy), p1 (upval), CellResult6 (copy)
							local WithOwnerResult = WithOwnerResults[Key]
							
							if WithOwnerResult then
								return WithOwnerResult
							else
								local WithOwnerResult1 = Compose.withOwner(assert(CurrentOwnerResult), function()
									-- upvalues: Host (upval), Key (copy), v2 (upval), p1 (upval), CellResult6 (upval)
									local Object = Host.Path2D("SectorBand" .. tostring(Key + 1))({ Closed = false, ZIndex = 102, Thickness = v2.Thickness })
									p1.styled(Object, "radial-sector")
									
									if CellResult6:peek() then
										Object:AddTag("facet-radial-candidate")
									end
									return Object
								end)
								WithOwnerResults[Key] = WithOwnerResult1
								
								return WithOwnerResult1
							end
						end
						
						Compose.watch(function(p12)
							-- upvalues: chosen (copy), CellResult6 (copy), v2 (copy), WithOwnerResults (copy)
							local ChosenResult = chosen(p12)
							CellResult6:set(ChosenResult)
							
							for _, Object in { v2, table.unpack(WithOwnerResults) } do
								if ChosenResult then
									Object:AddTag("facet-radial-candidate")
								else
									Object:RemoveTag("facet-radial-candidate")
								end
							end
						end)
						local FadeResult = p1.fade({
							Name = "Sector-" .. v1.id,
							BackgroundTransparency = 1,
							GroupTransparency = function(Callback): number
								-- upvalues: ReducedFunction (upval), TimelineResult (upval), TweenResult (upval), TweenResult1 (copy)
								return if ReducedFunction(Callback) then if ReducedFunction(Callback) then 0 else math.max(1 - Callback(TimelineResult.progress), Callback(TweenResult)) else 1 - (1 - (if ReducedFunction(Callback) then 0 else math.max(1 - Callback(TimelineResult.progress), Callback(TweenResult)))) * Callback(TweenResult1)
							end,
							ClipsDescendants = false,
							LayoutOrder = function(Callback)
								-- upvalues: CellResult2 (upval)
								return assert(if Callback then Callback(CellResult2) else CellResult2:peek()).index
							end,
							Size = function(Callback)
								-- upvalues: CellResult2 (upval), TypesUDim2 (upval)
								return if assert(if Callback then Callback(CellResult2) else CellResult2:peek()).list then TypesUDim2.new(1, 0, 0, 44) else TypesUDim2.fromScale(1, 1)
							end,
							ButtonResult
						}, nil, false)
						local CellResult7 = Compose.cell(false)
						local Parent = Host.Frame("Paint")({
							BackgroundTransparency = 1,
							Visible = function(Callback)
								-- upvalues: Appearance (upval), CellResult2 (upval), CellResult7 (copy)
								return Appearance == "wedges" and (not assert(if Callback then Callback(CellResult2) else CellResult2:peek()).list and Callback(CellResult7))
							end,
							v2
						})
						p3.attach(FadeResult, { Parent })
						local CellResult8 = Compose.cell(nil)
						Compose.watch(function(Callback)
							-- upvalues: FormulaResult (upval), CellResult2 (upval), FormulaResult1 (copy), NavRadialGeometryModule (upval), iconic (upval), Spec (upval), ReadFunction (upval), p1 (upval), CaptionPaddingFunction (upval), ContentFit (upval), CellResult (upval), Sectors (upval), CellResult7 (copy), CellResult3 (upval), CellResult1 (upval), Shape (copy), PeekResult (copy), ReducedFunction (upval), unfold (copy), CellResult8 (copy), Parent (copy), TypesUDim2 (upval), v2 (copy), WithOwnerResults (copy), Compose (upval), CurrentOwnerResult (copy), Host (upval), CellResult6 (copy)
							if Callback(FormulaResult) == nil then return end
							local v3 = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
							local CallbackResult = Callback(FormulaResult1)
							local LabelBoundsResult = NavRadialGeometryModule.labelBounds(v3, 40)
							local IconicResult = iconic(Callback, v3)
							local v4 = (if Spec.iconSize == nil then p1.controlSize(nil, "iconSize", Callback) else ReadFunction(Spec.iconSize, Callback)) + 8
							local FitContentResult = NavRadialGeometryModule.fitContent(v3, if IconicResult then v4 elseif CallbackResult.X > 0 then CallbackResult.X + CaptionPaddingFunction(Callback) else LabelBoundsResult.w, if IconicResult then v4 elseif CallbackResult.Y > 0 then math.max(CallbackResult.Y, p1.controlSize(nil, "height", Callback)) else LabelBoundsResult.h, 6, ContentFit)
							local IconicResult1 = IconicResult or (CallbackResult.X > 0 or (ReadFunction(v3.item.label, Callback) or "") == "")
							local Flag: boolean = IconicResult1
							
							if ContentFit == "radial" then
								local PeekResultEntry = CellResult:peek()[v3.key]
								
								if IconicResult1 and (not PeekResultEntry or PeekResultEntry.ring ~= v3.inner or PeekResultEntry.inner ~= FitContentResult.inner or PeekResultEntry.outer ~= FitContentResult.outer) then
									local Copy = table.clone(CellResult:peek())
									Copy[v3.key] = {
										ring = v3.inner,
										inner = FitContentResult.inner,
										outer = FitContentResult.outer
									}
									CellResult:set(Copy)
								end
								local CallbackResult1 = Callback(CellResult)
								
								for _, value in Callback(Sectors) do
									local CallbackResultEntry = CallbackResult1[value.key]
									
									if value.inner == v3.inner and (CallbackResultEntry == nil or CallbackResultEntry.ring ~= v3.inner) then
										Flag = false
									end
									if CallbackResultEntry and CallbackResultEntry.ring == v3.inner then
										FitContentResult.inner = math.min(FitContentResult.inner, CallbackResultEntry.inner)
										FitContentResult.outer = math.max(FitContentResult.outer, CallbackResultEntry.outer)
									end
								end
							end
							if Flag and not CellResult7:peek() then
								CellResult7:set(true)
							end
							CellResult3:set(FitContentResult)
							local W = NavRadialGeometryModule.labelBounds(FitContentResult, 40).w
							
							if CellResult1:peek()[v3.key] ~= W then
								local Copy = table.clone(CellResult1:peek())
								Copy[v3.key] = W
								CellResult1:set(Copy)
							end
							local UnfoldResult = if Shape and (if Shape == nil then PeekResult and (not v3.list and not ReducedFunction(Callback)) else not v3.list and not ReducedFunction(Callback)) then unfold(Callback, FitContentResult) else FitContentResult
							local PaintResult = NavRadialGeometryModule.paint(UnfoldResult)
							CellResult8:set({ x = PaintResult.x, y = PaintResult.y })
							Parent.Size = TypesUDim2.fromOffset(PaintResult.w, PaintResult.h)
							local Largest = math.max(1, FitContentResult.outer - FitContentResult.inner)
							local Largest1 = math.max(1, (math.ceil(Largest / 100 - 0.000001)))
							
							local function strokePoints(PaintResult1)
								-- upvalues: PaintResult (copy), p1 (upval), TypesUDim2 (upval)
								local List = {}
								
								for _, point in PaintResult1.points do
									local WRatio = PaintResult1.w / PaintResult.w
									local HRatio = PaintResult1.h / PaintResult.h
									table.insert(List, p1.types.Path2DControlPoint.new(TypesUDim2.fromScale((point.x * PaintResult1.w + PaintResult1.x - PaintResult.x) / PaintResult.w, (point.y * PaintResult1.h + PaintResult1.y - PaintResult.y) / PaintResult.h), TypesUDim2.fromScale(point.inX * WRatio, point.inY * HRatio), TypesUDim2.fromScale(point.outX * WRatio, point.outY * HRatio)))
								end
								return List
							end
							
							if Largest1 == 1 then
								v2.Thickness = Largest
								v2:SetControlPoints((strokePoints(PaintResult)))
							end
							local OuterRatio = (UnfoldResult.outer - UnfoldResult.inner) / Largest1
							
							for i = 1, math.max(Largest1, #WithOwnerResults + 1) do
								local v5 = nil
								if i == 1 then
									v5 = v2
								else
									local IDelta = i - 1
									local WithOwnerResult = WithOwnerResults[IDelta]
									
									if WithOwnerResult then
										v5 = WithOwnerResult
									else
										local WithOwnerResult1 = Compose.withOwner(assert(CurrentOwnerResult), function()
											-- upvalues: Host (upval), IDelta (copy), v2 (upval), p1 (upval), CellResult6 (upval)
											local Object = Host.Path2D("SectorBand" .. tostring(IDelta + 1))({ Closed = false, ZIndex = 102, Thickness = v2.Thickness })
											p1.styled(Object, "radial-sector")
											
											if CellResult6:peek() then
												Object:AddTag("facet-radial-candidate")
											end
											return Object
										end)
										WithOwnerResults[IDelta] = WithOwnerResult1
										v5 = WithOwnerResult1
									end
								end
								if Largest1 < i then
									v5.Visible = false
								elseif Largest1 > 1 then
									local Copy = table.clone(UnfoldResult)
									Copy.inner = UnfoldResult.inner + (i - 1) * OuterRatio
									Copy.outer = UnfoldResult.inner + i * OuterRatio
									v5.Visible = true
									v5.Thickness = Largest / Largest1
									v5:SetControlPoints((strokePoints(NavRadialGeometryModule.paint(Copy))))
									
									if i > 1 and v5.Parent ~= Parent then
										v5.Parent = Parent
									end
								end
							end
						end)
						Compose.watch(function(Callback)
							-- upvalues: CellResult8 (copy), CellResult2 (upval), Center (upval), Shape (copy), travel (copy), spread (upval), Parent (copy), TypesUDim2 (upval)
							local CallbackResult = Callback(CellResult8)
							
							if CallbackResult == nil then return end
							local Vector = assert(if Callback then Callback(CellResult2) else CellResult2:peek())
							local CallbackResult1 = Callback(Center)
							local v6 = 0
							local v7 = 0
							
							if not Shape then
								v6, v183 = travel(Callback, Vector)
							end
							local SpreadResultDelta = spread(Callback) - 1
							Parent.Position = TypesUDim2.fromOffset(CallbackResult1.X + CallbackResult.x + v6 + SpreadResultDelta * Vector.x, CallbackResult1.Y + CallbackResult.y + v7 + SpreadResultDelta * Vector.y)
						end)
						CellResult5:set(true)
						
						return FadeResult
					end, {
						exit = function()
							-- upvalues: ReducedFunction (upval), Compose (upval), Runtime (upval), p1 (upval)
							return if ReducedFunction() then { completed = Compose.cell(true) } else Runtime.timeline({ duration = p1.metric("motion.radial.exit") })
						end
					})
				})
			end
		})
	})
	Compose.watch(function(Callback)
		-- upvalues: Fallback (copy), RadialPanel (copy)
		if Callback(Fallback) then
			RadialPanel:AddTag("facet-panel")
			
			return
		else
			RadialPanel:RemoveTag("facet-panel")
		end
	end)
	
	return {
		enter = function()
			-- upvalues: TimelineResult (copy), ReadFunction (copy), SelectingResult (copy), FocusScope (copy)
			TimelineResult:restart()
			
			if ReadFunction(SelectingResult) then
				FocusScope.first()
			end
		end,
		transparency = transparency,
		buttons = Buttons,
		iconic = iconic,
		focus = FocusScope,
		gui = GuiService,
		panel = RadialPanel,
		listWidth = FormulaResult,
		listHeaderHeight = CellResult2,
		listHeader = ListHeader,
		headerHeight = headerHeight
	}
end