local ReducedFunction = require("./motion").reduced
local NavRadialGeometryModule = require("./nav_radial_geometry")
local AdaptiveModule = require("./adaptive")
local _ = require("./types")
local _ = require("./radial_types")
local _ = require("./navigation_types")
local _ = require("./control_types")
local _ = require("./radial_props")
local _ = require("../vendor/compose/core")

return function(p1, p2, Spec)
	-- upvalues: AdaptiveModule (copy), NavRadialGeometryModule (copy), ReducedFunction (copy)
	local Host = p1.Host
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local ReadFunction = p1.read
	local TypeNameOf = Runtime.host.typeNameOf or typeof
	local TypesEnum = p1.types.Enum
	local TypesUDim2 = p1.types.UDim2
	local UserInputService = p2.service("UserInputService")
	local PreferredInputResult = if UserInputService and UserInputService.GetPropertyChangedSignal then p1.observe.PreferredInput(UserInputService) else nil
	local TenFootResult = p1.tenFoot()
	
	local function painted(p3)
		-- upvalues: TenFootResult (copy), AdaptiveModule (upval)
		return if TenFootResult(p3) then 32 * AdaptiveModule.TEN_FOOT_SCALE else 32
	end
	
	local function _(p3, p4, List, Text)
		local Value = if p3 == nil then p4 else p3
		assert(table.find(List, Value), "RadialMenu invalid " .. Text)
		
		return Value
	end
	
	local Appearance = Spec.appearance
	local Wedges = if Appearance == nil then "wedges" else Appearance
	assert(table.find({ "wedges", "buttons" }, Wedges), "RadialMenu invalid appearance")
	
	local function glyphOnly(p3): boolean
		-- upvalues: Wedges (copy)
		return (p3.icon ~= nil or p3.compactLabel ~= nil and p3.compactLabel.icon ~= nil) and (p3.labelStyle == "icon" or (if p3.compactLabel == nil then Wedges == "buttons" else p3.compactLabel.prefer == true or Wedges == "buttons"))
	end
	
	local Follow = Spec.follow
	local Idle = if Follow == nil then "idle" else Follow
	assert(table.find({ "idle", "always", "fixed" }, Idle), "RadialMenu invalid follow")
	local GestureSelection = Spec.gestureSelection
	local Bounded = if GestureSelection == nil then "bounded" else GestureSelection
	assert(table.find({ "bounded", "direction" }, Bounded), "RadialMenu invalid gestureSelection")
	local ContentFit = Spec.contentFit or "radial"
	assert(table.find({ "both", "radial", "angular", "none" }, if ContentFit == nil then "radial" else ContentFit), "RadialMenu invalid contentFit")
	local Navigation = Spec.navigation
	assert(table.find({ "replace", "expand" }, if Navigation == nil then "replace" else Navigation), "RadialMenu invalid navigation")
	local Expansion = Spec.expansion
	assert(table.find({ "fan", "ring" }, if Expansion == nil then "fan" else Expansion), "RadialMenu invalid expansion")
	local Center = Spec.center
	assert(table.find({
		"back",
		"root",
		"close",
		"content",
		"empty"
	}, if Center == nil then "back" else Center), "RadialMenu invalid center")
	local Completion = Spec.completion
	assert(table.find({ "close", "back", "root", "stay" }, if Completion == nil then "close" else Completion), "RadialMenu invalid completion")
	local ButtonSurface = Spec.buttonSurface
	assert(table.find({ "native", "none" }, if ButtonSurface == nil then "native" else ButtonSurface), "RadialMenu invalid buttonSurface")
	local Scrim = Spec.scrim
	local None = if Scrim == nil then "none" else Scrim
	assert(table.find({ "dark", "light", "none" }, None), "RadialMenu invalid scrim")
	local _, ArcResult2 = NavRadialGeometryModule.arc(Spec.preset or "donut")
	local IsArcResultBelow = ArcResult2 < 360
	
	local function ringWidth(p3)
		-- upvalues: ReadFunction (copy), Spec (copy), p1 (copy)
		local ReadResult = ReadFunction(Spec.ringWidth, p3)
		
		if ReadResult == nil or type(ReadResult) == "number" then
			return ReadResult
		else
			assert(ReadResult == "narrow" or (ReadResult == "regular" or ReadResult == "wide"), "RadialMenu ringWidth must be a number of pixels or narrow, regular or wide")
			
			return p1.metric("controls.radial." .. ReadResult, p3)
		end
	end
	
	local ReducedResult = ReducedFunction(p1)
	
	local function reduced(p3)
		-- upvalues: Spec (copy), ReducedResult (copy)
		return Spec.transition == false or ReducedResult(p3)
	end
	
	local function validate(Key, p3, p4)
		-- upvalues: validate (copy), ReadFunction (copy)
		assert(type(Key) == "table" and not p4[Key], "RadialMenu requires an acyclic item tree")
		p4[Key] = true
		local t = {}
		
		for _, value in Key do
			assert(type(value.id) == "string" and (value.id ~= "$navigation" and not t[value.id]), "RadialMenu requires unique nonreserved item ids")
			t[value.id] = true
			local Completion = value.completion
			assert(table.find({ "stay", "back", "root", "close" }, if Completion == nil then "close" else Completion), "RadialMenu invalid item completion")
			local Navigation = value.navigation
			assert(table.find({ "replace", "expand" }, if Navigation == nil then "replace" else Navigation), "RadialMenu invalid item navigation")
			local Expansion = value.expansion
			assert(table.find({ "fan", "ring" }, if Expansion == nil then "fan" else Expansion), "RadialMenu invalid item expansion")
			assert(not (value.children and value.onSelect), "RadialMenu items use children or onSelect")
			
			if value.children then
				validate(ReadFunction(value.children, p3), p3, p4)
			end
		end
		p4[Key] = nil
	end
	
	Compose.watch(function(p5)
		-- upvalues: validate (copy), ReadFunction (copy), Spec (copy)
		validate(ReadFunction(Spec.items, p5), p5, {})
	end)
	local IsPresented = Spec.isPresented or Compose.cell(Spec.launcher == false)
	local CellResult = Compose.cell({})
	local CellResult1 = Compose.cell(nil)
	local Session = {
		analog = false,
		held = false,
		openedByLauncher = false,
		launcherGesture = false
	}
	local Shapes = {}
	
	local function jump(List)
		-- upvalues: Session (copy), CellResult (copy)
		Session.branchOrigin = nil
		local PeekResult = CellResult:peek()
		
		if #PeekResult == #List then
			local v1 = true
			
			for i, value in List do
				v1 = v1 and PeekResult[i] == value
			end
			if v1 then return end
		end
		CellResult:set(List)
	end
	
	local CellResult2 = Compose.cell(false)
	local CellResult3 = Compose.cell(false)
	local CellResult4 = Compose.cell(nil)
	local TimelineResult = Runtime.timeline({ duration = 0.4, autoplay = false })
	
	local function cancel()
		-- upvalues: Session (copy), CellResult2 (copy), CellResult3 (copy), CellResult4 (copy), TimelineResult (copy), CellResult1 (copy)
		if Session.inspectedUntil == 1e999 then
			Session.inspectedUntil = os.clock() + 0.3
		end
		Session.capture = nil
		Session.analog = false
		Session.launcherGesture = false
		CellResult2:set(false)
		CellResult3:set(false)
		CellResult4:set(nil)
		TimelineResult:pause()
		CellResult1:set(nil)
	end
	
	Compose.watch(function(Callback)
		-- upvalues: TimelineResult (copy), Session (copy), TypesEnum (copy), CellResult3 (copy)
		if Callback(TimelineResult.completed) and Session.capture and not Session.launcherGesture and Session.capture.UserInputType == TypesEnum.UserInputType.Touch then
			CellResult3:set(true)
			Session.inspectedUntil = 1e999
		end
	end)
	
	local function close()
		-- upvalues: IsPresented (copy), Session (copy), CellResult (copy), cancel (copy), Spec (copy)
		if not IsPresented:peek() then return end
		IsPresented:set(false)
		local t = {}
		Session.branchOrigin = nil
		local PeekResult = CellResult:peek()
		
		if #PeekResult == #t then
			local v2 = true
			
			for i, value in t do
				v2 = v2 and PeekResult[i] == value
			end
			if v2 then
				cancel()
				
				if Spec.onClose then
					Spec.onClose()
				end
				return
			end
		end
		CellResult:set(t)
	end
	
	local function back()
		-- upvalues: cancel (copy), CellResult (copy), close (copy), Shapes (copy), Session (copy), CellResult1 (copy)
		cancel()
		local Copy = table.clone(CellResult:peek())
		
		if #Copy == 0 then
			close()
			
			return
		end
		local Removed = table.remove(Copy)
		local Shape = Shapes[table.concat(CellResult:peek(), "/")]
		Session.branchOrigin = if Shape then { path = table.concat(Copy, "/"), shape = Shape } else nil
		
		local function change()
			-- upvalues: CellResult (upval), Copy (copy), CellResult1 (upval)
			CellResult:set(Copy)
			CellResult1:set(nil)
		end
		
		if Session.returnSelection then
			Session.returnSelection(change, table.concat(Copy, "/") .. "/" .. tostring(Removed))
			
			return
		else
			CellResult:set(Copy)
			CellResult1:set(nil)
		end
	end
	
	local function activate(Shape)
		-- upvalues: IsPresented (copy), ReadFunction (copy), Spec (copy), cancel (copy), back (copy), Session (copy), Shapes (copy), CellResult (copy), CellResult1 (copy), close (copy)
		if not Shape or not IsPresented:peek() then return end
		local Item = Shape.item
		
		if ReadFunction(Spec.enabled) == false or ReadFunction(Item.enabled) == false or ReadFunction(Item.hidden) == true then return end
		cancel()
		
		if Item.id == "$navigation" then
			back()
			
			return
		end
		if Item.children then
			local Copy = table.clone(Shape.path)
			table.insert(Copy, Item.id)
			local Joined = table.concat(Copy, "/")
			Session.branchOrigin = { path = Joined, shape = Shape }
			Shapes[Joined] = Shape
			
			local function change()
				-- upvalues: CellResult (upval), Copy (copy), CellResult1 (upval)
				CellResult:set(Copy)
				CellResult1:set(nil)
			end
			
			if Session.returnSelection then
				Session.returnSelection(change)
				
				return
			else
				CellResult:set(Copy)
				CellResult1:set(nil)
				
				return
			end
		else
			local Checked = Item.checked or Item.selected
			local Completion = Item.completion or ((if Item.dismiss == false then "stay" elseif Item.dismiss == true then "close" else Spec.completion) or (if Checked then "stay" else "close"))
			
			if Completion == "close" then
				close()
			elseif Completion == "root" then
				local t = {}
				Session.branchOrigin = nil
				local PeekResult = CellResult:peek()
				
				if #PeekResult == #t then
					local v3 = true
					
					for i, value in t do
						v3 = v3 and PeekResult[i] == value
					end
					if not v3 then
						CellResult:set(t)
					end
				end
			elseif Completion == "back" then
				back()
			end
			if Item.checked then
				local Inverted = not Item.checked:peek()
				Item.checked:set(Inverted)
				
				if Item.onChange then
					Item.onChange(Inverted)
					
					return
				end
			elseif not Item.selected then
				local OnSelectFunction: () -> () = Item.onSelect
				
				if OnSelectFunction then
					OnSelectFunction()
				end
			elseif Item.selected:peek() ~= Item.value then
				Item.selected:set(Item.value)
				
				if Item.onChange then
					Item.onChange(Item.value)
					
					return
				end
			end
		end
	end
	
	return {
		spec = Spec,
		session = Session,
		preferred = PreferredInputResult,
		painted = painted,
		appearance = Wedges,
		glyphOnly = glyphOnly,
		follow = Idle,
		gestureSelection = Bounded,
		contentFit = ContentFit,
		scrim = None,
		corner = IsArcResultBelow,
		ringWidth = ringWidth,
		reduced = reduced,
		opened = IsPresented,
		path = CellResult,
		candidate = CellResult1,
		interacting = CellResult2,
		naming = CellResult3,
		touchPoint = CellResult4,
		holding = TimelineResult,
		jump = jump,
		cancel = cancel,
		close = close,
		open = function()
			-- upvalues: ReadFunction (copy), Spec (copy), IsPresented (copy), TypeNameOf (copy)
			if ReadFunction(Spec.enabled) == false or IsPresented:peek() then return end
			local ReadResult = ReadFunction(Spec.anchor)
			
			if TypeNameOf(ReadResult) ~= "Instance" and type(ReadResult) == "table" and ReadResult.visible == false then return end
			IsPresented:set(true)
			
			if Spec.onOpen then
				Spec.onOpen()
			end
		end,
		back = back,
		nativeActivate = function(Shape, SuppressedInput, p5)
			-- upvalues: Session (copy), TypesEnum (copy), activate (copy)
			if not Shape then return end
			local P18 = p5 or "native"
			
			if Session.inspectedUntil and os.clock() < Session.inspectedUntil and SuppressedInput and SuppressedInput.UserInputType == TypesEnum.UserInputType.Touch then return end
			if not Session.suppressedUntil or os.clock() >= Session.suppressedUntil or Session.suppressedKey ~= Shape.key or Session.suppressedSource == P18 or SuppressedInput ~= nil and Session.suppressedInput ~= nil and SuppressedInput ~= Session.suppressedInput then
				local Key = Shape.key
				Session.suppressedInput = SuppressedInput
				Session.suppressedUntil = os.clock() + 0.3
				Session.suppressedKey = Key
				Session.suppressedSource = P18
				activate(Shape)
				
				return
			end
		end,
		pointing = function(): boolean
			-- upvalues: p2 (copy), CellResult4 (copy), PreferredInputResult (copy), TypesEnum (copy)
			local UserInputService = p2.service("UserInputService")
			
			return CellResult4:peek() == nil and (if PreferredInputResult == nil then UserInputService ~= nil and (type(UserInputService.GetLastInputType) == "function" and UserInputService:GetLastInputType() == TypesEnum.UserInputType.MouseMovement) else PreferredInputResult:peek() ~= TypesEnum.PreferredInput.Touch and (UserInputService ~= nil and (type(UserInputService.GetLastInputType) == "function" and UserInputService:GetLastInputType() == TypesEnum.UserInputType.MouseMovement)))
		end,
		isPointer = function(Input): boolean
			-- upvalues: TypesEnum (copy)
			return Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch
		end,
		beginPointer = function(Input, p5, Enabled)
			-- upvalues: Session (copy), IsPresented (copy), TypesEnum (copy), CellResult4 (copy), TimelineResult (copy), CellResult2 (copy)
			if not Session.capture and IsPresented:peek() and ((Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch) and Session.aimPointer) then
				Session.suppressedInput = nil
				Session.suppressedUntil = nil
				Session.inspectedUntil = nil
				
				if not Enabled and Session.aimPointer(Input.Position, false, true) == false then return end
				Session.capture = Input
				Session.pressedAt = if p5 then Input.Position else nil
				Session.heldAt = Input.Position
				Session.launcherGesture = Enabled == true
				
				if Input.UserInputType == TypesEnum.UserInputType.Touch then
					CellResult4:set(Input.Position)
					TimelineResult:restart()
				end
				if Session.freezeCenter then
					Session.freezeCenter()
				end
				CellResult2:set(true)
			end
		end,
		skin = function(p5, p6, p7)
			-- upvalues: p1 (copy), p2 (copy), Host (copy), TypesUDim2 (copy), TypesEnum (copy), ReadFunction (copy)
			if p6 then
				local GuiStateResult = p1.observe.GuiState(p5)
				p2.attach(p5, {
					Host.ImageLabel("RadialSkin")({
						BackgroundTransparency = 1,
						ZIndex = 0,
						Size = TypesUDim2.fromScale(1, 1),
						Image = function(Callback)
							-- upvalues: GuiStateResult (copy), TypesEnum (upval), p6 (copy), p7 (copy), ReadFunction (upval)
							local CallbackResult = Callback(GuiStateResult)
							
							return (if CallbackResult == TypesEnum.GuiState.Press then p6.pressed elseif CallbackResult == TypesEnum.GuiState.Hover then p6.hover elseif p7 and ReadFunction(p7, Callback) then p6.selected else nil) or (p6.default or "")
						end
					})
				})
				
				return
			end
		end
	}
end