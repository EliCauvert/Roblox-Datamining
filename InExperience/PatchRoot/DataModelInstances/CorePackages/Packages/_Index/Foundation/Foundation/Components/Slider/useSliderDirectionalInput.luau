local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ServicesModule = require(Foundation.Utility.Wrappers.Services)
local SliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local SliderStepSizeModule = require(script.Parent.SliderStepSize)
local FlagsModule = require(Foundation.Utility.Flags)
local CalculateAdjacentStepValueModule = require(script.Parent.calculateAdjacentStepValue)
local CalculateDirectionalStepValueModule = require(script.Parent.calculateDirectionalStepValue)
local ConstantsModule = require(script.Parent.constants)

local function getStepForKeyCode(Value, p1)
	-- upvalues: FlagsModule (copy), ConstantsModule (copy), SliderStepSizeModule (copy)
	if not FlagsModule.FoundationSliderCapture then
		if table.find(ConstantsModule.coarseIncrement, Value) then
			return { sign = 1, size = SliderStepSizeModule.Page }
		elseif table.find(ConstantsModule.coarseDecrement, Value) then
			return { sign = -1, size = SliderStepSizeModule.Page }
		end
	end
	local Vertical: string = if p1 then "vertical" else "horizontal"
	
	return if table.find(ConstantsModule.stepIncrement[Vertical], Value) then { sign = 1, size = SliderStepSizeModule.Step } elseif table.find(ConstantsModule.stepDecrement[Vertical], Value) then { sign = -1, size = SliderStepSizeModule.Step } else nil
end

local function _(Value): boolean
	-- upvalues: ConstantsModule (copy)
	return table.find(ConstantsModule.exit, Value) ~= nil
end

local _ = function(p1: number, p2: number): number
	-- upvalues: FlagsModule (copy)
	return if FlagsModule.FoundationSliderCapture and (p2 == nil or p2 <= 0) then if p1 >= 15 then 0.03 elseif p1 >= 5 then 0.06 else 0.1 else 0.1
end

