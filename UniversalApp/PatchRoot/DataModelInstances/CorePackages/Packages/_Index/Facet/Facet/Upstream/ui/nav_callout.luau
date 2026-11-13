local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local CoreModule = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local OverlayPlacementModule = require("./overlay_placement")
local _ = require("./overlay_types")
local _ = require("./navigation_props")
local _ = require("./nav_surface_parts")

return function(p1, p2, p3, p4)
	-- upvalues: OverlayPartsModule (copy), CoreModule (copy), OverlayPlacementModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local BodyFunction = p4.body
	local CellResult = Compose.cell({})
	local Id = 0
	p2.Callout = p1.construct("Callout", function(p5)
		-- upvalues: OverlayPartsModule (upval), p1 (copy), p3 (copy), Compose (copy), ReadFunction (copy), Id (ref), CellResult (copy), p4 (copy), CoreModule (upval), TypesUDim2 (copy), TypesEnum (copy), Host (copy), p2 (copy), BodyFunction (copy), Runtime (copy), OverlayPlacementModule (upval), TypesVector2 (copy)
		assert(type(p5.onRetire) == "function", "Callout requires onRetire")
		assert(p5.anchor, "Callout requires a native anchor")
		OverlayPartsModule.checkMedia("UI.Callout", p5.media)
		local UICallout = OverlayPartsModule.checkActions(p1, "UI.Callout", p5.actions, 2)
		
		if p5.closeButton ~= nil and type(p5.closeButton) ~= "boolean" then
			error("Facet UI.Callout: closeButton must be true or false", 0)
		end
		if p5.title ~= nil and not OverlayPartsModule.bound(p1, p5.title, "string") then
			error("Facet UI.Callout: title must be a string or a bound string", 0)
		end
		local Steps = p5.steps
		
		if Steps ~= nil then
			local Index = if type(Steps) == "table" then Steps.index else nil
			local Count = if type(Steps) == "table" then Steps.count else nil
			
			local function _(Value: number): boolean
				return type(Value) == "number" and Value == math.floor(Value) and Value < 1e999
			end
			
			if type(Index) ~= "number" or type(Count) ~= "number" or (type(Index) ~= "number" or (Index ~= math.floor(Index) or Index >= 1e999)) or (type(Count) ~= "number" or (Count ~= math.floor(Count) or Count >= 1e999) or Index < 1 or Count < Index) then
				error("Facet UI.Callout: steps must be { index, count } with whole numbers 1 <= index <= count", 0)
			end
		end
		if p5.content == nil and p5.title == nil and p5.media == nil and Steps == nil and UICallout == 0 then
			error("Facet UI.Callout: nothing to show. Supply content, or a title, media, steps or actions", 0)
		end
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService and UserInputService.GetPropertyChangedSignal then p1.observe.PreferredInput(UserInputService) else nil
		local v1 = assert(Compose.currentOwner())
		local CellResult1 = Compose.cell(false)
		local AvailableResult = p3.available(p5.anchor)
		Id += 1
		local config = {
			id = Id,
			eligible = Compose.formula(function(Callback): boolean
				-- upvalues: AvailableResult (copy), CellResult1 (copy), ReadFunction (upval), p5 (copy)
				return Callback(AvailableResult) and (not Callback(CellResult1) and (ReadFunction(p5.isPresented, Callback) ~= false and (ReadFunction(p5.seen, Callback) ~= true and (ReadFunction(p5.featureUsed, Callback) ~= true and (p5.afterSessions == nil or p5.afterSessions <= (ReadFunction(p5.sessions, Callback) or 0))))))
			end),
			priority = p5.priority or 0
		}
		local Copy = table.clone(CellResult:peek())
		table.insert(Copy, config)
		CellResult:set(Copy)
		Compose.cleanup(function()
			-- upvalues: CellResult (upval), config (copy)
			local List = {}
			
			for _, value in CellResult:peek() do
				if value ~= config then
					table.insert(List, value)
				end
			end
			CellResult:set(List)
		end)
		local FormulaResult = Compose.formula(function(Callback): boolean
			-- upvalues: CellResult (upval), config (copy)
			local v2 = nil
			
			for _, value in Callback(CellResult) do
				if Callback(value.eligible) and (not v2 or v2.priority < value.priority) then
					v2 = value
				end
			end
			return v2 == config
		end)
		local Callout = p4.empty(p5, {
			"anchor", "content", "dismissLabel", "edge", "align", "tail", "priority",
			"seen", "sessions", "afterSessions", "featureUsed", "onRetire", "onShow",
			"onHide", "isPresented", "title", "media", "steps", "actions", "closeButton"
		}, "Callout")
		local Ancestor = nil
		
		local function retire(p6)
			-- upvalues: CellResult1 (copy), CoreModule (upval), v1 (copy), p1 (upval), Ancestor (ref), p5 (copy)
			if CellResult1:peek() or CoreModule.owner.isDisposed(v1) then return end
			local GuiService = p1.config.guiService
			local GetResult = if GuiService then p1.selection.get() else nil
			
			if GuiService and Ancestor and GetResult and GetResult:IsDescendantOf(Ancestor) and p5.anchor.Selectable and p5.anchor.Parent then
				p1.selection.set(p5.anchor)
			end
			CellResult1:set(true)
			p5.onRetire(p6)
		end
		
		Compose.watch(function(p6)
			-- upvalues: ReadFunction (upval), p5 (copy), retire (copy)
			if ReadFunction(p5.featureUsed, p6) == true then
				retire("featureUsed")
				
				return
			end
			if ReadFunction(p5.seen, p6) == true then
				retire("seen")
			end
		end)
		local MotionFast = p1.metric("motion.fast")
		local Motion = { enter = MotionFast, exit = MotionFast }
		p3.attach(Callout, {
			p3.overlay(p5.anchor, FormulaResult, function(p6)
				-- upvalues: Compose (upval), p3 (upval), Motion (copy), p5 (copy), p1 (upval), CellResult1 (copy), ReadFunction (upval), TypesUDim2 (upval), TypesEnum (upval), Host (upval), p2 (upval), OverlayPartsModule (upval), retire (copy), BodyFunction (upval), Steps (copy), Runtime (upval), PreferredInputResult (copy), OverlayPlacementModule (upval), TypesVector2 (upval), Ancestor (ref)
				local CellResult = Compose.cell(false)
				local AppearanceResult = p3.appearance(p6, Motion, CellResult)
				
				if p5.onShow then
					local Success, Result = pcall(p5.onShow)
					
					if not Success then
						if p1.config.onError then
							p1.config.onError(Result)
						else
							warn(`Facet UI.Callout: onShow failed: {tostring(Result)}`)
						end
					end
				end
				Compose.cleanup(function()
					-- upvalues: p5 (upval), CellResult1 (upval)
					if p5.onHide then
						p5.onHide(if CellResult1:peek() then "retired" else "hidden")
					end
				end)
				local AbsolutePositionResult = p1.observe.AbsolutePosition(p5.anchor)
				local AbsoluteSizeResult = p1.observe.AbsoluteSize(p5.anchor)
				local List = {}
				
				if p5.title ~= nil or p5.closeButton == true then
					local List1 = {}
					
					if p5.title ~= nil then
						local Title = p5.title
						local Title1 = p1.text({
							Name = "Title",
							Text = function(p7)
								-- upvalues: ReadFunction (upval), Title (copy)
								return ReadFunction(Title, p7) or ""
							end,
							TextWrapped = true,
							Size = TypesUDim2.new(1, 0, 0, 0),
							AutomaticSize = TypesEnum.AutomaticSize.Y,
							Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
						})
						p1.textRole(Title1, "heading")
						table.insert(List1, Title1)
					end
					if p5.closeButton == true then
						table.insert(List1, p2.Button("Close")({
							name = "Close",
							icon = "close",
							Size = OverlayPartsModule.closeTarget(p1),
							AutomaticSize = TypesEnum.AutomaticSize.None,
							onActivate = function()
								-- upvalues: retire (upval)
								retire("dismissed")
							end
						}))
					end
					table.insert(List, (p1.row(List1, {
						Name = "Header",
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y
					})))
				end
				if p5.media then
					table.insert(List, OverlayPartsModule.media(p1, p5.media))
				end
				if p5.content ~= nil then
					table.insert(List, BodyFunction(p5.content))
				end
				if Steps then
					table.insert(List, p1.styled(p1.text({
						Name = "Steps",
						Text = function(p7)
							-- upvalues: p1 (upval), Steps (copy)
							return p1.phrase("Facet.IndexOf", "{current} of {count}", { current = Steps.index, count = Steps.count }, p7)
						end,
						AutomaticSize = TypesEnum.AutomaticSize.XY
					}), "secondary"))
				end
				local Actions = p5.actions or {}
				local ButtonResults = {}
				
				if #Actions > 0 then
					local config = {
						Name = "Actions",
						BackgroundTransparency = 1,
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y
					}
					config[#config + 1] = Host.UIListLayout({
						FillDirection = TypesEnum.FillDirection.Horizontal,
						HorizontalFlex = TypesEnum.UIFlexAlignment.Fill,
						SortOrder = TypesEnum.SortOrder.LayoutOrder,
						Padding = p1.types.UDim.new(0, 8)
					})
					
					for LayoutOrder, action in Actions do
						local ButtonResult = p2.Button({
							Name = action.id,
							label = action.label,
							role = action.role,
							appearance = if action.role == "default" then "emphasis" else nil,
							enabled = action.enabled,
							busy = action.busy,
							LayoutOrder = LayoutOrder,
							onActivate = function()
								-- upvalues: OverlayPartsModule (upval), action (copy), retire (upval)
								OverlayPartsModule.call(action.onActivate, function()
									-- upvalues: retire (upval)
									retire("action")
								end)
							end
						})
						config[#config + 1] = ButtonResult
						ButtonResults[action.id] = ButtonResult
					end
					table.insert(List, Host.Frame(config))
				else
					table.insert(List, p2.Button("Dismiss")({
						label = p5.dismissLabel or "Got it",
						onActivate = function()
							-- upvalues: retire (upval)
							retire("dismissed")
						end
					}))
				end
				table.insert(List, p1.padding(12, 12))
				local ColumnResult = p1.column(List, {
					Name = "CalloutContent",
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				})
				assert(ColumnResult:FindFirstChildWhichIsA("UIListLayout")).HorizontalFlex = TypesEnum.UIFlexAlignment.Fill
				local CalloutBody = Host.ScrollingFrame({
					Name = "CalloutBody",
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = TypesUDim2.new(1, 0, 0, 0),
					CanvasSize = TypesUDim2.new(),
					AutomaticCanvasSize = TypesEnum.AutomaticSize.Y,
					ScrollingDirection = TypesEnum.ScrollingDirection.Y,
					ScrollBarThickness = 4,
					VerticalScrollBarInset = TypesEnum.ScrollBarInset.None,
					Selectable = false,
					ColumnResult
				})
				local Callout = p1.styled(p1.fade({
					Name = "CalloutPanel",
					GroupTransparency = function(p7): number
						-- upvalues: AppearanceResult (copy)
						return 1 - AppearanceResult.opacity(p7)
					end,
					Size = TypesUDim2.fromOffset(280, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y,
					p1.corner(),
					CalloutBody
				}), "callout")
				p1.modalPortal(Callout, p5.anchor)
				p1.styled(Callout, "panel")
				p1.styled(Callout, "floating")
				p3.skin(Callout)
				local Anchor = assert(p3.parent(p5.anchor))
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Anchor)
				local AbsolutePositionResult1 = p1.observe.AbsolutePosition(Anchor)
				local AtRestResult, AtRestResult2 = p3.atRest(AppearanceResult.travel, CellResult, { Callout, ColumnResult })
				local AtRestResultEntry = AtRestResult[1]
				local AtRestResultEntry1 = AtRestResult[2]
				
				local function _(Callback)
					-- upvalues: AtRestResult2 (copy), AppearanceResult (copy), AtRestResultEntry (copy)
					return if Callback(AtRestResult2) and AppearanceResult.travel(Callback) < 1 then Callback(AtRestResultEntry) else nil
				end
				
				local IsNotNone: boolean = p5.tail ~= false and p5.tail ~= "none"
				
				local _ = function(p7): number
					-- upvalues: IsNotNone (copy), OverlayPartsModule (upval), p1 (upval)
					return 8 + (if IsNotNone then OverlayPartsModule.tailDepth(p1, p7) else 0)
				end
				
				Runtime.decorate(CalloutBody, {
					Size = function(Callback)
						-- upvalues: p1 (upval), AbsolutePositionResult (copy), AbsolutePositionResult1 (copy), AbsoluteSizeResult (copy), IsNotNone (copy), OverlayPartsModule (upval), ReadFunction (upval), p5 (upval), AbsoluteSizeResult1 (copy), p3 (upval), TypesUDim2 (upval), AtRestResultEntry1 (copy)
						local SpaceS: number = p1.metric("space.s", Callback)
						local YDelta = Callback(AbsolutePositionResult).Y - Callback(AbsolutePositionResult1).Y
						local NewYDelta = YDelta + Callback(AbsoluteSizeResult).Y
						local v3 = 8 + (if IsNotNone then OverlayPartsModule.tailDepth(p1, Callback) else 0)
						local ReadResult = ReadFunction(p5.edge, Callback)
						local YDelta1 = if ReadResult == "leading" or ReadResult == "trailing" then Callback(AbsoluteSizeResult1).Y - SpaceS * 2 else math.max(YDelta - v3 - SpaceS, Callback(AbsoluteSizeResult1).Y - NewYDelta - v3 - SpaceS)
						local SpaceM = p1.metric("space.m", Callback)
						
						return TypesUDim2.new(1, 0, 0, (math.max(0, (math.min(Callback(AtRestResultEntry1).Y, YDelta1 - (p3.inset(SpaceM, "top", nil, Callback) + p3.inset(SpaceM, "bottom", nil, Callback)))))))
					end
				})
				
				local function above(Callback: (any) -> (), p7: number): number
					-- upvalues: AbsolutePositionResult (copy), p5 (upval), Anchor (copy)
					Callback(AbsolutePositionResult)
					local ZIndex = 0
					local Anchor1 = p5.anchor
					while Anchor1 and Anchor1 ~= Anchor do
						if Anchor1:IsA("GuiObject") then
							ZIndex = Anchor1.ZIndex
						end
						Anchor1 = Anchor1.Parent
					end
					return (math.max(p7, ZIndex + p7 - 93))
				end
				
				local FormulaResult = Compose.formula(function(Callback)
					-- upvalues: AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsoluteSizeResult1 (copy), AbsolutePositionResult1 (copy), AtRestResultEntry (copy), ReadFunction (upval), p5 (upval), PreferredInputResult (upval), TypesEnum (upval), p1 (upval), OverlayPlacementModule (upval), IsNotNone (copy), OverlayPartsModule (upval)
					local CallbackResult = Callback(AbsolutePositionResult)
					local CallbackResult1 = Callback(AbsoluteSizeResult)
					local CallbackResult2 = Callback(AbsoluteSizeResult1)
					local CallbackResult3 = Callback(AbsolutePositionResult1)
					local CallbackResult4 = Callback(AtRestResultEntry)
					local XDelta = CallbackResult.X - CallbackResult3.X
					local YDelta = CallbackResult.Y - CallbackResult3.Y
					local ReadResult = ReadFunction(p5.align, Callback) or "center"
					local SpaceS: number = p1.metric("space.s", Callback)
					local SolveResult = OverlayPlacementModule.solve({
						source = {
							x = XDelta,
							y = YDelta,
							w = CallbackResult1.X,
							h = CallbackResult1.Y
						},
						size = { w = CallbackResult4.X, h = CallbackResult4.Y },
						safe = {
							x = SpaceS,
							y = SpaceS,
							w = math.max(0, CallbackResult2.X - SpaceS * 2),
							h = math.max(0, CallbackResult2.Y - SpaceS * 2)
						},
						edge = ReadFunction(p5.edge, Callback) or (if PreferredInputResult and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch then "top" else "bottom"),
						align = if ReadResult == "leading" then "start" elseif ReadResult == "trailing" then "end" else "center",
						gap = 8 + (if IsNotNone then OverlayPartsModule.tailDepth(p1, Callback) else 0),
						tail = if IsNotNone then OverlayPartsModule.tailWidth(p1, Callback) else 0,
						tailInset = p1.metric("radii.panel", Callback)
					})
					
					return {
						left = SolveResult.x,
						top = SolveResult.y,
						edge = SolveResult.edge,
						tailX = SolveResult.tailX,
						tailY = SolveResult.tailY,
						tailSuppressed = SolveResult.tailSuppressed
					}
				end)
				local Frame = {
					AutomaticSize = function(Callback)
						-- upvalues: AtRestResult2 (copy), AppearanceResult (copy), AtRestResultEntry (copy), TypesEnum (upval)
						local CallbackResult = if Callback(AtRestResult2) and AppearanceResult.travel(Callback) < 1 then Callback(AtRestResultEntry) else nil
						
						return if CallbackResult then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.Y
					end,
					Size = function(Callback)
						-- upvalues: AtRestResult2 (copy), AppearanceResult (copy), AtRestResultEntry (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsolutePositionResult1 (copy), AbsoluteSizeResult1 (copy), p1 (upval), OverlayPlacementModule (upval), IsNotNone (copy), OverlayPartsModule (upval), TypesUDim2 (upval)
						local CallbackResult = if Callback(AtRestResult2) and AppearanceResult.travel(Callback) < 1 then Callback(AtRestResultEntry) else nil
						local CallbackResult1 = Callback(AbsolutePositionResult)
						local CallbackResult2 = Callback(AbsoluteSizeResult)
						local CallbackResult3 = Callback(AbsolutePositionResult1)
						local CallbackResult4 = Callback(AbsoluteSizeResult1)
						local SpaceS: number = p1.metric("space.s", Callback)
						
						return TypesUDim2.fromOffset(OverlayPlacementModule.width({
							x = CallbackResult1.X - CallbackResult3.X,
							y = CallbackResult1.Y - CallbackResult3.Y,
							w = CallbackResult2.X,
							h = CallbackResult2.Y
						}, { w = 280, h = Callback(AtRestResultEntry).Y }, {
							x = SpaceS,
							y = SpaceS,
							w = math.max(0, CallbackResult4.X - SpaceS * 2),
							h = math.max(0, CallbackResult4.Y - SpaceS * 2)
						}, 8 + (if IsNotNone then OverlayPartsModule.tailDepth(p1, Callback) else 0)), if CallbackResult then math.ceil(CallbackResult.Y) else 0)
					end,
					ZIndex = function(p8)
						-- upvalues: above (copy)
						return (above(p8, 95))
					end
				}
				Runtime.decorate(Callout, Frame)
				local PopoverResult = p3.popover(Callout, AppearanceResult.travel, function(Callback)
					-- upvalues: FormulaResult (copy), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), AbsolutePositionResult1 (copy), AtRestResultEntry (copy), TypesVector2 (upval)
					local CallbackResult = Callback(FormulaResult)
					local CallbackResult1 = Callback(AbsolutePositionResult)
					local CallbackResult2 = Callback(AbsoluteSizeResult)
					local CallbackResult3 = Callback(AbsolutePositionResult1)
					local CallbackResult4 = Callback(AtRestResultEntry)
					local XDelta = CallbackResult1.X - CallbackResult3.X + CallbackResult2.X / 2 - CallbackResult.left
					local YDelta = CallbackResult1.Y - CallbackResult3.Y + CallbackResult2.Y / 2 - CallbackResult.top
					
					return TypesVector2.new(CallbackResult.left, CallbackResult.top), if CallbackResult.edge == "bottom" then TypesVector2.new(math.clamp(XDelta, 0, CallbackResult4.X), 0) elseif CallbackResult.edge == "top" then TypesVector2.new(math.clamp(XDelta, 0, CallbackResult4.X), CallbackResult4.Y) elseif CallbackResult.edge == "right" then TypesVector2.new(0, (math.clamp(YDelta, 0, CallbackResult4.Y))) else TypesVector2.new(CallbackResult4.X, (math.clamp(YDelta, 0, CallbackResult4.Y)))
				end, {
					pinned = true,
					rested = AtRestResult2,
					size = AtRestResultEntry,
					geometry = { Size = Frame.Size, AutomaticSize = Frame.AutomaticSize }
				})
				local Arrow = if IsNotNone then OverlayPartsModule.tail(p1, "Arrow", function(Callback)
					-- upvalues: FormulaResult (copy), TypesVector2 (upval)
					local CallbackResult = Callback(FormulaResult)
					
					if CallbackResult.tailSuppressed or CallbackResult.tailX == nil or CallbackResult.tailY == nil then
						return nil, CallbackResult.edge
					else
						return TypesVector2.new(CallbackResult.tailX, CallbackResult.tailY), CallbackResult.edge
					end
				end, AppearanceResult.opacity, function(p8)
					-- upvalues: above (copy)
					return (above(p8, 95))
				end, {
					role = "floating",
					node = Callout,
					scale = PopoverResult,
					corner = function(Callback)
						-- upvalues: FormulaResult (copy), TypesVector2 (upval)
						local CallbackResult = Callback(FormulaResult)
						
						return TypesVector2.new(CallbackResult.left, CallbackResult.top)
					end,
					size = AtRestResultEntry,
					radius = function(p8)
						-- upvalues: p1 (upval)
						return p1.metric("radii.panel", p8)
					end
				}) else nil
				local UserInputService = p3.service("UserInputService")
				
				if UserInputService then
					Runtime.connect(UserInputService, "InputBegan", function(Input, p8)
						-- upvalues: TypesEnum (upval), Callout (copy), p5 (upval), retire (upval)
						if p8 or Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 and Input.UserInputType ~= TypesEnum.UserInputType.Touch then return end
						local function _(Frame: Frame): boolean
							-- upvalues: Input (copy)
							local Position = Input.Position
							local AbsolutePosition = Frame.AbsolutePosition
							local AbsoluteSize = Frame.AbsoluteSize
							
							return AbsolutePosition.X <= Position.X and (Position.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Position.Y) and Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y
						end
						
						local Position = Input.Position
						local AbsolutePosition = Callout.AbsolutePosition
						local AbsoluteSize = Callout.AbsoluteSize
						
						if AbsolutePosition.X > Position.X or (Position.X > AbsolutePosition.X + AbsoluteSize.X or (AbsolutePosition.Y > Position.Y or Position.Y > AbsolutePosition.Y + AbsoluteSize.Y)) then
							local Anchor = p5.anchor
							local Position1 = Input.Position
							local AbsolutePosition1 = Anchor.AbsolutePosition
							local AbsoluteSize1 = Anchor.AbsoluteSize
							
							if AbsolutePosition1.X > Position1.X or (Position1.X > AbsolutePosition1.X + AbsoluteSize1.X or (AbsolutePosition1.Y > Position1.Y or Position1.Y > AbsolutePosition1.Y + AbsoluteSize1.Y)) then
								retire("tapAway")
							end
						end
					end)
				end
				Ancestor = Callout
				
				if p1.config.guiService then
					local Anchor1 = p5.anchor
					local ObserveResult = p1.selection.observe()
					local AbsolutePositionResult2 = p1.observe.AbsolutePosition(Callout)
					local Down = nil
					local NextSelectionDown = nil
					
					local function unlink()
						-- upvalues: Down (ref), Anchor1 (copy), NextSelectionDown (ref), Runtime (upval)
						if Down == "Down" and Anchor1.NextSelectionDown == NextSelectionDown then
							Runtime.host.render.setProperty(Anchor1, "NextSelectionDown", nil)
						elseif Down == "Up" and Anchor1.NextSelectionUp == NextSelectionDown then
							Runtime.host.render.setProperty(Anchor1, "NextSelectionUp", nil)
						end
						Down = nil
						NextSelectionDown = nil
					end
					
					local CellResult1 = Compose.cell(0)
					local v3 = nil
					Runtime.connect(Callout, "DescendantAdded", function()
						-- upvalues: v3 (ref), CellResult1 (copy)
						v3 = nil
						CellResult1:set(CellResult1:peek() + 1)
					end)
					Runtime.connect(Callout, "DescendantRemoving", function(Ancestor)
						-- upvalues: NextSelectionDown (ref), v3 (ref), CellResult1 (copy)
						if NextSelectionDown and (Ancestor == NextSelectionDown or NextSelectionDown:IsDescendantOf(Ancestor)) then
							v3 = NextSelectionDown
							CellResult1:set(CellResult1:peek() + 1)
						end
					end)
					Compose.watch(function(Callback)
						-- upvalues: CellResult1 (copy), AbsolutePositionResult2 (copy), Anchor1 (copy), Actions (copy), OverlayPartsModule (upval), p1 (upval), ButtonResults (copy), p3 (upval), Callout (copy), v3 (ref), Down (ref), NextSelectionDown (ref), unlink (copy)
						Callback(CellResult1)
						local IsYBelow = Anchor1.AbsolutePosition.Y < Callback(AbsolutePositionResult2).Y
						local Down1: string = if IsYBelow then "Down" else "Up"
						local List = {}
						
						for _, action in Actions do
							table.insert(List, {
								id = action.id,
								role = action.role,
								usable = OverlayPartsModule.usable(p1, action, Callback)
							})
						end
						local InitialActionResult = OverlayPartsModule.initialAction(List)
						local ButtonResult = if InitialActionResult then ButtonResults[InitialActionResult] else nil
						local FirstSelectableResult = (if ButtonResult then p3.firstSelectable(ButtonResult) else nil) or p3.firstSelectable(Callout)
						local FirstSelectableResult1 = if FirstSelectableResult == v3 then nil else FirstSelectableResult
						
						if Down ~= Down1 or NextSelectionDown ~= FirstSelectableResult1 then
							unlink()
							local NextSelectionDown1 = if IsYBelow then Anchor1.NextSelectionDown else Anchor1.NextSelectionUp
							
							if FirstSelectableResult1 and NextSelectionDown1 == nil then
								if IsYBelow then
									Anchor1.NextSelectionDown = FirstSelectableResult1
								else
									Anchor1.NextSelectionUp = FirstSelectableResult1
								end
								Down = Down1
								NextSelectionDown = FirstSelectableResult1
							end
						end
					end)
					Compose.cleanup(function()
						-- upvalues: unlink (copy), p1 (upval), Callout (copy), Anchor1 (copy)
						unlink()
						local GetResult = p1.selection.get()
						
						if GetResult and GetResult:IsDescendantOf(Callout) then
							p1.selection.set(if Anchor1.Selectable and Anchor1.Parent then Anchor1 else nil)
						end
					end)
					p1.action(Callout, "CalloutBack", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, function(Callback)
						-- upvalues: ObserveResult (copy), Callout (copy)
						local CallbackResult = Callback(ObserveResult)
						
						return CallbackResult ~= nil and CallbackResult:IsDescendantOf(Callout)
					end, function()
						-- upvalues: retire (upval)
						retire("dismissed")
					end, { priority = 2000 })
				end
				local Callout1 = if Arrow then Host.Folder("CalloutOverlay")({ Callout, table.unpack(Arrow) }) else Callout
				p3.keep(p5.content)
				
				return Callout1
			end, { motion = Motion })
		})
		
		return Callout
	end)
end