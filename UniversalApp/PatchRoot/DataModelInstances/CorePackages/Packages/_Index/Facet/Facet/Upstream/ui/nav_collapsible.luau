local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./overlay_types")
local _ = require("./input_props")
local _ = require("./navigation_props")
local _ = require("./nav_surface_parts")

return function(p1, p2, p3, p4)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local BodyFunction = p4.body
	p2.CollapsibleView = p1.construct("CollapsibleView", function(Tbl)
		-- upvalues: p2 (copy), p3 (copy), p1 (copy), Compose (copy), p4 (copy), Runtime (copy), TypesEnum (copy), Host (copy), BodyFunction (copy), TypesUDim2 (copy), ReadFunction (copy), TypesVector2 (copy)
		assert(type(Tbl.expanded) == "table" and Tbl.expanded.set, "CollapsibleView.expanded requires a writable Compose cell")
		local Copy = table.clone(Tbl)
		Copy.content = nil
		Copy.expanded = nil
		Copy.initialFocus = nil
		Copy.dismissButton = nil
		Copy.outsideDismiss = nil
		Copy.ref = nil
		Copy.trailingIcon = Tbl.trailingIcon or "chevron.down"
		Copy.corners = Tbl.corners or "pill"
		
		function Copy.onActivate()
			-- upvalues: Tbl (copy)
			Tbl.expanded:set(not Tbl.expanded:peek())
		end
		
		local ButtonResult = p2.Button(Copy)
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else Compose.cell(nil)
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(false)
		Compose.watch(function(Callback)
			-- upvalues: CellResult1 (copy), Tbl (copy), CellResult (copy)
			CellResult1:set(Callback(Tbl.expanded) and Callback(CellResult))
		end)
		local RevealMotionResult, RevealMotionResult2, RevealMotionResult3 = p4.revealMotion(CellResult1)
		
		local function hidden(Callback)
			-- upvalues: CellResult (copy), RevealMotionResult3 (copy)
			return if Callback(CellResult) then RevealMotionResult3(Callback) else 1
		end
		
		local function collapse()
			-- upvalues: Tbl (copy)
			Tbl.expanded:set(false)
		end
		
		local Title = ButtonResult:FindFirstChild("Title", true)
		
		if Title and Title:IsA("TextLabel") then
			Runtime.decorate(Title, {
				TextWrapped = false,
				TextTruncate = TypesEnum.TextTruncate.AtEnd
			})
			Runtime.mount(function()
				-- upvalues: Host (upval), TypesEnum (upval)
				return Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Shrink })
			end, Title)
		end
		local TrailingIcon = ButtonResult:FindFirstChild("TrailingIcon", true)
		
		if Tbl.trailingIcon == nil and TrailingIcon and TrailingIcon:IsA("GuiObject") then
			Runtime.decorate(TrailingIcon, {
				Rotation = function(p5)
					-- upvalues: RevealMotionResult (copy)
					return 180 * RevealMotionResult(p5)
				end
			})
		end
		local AbsoluteSizeResult = p1.observe.AbsoluteSize(ButtonResult)
		local AbsolutePositionResult = p1.observe.AbsolutePosition(ButtonResult)
		p3.attach(ButtonResult, {
			p3.overlay(ButtonResult, Tbl.expanded, function(p5)
				-- upvalues: CellResult (copy), Compose (upval), p3 (upval), ButtonResult (copy), p1 (upval), BodyFunction (upval), Tbl (copy), TypesUDim2 (upval), TypesEnum (upval), ReadFunction (upval), PreferredInputResult (copy), p2 (upval), collapse (copy), Host (upval), TypesVector2 (upval), AbsolutePositionResult (copy), AbsoluteSizeResult (copy), hidden (copy), RevealMotionResult (copy)
				CellResult:set(false)
				Compose.cleanup(function()
					-- upvalues: CellResult (upval)
					CellResult:set(false)
				end)
				local v1 = assert(p3.parent(ButtonResult))
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(v1)
				local AbsolutePositionResult1 = p1.observe.AbsolutePosition(v1)
				local ColumnResult = p1.column({ BodyFunction(Tbl.content), p1.padding(16, 16) }, {
					Name = "ExpandedBody",
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				})
				local ColumnResult1 = p1.column({
					Compose.show(function(Callback): boolean
						-- upvalues: ReadFunction (upval), Tbl (upval), PreferredInputResult (upval), TypesEnum (upval)
						return ReadFunction(Tbl.dismissButton, Callback) ~= false or Callback(PreferredInputResult) == TypesEnum.PreferredInput.Gamepad
					end, function()
						-- upvalues: p2 (upval), collapse (upval)
						return p2.Button("Close")({ label = "Close", onActivate = collapse })
					end),
					Host.UIPadding({
						PaddingLeft = p1.types.UDim.new(0, 16),
						PaddingRight = p1.types.UDim.new(0, 16),
						PaddingBottom = p1.types.UDim.new(0, 16)
					})
				}, {
					Name = "ExpandedFooter",
					AnchorPoint = TypesVector2.new(0, 1),
					Position = TypesUDim2.fromScale(0, 1),
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				})
				local AbsoluteSizeResult2 = p1.observe.AbsoluteSize(ColumnResult)
				local AbsoluteSizeResult3 = p1.observe.AbsoluteSize(ColumnResult1)
				local CellResult1 = Compose.cell(TypesVector2.zero)
				local FormulaResult = Compose.formula(function(Callback)
					-- upvalues: AbsoluteSizeResult1 (copy), AbsolutePositionResult1 (copy), AbsolutePositionResult (upval), AbsoluteSizeResult (upval), p1 (upval), AbsoluteSizeResult2 (copy), AbsoluteSizeResult3 (copy), CellResult1 (copy)
					local CallbackResult = Callback(AbsoluteSizeResult1)
					local CallbackResult1 = Callback(AbsolutePositionResult1)
					local CallbackResult2 = Callback(AbsolutePositionResult)
					local CallbackResult3 = Callback(AbsoluteSizeResult)
					local SpaceS: number = p1.metric("space.s", Callback)
					local Smallest = math.min(math.max(CallbackResult3.X, (p1.metric("controls.popup.panelWidth", Callback))), (math.max(0, CallbackResult.X - 2 * SpaceS)))
					local Smallest1 = math.min(math.max(Callback(AbsoluteSizeResult2).Y + Callback(AbsoluteSizeResult3).Y + Callback(CellResult1).Y, CallbackResult3.Y), (math.max(0, CallbackResult.Y - 2 * SpaceS)))
					
					return {
						x = math.clamp(CallbackResult2.X - CallbackResult1.X, SpaceS, (math.max(SpaceS, CallbackResult.X - SpaceS - Smallest))),
						y = math.clamp(CallbackResult2.Y - CallbackResult1.Y, SpaceS, (math.max(SpaceS, CallbackResult.Y - SpaceS - Smallest1))),
						w = Smallest,
						h = Smallest1
					}
				end)
				local ExpandedFade = p1.fade({
					Name = "ExpandedFade",
					BackgroundTransparency = 1,
					Size = function(Callback)
						-- upvalues: FormulaResult (copy), CellResult1 (copy), TypesUDim2 (upval)
						local CallbackResult = Callback(FormulaResult)
						local CallbackResult1 = Callback(CellResult1)
						
						return TypesUDim2.fromOffset(CallbackResult.w - CallbackResult1.X, CallbackResult.h - CallbackResult1.Y)
					end,
					GroupTransparency = 0,
					Host.ScrollingFrame("ExpandedScroll")({
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = function(Callback)
							-- upvalues: TypesUDim2 (upval), AbsoluteSizeResult3 (copy)
							return TypesUDim2.new(1, 0, 1, -Callback(AbsoluteSizeResult3).Y)
						end,
						CanvasSize = function(Callback)
							-- upvalues: TypesUDim2 (upval), AbsoluteSizeResult2 (copy)
							return TypesUDim2.fromOffset(0, Callback(AbsoluteSizeResult2).Y)
						end,
						ScrollingDirection = TypesEnum.ScrollingDirection.Y,
						ScrollBarThickness = 4,
						VerticalScrollBarInset = TypesEnum.ScrollBarInset.Always,
						Selectable = false,
						ColumnResult
					}),
					ColumnResult1
				})
				local Frame = Host.Frame("ContentBox")({
					BackgroundTransparency = 1,
					Interactable = false,
					Size = TypesUDim2.fromScale(1, 1)
				})
				local SkinResult = p3.skin(p1.styled(p1.fade({
					Name = "Expanded",
					GroupTransparency = hidden,
					Active = true,
					BackgroundTransparency = 0,
					ClipsDescendants = true,
					Position = function(Callback)
						-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
						local CallbackResult = Callback(FormulaResult)
						
						return TypesUDim2.fromOffset(CallbackResult.x, CallbackResult.y)
					end,
					Size = function(Callback)
						-- upvalues: FormulaResult (copy), TypesUDim2 (upval)
						local CallbackResult = Callback(FormulaResult)
						
						return TypesUDim2.fromOffset(CallbackResult.w, CallbackResult.h)
					end,
					ExpandedFade,
					Frame,
					p1.corner()
				}), "panel"))
				p1.styled(SkinResult, "floating")
				local AbsoluteSizeResult4 = p1.observe.AbsoluteSize(SkinResult)
				local AbsoluteSizeResult5 = p1.observe.AbsoluteSize(Frame)
				Compose.watch(function(Callback: (any) -> ())
					-- upvalues: AbsoluteSizeResult4 (copy), AbsoluteSizeResult5 (copy), SkinResult (copy), Frame (copy), CellResult1 (copy)
					Callback(AbsoluteSizeResult4)
					Callback(AbsoluteSizeResult5)
					local AbsoluteSize = SkinResult.AbsoluteSize
					local AbsoluteSize1 = Frame.AbsoluteSize
					
					if AbsoluteSize1.X > 0 and AbsoluteSize1.Y > 0 then
						CellResult1:set(AbsoluteSize - AbsoluteSize1)
					end
				end)
				p3.atRest(function(): number
					return 0
				end, CellResult, {
					SkinResult,
					ExpandedFade,
					ColumnResult,
					ColumnResult1,
					Frame
				})
				local ModalResult = p3.modal(function()
					-- upvalues: SkinResult (copy)
					return SkinResult
				end, collapse, {
					Name = "CollapsibleModal",
					outsideMargin = 0,
					backgroundTransparency = 1,
					outsideDismiss = Tbl.outsideDismiss,
					initialFocus = Tbl.initialFocus,
					exiting = if p5 then p5.exiting else nil,
					appearance = RevealMotionResult
				})
				ModalResult:SetAttribute("FacetArrivalGroup", true)
				p3.keep(Tbl.content)
				
				return ModalResult
			end, {
				presence = {
					exit = function()
						-- upvalues: RevealMotionResult2 (copy)
						return { completed = RevealMotionResult2 }
					end
				}
			})
		})
		
		return ButtonResult
	end)
end