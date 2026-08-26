local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local servicesModule = require(foundation.Utility.Wrappers.Services)
local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)
local calculateDirectionalStepValueModule = require(script.Parent.calculateDirectionalStepValue)

local function getStepForKeyCode(p1)
	-- upvalues: sliderStepSizeModule (ref)
	return if p1 == Enum.KeyCode.Right or p1 == Enum.KeyCode.DPadRight then { sign = 1, size = sliderStepSizeModule.Step } elseif p1 == Enum.KeyCode.Left or p1 == Enum.KeyCode.DPadLeft then { sign = -1, size = sliderStepSizeModule.Step } elseif p1 == Enum.KeyCode.ButtonR1 then { sign = 1, size = sliderStepSizeModule.Page } elseif p1 == Enum.KeyCode.ButtonL1 then { sign = -1, size = sliderStepSizeModule.Page } else nil
end

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), sliderStepSizeModule (ref), calculateDirectionalStepValueModule (ref), sliderStepDirectionModule (ref), getStepForKeyCode (ref), servicesModule (ref)
	local var1 = reactModule.useRef({ step = p2, range = p3, handlers = p4 })
	var1.current = { step = p2, range = p3, handlers = p4 }
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), sliderStepSizeModule (copy), var1 (ref), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy), getStepForKeyCode (copy), servicesModule (copy)
		if p1 then
			local var2 = nil
			local var3 = 0
			local step = sliderStepSizeModule.Step
			local var4 = nil
			
			local function _(p5, p6)
				-- upvalues: var1 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
				local current = var1.current
				current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p5 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p6))
			end
			
			local function stopStepping(p5)
				-- upvalues: var2 (write), var3 (write), var4 (write)
				if p5 ~= nil and p5 ~= var2 then return end
				var2 = nil
				var3 = 0
				
				if var4 then
					task.cancel(var4)
					var4 = nil
				end
			end
			
			local function startStepping(p5, p6, p7)
				-- upvalues: var2 (write), var3 (write), step (write), var4 (write), var1 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
				if p5 == var2 and p6 == var3 and p7 == step then return end
				var2 = nil
				var3 = 0
				
				if var4 then
					task.cancel(var4)
					var4 = nil
				end
				var2 = p5
				var3 = p6
				step = p7
				local current = var1.current
				current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p6 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p7))
				var4 = task.spawn(function()
					-- upvalues: var2 (copy), p5 (ref), var3 (copy), p6 (ref), step (copy), p7 (ref), var1 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
					task.wait(0.4)
					while var2 == p5 and (var3 == p6 and step == p7) do
						local current = var1.current
						current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p6 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p7))
						task.wait(0.1)
					end
				end)
			end
			
			local function evaluateInput(p8)
				-- upvalues: getStepForKeyCode (copy), startStepping (ref), sliderStepSizeModule (copy), var2 (write), var3 (write), var4 (write)
				local var5 = getStepForKeyCode(p8.KeyCode)
				
				if var5 then
					startStepping(p8, var5.sign, var5.size)
					
					return
				elseif p8.KeyCode == Enum.KeyCode.Thumbstick1 then
					if math.abs(p8.Position.X) >= 0.8 then
						startStepping(p8, if p8.Position.X > 0 then 1 else -1, sliderStepSizeModule.Step)
						
						return
					elseif p8 ~= nil and p8 ~= var2 then return end
					var2 = nil
					var3 = 0
					
					if var4 then
						task.cancel(var4)
						var4 = nil
					end
				end
			end
			
			local list = {
				servicesModule.UserInputService.InputBegan:Connect(evaluateInput),
				servicesModule.UserInputService.InputChanged:Connect(evaluateInput),
				servicesModule.UserInputService.InputEnded:Connect(stopStepping)
			}
			
			return function()
				-- upvalues: var2 (write), var3 (write), var4 (write), list (ref)
				var2 = nil
				var3 = 0
				
				if var4 then
					task.cancel(var4)
					var4 = nil
				end
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { p1 })
end