local PointerDragModule = require("./pointer_drag")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("./input_props")
local ColorPickerKitModule = require("./color_picker_kit")
local _ = require("./color_picker_state")
local _ = require("./color_picker_sliders")
local CELL = ColorPickerKitModule.CELL
local SPACE = ColorPickerKitModule.SPACE
local RING = ColorPickerKitModule.RING
local BUBBLE = ColorPickerKitModule.BUBBLE

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: PointerDragModule (copy), CELL (copy), RING (copy), BUBBLE (copy), SPACE (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	local Color = p4.color
	local RingFunction = p4.ring
	local WHITE = p4.WHITE
	local Held = p5.held
	local Canon = p5.canon
	local Selected = p5.selected
	local InteractiveFunction = p5.interactive
	local MayEditFunction = p5.mayEdit
	local ProposeFunction = p5.propose
	local CommitFunction = p5.commit
	local TouchFunction = p5.touch
	local GamepadFunction = p5.gamepad
	local BubbleFunction = p6.bubble
	local HueSliderFunction = p6.hueSlider
	
	return function()
		-- upvalues: PointerDragModule (upval), p1 (copy), Compose (copy), Canon (copy), ProposeFunction (copy), MayEditFunction (copy), GamepadFunction (copy), Selected (copy), CommitFunction (copy), p5 (copy), InteractiveFunction (copy), RingFunction (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), Runtime (copy), CELL (upval), WHITE (copy), Color (copy), p4 (copy), TypesVector2 (copy), Held (copy), RING (upval), p3 (copy), TouchFunction (copy), BubbleFunction (copy), BUBBLE (upval), SPACE (upval), p2 (copy), HueSliderFunction (copy)
		local PointerDragModuleResult = PointerDragModule(p1)
		local FormulaResult = Compose.formula(function(Callback)
			-- upvalues: Canon (upval)
			return Callback(Canon).h
		end)
		local CellResult = Compose.cell(false)
		local PeekResult = nil
		local Frame = nil
		local v1 = nil
		local AbsoluteSizeResult = nil
		
		local function _(Vector)
			-- upvalues: Frame (ref)
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize = Frame.AbsoluteSize
			
			if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
				return nil, nil
			else
				return math.clamp((Vector.X - AbsolutePosition.X) / AbsoluteSize.X, 0, 1), (math.clamp((Vector.Y - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1))
			end
		end
		
		local function setFrom(Vector)
			-- upvalues: Frame (ref), Canon (upval), ProposeFunction (upval)
			local AbsolutePosition = Frame.AbsolutePosition
			local AbsoluteSize = Frame.AbsoluteSize
			local ClampedValue = nil
			local ClampedValue1 = nil
			
			if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
				ClampedValue = nil
				ClampedValue1 = nil
			else
				ClampedValue = math.clamp((Vector.X - AbsolutePosition.X) / AbsoluteSize.X, 0, 1)
				ClampedValue1 = math.clamp((Vector.Y - AbsolutePosition.Y) / AbsoluteSize.Y, 0, 1)
			end
			if ClampedValue ~= nil and ClampedValue1 ~= nil then
				ProposeFunction({
					h = Canon:peek().h,
					s = ClampedValue,
					v = 1 - ClampedValue1
				})
				
				return
			end
		end
		
		local function beginDrag(p7)
			-- upvalues: MayEditFunction (upval), GamepadFunction (upval), p1 (upval), Selected (upval), Frame (ref), CellResult (copy), PeekResult (ref), Canon (upval), setFrom (copy)
			if not MayEditFunction() or GamepadFunction() and p1.readSource(Selected) == Frame then return end
			if not CellResult:peek() then
				PeekResult = Canon:peek()
				CellResult:set(true)
			end
			setFrom(p7)
		end
		
		local function endDrag()
			-- upvalues: CellResult (copy), PeekResult (ref), CommitFunction (upval)
			if CellResult:peek() then
				CellResult:set(false)
				PeekResult = nil
				CommitFunction()
				
				return
			end
		end
		
		local _ = function()
			-- upvalues: CellResult (copy), PeekResult (ref), ProposeFunction (upval)
			if not CellResult:peek() then return end
			CellResult:set(false)
			local PeekResult1 = PeekResult
			PeekResult = nil
			
			if PeekResult1 ~= nil then
				ProposeFunction(PeekResult1)
			end
		end
		
		local Flag = true
		Compose.watch(function(Callback: (any) -> ())
			-- upvalues: p5 (upval), Flag (ref), CellResult (copy), PeekResult (ref), ProposeFunction (upval)
			Callback(p5.preferred)
			
			if not Flag and CellResult:peek() then
				CellResult:set(false)
				local PeekResult1 = PeekResult
				PeekResult = nil
				
				if PeekResult1 ~= nil then
					ProposeFunction(PeekResult1)
				end
			end
			Flag = false
		end)
		Compose.watch(function(p7)
			-- upvalues: InteractiveFunction (upval), CellResult (copy), PeekResult (ref), ProposeFunction (upval)
			if not InteractiveFunction(p7) then
				if not CellResult:peek() then return end
				CellResult:set(false)
				local PeekResult1 = PeekResult
				PeekResult = nil
				
				if PeekResult1 ~= nil then
					ProposeFunction(PeekResult1)
				end
			end
		end)
		
		local function spot(Callback, RING: number)
			-- upvalues: AbsoluteSizeResult (ref), Canon (upval)
			local CallbackResult = Callback(AbsoluteSizeResult)
			local CallbackResult1 = Callback(Canon)
			
			return math.clamp(CallbackResult1.s * CallbackResult.X, RING / 2, (math.max(RING / 2, CallbackResult.X - RING / 2))), (math.clamp((1 - CallbackResult1.v) * CallbackResult.Y, RING / 2, (math.max(RING / 2, CallbackResult.Y - RING / 2))))
		end
		
		local Ring = RingFunction("Ring")
		Frame = Host.Frame("Surface")({
			Size = TypesUDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ZIndex = 5,
			Selectable = function(p7)
				-- upvalues: InteractiveFunction (upval)
				return InteractiveFunction(p7)
			end,
			Host.UIDragDetector("Drag")({
				ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
				Enabled = function(p7)
					-- upvalues: InteractiveFunction (upval), PointerDragModuleResult (copy)
					return InteractiveFunction(p7) and PointerDragModuleResult(p7)
				end,
				DragStart = beginDrag,
				DragContinue = function(p7)
					-- upvalues: CellResult (copy), setFrom (copy)
					if CellResult:peek() then
						setFrom(p7)
					end
				end,
				DragEnd = endDrag
			})
		})
		Frame:SetAttribute("AccessibleLabel", "Saturation and brightness")
		Runtime.connect(Frame, "SelectionGained", function() end)
		v1 = Host.Frame("Plane")({
			Size = TypesUDim2.new(1, 0, 0, 4 * CELL),
			BackgroundTransparency = 1,
			Host.Frame("Field")({
				Size = TypesUDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Host.Frame("Hue")({
					Size = TypesUDim2.fromScale(1, 1),
					BorderSizePixel = 0,
					BackgroundColor3 = WHITE,
					Host.UIGradient("Gradient")({
						Rotation = 0,
						Color = function(Callback)
							-- upvalues: Color (upval), FormulaResult (copy), p1 (upval), WHITE (upval)
							return p1.types.ColorSequence.new({
								p1.types.ColorSequenceKeypoint.new(0, WHITE),
								p1.types.ColorSequenceKeypoint.new(1, (Color.toColor({ s = 1, v = 1, h = Callback(FormulaResult) })))
							})
						end
					})
				}),
				Host.Frame("Value")({
					Size = TypesUDim2.fromScale(1, 1),
					BorderSizePixel = 0,
					BackgroundColor3 = p4.BLACK,
					Host.UIGradient("Gradient")({
						Rotation = 90,
						Transparency = p1.types.NumberSequence.new({
							p1.types.NumberSequenceKeypoint.new(0, 1),
							p1.types.NumberSequenceKeypoint.new(1, 0)
						})
					})
				})
			}),
			Frame
		})
		AbsoluteSizeResult = p1.observe.AbsoluteSize(v1)
		Runtime.decorate(Ring, {
			ZIndex = 4,
			AnchorPoint = TypesVector2.new(0.5, 0.5),
			Visible = function(Callback): boolean
				-- upvalues: Held (upval)
				return Callback(Held) ~= nil
			end,
			Position = function(Callback)
				-- upvalues: AbsoluteSizeResult (ref), Canon (upval), TypesUDim2 (upval), spot (copy), RING (upval)
				if Callback(AbsoluteSizeResult).X <= 0 then
					local CallbackResult = Callback(Canon)
					
					return TypesUDim2.fromScale(CallbackResult.s, 1 - CallbackResult.v)
				else
					local SpotResult, SpotResult2 = spot(Callback, RING)
					
					return TypesUDim2.fromOffset(SpotResult, SpotResult2)
				end
			end
		})
		p3.attach(v1, {
			Ring,
			p3.overlay(v1, function(Callback)
				-- upvalues: TouchFunction (upval), CellResult (copy)
				return TouchFunction(Callback) and Callback(CellResult)
			end, function()
				-- upvalues: p3 (upval), v1 (ref), p1 (upval), BubbleFunction (upval), Color (upval), Canon (upval), CellResult (copy), TypesVector2 (upval), AbsoluteSizeResult (ref), spot (copy), RING (upval), BUBBLE (upval), SPACE (upval), TypesUDim2 (upval), Host (upval)
				local v2 = assert(p3.parent(v1))
				local AbsolutePositionResult = p1.observe.AbsolutePosition(v1)
				local AbsolutePositionResult1 = p1.observe.AbsolutePosition(v2)
				local AbsoluteSizeResult1 = p1.observe.AbsoluteSize(v2)
				local LayoutUnitResult = p1.layoutUnit(v1)
				local LayoutUnitResult1 = p1.layoutUnit(v2)
				local BubbleResult = BubbleFunction(function(Callback)
					-- upvalues: Color (upval), Canon (upval)
					return Color.toColor(Callback(Canon))
				end, function(Callback)
					-- upvalues: CellResult (upval)
					return Callback(CellResult)
				end, {
					ZIndex = 102,
					AnchorPoint = TypesVector2.new(0.5, 1),
					Position = function(Callback)
						-- upvalues: LayoutUnitResult (copy), AbsoluteSizeResult (upval), spot (upval), RING (upval), BUBBLE (upval), AbsolutePositionResult (copy), AbsolutePositionResult1 (copy), SPACE (upval), AbsoluteSizeResult1 (copy), TypesUDim2 (upval), LayoutUnitResult1 (copy)
						local CallbackResult = Callback(LayoutUnitResult)
						local CallbackResult1 = Callback(AbsoluteSizeResult)
						local SpotResult, SpotResult2 = spot(Callback, RING * CallbackResult)
						local ScaledBUBBLE = BUBBLE / 2 * CallbackResult
						local CallbackResultDelta = Callback(AbsolutePositionResult) - Callback(AbsolutePositionResult1)
						local YDelta = CallbackResultDelta.Y + SpotResult2 - (RING / 2 + SPACE) * CallbackResult
						local CallbackResult2 = Callback(AbsoluteSizeResult1)
						
						if CallbackResult2.Y > 0 and YDelta < BUBBLE * CallbackResult then
							local ScaledRING = (RING / 2 + SPACE + BUBBLE / 2) * CallbackResult
							local NewX = CallbackResultDelta.X + SpotResult
							
							return TypesUDim2.fromOffset(math.clamp(if NewX + ScaledRING + ScaledBUBBLE <= CallbackResult2.X then NewX + ScaledRING else NewX - ScaledRING, ScaledBUBBLE, (math.max(ScaledBUBBLE, CallbackResult2.X - ScaledBUBBLE))) / Callback(LayoutUnitResult1), math.clamp(CallbackResultDelta.Y + SpotResult2 + ScaledBUBBLE, 2 * ScaledBUBBLE, (math.max(2 * ScaledBUBBLE, CallbackResult2.Y))) / Callback(LayoutUnitResult1))
						else
							return TypesUDim2.fromOffset((CallbackResultDelta.X + math.clamp(SpotResult, ScaledBUBBLE, (math.max(ScaledBUBBLE, CallbackResult1.X - ScaledBUBBLE)))) / Callback(LayoutUnitResult1), YDelta / Callback(LayoutUnitResult1))
						end
					end
				})
				p3.attach(BubbleResult, {
					Host.UIScale({
						Scale = function(Callback)
							-- upvalues: LayoutUnitResult (copy), LayoutUnitResult1 (copy)
							return Callback(LayoutUnitResult) / Callback(LayoutUnitResult1)
						end
					})
				})
				
				return BubbleResult
			end)
		})
		
		local _ = function(p7): boolean
			-- upvalues: p1 (upval), Selected (upval), Frame (ref)
			return p1.readSource(Selected, p7) == Frame
		end
		
		local Zero = TypesVector2.zero
		local OnFrameResult = nil
		
		local _ = function()
			-- upvalues: OnFrameResult (ref), CommitFunction (upval)
			local Callback: () -> () = OnFrameResult
			
			if Callback then
				OnFrameResult = nil
				Callback()
				CommitFunction()
			end
		end
		
		local function steer(p7: number)
			-- upvalues: p1 (upval), Selected (upval), Frame (ref), MayEditFunction (upval), OnFrameResult (ref), CommitFunction (upval), Canon (upval), ProposeFunction (upval), Zero (ref)
			if p7 <= 0 then return end
			if p1.readSource(Selected, nil) == Frame and MayEditFunction() then
				local PeekResult = Canon:peek()
				ProposeFunction({
					h = PeekResult.h,
					s = math.clamp(PeekResult.s + Zero.X * 0.6 * p7, 0, 1),
					v = math.clamp(PeekResult.v + Zero.Y * 0.6 * p7, 0, 1)
				})
				
				return
			end
			local Callback: () -> () = OnFrameResult
			
			if Callback then
				OnFrameResult = nil
				Callback()
				CommitFunction()
			end
		end
		
		Runtime.decorate(p1.action(Frame, "ColorPlaneSteer", { TypesEnum.KeyCode.Thumbstick2 }, function(p7)
			-- upvalues: p1 (upval), Selected (upval), Frame (ref), InteractiveFunction (upval)
			return p1.readSource(Selected, p7) == Frame and InteractiveFunction(p7)
		end, function() end, { priority = 2200 }), {
			Type = TypesEnum.InputActionType.Direction2D,
			StateChanged = function(Offset)
				-- upvalues: Zero (ref), TypesVector2 (upval), OnFrameResult (ref), CommitFunction (upval), Runtime (upval), steer (copy)
				if typeof(Offset) ~= "Vector2" then return end
				if Offset.Magnitude < 0.2 then
					Zero = TypesVector2.zero
					local Callback: () -> () = OnFrameResult
					
					if Callback then
						OnFrameResult = nil
						Callback()
						CommitFunction()
					end
					return
				else
					Zero = Offset
					
					if OnFrameResult == nil then
						OnFrameResult = assert(Runtime.host.frames).onFrame(steer)
					end
				end
			end
		})
		Compose.watch(function(p7)
			-- upvalues: p1 (upval), Selected (upval), Frame (ref), Zero (ref), TypesVector2 (upval), OnFrameResult (ref), CommitFunction (upval)
			if p1.readSource(Selected, p7) ~= Frame then
				Zero = TypesVector2.zero
				local Callback: () -> () = OnFrameResult
				
				if Callback then
					OnFrameResult = nil
					Callback()
					CommitFunction()
				end
			end
		end)
		Compose.cleanup(function()
			-- upvalues: OnFrameResult (ref)
			local Callback: () -> () = OnFrameResult
			OnFrameResult = nil
			
			if Callback then
				Callback()
			end
		end)
		
		return p1.column({
			v1,
			p1.row({
				p2.ShortcutHint({
					Name = "StickKey",
					controlSize = "compact",
					keys = { { "Right Stick" } }
				}),
				p1.text({
					Name = "Words",
					Text = "Move saturation and brightness",
					AutomaticSize = TypesEnum.AutomaticSize.XY
				}, nil, "caption")
			}, {
				Name = "StickHint",
				Visible = function(p7): boolean
					-- upvalues: GamepadFunction (upval), p1 (upval), Selected (upval), Frame (ref)
					return GamepadFunction(p7) and p1.readSource(Selected, p7) == Frame
				end
			}),
			HueSliderFunction()
		}, {
			Name = "Spectrum",
			Size = TypesUDim2.new(1, 0, 0, 0),
			AutomaticSize = TypesEnum.AutomaticSize.Y
		})
	end
end