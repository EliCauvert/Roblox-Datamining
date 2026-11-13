local _ = require("./control_types")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./overlay_types")
local CoreModule = require("../vendor/compose/core")
local OverlayPartsModule = require("./overlay_parts")
local OverlayPlacementModule = require("./overlay_placement")
local ActivationModule = require("./activation")
local _ = require("./overlay_props")
local _ = require("./navigation_props")
local list = {
	"isPresented", "onPresentedChange", "onDismiss", "trigger", "source",
	"content", "edge", "align", "gap", "crossOffset", "tail", "maxWidth",
	"maxHeight", "compact", "title", "modal", "cancelPolicy", "closeButton"
}

return function(p1, p2, p3)
	-- upvalues: OverlayPartsModule (copy), OverlayPlacementModule (copy), list (copy), ActivationModule (copy), CoreModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	local function _(Value: number): boolean
		return type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
	end
	
	p2.Popover = p1.construct("Popover", function(p4)
		-- upvalues: OverlayPartsModule (upval), OverlayPlacementModule (upval), p1 (copy), Compose (copy), list (upval), Runtime (copy), Host (copy), TypesUDim2 (copy), ReadFunction (copy), ActivationModule (upval), p3 (copy), TypesVector2 (copy), CoreModule (upval), TypesEnum (copy), p2 (copy)
		if p4.isPresented == nil then
			error("Facet UI.Popover: isPresented is required; it is the caller's boolean fact", 0)
		end
		for _, value in { "onPresentedChange", "onDismiss" } do
			local Callback = p4[value]
			
			if Callback ~= nil and type(Callback) ~= "function" then
				error(`Facet UI.Popover: {value} must be a function`, 0)
			end
		end
		if type(p4.content) ~= "function" then
			error("Facet UI.Popover: content must be a factory that returns the content", 0)
		end
		if p4.trigger == nil == (p4.source == nil) then
			error("Facet UI.Popover: supply exactly one of trigger or source", 0)
		end
		local Node = nil
		local v1 = nil
		
		if p4.source ~= nil then
			local Source = p4.source
			
			if type(Source) ~= "table" then
				error("Facet UI.Popover: source is { node = GuiObject } or { rect = { x, y, w, h } }", 0)
			end
			for i in Source do
				if i ~= "node" and i ~= "rect" then
					error(`Facet UI.Popover: unknown source option '{tostring(i)}'`, 0)
				end
			end
			if Source.node == nil == (Source.rect == nil) then
				error("Facet UI.Popover: source names exactly one of node or rect", 0)
			end
			if Source.rect == nil then
				if not OverlayPartsModule.instance(Source.node) then
					error("Facet UI.Popover: source.node must be a GuiObject", 0)
				end
				Node = Source.node
			else
				local SourceRect = Source.rect
				
				for _, value1 in { "x", "y", "w", "h" } do
					local Value: number = SourceRect[value1]
					
					if type(Value) ~= "number" or (Value ~= Value or math.abs(Value) >= 1e999) then
						error(`Facet UI.Popover: source.rect.{value1} must be a finite number`, 0)
					end
				end
				v1 = {
					x = SourceRect.x,
					y = SourceRect.y,
					w = SourceRect.w,
					h = SourceRect.h
				}
			end
		end
		OverlayPlacementModule.assertEdge(p4.edge, "UI.Popover")
		OverlayPlacementModule.assertAlign(p4.align, "UI.Popover")
		OverlayPlacementModule.assertCrossOffset(p4.crossOffset, "UI.Popover")
		
		for _, value2 in { "maxWidth", "maxHeight" } do
			local Value1: number = p4[value2]
			
			if Value1 ~= nil and (type(Value1) ~= "number" or (Value1 ~= Value1 or math.abs(Value1) >= 1e999) or Value1 <= 0) then
				error(`Facet UI.Popover: {value2} must be a positive finite number of pixels`, 0)
			end
		end
		if p4.gap ~= nil then
			local Gap: number = p4.gap
			
			if type(Gap) ~= "number" or (Gap ~= Gap or math.abs(Gap) >= 1e999) then
				error("Facet UI.Popover: gap must be a finite number of pixels", 0)
			end
		end
		if p4.tail ~= nil and type(p4.tail) ~= "boolean" then
			error("Facet UI.Popover: tail must be true or false", 0)
		end
		if p4.title ~= nil and not OverlayPartsModule.bound(p1, p4.title, "string") then
			error("Facet UI.Popover: title must be a string or a bound string", 0)
		end
		if p4.modal ~= nil and type(p4.modal) ~= "boolean" then
			error("Facet UI.Popover: modal must be true or false", 0)
		end
		if p4.cancelPolicy ~= nil and p4.cancelPolicy ~= "dismiss" and p4.cancelPolicy ~= "none" then
			error("Facet UI.Popover: cancelPolicy must be dismiss or none", 0)
		end
		assert(p4.closeButton == nil or type(p4.closeButton) == "boolean", "Facet UI.Popover: closeButton must be a boolean")
		local IsNotModal = p4.modal == false
		local Popover = if IsNotModal then "popover" else p4.compact or "sheet"
		
		if Popover ~= "sheet" and Popover ~= "popover" then
			error("Facet UI.Popover: compact must be sheet or popover", 0)
		end
		local v2 = assert(Compose.currentOwner())
		local PropsResult = p1.props(p4, list, {})
		local Trigger = nil
		
		if p4.trigger then
			Trigger = p4.trigger
			local Copy = table.clone(PropsResult)
			Copy.Name = nil
			
			if next(Copy) ~= nil then
				Runtime.decorate(Trigger, Copy)
			end
		else
			Trigger = Host.Frame(p1.props(p4, list, {
				Name = "Popover",
				BackgroundTransparency = 1,
				Size = TypesUDim2.fromOffset(0, 0)
			}))
		end
		local Name = PropsResult.Name or "Popover"
		
		local function _(): boolean
			-- upvalues: ReadFunction (upval), p4 (copy)
			return ReadFunction(p4.isPresented) == true
		end
		
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(true)
		local v3 = nil
		local Flag = false
		local Flag1 = false
		local Flag2 = false
		local Flag3 = false
		
		local _ = function(p5)
			-- upvalues: p4 (copy)
			if p4.onDismiss then
				p4.onDismiss(p5)
			end
		end
		
		local _ = function(p5, p6): boolean
			-- upvalues: p4 (copy), v3 (ref), OverlayPartsModule (upval), ReadFunction (upval)
			local OnPresentedChange = p4.onPresentedChange
			
			if OnPresentedChange == nil then
				return false
			end
			if not p5 then
				v3 = p6
			end
			local v4 = false
			OverlayPartsModule.call(OnPresentedChange, function()
				-- upvalues: v4 (ref), ReadFunction (upval), p4 (upval), p5 (copy), v3 (upval)
				v4 = ReadFunction(p4.isPresented) == true == p5
				
				if not v4 then
					v3 = nil
				end
			end, p5)
			
			return v4
		end
		
		if p4.trigger then
			local Trigger1 = p4.trigger
			
			local function pressed()
				-- upvalues: Trigger1 (copy), p1 (upval), ReadFunction (upval), p4 (copy), v3 (ref), OverlayPartsModule (upval)
				if Trigger1.Interactable ~= false and p1.available(Trigger1) then
					local Inverted = not (ReadFunction(p4.isPresented) == true)
					local OnPresentedChange = p4.onPresentedChange
					
					if OnPresentedChange == nil then return end
					if not Inverted then
						v3 = "trigger"
					end
					local v4 = false
					OverlayPartsModule.call(OnPresentedChange, function()
						-- upvalues: v4 (ref), ReadFunction (upval), p4 (upval), Inverted (copy), v3 (upval)
						v4 = ReadFunction(p4.isPresented) == true == Inverted
						
						if not v4 then
							v3 = nil
						end
					end, Inverted)
				end
			end
			
			if ActivationModule.marked(Trigger1) then
				Compose.cleanup(ActivationModule.listen(Trigger1, pressed))
			else
				Runtime.connect(Trigger1, "Activated", pressed)
			end
		end
		if Node then
			local Node1 = Node
			
			local function check()
				-- upvalues: Node1 (copy), Flag2 (ref), Flag (ref), CellResult (copy), CellResult1 (copy), p4 (copy), v3 (ref), OverlayPartsModule (upval), ReadFunction (upval)
				local HasLayerCollector: boolean = Node1.Parent ~= nil and Node1:FindFirstAncestorWhichIsA("LayerCollector") ~= nil
				
				if HasLayerCollector or not Flag2 or Flag then
					CellResult1:set(HasLayerCollector)
					
					return
				end
				Flag = true
				CellResult:set(true)
				CellResult1:set(false)
				Flag = false
				local OnPresentedChange = p4.onPresentedChange
				
				if OnPresentedChange ~= nil then
					v3 = "anchorLost"
					local v4 = false
					local v5 = false
					OverlayPartsModule.call(OnPresentedChange, function()
						-- upvalues: v4 (ref), ReadFunction (upval), p4 (upval), v5 (copy), v3 (upval)
						v4 = ReadFunction(p4.isPresented) == true == v5
						
						if not v4 then
							v3 = nil
						end
					end, false)
				end
				v3 = nil
				
				if p4.onDismiss then
					p4.onDismiss("anchorLost")
				end
			end
			
			Runtime.connect(Node1, "AncestryChanged", check)
			check()
		end
		local UserInputService = p3.service("UserInputService")
		local PreferredInputResult = if UserInputService and UserInputService.GetPropertyChangedSignal then p1.observe.PreferredInput(UserInputService) else nil
		local CellResult2 = Compose.cell(TypesVector2.zero)
		local v4 = nil
		
		local function locateLayer()
			-- upvalues: CoreModule (upval), v2 (copy), v4 (ref), Compose (upval), p3 (upval), Trigger (ref), p1 (upval), CellResult2 (copy)
			if CoreModule.owner.isDisposed(v2) then return end
			if v4 then
				CoreModule.owner.dispose(v4)
			end
			local Child = CoreModule.owner.createChild(v2)
			v4 = Child
			Compose.withOwner(Child, function()
				-- upvalues: p3 (upval), Trigger (upval), p1 (upval), Compose (upval), CellResult2 (upval)
				local ParentResult = p3.parent(Trigger)
				
				if ParentResult then
					local AbsoluteSizeResult = p1.observe.AbsoluteSize(ParentResult)
					Compose.watch(function(Callback)
						-- upvalues: CellResult2 (upval), AbsoluteSizeResult (copy)
						CellResult2:set(Callback(AbsoluteSizeResult))
					end)
				end
			end)
		end
		
		Runtime.connect(Trigger, "AncestryChanged", locateLayer)
		locateLayer()
		local FormulaResult = Compose.formula(function(Callback): string
			-- upvalues: Popover (copy), CellResult2 (copy), PreferredInputResult (copy), TypesEnum (upval)
			if Popover == "popover" then
				return "popover"
			else
				local X: number = Callback(CellResult2).X
				
				return if (if PreferredInputResult then Callback(PreferredInputResult) else nil) == TypesEnum.PreferredInput.Touch and X > 0 and X < 600 then "sheet" else "popover"
			end
		end)
		local Popover1 = p1.motionTiming("popover")
		local MotionDurationsPopoverSheetExit = p1.metric("motion.durations.popoverSheetExit")
		local Motion = { enter = Popover1.enter, exit = Popover1.exit }
		Compose.watch(function(Callback)
			-- upvalues: Motion (copy), FormulaResult (copy), MotionDurationsPopoverSheetExit (copy), Popover1 (copy)
			Motion.exit = if Callback(FormulaResult) == "sheet" then MotionDurationsPopoverSheetExit else Popover1.exit
		end)
		Compose.watch(function(p5)
			-- upvalues: ReadFunction (upval), p4 (copy), CellResult (copy)
			if ReadFunction(p4.isPresented, p5) ~= true then
				CellResult:set(false)
			end
		end)
		
		local function v54(Callback): boolean
			-- upvalues: ReadFunction (upval), p4 (copy), CellResult1 (copy), Flag3 (ref), Node (ref), CellResult (copy)
			local IsReadResult = ReadFunction(p4.isPresented, Callback) == true
			local CallbackResult = Callback(CellResult1)
			
			if IsReadResult and not CallbackResult and not Flag3 and Node ~= nil then
				Flag3 = true
				warn(`Facet UI.Popover: the source node '{Node.Name}' is not mounted yet; the popover waits for it`)
			end
			return IsReadResult and (CallbackResult and not Callback(CellResult))
		end
		
		local function anchored(p5)
			-- upvalues: Compose (upval), p3 (upval), Popover1 (copy), Trigger (ref), p1 (upval), Node (ref), p4 (copy), TypesVector2 (upval), Runtime (upval), Host (upval), OverlayPartsModule (upval), TypesEnum (upval), TypesUDim2 (upval), IsNotModal (copy), ReadFunction (upval), p2 (upval), v3 (ref), v1 (ref), OverlayPlacementModule (upval), PreferredInputResult (copy), Name (copy)
			local CellResult = Compose.cell(false)
			local AppearanceResult = p3.appearance(p5, Popover1, CellResult)
			local v5 = assert(p3.parent(Trigger))
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(v5)
			local AbsolutePositionResult = p1.observe.AbsolutePosition(v5)
			local AbsolutePositionResult1 = nil
			local AbsoluteSizeResult1 = nil
			local Node1 = Node or p4.trigger
			
			if Node1 then
				AbsolutePositionResult1 = p1.observe.AbsolutePosition(Node1)
				AbsoluteSizeResult1 = p1.observe.AbsoluteSize(Node1)
			else
				AbsolutePositionResult1 = Compose.cell(TypesVector2.zero)
				AbsoluteSizeResult1 = Compose.cell(TypesVector2.zero)
			end
			local function _(Callback)
				-- upvalues: AbsoluteSizeResult (copy)
				local CallbackResult = Callback(AbsoluteSizeResult)
				
				return {
					x = 8,
					y = 8,
					w = math.max(0, CallbackResult.X - 16),
					h = math.max(0, CallbackResult.Y - 16)
				}
			end
			
			local ContentResult = nil
			local RootOwner = Compose.createRootOwner(function()
				-- upvalues: ContentResult (ref), p4 (upval)
				ContentResult = p4.content()
			end, Runtime.reactor)
			Compose.cleanup(RootOwner.dispose)
			local IsNotAutomaticSizeMatch: boolean = OverlayPartsModule.instance(ContentResult) and (ContentResult:IsA("GuiObject") and (ContentResult.Size.X.Scale > 0 and (ContentResult.AutomaticSize ~= TypesEnum.AutomaticSize.X and ContentResult.AutomaticSize ~= TypesEnum.AutomaticSize.XY)))
			local CellResult1 = Compose.cell(0)
			local LayoutUnitResult = p1.layoutUnit(v5)
			local AbsoluteSizeResult2 = if ContentResult:IsA("GuiObject") then p1.observe.AbsoluteSize(ContentResult) else Compose.cell(TypesVector2.zero)
			local FormulaResult = Compose.formula(function(Callback): number
				-- upvalues: IsNotAutomaticSizeMatch (copy), AbsoluteSizeResult2 (copy), LayoutUnitResult (copy), AbsoluteSizeResult (copy), p4 (upval), TypesVector2 (upval)
				if IsNotAutomaticSizeMatch then
					return 0
				else
					local XRatio = Callback(AbsoluteSizeResult2).X / Callback(LayoutUnitResult)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local config = {
						x = 8,
						y = 8,
						w = math.max(0, CallbackResult.X - 16),
						h = math.max(0, CallbackResult.Y - 16)
					}
					
					return if TypesVector2.new(math.max(0, math.min(p4.maxWidth or 1e999, config.w) - 16), (math.max(0, math.min(p4.maxHeight or 1e999, config.h) - 16))).X + 0.5 < XRatio then math.ceil(XRatio) else 0
				end
			end)
			local config = {
				Name = "Body",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 4,
				Selectable = false,
				Size = function(Callback)
					-- upvalues: AbsoluteSizeResult (copy), p4 (upval), TypesVector2 (upval), TypesUDim2 (upval), FormulaResult (copy), CellResult1 (copy)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local config = {
						x = 8,
						y = 8,
						w = math.max(0, CallbackResult.X - 16),
						h = math.max(0, CallbackResult.Y - 16)
					}
					local NewTypesVector = TypesVector2.new(math.max(0, math.min(p4.maxWidth or 1e999, config.w) - 16), (math.max(0, math.min(p4.maxHeight or 1e999, config.h) - 16)))
					
					return TypesUDim2.fromOffset(if Callback(FormulaResult) > 0 then NewTypesVector.X else 0, (math.min(Callback(CellResult1), NewTypesVector.Y)))
				end,
				AutomaticSize = function(Callback)
					-- upvalues: FormulaResult (copy), TypesEnum (upval)
					return if Callback(FormulaResult) > 0 then TypesEnum.AutomaticSize.None else TypesEnum.AutomaticSize.X
				end,
				ScrollingDirection = function(Callback)
					-- upvalues: FormulaResult (copy), TypesEnum (upval)
					return if Callback(FormulaResult) > 0 then TypesEnum.ScrollingDirection.XY else TypesEnum.ScrollingDirection.Y
				end,
				VerticalScrollBarInset = TypesEnum.ScrollBarInset.ScrollBar
			}
			config[#config + 1] = Host.UISizeConstraint({
				MaxSize = function(Callback)
					-- upvalues: AbsoluteSizeResult (copy), p4 (upval), TypesVector2 (upval)
					local CallbackResult = Callback(AbsoluteSizeResult)
					local config = {
						x = 8,
						y = 8,
						w = math.max(0, CallbackResult.X - 16),
						h = math.max(0, CallbackResult.Y - 16)
					}
					
					return TypesVector2.new(math.max(0, math.min(p4.maxWidth or 1e999, config.w) - 16), (math.max(0, math.min(p4.maxHeight or 1e999, config.h) - 16)))
				end
			})
			local FrameResults = {
				Host.UIListLayout({ SortOrder = TypesEnum.SortOrder.LayoutOrder }),
				Host.UISizeConstraint({
					MinSize = function(Callback)
						-- upvalues: IsNotAutomaticSizeMatch (copy), TypesVector2 (upval), p1 (upval), AbsoluteSizeResult (copy), p4 (upval)
						if IsNotAutomaticSizeMatch then
							local NewFunction = TypesVector2.new
							local ControlsPopupPanelWidthDelta = p1.metric("controls.popup.panelWidth", Callback) - 16
							local CallbackResult = Callback(AbsoluteSizeResult)
							local config = {
								x = 8,
								y = 8,
								w = math.max(0, CallbackResult.X - 16),
								h = math.max(0, CallbackResult.Y - 16)
							}
							
							return NewFunction(math.min(ControlsPopupPanelWidthDelta, TypesVector2.new(math.max(0, math.min(p4.maxWidth or 1e999, config.w) - 16), (math.max(0, math.min(p4.maxHeight or 1e999, config.h) - 16))).X), 0)
						else
							return TypesVector2.zero
						end
					end
				}),
				ContentResult
			}
			local NoIsNotModal: boolean = p4.cancelPolicy ~= "none" and (p4.closeButton ~= false and (not IsNotModal or p4.closeButton == true))
			
			if NoIsNotModal or p4.title ~= nil then
				if ContentResult:IsA("GuiObject") then
					Runtime.decorate(ContentResult, { LayoutOrder = 1 })
				end
				local List1 = {
					Host.UIListLayout({
						FillDirection = TypesEnum.FillDirection.Horizontal,
						HorizontalAlignment = TypesEnum.HorizontalAlignment.Right,
						VerticalAlignment = TypesEnum.VerticalAlignment.Center,
						SortOrder = TypesEnum.SortOrder.LayoutOrder,
						Padding = p1.types.UDim.new(0, 8)
					})
				}
				
				if p4.title ~= nil then
					table.insert(List1, p1.text({
						Name = "Title",
						LayoutOrder = 1,
						Text = function(p6)
							-- upvalues: ReadFunction (upval), p4 (upval)
							return ReadFunction(p4.title, p6) or ""
						end,
						TextWrapped = true,
						Size = TypesUDim2.new(1, 0, 0, 0),
						AutomaticSize = TypesEnum.AutomaticSize.Y,
						Host.UIFlexItem({ FlexMode = TypesEnum.UIFlexMode.Fill })
					}, nil, "heading"))
				end
				if NoIsNotModal then
					table.insert(List1, p2.Button("CloseCommand")({
						LayoutOrder = 2,
						name = "Close",
						icon = "close",
						appearance = "utility",
						shape = "circle",
						Visible = function(Callback)
							-- upvalues: p4 (upval), AbsoluteSizeResult (copy), AbsoluteSizeResult2 (copy), LayoutUnitResult (copy)
							if p4.closeButton == nil then
								local CallbackResult = Callback(AbsoluteSizeResult)
								local config = {
									x = 8,
									y = 8,
									w = math.max(0, CallbackResult.X - 16),
									h = math.max(0, CallbackResult.Y - 16)
								}
								local CallbackResult1 = Callback(AbsoluteSizeResult2)
								local CallbackResult11: number = Callback(LayoutUnitResult)
								
								return config.w / CallbackResult11 < 600 or config.w * config.h > 0 and config.w * config.h * 0.75 <= (CallbackResult1.X + 16 * CallbackResult11) * (CallbackResult1.Y + 16 * CallbackResult11)
							else
								return p4.closeButton
							end
						end,
						onActivate = function()
							-- upvalues: p4 (upval), v3 (upval), OverlayPartsModule (upval), ReadFunction (upval)
							local OnPresentedChange = p4.onPresentedChange
							
							if OnPresentedChange ~= nil then
								v3 = "cancel"
								local v6 = false
								local v7 = false
								OverlayPartsModule.call(OnPresentedChange, function()
									-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v3 (upval)
									v6 = ReadFunction(p4.isPresented) == true == v7
									
									if not v6 then
										v3 = nil
									end
								end, false)
								
								return
							end
						end
					}))
				end
				local config1 = {
					Name = "CloseHeader",
					BackgroundTransparency = 1,
					LayoutOrder = 0,
					Size = TypesUDim2.new(1, 0, 0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.Y
				}
				
				for _, value in List1 do
					config1[#config1 + 1] = value
				end
				table.insert(FrameResults, Host.Frame(config1))
			end
			local ScrollerResult, _, _, ScrollerResult4, ScrollerResult5 = OverlayPartsModule.scroller(p1, config, FrameResults, {
				hug = true,
				rest = true,
				bound = {
					wide = FormulaResult,
					limit = function(Callback)
						-- upvalues: AbsoluteSizeResult (copy), p4 (upval), TypesVector2 (upval)
						local CallbackResult = Callback(AbsoluteSizeResult)
						local config = {
							x = 8,
							y = 8,
							w = math.max(0, CallbackResult.X - 16),
							h = math.max(0, CallbackResult.Y - 16)
						}
						
						return TypesVector2.new(math.max(0, math.min(p4.maxWidth or 1e999, config.w) - 16), (math.max(0, math.min(p4.maxHeight or 1e999, config.h) - 16))).X
					end
				}
			})
			Compose.watch(function(Callback)
				-- upvalues: ScrollerResult4 (copy), ScrollerResult5 (copy), AppearanceResult (copy), CellResult1 (copy)
				local CallbackResult = Callback(ScrollerResult4)
				
				if not Callback(ScrollerResult5) or AppearanceResult.travel(Callback) >= 1 then
					CellResult1:set(CallbackResult)
				end
			end)
			local Popover = p1.styled(p1.fade({
				Name = "Panel",
				GroupTransparency = function(p6): number
					-- upvalues: AppearanceResult (copy)
					return 1 - AppearanceResult.opacity(p6)
				end,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = TypesUDim2.fromOffset(0, 0),
				AutomaticSize = TypesEnum.AutomaticSize.XY,
				ZIndex = 2,
				ScrollerResult,
				p1.padding(8, 8)
			}), "popover")
			p1.styled(Popover, "panel")
			p1.styled(Popover, "floating")
			p3.skin(Popover, "panel")
			local AtRestResult, AtRestResult2 = p3.atRest(AppearanceResult.travel, CellResult, { Popover })
			local AtRestResultEntry = AtRestResult[1]
			local IsTail: boolean = v1 == nil and p4.tail ~= false
			local FormulaResult1 = Compose.formula(function(Callback)
				-- upvalues: AbsolutePositionResult (copy), v1 (upval), AbsolutePositionResult1 (ref), AbsoluteSizeResult1 (ref), AtRestResultEntry (copy), OverlayPlacementModule (upval), AbsoluteSizeResult (copy), p4 (upval), PreferredInputResult (upval), TypesEnum (upval), IsTail (copy), OverlayPartsModule (upval), p1 (upval)
				local CallbackResult = Callback(AbsolutePositionResult)
				local Config = if v1 then v1 else {
					x = Callback(assert(AbsolutePositionResult1)).X - CallbackResult.X,
					y = Callback(assert(AbsolutePositionResult1)).Y - CallbackResult.Y,
					w = Callback(assert(AbsoluteSizeResult1)).X,
					h = Callback(assert(AbsoluteSizeResult1)).Y
				}
				local CallbackResult1 = Callback(AtRestResultEntry)
				local SolveFunction = OverlayPlacementModule.solve
				local Size = { w = CallbackResult1.X, h = CallbackResult1.Y }
				local CallbackResult2 = Callback(AbsoluteSizeResult)
				
				return SolveFunction({
					tailInset = 8,
					source = Config,
					size = Size,
					safe = {
						x = 8,
						y = 8,
						w = math.max(0, CallbackResult2.X - 16),
						h = math.max(0, CallbackResult2.Y - 16)
					},
					edge = p4.edge or (if PreferredInputResult and Callback(PreferredInputResult) == TypesEnum.PreferredInput.Touch then "top" else nil),
					align = p4.align,
					gap = (p4.gap or 8) + (if IsTail then OverlayPartsModule.tailDepth(p1, Callback) else 0),
					crossOffset = p4.crossOffset,
					tail = if IsTail then OverlayPartsModule.tailWidth(p1, Callback) else 0
				})
			end)
			local PopoverResult = p3.popover(Popover, AppearanceResult.travel, function(Callback)
				-- upvalues: FormulaResult1 (copy), AtRestResultEntry (copy), TypesVector2 (upval)
				local CallbackResult = Callback(FormulaResult1)
				local CallbackResult1 = Callback(AtRestResultEntry)
				
				return TypesVector2.new(CallbackResult.x, CallbackResult.y), if CallbackResult.edge == "bottom" then TypesVector2.new(math.clamp((CallbackResult.tailX or CallbackResult.x) - CallbackResult.x, 0, CallbackResult1.X), 0) elseif CallbackResult.edge == "top" then TypesVector2.new(math.clamp((CallbackResult.tailX or CallbackResult.x) - CallbackResult.x, 0, CallbackResult1.X), CallbackResult1.Y) elseif CallbackResult.edge == "right" then TypesVector2.new(0, (math.clamp((CallbackResult.tailY or CallbackResult.y) - CallbackResult.y, 0, CallbackResult1.Y))) else TypesVector2.new(CallbackResult1.X, (math.clamp((CallbackResult.tailY or CallbackResult.y) - CallbackResult.y, 0, CallbackResult1.Y)))
			end, {
				pinned = true,
				rested = AtRestResult2,
				size = AtRestResultEntry,
				geometry = {
					Size = TypesUDim2.fromOffset(0, 0),
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}
			})
			local List = { Popover }
			
			if IsTail then
				for _, value1 in OverlayPartsModule.tail(p1, "Tail", function(Callback)
					-- upvalues: FormulaResult1 (copy), TypesVector2 (upval)
					local CallbackResult = Callback(FormulaResult1)
					
					if CallbackResult.tailSuppressed or CallbackResult.tailX == nil or CallbackResult.tailY == nil then
						return nil, CallbackResult.edge
					else
						return TypesVector2.new(CallbackResult.tailX, CallbackResult.tailY), CallbackResult.edge
					end
				end, AppearanceResult.opacity, function(): number
					return 2
				end, {
					role = "floating",
					node = Popover,
					scale = PopoverResult,
					corner = function(Callback)
						-- upvalues: FormulaResult1 (copy), TypesVector2 (upval)
						local CallbackResult = Callback(FormulaResult1)
						
						return TypesVector2.new(CallbackResult.x, CallbackResult.y)
					end,
					size = AtRestResultEntry,
					radius = function(p6)
						-- upvalues: p1 (upval)
						return p1.metric("radii.panel", p6)
					end
				}) do
					table.insert(List, value1)
				end
			end
			if IsNotModal then
				return Host.Frame("Popup")({
					BackgroundTransparency = 1,
					Active = false,
					Size = TypesUDim2.fromScale(1, 1),
					ZIndex = 95,
					table.unpack(List)
				})
			else
				local ModalResult = p3.modal(function()
					-- upvalues: Host (upval), TypesUDim2 (upval), List (copy)
					return Host.Frame("Popup")({
						BackgroundTransparency = 1,
						Size = TypesUDim2.fromScale(1, 1),
						table.unpack(List)
					})
				end, function()
					-- upvalues: p4 (upval), v3 (upval), OverlayPartsModule (upval), ReadFunction (upval)
					local OnPresentedChange = p4.onPresentedChange
					
					if OnPresentedChange ~= nil then
						v3 = "cancel"
						local v6 = false
						local v7 = false
						OverlayPartsModule.call(OnPresentedChange, function()
							-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v3 (upval)
							v6 = ReadFunction(p4.isPresented) == true == v7
							
							if not v6 then
								v3 = nil
							end
						end, false)
						
						return
					end
				end, {
					backgroundTransparency = 1,
					Name = Name .. "Modal",
					onOutside = function()
						-- upvalues: p4 (upval), v3 (upval), OverlayPartsModule (upval), ReadFunction (upval)
						local OnPresentedChange = p4.onPresentedChange
						
						if OnPresentedChange ~= nil then
							v3 = "outside"
							local v6 = false
							local v7 = false
							OverlayPartsModule.call(OnPresentedChange, function()
								-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v3 (upval)
								v6 = ReadFunction(p4.isPresented) == true == v7
								
								if not v6 then
									v3 = nil
								end
							end, false)
							
							return
						end
					end,
					exiting = if p5 then p5.exiting else nil,
					appearance = AppearanceResult.opacity,
					canDismiss = p4.cancelPolicy ~= "none"
				})
				ModalResult:SetAttribute("FacetRoute", "popover")
				Compose.cleanup(RootOwner.dispose)
				
				return ModalResult
			end
		end
		
		local function sheeted(p6)
			-- upvalues: p3 (upval), Compose (upval), p4 (copy), v3 (ref), OverlayPartsModule (upval), ReadFunction (upval)
			local Object = assert(p3.sheetModal, "Facet UI.Popover requires the Sheet surface")({
				isPresented = Compose.cell(true),
				detent = Compose.cell("hug"),
				detents = { "hug" },
				title = p4.title,
				closeButton = p4.cancelPolicy ~= "none" and p4.closeButton,
				content = p4.content
			}, function(p7): boolean
				-- upvalues: p4 (upval), v3 (upval), OverlayPartsModule (upval), ReadFunction (upval)
				if p4.cancelPolicy == "none" then
					return false
				end
				local Outside: string = if p7 == "outside" then "outside" else "cancel"
				local OnPresentedChange = p4.onPresentedChange
				
				if OnPresentedChange == nil then
					return false
				else
					v3 = Outside
					local v6 = false
					local v7 = false
					OverlayPartsModule.call(OnPresentedChange, function()
						-- upvalues: v6 (ref), ReadFunction (upval), p4 (upval), v7 (copy), v3 (upval)
						v6 = ReadFunction(p4.isPresented) == true == v7
						
						if not v6 then
							v3 = nil
						end
					end, false)
					
					return v6
				end
			end, p6)
			Object:SetAttribute("FacetRoute", "sheet")
			
			return Object
		end
		
		local v6 = nil
		local v7 = nil
		local Input = nil
		local Connection = nil
		local RunService = p1.config.services.RunService
		
		if UserInputService then
			Runtime.connect(UserInputService, "InputBegan", function(Input1)
				-- upvalues: v7 (ref), TypesEnum (upval), v6 (ref), p1 (upval), Input (ref)
				local Size = v7
				
				if Size and Input1.UserInputType == TypesEnum.UserInputType.Touch and v6 and p1.available(v6) then
					local Position = Input1.Position
					
					if Position.X < Size.x - 24 or Size.x + Size.w + 24 < Position.X or Position.Y < Size.y - 24 or Size.y + Size.h + 24 < Position.Y then
						Input = Input1
					end
				end
			end)
			Runtime.connect(UserInputService, "InputEnded", function(Input1)
				-- upvalues: Input (ref), TypesEnum (upval), ReadFunction (upval), p4 (copy), v6 (ref), p1 (upval), v3 (ref), OverlayPartsModule (upval)
				if Input1 == Input then
					Input = nil
					
					if Input1.UserInputState ~= TypesEnum.UserInputState.Cancel and (ReadFunction(p4.isPresented) == true and v6 and p1.available(v6) and p4.cancelPolicy ~= "none") then
						local OnPresentedChange = p4.onPresentedChange
						
						if OnPresentedChange == nil then return end
						v3 = "outside"
						local v8 = false
						local v9 = false
						OverlayPartsModule.call(OnPresentedChange, function()
							-- upvalues: v8 (ref), ReadFunction (upval), p4 (upval), v9 (copy), v3 (upval)
							v8 = ReadFunction(p4.isPresented) == true == v9
							
							if not v8 then
								v3 = nil
							end
						end, false)
					end
				end
			end)
		end
		Compose.cleanup(function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end)
		local GuiService = p3.service("GuiService")
		local v8 = nil
		
		local function pathTo(GetResult, Parent)
			local List = {}
			local Parent1 = GetResult
			while Parent1 and Parent1 ~= Parent do
				table.insert(List, 1, Parent1.Name)
				Parent1 = Parent1.Parent
			end
			return if Parent1 == Parent then List else nil
		end
		
		p3.attach(Trigger, {
			p3.overlay(Trigger, v54, function(p6)
				-- upvalues: Flag2 (ref), Compose (upval), Flag (ref), Flag1 (ref), CoreModule (upval), v2 (copy), v3 (ref), p4 (copy), ReadFunction (upval), CellResult (copy), OverlayPartsModule (upval), Host (upval), FormulaResult (copy), sheeted (copy), anchored (copy), v6 (ref), PreferredInputResult (copy), TypesEnum (upval), v7 (ref), Connection (ref), RunService (copy), v8 (ref), GuiService (copy), p1 (upval), Runtime (upval), pathTo (copy)
				Flag2 = true
				Compose.cleanup(function()
					-- upvalues: Flag2 (upval), Flag (upval), Flag1 (upval), CoreModule (upval), v2 (upval), v3 (upval), p4 (upval), ReadFunction (upval), CellResult (upval), OverlayPartsModule (upval)
					Flag2 = false
					
					if Flag then return end
					if Flag1 or CoreModule.owner.isDisposed(v2) then
						v3 = nil
						
						if p4.onDismiss then
							p4.onDismiss("cancel")
						end
						return
					else
						local V34 = v3 or "cancel"
						v3 = nil
						
						if ReadFunction(p4.isPresented) == true and not CellResult:peek() then
							local OnPresentedChange = p4.onPresentedChange
							
							if OnPresentedChange ~= nil then
								v3 = "cancel"
								local v9 = false
								local v10 = false
								OverlayPartsModule.call(OnPresentedChange, function()
									-- upvalues: v9 (ref), ReadFunction (upval), p4 (upval), v10 (copy), v3 (upval)
									v9 = ReadFunction(p4.isPresented) == true == v10
									
									if not v9 then
										v3 = nil
									end
								end, false)
							end
							v3 = nil
							
							if p4.onDismiss then
								p4.onDismiss("cancel")
								
								return
							end
						elseif p4.onDismiss then
							p4.onDismiss(V34)
						end
					end
				end)
				
				return Host.Folder("PopoverRoute")({
					Compose.keyed({
						from = function(Callback)
							-- upvalues: FormulaResult (upval)
							return { Callback(FormulaResult) }
						end,
						render = function(p7)
							-- upvalues: sheeted (upval), p6 (copy), anchored (upval), v6 (upval), Compose (upval), ReadFunction (upval), p4 (upval), PreferredInputResult (upval), TypesEnum (upval), v7 (upval), Connection (upval), RunService (upval), v8 (upval), GuiService (upval), p1 (upval), Runtime (upval), Flag1 (upval), pathTo (upval)
							local SheetedResult = if p7:peek() == "sheet" then sheeted(p6) else anchored(p6)
							v6 = SheetedResult
							Compose.cleanup(function()
								-- upvalues: ReadFunction (upval), p4 (upval), PreferredInputResult (upval), TypesEnum (upval), p7 (copy), SheetedResult (copy), v7 (upval), Connection (upval), RunService (upval)
								if ReadFunction(p4.isPresented) == true and PreferredInputResult and PreferredInputResult:peek() == TypesEnum.PreferredInput.Touch and p7:peek() == "popover" then
									local Panel = SheetedResult:FindFirstChild("Panel", true)
									
									if Panel and Panel:IsA("GuiObject") then
										local AbsolutePosition = Panel.AbsolutePosition
										local AbsoluteSize = Panel.AbsoluteSize
										v7 = {
											x = AbsolutePosition.X,
											y = AbsolutePosition.Y,
											w = AbsoluteSize.X,
											h = AbsoluteSize.Y
										}
										
										if Connection then
											Connection:Disconnect()
										end
										if RunService then
											Connection = RunService.PreRender:Connect(function()
												-- upvalues: v7 (upval), Connection (upval)
												v7 = nil
												
												if Connection then
													Connection:Disconnect()
													Connection = nil
												end
											end)
										end
									end
								end
							end)
							local ChildNames = v8
							v8 = nil
							
							if ChildNames and GuiService then
								local Gui = SheetedResult
								
								for _, childName in ChildNames do
									if Gui then
										Gui = Gui:FindFirstChild(childName, true)
									else
										Gui = nil
									end
								end
								if Gui and Gui:IsA("GuiObject") then
									local Gui1 = Gui
									
									local function land()
										-- upvalues: Gui1 (ref), p1 (upval)
										if Gui1 and Gui1:FindFirstAncestorWhichIsA("LayerCollector") then
											p1.selection.set(Gui1)
											Gui1 = nil
										end
									end
									
									if Gui1 and Gui1:FindFirstAncestorWhichIsA("LayerCollector") then
										p1.selection.set(Gui1)
										Gui1 = nil
									end
									if Gui1 then
										Runtime.connect(SheetedResult, "AncestryChanged", land)
									end
								end
							end
							Compose.cleanup(function()
								-- upvalues: GuiService (upval), Flag1 (upval), SheetedResult (copy), pathTo (upval), p1 (upval), v8 (upval)
								if GuiService and not Flag1 then
									local Body = SheetedResult:FindFirstChild("Body", true) or SheetedResult:FindFirstChild("SheetContent", true)
									local PathToResult = if Body then pathTo(p1.selection.get(), Body) else nil
									
									if PathToResult and #PathToResult > 0 then
										v8 = { PathToResult[#PathToResult] }
									end
								end
							end)
							
							return SheetedResult
						end
					})
				})
			end, { motion = Motion })
		})
		Compose.cleanup(function()
			-- upvalues: Flag1 (ref)
			Flag1 = true
		end)
		
		return Trigger
	end)
end