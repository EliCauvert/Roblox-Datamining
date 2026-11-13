local _ = require("./types")
local _ = require("./environment_types")
local _ = require("./drag_types")
local GestureServiceModule = require("./gesture_service")
local ActivationModule = require("./activation")

return function(p1, Source, p2, p3)
	-- upvalues: GestureServiceModule (copy), ActivationModule (copy)
	local FacetWorldDraggableNeedsWorldPlane = assert(p2.world, "Facet world draggable needs world.plane")
	assert(FacetWorldDraggableNeedsWorldPlane.focusTarget, "Facet world draggable needs world.focusTarget")
	assert(FacetWorldDraggableNeedsWorldPlane.lift == nil or FacetWorldDraggableNeedsWorldPlane.lift >= 0 and FacetWorldDraggableNeedsWorldPlane.lift < 1e999, "Facet world lift must be finite and nonnegative")
	
	local function _(Part)
		assert(Part.Anchored, "Facet world draggable parts must be anchored")
	end
	
	if Source:IsA("BasePart") then
		assert(Source.Anchored, "Facet world draggable parts must be anchored")
	end
	for _, Part in Source:GetDescendants() do
		if Part:IsA("BasePart") then
			assert(Part.Anchored, "Facet world draggable parts must be anchored")
		end
	end
	local Compose = p1.Compose
	local TypesEnum = p1.types.Enum
	local UserInputService = p1.config.userInputService
	local GuiService = p1.config.guiService
	local GestureServiceModuleResult = GestureServiceModule(p1)
	local Input = nil
	local Flag = false
	
	local _ = function(): boolean
		-- upvalues: p3 (copy), Source (copy)
		local PeekResult = p3.state:peek()
		
		return PeekResult ~= nil and PeekResult.source == Source
	end
	
	local _ = function(): boolean
		-- upvalues: p3 (copy), Source (copy)
		local PeekResult = p3.state:peek()
		
		return PeekResult ~= nil and (PeekResult.source == Source and PeekResult.mode == "pointer")
	end
	
	Compose.watch(function(Callback)
		-- upvalues: p3 (copy), Source (copy), GestureServiceModuleResult (copy)
		local CallbackResult = Callback(p3.state)
		
		if CallbackResult == nil or CallbackResult.source ~= Source then
			GestureServiceModuleResult.cancelOwner(Source)
		end
	end)
	
	local _ = function(p4)
		-- upvalues: p2 (copy), p1 (copy)
		return if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, p4) and (p2.valid == nil or p2.valid())
	end
	
	local config = {
		payload = p2.payload,
		world = FacetWorldDraggableNeedsWorldPlane,
		enabled = p2.enabled,
		statusLabels = p2.statusLabels,
		operations = p2.operations,
		onStart = p2.onStart,
		valid = function()
			-- upvalues: Source (copy), p2 (copy), p1 (copy)
			return Source.Parent ~= nil and (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid()))
		end,
		onEnd = function(p4, p5)
			-- upvalues: GestureServiceModuleResult (copy), Source (copy), Input (ref), p2 (copy)
			GestureServiceModuleResult.cancelOwner(Source)
			Input = nil
			
			if p2.onEnd then
				p2.onEnd(p4, p5)
			end
		end
	}
	p3.own(Source)
	
	local _ = function(p4, p5)
		-- upvalues: p3 (copy), p2 (copy), p1 (copy), Source (copy), config (copy)
		if not p3.state:peek() and (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) then
			p3.begin(Source, config, p4, p5, false)
			
			return
		end
	end
	
	local function at(Input)
		-- upvalues: p1 (copy)
		return p1.types.Vector2.new(Input.Position.X, Input.Position.Y)
	end
	
	local function pointerHit(Input)
		-- upvalues: p1 (copy), Source (copy)
		local Players = p1.config.services.Players
		local LocalPlayer = Players and Players.LocalPlayer
		local PlayerGui = LocalPlayer and LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
		local NewResult = p1.types.Vector2.new(Input.Position.X, Input.Position.Y)
		
		if PlayerGui then
			for _, Object in PlayerGui:GetGuiObjectsAtPosition(NewResult.X, NewResult.Y) do
				local BackgroundTransparencyStyled: number = Object:GetStyled("BackgroundTransparency")
				
				if Object:GetAttribute("FacetDropPassThrough") ~= true and (Object.Active or Object:IsA("GuiButton") or Object:IsA("TextBox") or type(BackgroundTransparencyStyled) == "number" and BackgroundTransparencyStyled < 1) then
					return false
				end
			end
		end
		local Workspace = p1.config.services.Workspace
		local CurrentCamera = Workspace and Workspace.CurrentCamera
		
		if CurrentCamera then
			local v1 = CurrentCamera:ScreenPointToRay(NewResult.X, NewResult.Y)
			local RaycastResult = assert(Workspace):Raycast(v1.Origin, v1.Direction * 10000)
			
			return RaycastResult ~= nil and (rawequal(RaycastResult.Instance, Source) or RaycastResult.Instance:IsDescendantOf(Source))
		else
			return false
		end
	end
	
	local _ = function(): boolean
		-- upvalues: p1 (copy)
		local Players = p1.config.services.Players
		local LocalPlayer = Players and Players.LocalPlayer
		
		return LocalPlayer ~= nil and LocalPlayer.Character ~= nil
	end
	
	local function claim(Input1): boolean
		-- upvalues: pointerHit (copy), p1 (copy), GestureServiceModuleResult (copy), Source (copy), Input (ref), ActivationModule (upval)
		if not pointerHit(Input1) then
			return false
		elseif GestureServiceModuleResult.begin(Input1, Source, p1.types.Vector2.new(Input1.Position.X, Input1.Position.Y), { pickup = "immediate" }) and GestureServiceModuleResult.claim(Input1, Source, "drag") then
			Input = Input1
			ActivationModule.consume(Input1)
			
			return true
		else
			return false
		end
	end
	
	p1.Host.DragDetector({
		Name = "FacetWorldDragDetector",
		RunLocally = true,
		DragStyle = TypesEnum.DragDetectorDragStyle.TranslatePlane,
		ResponseStyle = TypesEnum.DragDetectorResponseStyle.Custom,
		PermissionPolicy = TypesEnum.DragDetectorPermissionPolicy.Everybody,
		Axis = FacetWorldDraggableNeedsWorldPlane.plane.UpVector,
		MaxActivationDistance = FacetWorldDraggableNeedsWorldPlane.maxActivationDistance,
		Enabled = function(Callback): boolean
			-- upvalues: p3 (copy), p2 (copy), p1 (copy), Source (copy)
			local CallbackResult = Callback(p3.state)
			
			return (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, Callback) and (p2.valid == nil or p2.valid())) and (CallbackResult == nil or CallbackResult.source == Source and CallbackResult.mode == "pointer" and not CallbackResult.pending)
		end,
		DragStart = function()
			-- upvalues: UserInputService (copy), p3 (copy), Flag (ref), Input (ref), TypesEnum (copy), claim (copy), p2 (copy), p1 (copy), Source (copy), config (copy)
			if not UserInputService or p3.state:peek() then return end
			Flag = true
			
			if not Input then
				for _, Input1 in UserInputService:GetMouseButtonsPressed() do
					if Input1.UserInputType == TypesEnum.UserInputType.MouseButton1 and claim(Input1) then break end
				end
			end
			if Input and claim(Input) then
				local Input2 = Input
				
				if not p3.state:peek() then
					if not (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) then return end
					p3.begin(Source, config, "pointer", Input2, false)
				end
			end
		end,
		DragEnd = function()
			-- upvalues: Flag (ref), p3 (copy), Source (copy), Input (ref), TypesEnum (copy), GestureServiceModuleResult (copy)
			Flag = false
			local PeekResult = p3.state:peek()
			
			if PeekResult ~= nil and PeekResult.source == Source then
				if Input and Input.UserInputState == TypesEnum.UserInputState.Cancel then
					p3.finish(false, "Cancelled")
				else
					p3.commit(nil)
				end
			end
			GestureServiceModuleResult.cancelOwner(Source)
			Input = nil
		end
	}).Parent = Source
	local HitArea = FacetWorldDraggableNeedsWorldPlane.hitArea
	local Input1 = nil
	
	if HitArea then
		p1.runtime.connect(HitArea, "InputBegan", function(Input)
			-- upvalues: TypesEnum (copy), Input1 (ref)
			if Input.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input.UserInputType == TypesEnum.UserInputType.Touch then
				Input1 = Input
			end
		end)
	end
	if UserInputService then
		p1.runtime.connect(UserInputService, "InputBegan", function(Input2, p4)
			-- upvalues: Input1 (ref), p3 (copy), p2 (copy), p1 (copy), GestureServiceModuleResult (copy), Source (copy), Input (ref), TypesEnum (copy), Flag (ref), pointerHit (copy), claim (copy), config (copy)
			if Input1 == nil or Input2 ~= Input1 then
				local PeekResult = p3.state:peek()
				
				if PeekResult and PeekResult.source == Source and PeekResult.mode == "pointer" and Input2.UserInputType == TypesEnum.UserInputType.Touch and Input ~= nil and Input.UserInputType ~= TypesEnum.UserInputType.Touch then
					Input = Input2
					
					return
				end
				if (not p4 or Flag) and ((if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) and p3.state:peek() == nil and (Input2.UserInputType == TypesEnum.UserInputType.MouseButton1 or Input2.UserInputType == TypesEnum.UserInputType.Touch)) and pointerHit(Input2) then
					Input = Input2
					
					if not Flag then
						local Players = p1.config.services.Players
						local LocalPlayer = Players and Players.LocalPlayer
						
						if LocalPlayer == nil or LocalPlayer.Character == nil then
							if claim(Input2) and not p3.state:peek() then
								if not (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) then return end
								p3.begin(Source, config, "pointer", Input2, false)
							end
						end
					end
				end
				return
			else
				Input1 = nil
				
				if p3.state:peek() == nil and ((if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) and GestureServiceModuleResult.begin(Input2, Source, p1.types.Vector2.new(Input2.Position.X, Input2.Position.Y), { pickup = "immediate" })) then
					Input = Input2
				end
			end
		end)
		p1.runtime.connect(UserInputService, "InputChanged", function(Input1)
			-- upvalues: Input (ref), TypesEnum (copy), HitArea (copy), p3 (copy), Source (copy), p2 (copy), p1 (copy), GestureServiceModuleResult (copy), at (copy), ActivationModule (upval), config (copy)
			if not Input or Input1 ~= Input and (Input.UserInputType ~= TypesEnum.UserInputType.MouseButton1 or Input1.UserInputType ~= TypesEnum.UserInputType.MouseMovement) then return end
			if HitArea then
				local PeekResult = p3.state:peek()
				
				if (PeekResult == nil or PeekResult.source ~= Source) and p3.state:peek() == nil and ((if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) and GestureServiceModuleResult.move(Input, at(Input1)) == "drag") then
					ActivationModule.consume(Input)
					local Input2 = Input
					
					if not p3.state:peek() and (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) then
						p3.begin(Source, config, "pointer", Input2, false)
					end
				end
			end
			local PeekResult = p3.state:peek()
			
			if PeekResult ~= nil and (PeekResult.source == Source and PeekResult.mode == "pointer") then
				p3.update(at(Input1))
			end
		end)
		p1.runtime.connect(UserInputService, "InputEnded", function(Input2)
			-- upvalues: Input1 (ref), Input (ref), p3 (copy), Source (copy), TypesEnum (copy), at (copy), GestureServiceModuleResult (copy), Flag (ref)
			if Input2 == Input1 then
				Input1 = nil
			end
			if Input2 ~= Input then return end
			local PeekResult = p3.state:peek()
			
			if PeekResult ~= nil and (PeekResult.source == Source and PeekResult.mode == "pointer") then
				if Input2.UserInputState == TypesEnum.UserInputState.Cancel then
					p3.finish(false, "Cancelled")
				else
					if Input2.UserInputType == TypesEnum.UserInputType.Touch then
						p3.update(at(Input2))
					end
					p3.commit(nil)
				end
			end
			GestureServiceModuleResult.cancelOwner(Source)
			Input = nil
			Flag = false
		end)
		p1.runtime.connect(UserInputService, "WindowFocusReleased", function()
			-- upvalues: GestureServiceModuleResult (copy), Source (copy), Input (ref), Flag (ref), p3 (copy)
			GestureServiceModuleResult.cancelOwner(Source)
			Input = nil
			Flag = false
			local PeekResult = p3.state:peek()
			
			if PeekResult ~= nil and PeekResult.source == Source then
				p3.finish(false, "Window lost focus")
			end
		end)
	end
	local FocusTarget = FacetWorldDraggableNeedsWorldPlane.focusTarget
	local ObserveResult = if GuiService then p1.selection.observe() else nil
	
	if FocusTarget then
		Compose.cleanup(ActivationModule.intercept(FocusTarget, function(): boolean
			-- upvalues: p3 (copy), p2 (copy), p1 (copy), Source (copy), config (copy)
			if not p3.state:peek() and (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) then
				p3.begin(Source, config, "armed", nil, false)
			end
			local PeekResult = p3.state:peek()
			
			return PeekResult ~= nil and PeekResult.source == Source
		end))
		p1.action(FocusTarget, "WorldDragPickUp", { TypesEnum.KeyCode.Return, TypesEnum.KeyCode.ButtonA }, function(Callback): boolean
			-- upvalues: p3 (copy), p2 (copy), p1 (copy), ObserveResult (copy), FocusTarget (copy)
			return Callback(p3.state) == nil and (if p2.enabled == nil then (p2.valid == nil or p2.valid()) and (ObserveResult ~= nil and Callback(ObserveResult) == FocusTarget) else p1.read(p2.enabled, Callback) and (p2.valid == nil or p2.valid()) and (ObserveResult ~= nil and Callback(ObserveResult) == FocusTarget))
		end, function()
			-- upvalues: p3 (copy), p2 (copy), p1 (copy), Source (copy), config (copy)
			if not p3.state:peek() and (if p2.enabled == nil then p2.valid == nil or p2.valid() else p1.read(p2.enabled, nil) and (p2.valid == nil or p2.valid())) then
				p3.begin(Source, config, "armed", nil, false)
			end
			local PeekResult = p3.state:peek()
			
			if PeekResult == nil or PeekResult.source == Source then
			end
		end, { priority = 250 })
	end
	if ObserveResult then
		Compose.watch(function(Callback)
			-- upvalues: ObserveResult (copy), p3 (copy), Source (copy)
			local CallbackResult = Callback(ObserveResult)
			local PeekResult = p3.state:peek()
			
			if PeekResult and PeekResult.source == Source and PeekResult.mode == "armed" then
				p3.hover(p3.targetOf(CallbackResult), nil)
			end
		end)
	end
	p1.action(FocusTarget or Source, "WorldDragCancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, function(Callback): boolean
		-- upvalues: p3 (copy), Source (copy)
		local CallbackResult = Callback(p3.state)
		
		return CallbackResult ~= nil and CallbackResult.source == Source
	end, function()
		-- upvalues: p3 (copy)
		p3.finish(false, "Cancelled")
	end, { priority = 250 })
	Compose.cleanup(function()
		-- upvalues: GestureServiceModuleResult (copy), Source (copy), p3 (copy)
		GestureServiceModuleResult.cancelOwner(Source)
		local PeekResult = p3.state:peek()
		
		if PeekResult ~= nil and PeekResult.source == Source then
			p3.finish(false, "The source was removed")
		end
	end)
end