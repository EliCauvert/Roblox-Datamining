local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ServicesModule = require(Foundation.Utility.Wrappers.Services)
local SliderStepDirectionModule = require(Foundation.Components.Slider.SliderStepDirection)
local CalculateAdjacentStepValueModule = require(Foundation.Components.Slider.calculateAdjacentStepValue)
local ConstantsModule = require(Foundation.Components.Slider.constants)

local function _(Value, p1)
	-- upvalues: ConstantsModule (copy)
	local Vertical: string = if p1 then "vertical" else "horizontal"
	
	return if table.find(ConstantsModule.stepIncrement[Vertical], Value) then 1 elseif table.find(ConstantsModule.stepDecrement[Vertical], Value) then -1 else nil
end

local _ = function(Value): boolean
	-- upvalues: ConstantsModule (copy)
	return table.find(ConstantsModule.exit, Value) ~= nil
end

local _ = function(p1: number, p2: number): number
	return if p2 == nil or p2 <= 0 then if p1 >= 15 then 0.03 elseif p1 >= 5 then 0.06 else 0.1 else 0.1
end

return function(p1, Step, Range, p2, Handlers)
	-- upvalues: ReactModule (copy), SliderStepDirectionModule (copy), CalculateAdjacentStepValueModule (copy), ConstantsModule (copy), ServicesModule (copy)
	local UseRefResult = ReactModule.useRef({ step = Step, range = Range, handlers = Handlers })
	UseRefResult.current = { step = Step, range = Range, handlers = Handlers }
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), SliderStepDirectionModule (upval), CalculateAdjacentStepValueModule (upval), ConstantsModule (upval), p2 (copy), ServicesModule (upval)
		if not p1 then return end
		local Input = nil
		local v1 = 0
		local SpawnedThread = nil
		local v2 = 0
		local v3 = 0
		
		local function _(p3: number)
			-- upvalues: UseRefResult (upval), SliderStepDirectionModule (upval), CalculateAdjacentStepValueModule (upval)
			local Current = UseRefResult.current
			Current.handlers.onStep(CalculateAdjacentStepValueModule(Current.handlers.getValue(), if p3 > 0 then SliderStepDirectionModule.Increment else SliderStepDirectionModule.Decrement, Current.range, Current.step))
		end
		
		local _ = function(p3)
			-- upvalues: Input (ref), v1 (ref), SpawnedThread (ref)
			if p3 ~= nil and p3 ~= Input then return end
			Input = nil
			v1 = 0
			
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
		end
		
		local function startStepping(Input1, p3: number)
			-- upvalues: Input (ref), v1 (ref), SpawnedThread (ref), UseRefResult (upval), SliderStepDirectionModule (upval), CalculateAdjacentStepValueModule (upval)
			if Input1 == Input and p3 == v1 then return end
			Input = nil
			v1 = 0
			
			if SpawnedThread then
				task.cancel(SpawnedThread)
				SpawnedThread = nil
			end
			Input = Input1
			v1 = p3
			local Current = UseRefResult.current
			Current.handlers.onStep(CalculateAdjacentStepValueModule(Current.handlers.getValue(), if p3 > 0 then SliderStepDirectionModule.Increment else SliderStepDirectionModule.Decrement, Current.range, Current.step))
			SpawnedThread = task.spawn(function()
				-- upvalues: Input (upval), Input1 (copy), v1 (upval), p3 (copy), UseRefResult (upval), SliderStepDirectionModule (upval), CalculateAdjacentStepValueModule (upval)
				task.wait(0.4)
				local Count = 0
				while Input == Input1 and v1 == p3 do
					local Current = UseRefResult.current
					Current.handlers.onStep(CalculateAdjacentStepValueModule(Current.handlers.getValue(), if p3 > 0 then SliderStepDirectionModule.Increment else SliderStepDirectionModule.Decrement, Current.range, Current.step))
					Count += 1
					local Step: number = UseRefResult.current.step
					task.wait(if Step == nil or Step <= 0 then if Count >= 15 then 0.03 elseif Count >= 5 then 0.06 else 0.1 else 0.1)
				end
			end)
		end
		
		local function evaluateInput(Input1)
			-- upvalues: ConstantsModule (upval), UseRefResult (upval), p2 (upval), startStepping (copy), v2 (ref), v3 (ref), Input (ref), v1 (ref), SpawnedThread (ref)
			if table.find(ConstantsModule.exit, Input1.KeyCode) ~= nil then
				UseRefResult.current.handlers.onExit()
				
				return
			end
			local KeyCode = Input1.KeyCode
			local Vertical: string = if p2 then "vertical" else "horizontal"
			local v4 = if table.find(ConstantsModule.stepIncrement[Vertical], KeyCode) then 1 elseif table.find(ConstantsModule.stepDecrement[Vertical], KeyCode) then -1 else nil
			
			if v4 then
				startStepping(Input1, v4)
				
				return
			end
			if table.find(ConstantsModule.analogStep, Input1.KeyCode) then
				local Y = if p2 then Input1.Position.Y else Input1.Position.X
				
				if ConstantsModule.thumbstickDeadzone <= math.abs(Y) then
					local v5: number = if Y > 0 then 1 else -1
					local v6: boolean = v2 ~= 0 and v5 ~= v2
					v3 = if v6 then v3 + 1 else 0
					
					if not v6 or v3 >= 3 then
						v2 = v5
						startStepping(Input1, v5)
						
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