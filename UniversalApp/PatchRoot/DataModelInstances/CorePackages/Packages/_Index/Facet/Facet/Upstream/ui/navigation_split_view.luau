local _ = require("./types")
local _ = require("./navigation_types")
local OverlayPartsModule = require("./overlay_parts")
local ScrollLockModule = require("./scroll_lock")
local DragSessionModule = require("./drag_session")
local _ = require("./input_props")
local _ = require("./navigation_props")
local NavPageLayersModule = require("./nav_page_layers")
local _ = require("../vendor/compose/core")

return function(p1, p2, p3)
	-- upvalues: NavPageLayersModule (copy), OverlayPartsModule (copy), ScrollLockModule (copy), DragSessionModule (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local TypesEnum = p1.types.Enum
	local NavPageLayersModuleResult = NavPageLayersModule(p1)
	p2.NavigationSplitView = p1.construct("NavigationSplitView", function(p4)
		-- upvalues: TypesUDim2 (copy), Compose (copy), NavPageLayersModuleResult (copy), Host (copy), p1 (copy), ReadFunction (copy), Runtime (copy), p3 (copy), OverlayPartsModule (upval), p2 (copy), TypesVector2 (copy), TypesEnum (copy), ScrollLockModule (upval), DragSessionModule (upval)
		assert(p4.axis == nil or (p4.axis == "x" or p4.axis == "y"), "NavigationSplitView.axis must be x or y")
		local IsY = p4.axis == "y"
		local MinSidebarHeight = if IsY then p4.minSidebarHeight or 120 else p4.minSidebarWidth or 240
		local MaxSidebarHeight = (if IsY then p4.maxSidebarHeight else p4.maxSidebarWidth) or 600
		local MinDetailHeight = if IsY then p4.minDetailHeight or 120 else p4.minDetailWidth or 320
		local CompactHeight = (if IsY then p4.compactHeight else p4.compactWidth) or MinSidebarHeight + MinDetailHeight
		
		local function _(Vector)
			-- upvalues: IsY (copy)
			return if IsY then Vector.Y else Vector.X
		end
		
		local _ = function(p5, p6, p7, p8)
			-- upvalues: IsY (copy), TypesUDim2 (upval)
			return if IsY then TypesUDim2.new(p7, p8, p5, p6) else TypesUDim2.new(p5, p6, p7, p8)
		end
		
		for _, value in {
			MinSidebarHeight,
			MaxSidebarHeight,
			MinDetailHeight,
			CompactHeight
		} do
			assert(value > 0 and value < 1e999, "NavigationSplitView pane limits must be positive finite numbers")
		end
		assert(MinSidebarHeight <= MaxSidebarHeight, "NavigationSplitView maximum sidebar size must be at least its minimum")
		local PreferredCompactColumn = p4.preferredCompactColumn or Compose.cell("sidebar")
		local SidebarHeight = if IsY then p4.sidebarHeight or Compose.cell(240) else p4.sidebarWidth or Compose.cell(360)
		assert(PreferredCompactColumn.set and SidebarHeight.set, "NavigationSplitView column and pane size require writable cells")
		local DetailLabel = p4.detailLabel
		local CompactBack = p4.compactBack
		local Flag = CompactBack == nil or CompactBack.set
		assert(Flag, "NavigationSplitView.compactBack requires a writable cell")
		NavPageLayersModuleResult.checkTransition(p4.transition)
		local Transition = if type(p4.transition) == "table" then p4.transition else nil
		Flag = false
		local FrameResult = Host.Frame(p1.props(p4, {
			"sidebar", "detail", "detailVisible", "preferredCompactColumn", "sidebarWidth",
			"axis", "resizable", "alwaysShowResizeHandle", "sidebarHeight",
			"minSidebarHeight", "maxSidebarHeight", "minDetailHeight", "compactHeight",
			"minSidebarWidth", "maxSidebarWidth", "minDetailWidth", "compactWidth",
			"backLabel", "detailLabel", "compactBack", "transition"
		}, {
			Name = "NavigationSplitView",
			BackgroundTransparency = 1,
			Size = TypesUDim2.fromScale(1, 1)
		}))
		local LayoutSizeResult = p1.layoutSize(FrameResult)
		local LayoutUnitResult = p1.layoutUnit(FrameResult)
		local EffectiveInputResult = p1.effectiveInput()
		local TenFootResult = p1.tenFoot()
		local HitFloorResult = p1.hitFloor()
		local UserInputService = p1.config.services.UserInputService
		local PreferredInputResult = if UserInputService then p1.observe.PreferredInput(UserInputService) else nil
		local CellResult = Compose.cell(false)
		local CellResult1 = Compose.cell(false)
		local GamepadService = p1.config.services.GamepadService
		local GamepadCursorEnabledResult = if GamepadService then p1.observe.GamepadCursorEnabled(GamepadService) else Compose.cell(false)
		local FormulaResult = Compose.formula(function(p5)
			-- upvalues: p4 (copy), ReadFunction (upval)
			return p4.resizable == nil or ReadFunction(p4.resizable, p5)
		end)
		
		local _ = function(p5): number
			-- upvalues: ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy)
			return if ReadFunction(FormulaResult, p5) then if EffectiveInputResult(p5) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(p5)) else 1
		end
		
		local FormulaResult1 = Compose.formula(function(p5)
			-- upvalues: p4 (copy), ReadFunction (upval)
			return p4.detailVisible == nil or ReadFunction(p4.detailVisible, p5)
		end)
		local FormulaResult2 = Compose.formula(function(Callback)
			-- upvalues: TenFootResult (copy), LayoutSizeResult (copy), IsY (copy), CompactHeight (copy), MinSidebarHeight (copy), MinDetailHeight (copy), ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy)
			local TenFootResultResult = TenFootResult(Callback)
			
			if not TenFootResultResult then
				local CallbackResult = Callback(LayoutSizeResult)
				TenFootResultResult = (if IsY then CallbackResult.Y else CallbackResult.X) < math.max(CompactHeight, MinSidebarHeight + MinDetailHeight + (if ReadFunction(FormulaResult, Callback) then if EffectiveInputResult(Callback) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(Callback)) else 1))
			end
			return TenFootResultResult
		end)
		local FormulaResult3 = Compose.formula(function(Callback)
			-- upvalues: PreferredCompactColumn (copy), FormulaResult1 (copy)
			local CallbackResult = Callback(PreferredCompactColumn)
			assert(CallbackResult == "sidebar" or CallbackResult == "detail", "NavigationSplitView column must be sidebar or detail")
			
			return if Callback(FormulaResult1) then CallbackResult else "sidebar"
		end)
		local FormulaResult4 = Compose.formula(function(Callback): number
			-- upvalues: SidebarHeight (copy), MinSidebarHeight (copy), MaxSidebarHeight (copy), LayoutSizeResult (copy), IsY (copy), MinDetailHeight (copy), ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy)
			local CallbackResult: number = Callback(SidebarHeight)
			assert(CallbackResult == CallbackResult and math.abs(CallbackResult) < 1e999, "NavigationSplitView sidebar size must be finite")
			local CallbackResult1 = Callback(LayoutSizeResult)
			
			return (math.clamp(CallbackResult, MinSidebarHeight, (math.max(MinSidebarHeight, (math.min(MaxSidebarHeight, (if IsY then CallbackResult1.Y else CallbackResult1.X) - MinDetailHeight - (if ReadFunction(FormulaResult, Callback) then if EffectiveInputResult(Callback) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(Callback)) else 1)))))))
		end)
		
		local function split(Callback): boolean
			-- upvalues: FormulaResult1 (copy), FormulaResult2 (copy)
			return Callback(FormulaResult1) and not Callback(FormulaResult2)
		end
		
		local function canResize(Callback)
			-- upvalues: FormulaResult1 (copy), FormulaResult2 (copy), FormulaResult (copy)
			return Callback(FormulaResult1) and not Callback(FormulaResult2) and Callback(FormulaResult)
		end
		
		local function bar(Callback): boolean
			-- upvalues: FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), CompactBack (copy), DetailLabel (copy)
			return if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
		end
		
		local _ = function(Callback)
			-- upvalues: FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), CompactBack (copy), DetailLabel (copy), p1 (upval)
			local NoCompactBack: boolean = if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
			
			return if NoCompactBack then p1.metric("targetSizes.minimum", Callback) else 0
		end
		
		local Sidebar = nil
		local Detail = nil
		local v1 = nil
		local CellResult2 = Compose.cell(false)
		local Resize = nil
		
		local function back()
			-- upvalues: PreferredCompactColumn (copy)
			PreferredCompactColumn:set("sidebar")
		end
		
		local _ = function(Callback)
			return if type(Callback) == "function" then Callback() else Callback
		end
		
		local Y = 0
		local PeekResult = 0
		local HoldOwnedAncestorsResult: (() -> ())? = nil
		
		local function finish()
			-- upvalues: CellResult1 (copy), HoldOwnedAncestorsResult (ref)
			CellResult1:set(false)
			
			if HoldOwnedAncestorsResult then
				HoldOwnedAncestorsResult()
				HoldOwnedAncestorsResult = nil
			end
		end
		
		local _ = function(Value: number)
			-- upvalues: SidebarHeight (copy), MinSidebarHeight (copy), MaxSidebarHeight (copy), LayoutSizeResult (copy), IsY (copy), MinDetailHeight (copy), ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy)
			local PeekResult = LayoutSizeResult:peek()
			SidebarHeight:set((math.clamp(Value, MinSidebarHeight, (math.max(MinSidebarHeight, (math.min(MaxSidebarHeight, (if IsY then PeekResult.Y else PeekResult.X) - MinDetailHeight - (if ReadFunction(FormulaResult, nil) then if EffectiveInputResult(nil) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(nil)) else 1))))))))
		end
		
		Compose.cleanup(finish)
		
		if p1.config.services.UserInputService then
			Runtime.connect(p1.config.services.UserInputService, "WindowFocusReleased", finish)
		end
		local CellResult3 = Compose.cell(false)
		local config = {
			sidebar = Compose.cell(false),
			detail = Compose.cell(false)
		}
		local FormulaResult5 = Compose.formula(function(Callback)
			-- upvalues: FormulaResult1 (copy), FormulaResult2 (copy), FormulaResult3 (copy), config (copy)
			local Inverted: boolean = Callback(FormulaResult1) and (not Callback(FormulaResult2) or Callback(FormulaResult3) == "detail")
			
			return Callback(if Inverted then config.detail else config.sidebar)
		end)
		local Config = if Transition and Transition.zoom ~= nil then {
			seconds = Transition.seconds,
			ease = Transition.ease,
			motion = Transition.motion,
			fade = Transition.fade,
			progress = Transition.progress,
			apply = Transition.apply,
			scale = Transition.scale
		} else Transition
		
		local function pane(p5, CellResult)
			-- upvalues: Transition (copy), Config (ref), Host (upval), Compose (upval), FormulaResult1 (copy), config (copy), p1 (upval), FrameResult (copy), TypesUDim2 (upval), LayoutUnitResult (copy), NavPageLayersModuleResult (upval), Flag (ref), FormulaResult5 (copy)
			local Transition1 = if CellResult then Transition else Config
			
			if not Transition1 then
				return Host.Frame(p5)
			end
			local VisibleFunction = p5.Visible
			assert(type(VisibleFunction) == "function")
			local FormulaResult = Compose.formula(function(Callback)
				-- upvalues: VisibleFunction (copy), CellResult (copy), FormulaResult1 (upval)
				local NoCellResult = VisibleFunction(Callback) and (CellResult == nil or Callback(FormulaResult1))
				
				return {
					index = 1,
					depthFromTop = if NoCellResult then 0 else 1,
					top = NoCellResult,
					covered = not NoCellResult
				}
			end)
			local v2: (() -> ())? = nil
			
			if CellResult then
				CellResult:set(false)
				Compose.watch(function(Callback)
					-- upvalues: FormulaResult (copy), CellResult (copy)
					if Callback(FormulaResult).top then
						CellResult:set(false)
					end
				end)
				
				v2 = function()
					-- upvalues: CellResult (copy)
					CellResult:set(true)
				end
			end
			local Detail = if CellResult then config.detail else config.sidebar
			Compose.cleanup(function()
				-- upvalues: Detail (copy)
				Detail:set(false)
			end)
			local AbsolutePositionResult = p1.observe.AbsolutePosition(FrameResult)
			local CellResult1 = Compose.cell(nil)
			local SizeFunction = p5.Size
			local PositionFunction = p5.Position
			assert(type(SizeFunction) == "function" and type(PositionFunction) == "function")
			
			function p5.Size(Callback)
				-- upvalues: CellResult1 (copy), TypesUDim2 (upval), SizeFunction (copy)
				local CallbackResult = Callback(CellResult1)
				
				return if CallbackResult then TypesUDim2.fromOffset(CallbackResult.size.X, CallbackResult.size.Y) else SizeFunction(Callback)
			end
			
			function p5.Position(Callback)
				-- upvalues: CellResult1 (copy), PositionFunction (copy), AbsolutePositionResult (copy), LayoutUnitResult (upval), TypesUDim2 (upval)
				local CallbackResult = Callback(CellResult1)
				
				if CallbackResult == nil then
					return PositionFunction(Callback)
				else
					local AtDelta = CallbackResult.at - Callback(AbsolutePositionResult) / Callback(LayoutUnitResult)
					
					return TypesUDim2.fromOffset(AtDelta.X, AtDelta.Y)
				end
			end
			
			local LayerResult = NavPageLayersModuleResult.layer(p5, FormulaResult, Transition1, v2, not Flag, Detail, FormulaResult5, true)
			local AbsoluteSizeResult = p1.observe.AbsoluteSize(LayerResult)
			local AbsolutePositionResult1 = p1.observe.AbsolutePosition(LayerResult)
			local VisibleResult = p1.observe.Visible(LayerResult)
			Compose.watch(function(Callback)
				-- upvalues: FormulaResult (copy), VisibleResult (copy), CellResult1 (copy), AbsoluteSizeResult (copy), LayoutUnitResult (upval), AbsolutePositionResult1 (copy)
				if Callback(FormulaResult).top or not Callback(VisibleResult) then
					CellResult1:set(nil)
					
					return
				end
				local PeekResult = AbsoluteSizeResult:peek()
				
				if CellResult1:peek() == nil and PeekResult.X > 0 and PeekResult.Y > 0 then
					local PeekResult1 = LayoutUnitResult:peek()
					CellResult1:set({
						size = PeekResult / PeekResult1,
						at = AbsolutePositionResult1:peek() / PeekResult1
					})
				end
			end)
			
			return LayerResult
		end
		
		local function reveal(FormulaResult, Callback)
			-- upvalues: Transition (copy), Compose (upval), CellResult3 (copy)
			return if Transition then Compose.presence(FormulaResult, function(_)
				-- upvalues: Callback (copy)
				return Callback()
			end, {
				exit = function()
					-- upvalues: CellResult3 (upval)
					return { completed = CellResult3 }
				end
			}) else Compose.show(FormulaResult, Callback)
		end
		
		local AttachFunction: (any, any) -> () = p3.attach
		local SidebarFunction = p4.sidebar
		Sidebar = pane({
			Name = "Sidebar",
			BackgroundTransparency = 1,
			Visible = function(Callback): boolean
				-- upvalues: FormulaResult2 (copy), FormulaResult3 (copy)
				return not Callback(FormulaResult2) or Callback(FormulaResult3) == "sidebar"
			end,
			Position = function(Callback)
				-- upvalues: TypesUDim2 (upval), FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), CompactBack (copy), DetailLabel (copy), p1 (upval)
				local v2: boolean = if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
				
				return TypesUDim2.fromOffset(0, if v2 then p1.metric("targetSizes.minimum", Callback) else 0)
			end,
			Size = function(Callback)
				-- upvalues: FormulaResult1 (copy), FormulaResult2 (copy), FormulaResult4 (copy), IsY (copy), TypesUDim2 (upval), FormulaResult3 (copy), CompactBack (copy), DetailLabel (copy), p1 (upval)
				if Callback(FormulaResult1) and not Callback(FormulaResult2) then
					local CallbackResult = Callback(FormulaResult4)
					
					return if IsY then TypesUDim2.new(1, 0, 0, CallbackResult) else TypesUDim2.new(0, CallbackResult, 1, 0)
				else
					local v2: boolean = if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
					
					return (TypesUDim2.new(1, 0, 1, -(if v2 then p1.metric("targetSizes.minimum", Callback) else 0)))
				end
			end,
			if type(SidebarFunction) == "function" then SidebarFunction() else SidebarFunction
		})
		local Sidebar1 = Sidebar
		local RevealResult = reveal(FormulaResult1, function()
			-- upvalues: Detail (ref), pane (copy), FormulaResult2 (copy), FormulaResult3 (copy), FormulaResult1 (copy), FormulaResult4 (copy), ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy), IsY (copy), TypesUDim2 (upval), CompactBack (copy), DetailLabel (copy), p1 (upval), p4 (copy), CellResult3 (copy), v1 (ref), Compose (upval), CellResult2 (copy), p3 (upval)
			local DetailFunction = p4.detail
			Detail = pane({
				Name = "Detail",
				BackgroundTransparency = 1,
				Visible = function(Callback): boolean
					-- upvalues: FormulaResult2 (upval), FormulaResult3 (upval)
					return not Callback(FormulaResult2) or Callback(FormulaResult3) == "detail"
				end,
				Position = function(Callback)
					-- upvalues: FormulaResult1 (upval), FormulaResult2 (upval), FormulaResult4 (upval), ReadFunction (upval), FormulaResult (upval), EffectiveInputResult (upval), HitFloorResult (upval), IsY (upval), TypesUDim2 (upval), FormulaResult3 (upval), CompactBack (upval), DetailLabel (upval), p1 (upval)
					if Callback(FormulaResult1) and not Callback(FormulaResult2) then
						local NewCallbackResult = Callback(FormulaResult4) + (if ReadFunction(FormulaResult, Callback) then if EffectiveInputResult(Callback) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(Callback)) else 1)
						
						return if IsY then TypesUDim2.new(0, 0, 0, NewCallbackResult) else TypesUDim2.new(0, NewCallbackResult, 0, 0)
					else
						local NoCompactBack: boolean = if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
						
						return (TypesUDim2.fromOffset(0, if NoCompactBack then p1.metric("targetSizes.minimum", Callback) else 0))
					end
				end,
				Size = function(Callback)
					-- upvalues: FormulaResult1 (upval), FormulaResult2 (upval), FormulaResult4 (upval), ReadFunction (upval), FormulaResult (upval), EffectiveInputResult (upval), HitFloorResult (upval), IsY (upval), TypesUDim2 (upval), FormulaResult3 (upval), CompactBack (upval), DetailLabel (upval), p1 (upval)
					if Callback(FormulaResult1) and not Callback(FormulaResult2) then
						local v2 = -Callback(FormulaResult4) - (if ReadFunction(FormulaResult, Callback) then if EffectiveInputResult(Callback) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(Callback)) else 1)
						
						return if IsY then TypesUDim2.new(1, 0, 1, v2) else TypesUDim2.new(1, v2, 1, 0)
					else
						local NoCompactBack: boolean = if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
						
						return (TypesUDim2.new(1, 0, 1, -(if NoCompactBack then p1.metric("targetSizes.minimum", Callback) else 0)))
					end
				end,
				if type(DetailFunction) == "function" then DetailFunction() else DetailFunction
			}, CellResult3)
			local VisibleResult = p1.observe.Visible(Detail)
			v1 = VisibleResult
			Compose.watch(function(Callback)
				-- upvalues: CellResult2 (upval), VisibleResult (copy)
				CellResult2:set(Callback(VisibleResult))
			end)
			Compose.cleanup(function()
				-- upvalues: CellResult2 (upval)
				CellResult2:set(false)
			end)
			p3.keep(p4.detail)
			
			return Detail
		end)
		Resize = Host.TextButton({
			Name = "Resize",
			Active = canResize,
			MouseEnter = function()
				-- upvalues: CellResult (copy)
				CellResult:set(true)
			end,
			MouseLeave = function()
				-- upvalues: CellResult (copy)
				CellResult:set(false)
			end,
			Text = "",
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			Visible = split,
			Selectable = false,
			Position = function(Callback)
				-- upvalues: FormulaResult4 (copy), IsY (copy), TypesUDim2 (upval)
				local CallbackResult = Callback(FormulaResult4)
				
				return if IsY then TypesUDim2.new(0, 0, 0, CallbackResult) else TypesUDim2.new(0, CallbackResult, 0, 0)
			end,
			Size = function(p5)
				-- upvalues: ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy), IsY (copy), TypesUDim2 (upval)
				local Largest: number = if ReadFunction(FormulaResult, p5) then if EffectiveInputResult(p5) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(p5)) else 1
				
				return if IsY then TypesUDim2.new(1, 0, 0, Largest) else TypesUDim2.new(0, Largest, 1, 0)
			end,
			Attributes = {
				AccessibleLabel = "Resize split.",
				FacetFocusPart = "Grip"
			},
			p1.styled(Host.Frame({
				Name = "Line",
				BorderSizePixel = 0,
				AnchorPoint = if IsY then TypesVector2.new(0, 0.5) else TypesVector2.new(0.5, 0),
				Position = if IsY then TypesUDim2.new(0, 0, 0.5, 0) else TypesUDim2.new(0.5, 0, 0, 0),
				Size = if IsY then TypesUDim2.new(1, 0, 0, 1) else TypesUDim2.new(0, 1, 1, 0)
			}), "divider"),
			Host.Frame({
				Name = "Grip",
				Visible = canResize,
				BackgroundTransparency = 1,
				Active = false,
				Selectable = false,
				AnchorPoint = TypesVector2.new(0.5, 0.5),
				Position = TypesUDim2.fromScale(0.5, 0.5),
				Size = if IsY then TypesUDim2.new(0, 36, 0, 8) else TypesUDim2.new(0, 8, 0, 36),
				Host.UICorner({ CornerRadius = p1.round }),
				p1.styled(Host.Frame({
					Name = "Pill",
					Active = false,
					AnchorPoint = TypesVector2.new(0.5, 0.5),
					Position = TypesUDim2.fromScale(0.5, 0.5),
					Size = if IsY then TypesUDim2.new(0, 24, 0, 3) else TypesUDim2.new(0, 3, 0, 24),
					BorderSizePixel = 0,
					Visible = function(Callback)
						-- upvalues: ReadFunction (upval), p4 (copy), CellResult (copy), CellResult1 (copy), EffectiveInputResult (copy)
						return ReadFunction(p4.alwaysShowResizeHandle, Callback) == true or (Callback(CellResult) or (Callback(CellResult1) or EffectiveInputResult(Callback) ~= "KeyboardAndMouse"))
					end,
					Host.UICorner({ CornerRadius = p1.round })
				}), "grabber")
			}),
			Host.UIDragDetector({
				Enabled = function(Callback): boolean
					-- upvalues: FormulaResult1 (copy), FormulaResult2 (copy), FormulaResult (copy), PreferredInputResult (copy), TypesEnum (upval), GamepadCursorEnabledResult (copy)
					return (if Callback(FormulaResult1) then not Callback(FormulaResult2) and Callback(FormulaResult) else Callback(FormulaResult1) and Callback(FormulaResult)) and (PreferredInputResult == nil or (Callback(PreferredInputResult) ~= TypesEnum.PreferredInput.Gamepad or Callback(GamepadCursorEnabledResult) == true))
				end,
				CursorIcon = if IsY then "rbxasset://SystemCursors/SizeNS" else "rbxasset://SystemCursors/SizeEW",
				ActivatedCursorIcon = if IsY then "rbxasset://SystemCursors/SizeNS" else "rbxasset://SystemCursors/SizeEW",
				DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslateLine,
				DragAxis = if IsY then TypesVector2.new(0, 1) else TypesVector2.new(1, 0),
				ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
				DragStart = function(Vector)
					-- upvalues: CellResult1 (copy), HoldOwnedAncestorsResult (ref), Y (ref), PeekResult (ref), IsY (copy), FormulaResult4 (copy), ScrollLockModule (upval), FrameResult (copy)
					CellResult1:set(false)
					
					if HoldOwnedAncestorsResult then
						HoldOwnedAncestorsResult()
						HoldOwnedAncestorsResult = nil
					end
					CellResult1:set(true)
					Y = if IsY then Vector.Y else Vector.X
					PeekResult = FormulaResult4:peek()
					HoldOwnedAncestorsResult = ScrollLockModule.holdOwnedAncestors(FrameResult)
				end,
				DragContinue = function(Vector)
					-- upvalues: HoldOwnedAncestorsResult (ref), PeekResult (ref), IsY (copy), Y (ref), LayoutUnitResult (copy), SidebarHeight (copy), MinSidebarHeight (copy), MaxSidebarHeight (copy), LayoutSizeResult (copy), MinDetailHeight (copy), ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy)
					if HoldOwnedAncestorsResult then
						local PeekResult = LayoutSizeResult:peek()
						SidebarHeight:set((math.clamp(PeekResult + ((if IsY then Vector.Y else Vector.X) - Y) / LayoutUnitResult:peek(), MinSidebarHeight, (math.max(MinSidebarHeight, (math.min(MaxSidebarHeight, (if IsY then PeekResult.Y else PeekResult.X) - MinDetailHeight - (if ReadFunction(FormulaResult, nil) then if EffectiveInputResult(nil) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(nil)) else 1))))))))
					end
				end,
				DragEnd = function(Vector)
					-- upvalues: HoldOwnedAncestorsResult (ref), PeekResult (ref), IsY (copy), Y (ref), LayoutUnitResult (copy), SidebarHeight (copy), MinSidebarHeight (copy), MaxSidebarHeight (copy), LayoutSizeResult (copy), MinDetailHeight (copy), ReadFunction (upval), FormulaResult (copy), EffectiveInputResult (copy), HitFloorResult (copy), CellResult1 (copy)
					if HoldOwnedAncestorsResult then
						local PeekResult = LayoutSizeResult:peek()
						SidebarHeight:set((math.clamp(PeekResult + ((if IsY then Vector.Y else Vector.X) - Y) / LayoutUnitResult:peek(), MinSidebarHeight, (math.max(MinSidebarHeight, (math.min(MaxSidebarHeight, (if IsY then PeekResult.Y else PeekResult.X) - MinDetailHeight - (if ReadFunction(FormulaResult, nil) then if EffectiveInputResult(nil) == "KeyboardAndMouse" then 12 else math.max(28, HitFloorResult(nil)) else 1))))))))
					end
					CellResult1:set(false)
					
					if HoldOwnedAncestorsResult then
						HoldOwnedAncestorsResult()
						HoldOwnedAncestorsResult = nil
					end
				end
			})
		})
		AttachFunction(FrameResult, {
			Sidebar1,
			RevealResult,
			Host.Frame({
				Name = "NavigationBar",
				BackgroundTransparency = 1,
				Visible = bar,
				Size = function(Callback)
					-- upvalues: TypesUDim2 (upval), FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), CompactBack (copy), DetailLabel (copy), p1 (upval)
					local NoCompactBack: boolean = if Callback(FormulaResult2) and Callback(FormulaResult1) then if Callback(FormulaResult3) == "detail" then CompactBack == nil else DetailLabel ~= false else false
					
					return TypesUDim2.new(1, 0, 0, if NoCompactBack then p1.metric("targetSizes.minimum", Callback) else 0)
				end,
				Compose.show(function(Callback): boolean
					-- upvalues: CompactBack (copy), FormulaResult3 (copy)
					return CompactBack == nil and Callback(FormulaResult3) == "detail"
				end, function()
					-- upvalues: OverlayPartsModule (upval), p1 (upval), p2 (upval), p4 (copy), back (copy)
					return OverlayPartsModule.back(p1, p2, p4.backLabel, back)
				end),
				Compose.show(function(Callback): boolean
					-- upvalues: DetailLabel (copy), FormulaResult3 (copy)
					return DetailLabel ~= false and Callback(FormulaResult3) == "sidebar"
				end, function()
					-- upvalues: p2 (upval), DetailLabel (copy), PreferredCompactColumn (copy)
					return p2.Button({
						Name = "ShowDetail",
						appearance = "utility",
						label = (if DetailLabel == false then nil else DetailLabel) or "Show detail",
						onActivate = function()
							-- upvalues: PreferredCompactColumn (upval)
							PreferredCompactColumn:set("detail")
						end
					})
				end)
			}),
			Resize
		})
		p3.keep(p4.sidebar)
		local GuiService = p3.service("GuiService")
		local SelectingResult = p3.selecting()
		local ObserveResult = if GuiService then p1.selection.observe() else Compose.cell(nil)
		local v2 = nil
		local v3 = nil
		Compose.watch(function(Callback)
			-- upvalues: ObserveResult (copy), p3 (upval), Sidebar (ref), v2 (ref), IsY (copy), Resize (ref), Detail (ref), v3 (ref)
			local CallbackResult = Callback(ObserveResult)
			
			if CallbackResult and p3.within(CallbackResult, Sidebar) then
				v2 = CallbackResult
				
				if IsY then
					Resize.NextSelectionUp = CallbackResult
				else
					Resize.NextSelectionLeft = CallbackResult
				end
			end
			if CallbackResult and Detail and p3.within(CallbackResult, Detail) then
				v3 = CallbackResult
				
				if IsY then
					Resize.NextSelectionDown = CallbackResult
					
					return
				end
				Resize.NextSelectionRight = CallbackResult
			end
		end)
		local PeekResult1 = FormulaResult2:peek()
		local PeekResult2 = FormulaResult3:peek()
		local PeekResult3 = FormulaResult1:peek()
		local Flag1 = false
		local HasGetResult = false
		Flag = true
		local VisibleResult = p1.observe.Visible(Sidebar)
		Compose.watch(function(Callback)
			-- upvalues: FormulaResult2 (copy), FormulaResult3 (copy), FormulaResult1 (copy), VisibleResult (copy), v1 (ref), FrameResult (copy), FormulaResult (copy), CellResult1 (copy), HoldOwnedAncestorsResult (ref), GuiService (copy), p1 (upval), Resize (ref), Flag1 (ref), PeekResult1 (ref), PeekResult2 (ref), PeekResult3 (ref), HasGetResult (ref), p3 (upval), GamepadCursorEnabledResult (copy), SelectingResult (copy), Detail (ref), Sidebar (ref), v2 (ref), v3 (ref)
			local CallbackResult = Callback(FormulaResult2)
			local CallbackResult1 = Callback(FormulaResult3)
			local CallbackResult2 = Callback(FormulaResult1)
			Callback(VisibleResult)
			
			if v1 then
				Callback(v1)
			end
			FrameResult:SetAttribute("FacetSplitCollapsed", CallbackResult)
			FrameResult:SetAttribute("FacetSplitColumn", CallbackResult1)
			
			if not Callback(FormulaResult1) or Callback(FormulaResult2) or not Callback(FormulaResult) then
				CellResult1:set(false)
				
				if HoldOwnedAncestorsResult then
					HoldOwnedAncestorsResult()
					HoldOwnedAncestorsResult = nil
				end
				if GuiService and p1.selection.get() == Resize then
					Flag1 = true
				end
			end
			local IsNotCallbackResultMatch: boolean = CallbackResult ~= PeekResult1 or CallbackResult1 ~= PeekResult2 or CallbackResult2 ~= PeekResult3
			PeekResult1 = CallbackResult
			PeekResult2 = CallbackResult1
			PeekResult3 = CallbackResult2
			
			if IsNotCallbackResultMatch then
				Flag1 = GuiService ~= nil and (HasGetResult or (p3.within(p1.selection.get(), FrameResult) or not Callback(GamepadCursorEnabledResult) and SelectingResult(Callback)))
				HasGetResult = false
			end
			if Flag1 and GuiService and p1.available(FrameResult, Callback) then
				if not CallbackResult and p1.selection.get() ~= Resize and p1.available(p1.selection.get() or FrameResult) then
					Flag1 = false
					
					return
				end
				local Detail1 = if CallbackResult and CallbackResult1 == "detail" then Detail else Sidebar
				
				if not Detail1 or not p1.available(Detail1, Callback) then return end
				local v4 = if Detail1 == Sidebar then v2 else v3
				local FirstSelectableResult = if v4 and p1.available(v4) and v4.Selectable then v4 else p3.firstSelectable(Detail1)
				
				if FirstSelectableResult then
					Flag1 = false
					p1.selection.set(FirstSelectableResult)
				end
			end
		end)
		local DragSessionModuleResult = DragSessionModule(p1)
		
		if CompactBack then
			local Flag2 = false
			Compose.watch(function(Callback)
				-- upvalues: CompactBack (copy), FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), Transition (copy), CellResult2 (copy)
				CompactBack:set(Callback(FormulaResult2) and (Callback(FormulaResult1) and Callback(FormulaResult3) == "detail" or Transition ~= nil and Callback(CellResult2)))
			end)
			Compose.watch(function(Callback)
				-- upvalues: CompactBack (copy), Flag2 (ref), FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), HasGetResult (ref), GuiService (copy), p1 (upval), PreferredCompactColumn (copy)
				if Callback(CompactBack) == false and not Flag2 and FormulaResult2:peek() and FormulaResult1:peek() and FormulaResult3:peek() == "detail" then
					HasGetResult = GuiService ~= nil and p1.selection.get() ~= nil
					PreferredCompactColumn:set("sidebar")
				end
			end)
			Compose.cleanup(function()
				-- upvalues: Flag2 (ref), CompactBack (copy)
				Flag2 = true
				CompactBack:set(false)
			end)
		end
		FrameResult:SetAttribute("FacetNavigationStack", true)
		local _, SplitBack2 = p1.action(FrameResult, "SplitBack", { "Escape", "ButtonB" }, function(Callback): boolean
			-- upvalues: FormulaResult2 (copy), FormulaResult1 (copy), FormulaResult3 (copy), DragSessionModuleResult (copy)
			return Callback(FormulaResult2) and (Callback(FormulaResult1) and (Callback(FormulaResult3) == "detail" and Callback(DragSessionModuleResult.state) == nil))
		end, back, { priority = 1001 })
		
		local function locate()
			-- upvalues: FrameResult (copy), SplitBack2 (copy)
			local Count = 0
			local Parent = FrameResult.Parent
			while Parent do
				if Parent:GetAttribute("FacetNavigationStack") == true then
					Count += 1
				end
				Parent = Parent.Parent
			end
			SplitBack2.Priority = Count + 1000
		end
		
		Runtime.connect(FrameResult, "AncestryChanged", locate)
		locate()
		
		return FrameResult
	end)
end