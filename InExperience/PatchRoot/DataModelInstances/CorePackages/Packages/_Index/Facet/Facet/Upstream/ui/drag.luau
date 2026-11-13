local PointerDragModule = require("./pointer_drag")
local _ = require("./types")
local _ = require("./environment_types")
local ActivationModule = require("./activation")
local _ = require("./drag_types")
local DragSessionModule = require("./drag_session")
local GestureServiceModule = require("./gesture_service")
local _ = require("./gesture_arbitration")
local ScrollLockModule = require("./scroll_lock")
local DragPointerModule = require("./drag_pointer")
local DragLiftModule = require("./drag_lift")
local DragWorldModule = require("./drag_world")

return function(p1, p2)
	-- upvalues: DragSessionModule (copy), GestureServiceModule (copy), ActivationModule (copy), DragWorldModule (copy), DragLiftModule (copy), ScrollLockModule (copy), PointerDragModule (copy), DragPointerModule (copy)
	local Compose = p1.Compose
	local Host = p1.Host
	local TypesEnum = p1.types.Enum
	local DragSessionModuleResult = DragSessionModule(p1)
	local GestureServiceModuleResult = GestureServiceModule(p1)
	
	function p2.gestureArbiter(p3)
		-- upvalues: Compose (copy), GestureServiceModuleResult (copy)
		assert(Compose.currentOwner() ~= nil, "Facet UI.gestureArbiter must run inside a Compose owner")
		Compose.cleanup(function()
			-- upvalues: GestureServiceModuleResult (upval), p3 (copy)
			GestureServiceModuleResult.cancelOwner(p3)
		end)
		
		return {
			begin = function(Input, Source, NewResult)
				-- upvalues: GestureServiceModuleResult (upval), p3 (copy)
				return GestureServiceModuleResult.begin(Input, p3, Source, NewResult)
			end,
			move = GestureServiceModuleResult.move,
			claim = function(Input, Source)
				-- upvalues: GestureServiceModuleResult (upval), p3 (copy)
				return GestureServiceModuleResult.claim(Input, p3, Source)
			end,
			get = GestureServiceModuleResult.get,
			finish = function(Input, Source)
				-- upvalues: GestureServiceModuleResult (upval), p3 (copy)
				return GestureServiceModuleResult.finish(Input, p3, Source)
			end
		}
	end
	
	local UserInputService = p1.config.userInputService
	local GuiService = p1.config.guiService
	
	local function _(p3, p4): boolean
		-- upvalues: ActivationModule (upval), Compose (copy), TypesEnum (copy)
		if ActivationModule.marked(p3) then
			Compose.cleanup(ActivationModule.intercept(p3, function(Input)
				-- upvalues: TypesEnum (upval), p4 (copy)
				local UserInputType = if Input then Input.UserInputType else nil
				
				return UserInputType ~= TypesEnum.UserInputType.MouseButton1 and UserInputType ~= TypesEnum.UserInputType.Touch and p4()
			end))
			
			return true
		else
			return false
		end
	end
	
	function p2.draggable(Source, p3)
		-- upvalues: Compose (copy), DragWorldModule (upval), p1 (copy), DragSessionModuleResult (copy), DragLiftModule (upval), ActivationModule (upval), ScrollLockModule (upval), TypesEnum (copy), PointerDragModule (upval), Host (copy), DragPointerModule (upval), GestureServiceModuleResult (copy), UserInputService (copy), GuiService (copy)
		assert(Compose.currentOwner() ~= nil, "Facet UI.draggable must run inside a component or Compose owner")
		assert(p3.payload ~= nil, "Facet UI.draggable needs a payload")
		
		if not Source:IsA("GuiObject") then
			DragWorldModule(p1, Source, p3, DragSessionModuleResult)
			
			return
		end
		local NoTouchDragAxis: boolean = p3.previewScale == nil or p3.previewScale > 0 and p3.previewScale < 1e999
		assert(NoTouchDragAxis, "Facet UI.draggable previewScale must be positive and finite")
		NoTouchDragAxis = p3.touchPickup == nil or (p3.touchPickup == "longPress" or p3.touchPickup == "immediate")
		assert(NoTouchDragAxis, "Facet UI.draggable touchPickup must be longPress or immediate")
		NoTouchDragAxis = p3.touchDragAxis == nil or (p3.touchDragAxis == "X" or (p3.touchDragAxis == "Y" or p3.touchDragAxis == "XY"))
		assert(NoTouchDragAxis, "Facet UI.draggable touchDragAxis must be X, Y or XY")
		DragSessionModuleResult.own(Source)
		local Input = nil
		NoTouchDragAxis = nil
		local IsSourceMatch = false
		local Flag = false
		local Flag1 = false
		local Enabled = nil
		local HoldAncestorsResult: (() -> ())? = nil
		local DragLiftModuleResult = if p3.previewScale and p3.previewScale ~= 1 then DragLiftModule(p1, p3.preview or Source, p3.previewScale) else nil
		
		local function _(): boolean
			-- upvalues: DragSessionModuleResult (upval), Source (copy)
			local PeekResult = DragSessionModuleResult.state:peek()
			
			return PeekResult ~= nil and PeekResult.source == Source
		end
		
		local function activateTap(): boolean
			-- upvalues: Source (copy), ActivationModule (upval), Input (ref)
			local Button = Source
			while Button and Button:IsA("GuiObject") do
				if ActivationModule.trigger(Button, Input, 1) then
					return true
				end
				if Button:IsA("GuiButton") then
					return false
				end
				Button = Button.Parent
			end
			return false
		end
		
		local _ = function(p4): boolean
			-- upvalues: p3 (copy), p1 (upval)
			return p3.enabled == nil or p1.read(p3.enabled, p4) == true
		end
		
		local _ = function()
			-- upvalues: HoldAncestorsResult (ref)
			if HoldAncestorsResult then
				HoldAncestorsResult()
				HoldAncestorsResult = nil
			end
		end
		
		local config = {
			payload = p3.payload,
			enabled = p3.enabled,
			armOnTap = p3.armOnTap,
			touchPickup = p3.touchPickup,
			touchDragAxis = p3.touchDragAxis,
			statusLabels = p3.statusLabels,
			previewScale = p3.previewScale,
			preview = p3.preview,
			hitArea = p3.hitArea,
			returnTravel = p3.returnTravel,
			mark = p3.mark,
			operations = p3.operations,
			onStart = p3.onStart
		}
		
		if DragLiftModuleResult then
			config.liftValue = DragLiftModuleResult.value
			config.liftVisual = DragLiftModuleResult.visual
			config.liftCarry = DragLiftModuleResult.carry
		end
		function config.valid()
			-- upvalues: p3 (copy), p1 (upval)
			return (p3.enabled == nil or p1.read(p3.enabled, nil) == true) and (p3.valid == nil or p3.valid())
		end
		
		function config.onEnd(p4, p5)
			-- upvalues: IsSourceMatch (ref), DragLiftModuleResult (copy), HoldAncestorsResult (ref), p3 (copy)
			IsSourceMatch = false
			
			if DragLiftModuleResult then
				DragLiftModuleResult.release()
			end
			if HoldAncestorsResult then
				HoldAncestorsResult()
				HoldAncestorsResult = nil
			end
			if p3.onEnd then
				p3.onEnd(p4, p5)
			end
		end
		
		local function begin(p4)
			-- upvalues: DragSessionModuleResult (upval), Source (copy), config (copy), Input (ref), NoTouchDragAxis (ref), IsSourceMatch (ref), HoldAncestorsResult (ref), Flag (ref)
			DragSessionModuleResult.begin(Source, config, p4, Input, nil, if NoTouchDragAxis then { position = NoTouchDragAxis, source = Source } else nil)
			local PeekResult = DragSessionModuleResult.state:peek()
			IsSourceMatch = PeekResult ~= nil and PeekResult.source == Source
			
			if not IsSourceMatch and HoldAncestorsResult then
				HoldAncestorsResult()
				HoldAncestorsResult = nil
			end
			Flag = true
		end
		
		local _ = function()
			-- upvalues: HoldAncestorsResult (ref), ScrollLockModule (upval), Source (copy)
			if not HoldAncestorsResult then
				HoldAncestorsResult = ScrollLockModule.holdAncestors(Source)
			end
		end
		
		local _ = function(p4)
			-- upvalues: Input (ref), TypesEnum (upval), p1 (upval)
			return if Input and Input.UserInputType == TypesEnum.UserInputType.Touch then p1.types.Vector2.new(Input.Position.X, Input.Position.Y) else p4
		end
		
		local PointerDragModuleResult = PointerDragModule(p1)
		Host.UIDragDetector({
			Name = "FacetDragDetector",
			Archivable = false,
			DragStyle = TypesEnum.UIDragDetectorDragStyle.TranslatePlane,
			ResponseStyle = TypesEnum.UIDragDetectorResponseStyle.CustomOffset,
			Enabled = function(p4): boolean
				-- upvalues: p3 (copy), p1 (upval), PointerDragModuleResult (copy)
				return (p3.enabled == nil or p1.read(p3.enabled, p4) == true) and (PointerDragModuleResult(p4) and p1.effectiveInput()(p4) ~= "Touch")
			end,
			DragStart = function(p4)
				-- upvalues: NoTouchDragAxis (ref), Enabled (ref), DragPointerModule (upval), p1 (upval)
				NoTouchDragAxis = if Enabled == false then nil else DragPointerModule(p1, p4)
			end,
			DragContinue = function(p4)
				-- upvalues: DragPointerModule (upval), p1 (upval), IsSourceMatch (ref), NoTouchDragAxis (ref), p3 (copy), Input (ref), TypesEnum (upval), GestureServiceModuleResult (upval), HoldAncestorsResult (ref), ScrollLockModule (upval), Source (copy), begin (copy), DragSessionModuleResult (upval)
				local DragPointerModuleResult = DragPointerModule(p1, p4)
				
				if not IsSourceMatch and NoTouchDragAxis and (DragPointerModuleResult - NoTouchDragAxis).Magnitude >= 6 and (p3.enabled == nil or p1.read(p3.enabled, nil) == true) and ((Input == nil or Input.UserInputType ~= TypesEnum.UserInputType.Touch) and (Input == nil or GestureServiceModuleResult.move(Input, DragPointerModuleResult) == "drag")) then
					if not HoldAncestorsResult then
						HoldAncestorsResult = ScrollLockModule.holdAncestors(Source)
					end
					begin("pointer")
				end
				if IsSourceMatch then
					DragSessionModuleResult.update(DragPointerModuleResult)
				end
			end,
			DragEnd = function(p4)
				-- upvalues: Input (ref), GestureServiceModuleResult (upval), Source (copy), TypesEnum (upval), DragPointerModule (upval), p1 (upval), NoTouchDragAxis (ref), Flag (ref), IsSourceMatch (ref), DragSessionModuleResult (upval), p3 (copy), activateTap (copy), ActivationModule (upval)
				if Input then
					GestureServiceModuleResult.finish(Input, Source, Input.UserInputState == TypesEnum.UserInputState.Cancel)
				end
				local DragPointerModuleResult = DragPointerModule(p1, p4)
				local IsMagnitudeBelow: boolean = NoTouchDragAxis ~= nil and (not Flag and (DragPointerModuleResult - NoTouchDragAxis).Magnitude < 6)
				NoTouchDragAxis = nil
				
				if IsSourceMatch then
					DragSessionModuleResult.update(DragPointerModuleResult)
					DragSessionModuleResult.commit(nil)
					
					return
				end
				if IsMagnitudeBelow and ((p3.enabled == nil or p1.read(p3.enabled, nil) == true) and activateTap()) then
					ActivationModule.consume(Input)
				end
			end
		}).Parent = Source
		local self = setmetatable({}, { __mode = "k" })
		p1.runtime.connect(Source, "InputBegan", function(Input1)
			-- upvalues: TypesEnum (upval), Enabled (ref), self (copy), ActivationModule (upval), IsSourceMatch (ref), p1 (upval), p3 (copy), Source (copy), GestureServiceModuleResult (upval), Input (ref), Flag (ref), Flag1 (ref), NoTouchDragAxis (ref), DragLiftModuleResult (copy)
			if Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input1.UserInputType == TypesEnum.UserInputType.Touch then
				Enabled = false
				
				if self[Input1] then
					self[Input1] = nil
					ActivationModule.release(Input1)
				end
				if IsSourceMatch or ActivationModule.consumed(Input1) then return end
				local NewResult = p1.types.Vector2.new(Input1.Position.X, Input1.Position.Y)
				local HitArea = p3.hitArea or Source
				local NewResultDelta = NewResult - HitArea.AbsolutePosition
				local AbsoluteSize = HitArea.AbsoluteSize
				
				if p3.hitArea and (NewResultDelta.X < 0 or NewResultDelta.Y < 0 or AbsoluteSize.X <= NewResultDelta.X or AbsoluteSize.Y <= NewResultDelta.Y) then return end
				if p3.enabled ~= nil and p1.read(p3.enabled, nil) ~= true or not GestureServiceModuleResult.begin(Input1, Source, NewResult, {
					pickup = if Input1.UserInputType == TypesEnum.UserInputType.Touch then p3.touchPickup or "longPress" else "immediate",
					axis = p3.touchDragAxis or "XY",
					scroll = Source:FindFirstAncestorWhichIsA("ScrollingFrame") ~= nil
				}) then return end
				Enabled = true
				ActivationModule.release(Input1)
				Input = Input1
				Flag = false
				Flag1 = false
				NoTouchDragAxis = NewResult
				
				if DragLiftModuleResult then
					DragLiftModuleResult.press()
				end
			end
		end)
		p1.runtime.connect(Source, "TouchLongPress", function(Entry, Begin)
			-- upvalues: TypesEnum (upval), p3 (copy), p1 (upval), IsSourceMatch (ref), Input (ref), GestureServiceModuleResult (upval), Source (copy), HoldAncestorsResult (ref), ScrollLockModule (upval), begin (copy), DragSessionModuleResult (upval), DragPointerModule (upval)
			if Begin ~= TypesEnum.UserInputState.Begin or (p3.enabled ~= nil and p1.read(p3.enabled, nil) ~= true or IsSourceMatch or p3.touchPickup == "immediate") then return end
			if not Input or not GestureServiceModuleResult.claim(Input, Source, "drag") then return end
			if not HoldAncestorsResult then
				HoldAncestorsResult = ScrollLockModule.holdAncestors(Source)
			end
			begin("pointer")
			
			if Entry[1] then
				local UpdateFunction: (any) -> () = DragSessionModuleResult.update
				local DragPointerModuleResult = DragPointerModule(p1, Entry[1])
				UpdateFunction(if Input and Input.UserInputType == TypesEnum.UserInputType.Touch then p1.types.Vector2.new(Input.Position.X, Input.Position.Y) else DragPointerModuleResult)
			end
		end)
		
		if UserInputService then
			p1.runtime.connect(UserInputService, "InputBegan", ActivationModule.release)
			p1.runtime.connect(UserInputService, "InputChanged", function(Input1)
				-- upvalues: Input (ref), TypesEnum (upval), p1 (upval), GestureServiceModuleResult (upval), IsSourceMatch (ref), p3 (copy), HoldAncestorsResult (ref), ScrollLockModule (upval), Source (copy), begin (copy), Flag1 (ref), DragLiftModuleResult (copy), DragSessionModuleResult (upval)
				local IsUserInputTypeMatch: boolean = Input ~= nil and (Input.UserInputType == TypesEnum.UserInputType.MouseButton1 and Input1.UserInputType == TypesEnum.UserInputType.MouseMovement)
				
				if (Input1 ~= Input or Input1.UserInputType ~= TypesEnum.UserInputType.Touch) and not IsUserInputTypeMatch then return end
				local NewResult = p1.types.Vector2.new(Input1.Position.X, Input1.Position.Y)
				local MoveResult = GestureServiceModuleResult.move(assert(Input), NewResult)
				
				if IsSourceMatch or MoveResult ~= "drag" or p3.enabled ~= nil and p1.read(p3.enabled, nil) ~= true then
					if MoveResult == "scroll" or MoveResult == "pan" then
						Flag1 = true
						
						if DragLiftModuleResult then
							DragLiftModuleResult.release()
						end
					end
				else
					if not HoldAncestorsResult then
						HoldAncestorsResult = ScrollLockModule.holdAncestors(Source)
					end
					begin("pointer")
				end
				if IsSourceMatch then
					DragSessionModuleResult.update(NewResult)
				end
			end)
			p1.runtime.connect(UserInputService, "InputEnded", function(Input1)
				-- upvalues: self (copy), Input (ref), GestureServiceModuleResult (upval), Source (copy), TypesEnum (upval), NoTouchDragAxis (ref), Enabled (ref), Flag (ref), Flag1 (ref), ActivationModule (upval), DragSessionModuleResult (upval), IsSourceMatch (ref), p1 (upval), p3 (copy), begin (copy), DragLiftModuleResult (copy)
				self[Input1] = true
				
				if Input1 == Input then
					GestureServiceModuleResult.finish(Input1, Source, Input1.UserInputState == TypesEnum.UserInputState.Cancel)
				end
				if Input1 == Input and Input1.UserInputState == TypesEnum.UserInputState.Cancel then
					NoTouchDragAxis = nil
					Enabled = false
					Flag = true
					Flag1 = true
					ActivationModule.consume(Input1)
					local PeekResult = DragSessionModuleResult.state:peek()
					
					if PeekResult ~= nil and PeekResult.source == Source then
						DragSessionModuleResult.finish(false, "Cancelled")
					end
				end
				if IsSourceMatch and Input1 == Input then
					if Input1.UserInputType == TypesEnum.UserInputType.Touch then
						DragSessionModuleResult.update(p1.types.Vector2.new(Input1.Position.X, Input1.Position.Y))
					end
					DragSessionModuleResult.commit(nil)
				end
				if Input1 == Input and p3.armOnTap and Enabled == true and not ActivationModule.consumed(Input1) and Input1.UserInputState ~= TypesEnum.UserInputState.Cancel and Input1.UserInputType == TypesEnum.UserInputType.Touch and not Flag and not Flag1 and not IsSourceMatch and DragSessionModuleResult.state:peek() == nil then
					begin("armed")
				end
				if Input1 == Input then
					local PeekResult = DragSessionModuleResult.state:peek()
					
					if (PeekResult == nil or PeekResult.source ~= Source) and DragLiftModuleResult then
						DragLiftModuleResult.release()
					end
				end
			end)
			p1.runtime.connect(UserInputService, "WindowFocusReleased", function()
				-- upvalues: GestureServiceModuleResult (upval), Source (copy), Input (ref), DragLiftModuleResult (copy), DragSessionModuleResult (upval)
				GestureServiceModuleResult.cancelOwner(Source)
				Input = nil
				
				if DragLiftModuleResult then
					DragLiftModuleResult.release()
				end
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult ~= nil and PeekResult.source == Source then
					DragSessionModuleResult.finish(false, "Window lost focus")
				end
			end)
		end
		local ObserveResult = if GuiService then p1.selection.observe() else nil
		
		if ObserveResult then
			Compose.watch(function(Callback)
				-- upvalues: ObserveResult (copy), DragSessionModuleResult (upval), Source (copy)
				local CallbackResult = Callback(ObserveResult)
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult and PeekResult.source == Source and PeekResult.mode == "armed" then
					DragSessionModuleResult.hover(DragSessionModuleResult.targetOf(CallbackResult), nil)
				end
			end)
		end
		local function pickUp(): boolean
			-- upvalues: DragSessionModuleResult (upval), p3 (copy), p1 (upval), DragLiftModuleResult (copy), begin (copy), Source (copy)
			if DragSessionModuleResult.state:peek() ~= nil or p3.enabled ~= nil and p1.read(p3.enabled, nil) ~= true then
				return false
			end
			if DragLiftModuleResult then
				DragLiftModuleResult.press()
			end
			begin("armed")
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if (PeekResult == nil or PeekResult.source ~= Source) and DragLiftModuleResult then
				DragLiftModuleResult.release()
			end
			return true
		end
		local Flag2 = nil
		
		if ActivationModule.marked(Source) then
			Compose.cleanup(ActivationModule.intercept(Source, function(Input)
				-- upvalues: TypesEnum (upval), pickUp (copy)
				local UserInputType = if Input then Input.UserInputType else nil
				
				return UserInputType ~= TypesEnum.UserInputType.MouseButton1 and UserInputType ~= TypesEnum.UserInputType.Touch and pickUp()
			end))
			Flag2 = true
		else
			Flag2 = false
		end
		if not Flag2 then
			p1.action(Source, "DragPickUp", { TypesEnum.KeyCode.Return, TypesEnum.KeyCode.ButtonA }, function(Callback)
				-- upvalues: ObserveResult (copy), DragSessionModuleResult (upval), p3 (copy), p1 (upval), Source (copy)
				local CallbackResult = if ObserveResult then Callback(ObserveResult) else nil
				
				return Callback(DragSessionModuleResult.state) == nil and (if p3.enabled == nil then CallbackResult ~= nil and (CallbackResult == Source or CallbackResult:IsDescendantOf(Source)) else p1.read(p3.enabled, Callback) == true and (CallbackResult ~= nil and (CallbackResult == Source or CallbackResult:IsDescendantOf(Source))))
			end, function()
				-- upvalues: pickUp (copy)
				pickUp()
			end, { priority = 250 })
		end
		p1.action(Source, "DragCancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, function(Callback): boolean
			-- upvalues: DragSessionModuleResult (upval), Source (copy)
			local CallbackResult = Callback(DragSessionModuleResult.state)
			
			return CallbackResult ~= nil and CallbackResult.source == Source
		end, function()
			-- upvalues: DragSessionModuleResult (upval)
			DragSessionModuleResult.finish(false, "Cancelled")
		end, { priority = 250 })
		Compose.cleanup(function()
			-- upvalues: GestureServiceModuleResult (upval), Source (copy), DragSessionModuleResult (upval), HoldAncestorsResult (ref)
			GestureServiceModuleResult.cancelOwner(Source)
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if PeekResult ~= nil and PeekResult.source == Source then
				DragSessionModuleResult.finish(false, "The source was removed")
			end
			if HoldAncestorsResult then
				HoldAncestorsResult()
				HoldAncestorsResult = nil
			end
		end)
	end
	
	function p2.dropTarget(Gui, p4)
		-- upvalues: Compose (copy), DragSessionModuleResult (copy), p1 (copy), TypesEnum (copy), ActivationModule (upval), GuiService (copy)
		assert(Compose.currentOwner() ~= nil, "Facet UI.dropTarget must run inside a component or Compose owner")
		assert(type(p4.onDrop) == "function", "Facet UI.dropTarget needs onDrop")
		DragSessionModuleResult.register(Gui, p4)
		local FocusTarget = p4.focusTarget or (if Gui:IsA("GuiObject") then Gui else nil)
		
		if not FocusTarget then return end
		local function _(p5): boolean
			-- upvalues: DragSessionModuleResult (upval), Gui (copy)
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if PeekResult and PeekResult.mode == "armed" then
				DragSessionModuleResult.commit(Gui, p5)
				
				return true
			else
				return false
			end
		end
		
		p1.runtime.connect(FocusTarget, "InputBegan", function(Input)
			-- upvalues: TypesEnum (upval), p1 (upval), DragSessionModuleResult (upval), Gui (copy), ActivationModule (upval)
			if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch then
				local NewResult = if Input.Position then p1.types.Vector2.new(Input.Position.X, Input.Position.Y) else nil
				local PeekResult = DragSessionModuleResult.state:peek()
				local Flag = nil
				
				if PeekResult and PeekResult.mode == "armed" then
					DragSessionModuleResult.commit(Gui, NewResult)
					Flag = true
				else
					Flag = false
				end
				if Flag then
					ActivationModule.consume(Input)
				end
			end
		end)
		
		local function dropAtFocus(): boolean
			-- upvalues: DragSessionModuleResult (upval), Gui (copy)
			local PeekResult = DragSessionModuleResult.state:peek()
			
			if PeekResult and PeekResult.mode == "armed" then
				DragSessionModuleResult.commit(Gui, nil)
				
				return true
			else
				return false
			end
		end
		local Flag = nil
		
		if ActivationModule.marked(FocusTarget) then
			Compose.cleanup(ActivationModule.intercept(FocusTarget, function(Input)
				-- upvalues: TypesEnum (upval), dropAtFocus (copy)
				local UserInputType = if Input then Input.UserInputType else nil
				
				return UserInputType ~= TypesEnum.UserInputType.MouseButton1 and UserInputType ~= TypesEnum.UserInputType.Touch and dropAtFocus()
			end))
			Flag = true
		else
			Flag = false
		end
		if not Flag then
			local ObserveResult = if GuiService then p1.selection.observe() else nil
			p1.action(FocusTarget, "DragDrop", { TypesEnum.KeyCode.Return, TypesEnum.KeyCode.ButtonA }, function(Callback): boolean
				-- upvalues: DragSessionModuleResult (upval), ObserveResult (copy), FocusTarget (copy)
				local CallbackResult = Callback(DragSessionModuleResult.state)
				
				return CallbackResult ~= nil and (CallbackResult.mode == "armed" and (ObserveResult ~= nil and Callback(ObserveResult) == FocusTarget))
			end, function()
				-- upvalues: DragSessionModuleResult (upval), Gui (copy)
				local PeekResult = DragSessionModuleResult.state:peek()
				
				if PeekResult then
					if PeekResult.mode ~= "armed" then return end
					DragSessionModuleResult.commit(Gui, nil)
				end
			end, { priority = 250 })
		end
	end
end