local NavRadialGeometryModule = require("./nav_radial_geometry")
local _ = require("./types")
local _ = require("./radial_types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local _ = require("./nav_radial_menu")
local _ = require("./nav_radial_layout")
local _ = require("./nav_radial_sectors")
local _ = require("./nav_radial_center")
local self = setmetatable({}, { __mode = "k" })

local function holdNavigation(Gui)
	-- upvalues: self (copy)
	local SelfEntry = self[Gui]
	
	if SelfEntry == nil then
		local config = {
			count = 0,
			changed = false,
			saved = Gui.GuiNavigationEnabled
		}
		Gui.GuiNavigationEnabled = false
		config.watch = Gui:GetPropertyChangedSignal("GuiNavigationEnabled"):Connect(function()
			-- upvalues: Gui (copy), config (copy)
			if Gui.GuiNavigationEnabled then
				config.changed = true
			end
		end)
		self[Gui] = config
		SelfEntry = config
	end
	local v1 = assert(SelfEntry)
	v1.count += 1
	local Flag = false
	
	return function()
		-- upvalues: Flag (ref), v1 (copy), self (upval), Gui (copy)
		if Flag then return end
		Flag = true
		v1.count -= 1
		
		if v1.count == 0 then
			self[Gui] = nil
			
			if v1.watch then
				v1.watch:Disconnect()
			end
			if not v1.changed and Gui.GuiNavigationEnabled == false then
				Gui.GuiNavigationEnabled = v1.saved
			end
		end
	end
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: NavRadialGeometryModule (copy), holdNavigation (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local TypesVector2 = p1.types.Vector2
	local Spec = p3.spec
	local Session = p3.session
	local Appearance = p3.appearance
	local GestureSelection = p3.gestureSelection
	local Opened = p3.opened
	local Path = p3.path
	local Candidate = p3.candidate
	local Interacting = p3.interacting
	local Naming = p3.naming
	local TouchPoint = p3.touchPoint
	local Holding = p3.holding
	local CancelFunction = p3.cancel
	local NativeActivateFunction = p3.nativeActivate
	local Origin = p4.origin
	local Center = p4.center
	local Layout = p4.layout
	local Sectors = p4.sectors
	local Fallback = p4.fallback
	local Buttons = p5.buttons
	local Focus = p5.focus
	local Gui = p5.gui
	local Panel = p5.panel
	
	local function _(p7)
		-- upvalues: ReadFunction (copy), Candidate (copy)
		if p7 and ReadFunction(p7.item.enabled) == false then
			p7 = nil
		end
		Candidate:set(if p7 then p7.key else nil)
		
		return p7
	end
	
	local function beyond(Position): boolean
		-- upvalues: Layout (copy), Center (copy), Origin (copy), TypesVector2 (copy), p6 (copy)
		local PeekResult = Layout:peek()
		local NewPeekResult = Center:peek() + Origin:peek()
		
		return not PeekResult.list and p6.reachOf(PeekResult) < TypesVector2.new(Position.X - NewPeekResult.X, Position.Y - NewPeekResult.Y).Magnitude
	end
	
	function Session.aimPointer(Vector, p7, p8)
		-- upvalues: Fallback (copy), Center (copy), Origin (copy), Spec (copy), Layout (copy), GestureSelection (copy), ReadFunction (copy), Candidate (copy), Sectors (copy), NavRadialGeometryModule (upval), Appearance (copy), Session (copy)
		if Fallback:peek() then
			return false
		end
		local NewPeekResult = Center:peek() + Origin:peek()
		local XDelta = Vector.X - NewPeekResult.X
		local YDelta = Vector.Y - NewPeekResult.Y
		local SquareRoot = math.sqrt(XDelta * XDelta + YDelta * YDelta)
		
		if p8 and Spec.centerPassThrough and (Spec.center == "empty" or Spec.center == "content") and SquareRoot < Layout:peek().inner then
			return false
		end
		if p7 and GestureSelection == "direction" then
			if SquareRoot < 26 then
				local v1 = nil
				
				if v1 and ReadFunction(v1.item.enabled) == false then
					v1 = nil
				end
				Candidate:set(if v1 then v1.key else nil)
				
				return v1
			else
				local PeekResult = Sectors:peek()
				local PeekResultEntry = PeekResult[#PeekResult]
				
				if PeekResultEntry then
					local InnerRatio = (PeekResultEntry.inner + PeekResultEntry.outer) / 2
					XDelta = XDelta / SquareRoot * InnerRatio
					YDelta = YDelta / SquareRoot * InnerRatio
				else
					local v2 = nil
					
					if v2 and ReadFunction(v2.item.enabled) == false then
						v2 = nil
					end
					Candidate:set(if v2 then v2.key else nil)
					
					return v2
				end
			end
		end
		local HitResult = NavRadialGeometryModule.hit(Sectors:peek(), XDelta, YDelta, Appearance, if p7 then 44 else nil, assert(Session.candidateSector)())
		
		if HitResult and ReadFunction(HitResult.item.enabled) == false then
			HitResult = nil
		end
		Candidate:set(if HitResult then HitResult.key else nil)
		
		return HitResult
	end
	
	function Session.aimAnalog(Offset)
		-- upvalues: Session (copy), Opened (copy), p1 (copy), Panel (copy), Interacting (copy), Candidate (copy), Naming (copy), Fallback (copy), Focus (copy), Sectors (copy), NavRadialGeometryModule (upval), ReadFunction (copy), Gui (copy), Buttons (copy)
		if Session.capture or not Opened:peek() or not p1.available(Panel) then return end
		local Magnitude: number = Offset.Magnitude
		
		if Magnitude < 0.25 then
			Session.analog = false
			Interacting:set(false)
			Candidate:set(nil)
			
			return
		end
		if Magnitude < 0.35 and not Session.analog then return end
		local NoAnalog = not Session.analog
		
		if NoAnalog and Session.freezeCenter then
			Session.freezeCenter()
		end
		Session.analog = true
		Interacting:set(true)
		Naming:set(true)
		
		if Fallback:peek() then
			if NoAnalog then
				Candidate:set(Focus.move(if Offset.Y > 0 then "up" else "down"))
			end
		else
			local PeekResult = Sectors:peek()
			local PeekResultEntry = PeekResult[#PeekResult]
			
			if not PeekResultEntry then return end
			local InnerRatio = (PeekResultEntry.inner + PeekResultEntry.outer) / 2
			local Wedges = NavRadialGeometryModule.hit(PeekResult, Offset.X / Magnitude * InnerRatio, -Offset.Y / Magnitude * InnerRatio, "wedges", 0, assert(Session.candidateSector)())
			
			if Wedges and ReadFunction(Wedges.item.enabled) == false then
				Wedges = nil
			end
			Candidate:set(if Wedges then Wedges.key else nil)
		end
		local PeekResult1 = Candidate:peek()
		
		if Gui and PeekResult1 and Buttons[PeekResult1] then
			p1.selection.set(Buttons[PeekResult1])
		end
	end
	
	Runtime.connect(Panel, "InputBegan", function(p7)
		-- upvalues: p3 (copy)
		p3.beginPointer(p7, true)
	end)
	local UserInputService = p2.service("UserInputService")
	Runtime.connect(UserInputService or Panel, "InputChanged", function(Input)
		-- upvalues: Session (copy), TypesEnum (copy), CancelFunction (copy), Naming (copy), TouchPoint (copy), Holding (copy)
		if Session.capture and (Input == Session.capture or Session.capture.UserInputType == TypesEnum.UserInputType.MouseButton1 and Input.UserInputType == TypesEnum.UserInputType.MouseMovement) then
			if Input.UserInputState == TypesEnum.UserInputState.Cancel then
				CancelFunction()
				
				return
			end
			if Session.launcherGesture and not Naming:peek() and Session.heldAt and (Input.Position - Session.heldAt).Magnitude < 14 then return end
			if Session.capture.UserInputType == TypesEnum.UserInputType.Touch then
				TouchPoint:set(Input.Position)
			end
			if Session.heldAt and (Input.Position - Session.heldAt).Magnitude > 14 then
				Holding:pause()
				
				if Session.inspectedUntil == 1e999 then
					Session.inspectedUntil = nil
				end
			end
			Naming:set(true)
			assert(Session.aimPointer)(Input.Position, true)
		end
	end)
	Runtime.connect(UserInputService or Panel, "InputEnded", function(Input)
		-- upvalues: Session (copy), TypesEnum (copy), CancelFunction (copy), beyond (copy), p3 (copy), NativeActivateFunction (copy)
		if Session.capture and (Input == Session.capture or Session.capture.UserInputType == TypesEnum.UserInputType.MouseButton1 and Input.UserInputType == TypesEnum.UserInputType.MouseButton1) then
			if Input.UserInputState == TypesEnum.UserInputState.Cancel then
				CancelFunction()
				
				return
			end
			local BeyondResult = Session.pressedAt and (Input.Position - Session.pressedAt).Magnitude < 8 and (beyond(Session.pressedAt) and beyond(Input.Position))
			local IsMagnitudeBelow: boolean = Session.launcherGesture and (Session.heldAt and (Input.Position - Session.heldAt).Magnitude < 14)
			local v1 = if BeyondResult or IsMagnitudeBelow then nil else assert(Session.aimPointer)(Input.Position, true)
			CancelFunction()
			
			if BeyondResult then
				p3.close()
				
				return
			end
			if type(v1) == "table" then
				NativeActivateFunction(v1, Input, "gesture")
			end
		end
	end)
	
	function Session.returnSelection(Callback: () -> (), p7)
		-- upvalues: Gui (copy), p2 (copy), p1 (copy), Panel (copy), Buttons (copy), Focus (copy)
		local WithinResult = Gui ~= nil and p2.within(p1.selection.get(), Panel)
		Callback()
		local Button = Buttons[p7 or ((if WithinResult then Focus.first() else nil) or "")]
		
		if WithinResult and Gui and Button and Button.Parent then
			p1.selection.set(Button)
		end
	end
	
	Compose.cleanup(function()
		-- upvalues: CancelFunction (copy), Session (copy)
		CancelFunction()
		Session.aimPointer = nil
		Session.aimAnalog = nil
		Session.returnSelection = nil
	end)
	
	if Gui then
		local Callback: (() -> ())? = nil
		
		local function let()
			-- upvalues: Callback (ref)
			if Callback then
				Callback()
				Callback = nil
			end
		end
		
		Compose.watch(function(Callback1)
			-- upvalues: Opened (copy), Callback (ref), holdNavigation (upval), Gui (copy)
			if Callback1(Opened) and Callback == nil then
				Callback = holdNavigation(Gui)
				
				return
			end
			if not Callback1(Opened) and Callback then
				Callback()
				Callback = nil
			end
		end)
		Compose.cleanup(let)
	end
	Compose.watch(function(Callback)
		-- upvalues: Sectors (copy), Layout (copy), Path (copy), p3 (copy), Candidate (copy), ReadFunction (copy)
		local CallbackResult = Callback(Sectors)
		local Path1 = Callback(Layout).path
		
		if #Path1 < #Path:peek() then
			p3.jump(Path1)
		end
		local PeekResult = Candidate:peek()
		local Flag = false
		
		for _, value in CallbackResult do
			if value.key == PeekResult and ReadFunction(value.item.enabled, Callback) ~= false then
				Flag = true
			end
		end
		if PeekResult and not Flag then
			Candidate:set(nil)
		end
	end)
	
	if p1.action then
		p1.action(Panel, "RadialAim", { "Thumbstick1" }, Opened, function() end, {
			priority = 2200,
			group = "Radial",
			direction2D = Session.aimAnalog
		})
		p1.action(Panel, "RadialCommit", { "ButtonA", "Return" }, function(Callback): boolean
			-- upvalues: Opened (copy), Candidate (copy)
			return Callback(Opened) and Callback(Candidate) ~= nil
		end, function()
			-- upvalues: Session (copy), NativeActivateFunction (copy)
			NativeActivateFunction(assert(Session.candidateSector)(), nil, "action")
		end, { priority = 2200, group = "Radial" })
		local config = {
			left = TypesVector2.new(-1, 0),
			right = TypesVector2.new(1, 0),
			up = TypesVector2.new(0, -1),
			down = TypesVector2.new(0, 1)
		}
		
		local function ringStep(p7)
			-- upvalues: config (copy), Sectors (copy), ReadFunction (copy), Candidate (copy), TypesVector2 (copy), p6 (copy)
			local Entry = config[p7]
			local List = {}
			
			for _, value in Sectors:peek() do
				if ReadFunction(value.item.enabled) ~= false then
					table.insert(List, value)
				end
			end
			local function _(Direction)
				-- upvalues: Entry (copy)
				return if Direction.Magnitude > 0 then Direction.Unit:Dot(Entry) else -1
			end
			
			local Value = nil
			
			for _, value1 in List do
				if value1.key == Candidate:peek() then
					Value = value1
				end
			end
			if Value == nil then
				local v1 = 0
				local Key = nil
				
				for _, value2 in List do
					local NewTypesVector1 = TypesVector2.new(value2.x, value2.y)
					local DotProduct = if NewTypesVector1.Magnitude > 0 then NewTypesVector1.Unit:Dot(Entry) else -1
					
					if v1 < DotProduct then
						v1 = DotProduct
						Key = value2.key
					end
				end
				return Key, false
			else
				local NewTypesVector = TypesVector2.new(Value.x, Value.y)
				
				if ReadFunction(p6.showCenter) then
					local Negated = -NewTypesVector
					
					if (if Negated.Magnitude > 0 then Negated.Unit:Dot(Entry) else -1) >= 0.7071067811865476 then
						return nil, true
					end
				end
				table.sort(List, function(A, B): boolean
					return math.atan2(A.x, -A.y) < math.atan2(B.x, -B.y)
				end)
				local v2: number = assert(table.find(List, Value))
				local v3 = 0
				local Key = nil
				
				for _, value3 in { -1, 1 } do
					local Entry1 = List[(v2 - 1 + value3) % #List + 1]
					
					if Entry1 ~= Value then
						local NewTypesVectorDelta = TypesVector2.new(Entry1.x, Entry1.y) - NewTypesVector
						local DotProduct = if NewTypesVectorDelta.Magnitude > 0 then NewTypesVectorDelta.Unit:Dot(Entry) else -1
						
						if v3 < DotProduct then
							v3 = DotProduct
							Key = Entry1.key
						end
					end
				end
				return Key, false
			end
		end
		
		for i, value in {
			left = { "Left", "DPadLeft" },
			right = { "Right", "DPadRight" },
			up = { "Up", "DPadUp" },
			down = { "Down", "DPadDown" }
		} do
			p1.action(Panel, "Radial-" .. i, value, Opened, function()
				-- upvalues: Session (copy), Interacting (copy), Fallback (copy), Focus (copy), i (copy), Candidate (copy), Naming (copy), Gui (copy), Buttons (copy), p1 (copy), ringStep (copy), p6 (copy)
				Session.analog = false
				Interacting:set(false)
				
				if Fallback:peek() then
					local MoveResult = Focus.move(i)
					Candidate:set(MoveResult)
					Naming:set(true)
					
					if Gui and MoveResult and Buttons[MoveResult] then
						p1.selection.set(Buttons[MoveResult])
					end
					return
				else
					local RingStepResult, RingStepResult2 = ringStep(i)
					
					if RingStepResult2 then
						Candidate:set(nil)
						
						if Gui then
							p1.selection.set(p6.centerNode)
						end
						return
					elseif RingStepResult == nil then return end
					Candidate:set(RingStepResult)
					Naming:set(true)
					
					if Gui and Buttons[RingStepResult] then
						p1.selection.set(Buttons[RingStepResult])
					end
				end
			end, { priority = 2200, capture = true, group = "Radial" })
		end
	end
end