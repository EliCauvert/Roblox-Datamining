local _ = require("./input_types")
local _ = require("./types")
local _ = require("../vendor/compose/core")

return function(p1, p2)
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local ReadFunction = p1.read
	local TypesEnum = p1.types.Enum
	local AttributesFunction = p2.attributes
	local EnabledFunction = p2.enabled
	local StopEnabledFunction = p2.stopEnabled
	local RepeatHeldFunction = p2.repeatHeld
	
	return function(Object, p3, Callback1, Callback, p4, p5, p6)
		-- upvalues: Runtime (copy), AttributesFunction (copy), StopEnabledFunction (copy), p1 (copy), TypesEnum (copy), Compose (copy), ReadFunction (copy), EnabledFunction (copy), ReadFunction (copy), RepeatHeldFunction (copy), p2 (copy)
		local P6 = p6 or {}
		Object:AddTag("facet-adjustable")
		Runtime.connect(Object, "SelectionGained", function() end)
		AttributesFunction(Object, {
			disabled = function(p7): boolean
				-- upvalues: StopEnabledFunction (upval), p3 (copy)
				return not StopEnabledFunction(p3, p7)
			end
		})
		
		if p4 ~= nil and p5 ~= nil then
			Object:SetAttribute("axis", if P6.vertical then "vertical" else "horizontal")
		end
		local Flag = false
		
		local function arrowHeld(): boolean
			-- upvalues: p1 (upval), TypesEnum (upval)
			local UserInputService = p1.config.services.UserInputService
			
			if UserInputService == nil then
				return false
			end
			for _, value in {
				TypesEnum.KeyCode.Up,
				TypesEnum.KeyCode.Down,
				TypesEnum.KeyCode.Left,
				TypesEnum.KeyCode.Right
			} do
				if UserInputService:IsKeyDown(value) then
					return true
				end
			end
			for _, value1 in p1.navigationGamepads() do
				for _, value2 in {
					TypesEnum.KeyCode.DPadUp,
					TypesEnum.KeyCode.DPadDown,
					TypesEnum.KeyCode.DPadLeft,
					TypesEnum.KeyCode.DPadRight
				} do
					if UserInputService:IsGamepadButtonDown(value1, value2) then
						return true
					end
				end
			end
			return false
		end
		
		local function stickHeld(): boolean
			-- upvalues: p1 (upval), TypesEnum (upval)
			local UserInputService = p1.config.services.UserInputService
			
			if UserInputService == nil then
				return false
			end
			for _, value in p1.navigationGamepads() do
				for _, Input in UserInputService:GetGamepadState(value) do
					if Input.KeyCode == TypesEnum.KeyCode.Thumbstick1 and Input.Position.Magnitude >= 0.5 then
						return true
					end
				end
			end
			return false
		end
		
		local GuiService = p1.config.services.GuiService
		local GetResult = GuiService and p1.selection.get()
		local CellResult = Compose.cell(GetResult ~= nil and GetResult == Object)
		
		if GuiService then
			local ObserveResult = p1.selection.observe()
			Compose.watch(function(Callback1)
				-- upvalues: ObserveResult (copy), Object (copy), CellResult (copy), Callback (copy), P6 (copy), Flag (ref), arrowHeld (copy)
				local CallbackResult = Callback1(ObserveResult)
				local IsCallbackResultMatch: boolean = CallbackResult ~= nil and CallbackResult == Object
				
				if CellResult:peek() and not IsCallbackResultMatch and Callback then
					Callback()
				end
				if IsCallbackResultMatch and not CellResult:peek() and P6.guard then
					Flag = arrowHeld()
				end
				CellResult:set(IsCallbackResultMatch)
			end)
		else
			Runtime.connect(Object, "SelectionGained", function()
				-- upvalues: CellResult (copy)
				CellResult:set(true)
			end)
			Runtime.connect(Object, "SelectionLost", function()
				-- upvalues: CellResult (copy), Callback (copy)
				CellResult:set(false)
				
				if Callback then
					Callback()
				end
			end)
		end
		local function v14(p7)
			-- upvalues: ReadFunction (upval), CellResult (copy), EnabledFunction (upval), p3 (copy)
			return ReadFunction(CellResult, p7) and EnabledFunction(p3, p7)
		end
		
		Runtime.mountFragment(function()
			-- upvalues: Compose (upval), v14 (copy), ReadFunction (upval), CellResult (copy), EnabledFunction (upval), p3 (copy), p1 (upval), Object (copy), P6 (copy), p4 (copy), p5 (copy), ReadFunction (upval), Callback1 (copy), Runtime (upval), RepeatHeldFunction (upval), p2 (upval), Flag (ref), TypesEnum (upval), stickHeld (copy), Callback (copy)
			return {
				Compose.show(v14, function()
					-- upvalues: Compose (upval), ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), p1 (upval), Object (upval), P6 (upval), p4 (upval), p5 (upval), ReadFunction (upval), Callback1 (upval), Runtime (upval), RepeatHeldFunction (upval), p2 (upval), v14 (upval), Flag (upval), TypesEnum (upval), stickHeld (upval), Callback (upval)
					local Humanoid = nil
					local Callback2: (() -> ())? = nil
					Compose.cleanup(function()
						-- upvalues: Humanoid (ref), Callback2 (ref)
						Humanoid = nil
						
						if Callback2 then
							Callback2()
							Callback2 = nil
						end
					end)
					Compose.watch(function(p7)
						-- upvalues: ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), p1 (upval), Object (upval), Humanoid (ref), Callback2 (ref)
						if not ReadFunction(CellResult, p7) or not EnabledFunction(p3, p7) or not p1.available(Object, p7) then
							Humanoid = nil
							
							if Callback2 then
								Callback2()
								Callback2 = nil
							end
						end
					end)
					
					local function peekUse(p7)
						-- upvalues: p1 (upval)
						return p1.readSource(p7)
					end
					
					local function _(p7)
						-- upvalues: peekUse (copy), ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), P6 (upval), p4 (upval), p5 (upval), ReadFunction (upval)
						return function()
							-- upvalues: peekUse (upval), ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), P6 (upval), p7 (copy), p4 (upval), p5 (upval), ReadFunction (upval)
							if not ReadFunction(CellResult, peekUse) or not EnabledFunction(p3, peekUse) then
								return false
							elseif P6.arrows then
								return P6.arrows(peekUse, p7)
							elseif p4 == nil or p5 == nil then
								return true
							else
								local v1 = ReadFunction(assert(p3.value))
								
								return if p7 < 0 then p4 < v1 else v1 < p5
							end
						end
					end
					
					local function start(Humanoid1, p7, Callback)
						-- upvalues: Humanoid (ref), Callback2 (ref), peekUse (copy), ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), P6 (upval), p4 (upval), p5 (upval), ReadFunction (upval), Callback1 (upval), Runtime (upval), RepeatHeldFunction (upval), p2 (upval), p1 (upval), Object (upval)
						Humanoid = nil
						
						if Callback2 then
							Callback2()
							Callback2 = nil
						end
						local function v31()
							-- upvalues: peekUse (upval), ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), P6 (upval), p7 (copy), p4 (upval), p5 (upval), ReadFunction (upval)
							if not ReadFunction(CellResult, peekUse) or not EnabledFunction(p3, peekUse) then
								return false
							elseif P6.arrows then
								return P6.arrows(peekUse, p7)
							elseif p4 == nil or p5 == nil then
								return true
							else
								local v1 = ReadFunction(assert(p3.value))
								
								return if p7 < 0 then p4 < v1 else v1 < p5
							end
						end
						
						if not v31() then return end
						Callback1(p7)
						Humanoid = Humanoid1
						
						if Runtime.host.frames and not P6.once then
							Callback2 = RepeatHeldFunction(Runtime.host.frames, p3.repeatDelay or p2.repeatDelay, p3.repeatInterval or p2.repeatInterval, function(): boolean
								-- upvalues: Humanoid (upval), Humanoid1 (copy), v31 (copy), p1 (upval), Object (upval), Callback (copy), Callback2 (upval)
								if Humanoid == Humanoid1 and v31() and p1.available(Object) and Callback() then
									return true
								end
								Humanoid = nil
								
								if Callback2 then
									Callback2()
									Callback2 = nil
								end
								return false
							end, function()
								-- upvalues: Callback1 (upval), p7 (copy)
								Callback1(p7)
							end)
						end
					end
					
					local _ = function(): boolean
						-- upvalues: Object (upval)
						local Parent = Object.Parent
						while Parent do
							if Parent:GetAttribute("FacetCollectionRow") == true then
								return true
							end
							Parent = Parent.Parent
						end
						return false
					end
					
					local _ = function(p7)
						-- upvalues: ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), Object (upval), P6 (upval), p4 (upval), p5 (upval), ReadFunction (upval)
						return function(p8)
							-- upvalues: ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), Object (upval), P6 (upval), p7 (copy), p4 (upval), p5 (upval), ReadFunction (upval)
							if ReadFunction(CellResult, p8) and EnabledFunction(p3, p8) then
								local Parent = Object.Parent
								local Flag = nil
								while Parent do
									if Parent:GetAttribute("FacetCollectionRow") ~= true then
										Parent = Parent.Parent
										continue
									end
									Flag = true
									if not Flag then
										if P6.arrows then
											return P6.arrows(p8, p7)
										elseif p4 == nil or p5 == nil then
											return true
										else
											local v1 = ReadFunction(assert(p3.value), p8)
											
											return if p7 < 0 then p4 < v1 else v1 < p5
										end
									end
								end
								Flag = false
							end
							return false
						end
					end
					
					local function bind(DecreaseArrow, p8, p9, p10)
						-- upvalues: p1 (upval), Object (upval), ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), P6 (upval), p4 (upval), p5 (upval), ReadFunction (upval), v14 (upval), Flag (upval), start (copy), Humanoid (ref), Callback2 (ref)
						local Humanoid1 = nil
						Humanoid1 = p1.action(Object, DecreaseArrow, p8, if p10 then function(p11)
							-- upvalues: ReadFunction (upval), CellResult (upval), EnabledFunction (upval), p3 (upval), Object (upval), P6 (upval), p9 (copy), p4 (upval), p5 (upval), ReadFunction (upval)
							if ReadFunction(CellResult, p11) and EnabledFunction(p3, p11) then
								local Parent = Object.Parent
								local Flag = nil
								while Parent do
									if Parent:GetAttribute("FacetCollectionRow") ~= true then
										Parent = Parent.Parent
										continue
									end
									Flag = true
									if not Flag then
										if P6.arrows then
											return P6.arrows(p11, p9)
										elseif p4 == nil or p5 == nil then
											return true
										else
											local v1 = ReadFunction(assert(p3.value), p11)
											
											return if p9 < 0 then p4 < v1 else v1 < p5
										end
									end
								end
								Flag = false
							end
							return false
						end else v14, function()
							-- upvalues: p10 (copy), Flag (upval), Humanoid1 (ref), start (upval), p9 (copy)
							if not p10 or not Flag then
								local IsState = Humanoid1:GetState() == true
								start(Humanoid1, p9, function(): boolean
									-- upvalues: IsState (copy), Humanoid1 (upval)
									return not IsState or Humanoid1:GetState() == true
								end)
								
								return
							end
						end, {
							priority = 250,
							capture = true,
							onReleased = function()
								-- upvalues: p10 (copy), Flag (upval), Humanoid (upval), Humanoid1 (ref), Callback2 (upval)
								if p10 then
									Flag = false
								end
								if Humanoid == Humanoid1 then
									Humanoid = nil
									
									if Callback2 then
										Callback2()
										Callback2 = nil
									end
								end
							end
						})
					end
					
					bind("Decrease", { TypesEnum.KeyCode.Comma, TypesEnum.KeyCode.ButtonL1 }, -1)
					bind("Increase", { TypesEnum.KeyCode.Period, TypesEnum.KeyCode.ButtonR1 }, 1)
					
					if p4 ~= nil and p5 ~= nil then
						for _, value in { -1, 1 } do
							bind(if value < 0 then "DecreaseArrow" else "IncreaseArrow", if P6.vertical then if value < 0 then { TypesEnum.KeyCode.Down, TypesEnum.KeyCode.DPadDown } else { TypesEnum.KeyCode.Up, TypesEnum.KeyCode.DPadUp } elseif value < 0 then { TypesEnum.KeyCode.Left, TypesEnum.KeyCode.DPadLeft } else { TypesEnum.KeyCode.Right, TypesEnum.KeyCode.DPadRight }, value, true)
						end
						local v1 = 0
						local StickHeldResult = stickHeld()
						local UserInputService = p1.config.services.UserInputService
						
						local function lean(Input, p11)
							-- upvalues: TypesEnum (upval), p1 (upval), P6 (upval), StickHeldResult (ref), v1 (ref), Humanoid (ref), Callback2 (ref), Object (upval), start (copy)
							if Input.KeyCode ~= TypesEnum.KeyCode.Thumbstick1 or not table.find(p1.navigationGamepads(), Input.UserInputType) then return end
							local X = if p11 then 0 else Input.Position.X
							local Y = if p11 then 0 else Input.Position.Y
							local Value = if P6.vertical then Y else X
							local Magnitude = math.abs(if P6.vertical then X else Y)
							local Magnitude1 = math.abs(Value)
							local v2: number = if Value > 0 then 1 else -1
							
							if StickHeldResult then
								StickHeldResult = Magnitude1 >= 0.35 and Magnitude <= Magnitude1
								
								return
							end
							local v3: number = if v1 == v2 and Magnitude1 >= 0.35 and Magnitude <= Magnitude1 then v2 elseif Magnitude1 >= 0.5 and Magnitude * 1.2 < Magnitude1 then v2 else 0
							
							if v3 == v1 then return end
							v1 = v3
							
							if v3 == 0 then
								if Humanoid == "stick" then
									Humanoid = nil
									
									if Callback2 then
										Callback2()
										Callback2 = nil
										
										return
									end
								end
							elseif p1.available(Object) then
								start("stick", v3, function(): boolean
									-- upvalues: v1 (upval), v3 (copy)
									return v1 == v3
								end)
							end
						end
						
						if UserInputService then
							Runtime.connect(UserInputService, "InputChanged", function(Input)
								-- upvalues: lean (copy)
								lean(Input, false)
							end)
							Runtime.connect(UserInputService, "InputEnded", function(Input)
								-- upvalues: lean (copy)
								lean(Input, true)
							end)
						end
					end
					if P6.extra then
						P6.extra(v14)
					end
					if Callback then
						p1.action(Object, "Cancel", { TypesEnum.KeyCode.Escape, TypesEnum.KeyCode.ButtonB }, v14, Callback, { priority = 100 })
					end
					return Compose.fragment(function()
						return {}
					end)
				end)
			}
		end, Object)
	end
end