return function(p1, Step, Range, p2, Handlers)
	-- upvalues: ReactModule (copy), SliderStepSizeModule (copy), SliderStepDirectionModule (copy), FlagsModule (copy), CalculateAdjacentStepValueModule (copy), CalculateDirectionalStepValueModule (copy), ConstantsModule (copy), getStepForKeyCode (copy), ServicesModule (copy)
	local UseRefResult = ReactModule.useRef({ step = Step, range = Range, handlers = Handlers })
	UseRefResult.current = { step = Step, range = Range, handlers = Handlers }
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SliderStepSizeModule (upval), UseRefResult (copy), SliderStepDirectionModule (upval), FlagsModule (upval), CalculateAdjacentStepValueModule (upval), CalculateDirectionalStepValueModule (upval), ConstantsModule (upval), getStepForKeyCode (upval), p2 (copy), ServicesModule (upval)
		if not p1 then return end
		local Input = nil
		local v1 = 0
		local Step = SliderStepSizeModule.Step
		local SpawnedThread = nil
		local v2 = 0
		local v3 = 0
		
		local function performStep(p3: number, Step)
			-- upvalues: UseRefResult (upval), SliderStepDirectionModule (upval), FlagsModule (upval), CalculateAdjacentStepValueModule (upval), CalculateDirectionalStepValueModule (upval)
			local Current = UseRefResult.current
			local Increment = if p3 > 0 then SliderStepDirectionModule.Increment else SliderStepDirectionModule.Decrement
			Current.handlers.onStep(if FlagsModule.FoundationSliderCapture then CalculateAdjacentStepValueModule(Current.handlers.getValue(), Increment, Current.range, Current.step, Step) else CalculateDirectionalStepValueModule(Current.handlers.getValue(), Increment, Current.range, Current.step, Step))
		end
		
		local function _(p3)
			-- upvalues: Input (ref), v1 (ref), SpawnedThread (ref)
			if p3 ~= nil and p3 ~= Input then return end
			Input = nil
			v1 = 0
			
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
		end
		
		local function startStepping(Input1, Sign, Step1)
			-- upvalues: Input (ref), v1 (ref), Step (ref), SpawnedThread (ref), performStep (copy), UseRefResult (upval), FlagsModule (upval)
			if Input1 == Input and Sign == v1 and Step1 == Step then return end
			Input = nil
			v1 = 0
			
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
			Input = Input1
			v1 = Sign
			Step = Step1
			performStep(Sign, Step1)
			SpawnedThread = task.spawn(function()
				-- upvalues: Input (upval), Input1 (copy), v1 (upval), Sign (copy), Step (upval), Step1 (copy), performStep (upval), UseRefResult (upval), FlagsModule (upval)
				task.wait(0.4)
				local Count = 0
				while Input == Input1 and (v1 == Sign and Step == Step1) do
					performStep(Sign, Step1)
					Count += 1
					local Step2: number = UseRefResult.current.step
					task.wait(if FlagsModule.FoundationSliderCapture and (Step2 == nil or Step2 <= 0) then if Count >= 15 then 0.03 elseif Count >= 5 then 0.06 else 0.1 else 0.1)
				end
			end)
		end
		
		local function evaluateInput(Input1)
			-- upvalues: FlagsModule (upval), ConstantsModule (upval), UseRefResult (upval), getStepForKeyCode (upval), p2 (upval), startStepping (copy), v2 (ref), v3 (ref), Input (ref), v1 (ref), SpawnedThread (ref), SliderStepSizeModule (upval)
			if FlagsModule.FoundationSliderCapture and table.find(ConstantsModule.exit, Input1.KeyCode) ~= nil then
				local OnExitFunction: () -> () = UseRefResult.current.handlers.onExit
				
				if OnExitFunction then
					OnExitFunction()
				end
				return
			else
				local StepForKeyCode = getStepForKeyCode(Input1.KeyCode, p2)
				
				if StepForKeyCode then
					startStepping(Input1, StepForKeyCode.sign, StepForKeyCode.size)
					
					return
				end
				if table.find(ConstantsModule.analogStep, Input1.KeyCode) then
					local Y = if p2 then Input1.Position.Y else Input1.Position.X
					
					if ConstantsModule.thumbstickDeadzone <= math.abs(Y) then
						local v4: number = if Y > 0 then 1 else -1
						local v5: boolean = v2 ~= 0 and v4 ~= v2
						v3 = if v5 then v3 + 1 else 0
						
						if not FlagsModule.FoundationSliderCapture or not v5 or v3 >= 3 then
							v2 = v4
							startStepping(Input1, v4, SliderStepSizeModule.Step)
							
							return
						end
						if Input1 ~= nil and Input1 ~= Input then return end
						Input = nil
						v1 = 0
						
						if SpawnedThread then
							task.cancel(SpawnedThread)
							SpawnedThread = nil
							
							return
						end
					else
						v2 = 0
						v3 = 0
						
						if Input1 ~= nil and Input1 ~= Input then return end
						Input = nil
						v1 = 0
						
						if SpawnedThread then
							task.cancel(SpawnedThread)
							SpawnedThread = nil
						end
					end
				end
			end
		end
		
		local Connections = {
			ServicesModule.UserInputService.InputBegan:Connect(evaluateInput),
			ServicesModule.UserInputService.InputChanged:Connect(evaluateInput),
			ServicesModule.UserInputService.InputEnded:Connect(function(Input1)
				-- upvalues: ConstantsModule (upval), v2 (ref), v3 (ref), Input (ref), v1 (ref), SpawnedThread (ref)
				if table.find(ConstantsModule.analogStep, Input1.KeyCode) then
					v2 = 0
					v3 = 0
				end
				if Input1 ~= nil and Input1 ~= Input then return end
				Input = nil
				v1 = 0
				
				if SpawnedThread then
					task.cancel(SpawnedThread)
					SpawnedThread = nil
				end
			end)
		}
		
		return function()
			-- upvalues: Input (ref), v1 (ref), SpawnedThread (ref), Connections (copy)
			Input = nil
			v1 = 0
			
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { p1, p2 })
end