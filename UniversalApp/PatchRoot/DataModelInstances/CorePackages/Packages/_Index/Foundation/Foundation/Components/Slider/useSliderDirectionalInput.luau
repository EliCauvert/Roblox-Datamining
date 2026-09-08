local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local servicesModule = require(foundation.Utility.Wrappers.Services)
local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)
local flagsModule = require(foundation.Utility.Flags)
local calculateDirectionalStepValueModule = require(script.Parent.calculateDirectionalStepValue)

local function getStepForKeyCode(p1, p2)
	-- upvalues: flagsModule (ref), sliderStepSizeModule (ref)
	if flagsModule.FoundationSliderBeta then
		if p1 == Enum.KeyCode.ButtonR1 then
			return { sign = 1, size = sliderStepSizeModule.Page }
		elseif p1 == Enum.KeyCode.ButtonL1 then
			return { sign = -1, size = sliderStepSizeModule.Page }
		elseif p2 then
			if p1 == Enum.KeyCode.Up or p1 == Enum.KeyCode.DPadUp then
				return { sign = 1, size = sliderStepSizeModule.Step }
			elseif p1 == Enum.KeyCode.Down or p1 == Enum.KeyCode.DPadDown then
				return { sign = -1, size = sliderStepSizeModule.Step }
			end
		elseif p1 == Enum.KeyCode.Right or p1 == Enum.KeyCode.DPadRight then
			return { sign = 1, size = sliderStepSizeModule.Step }
		elseif p1 == Enum.KeyCode.Left or p1 == Enum.KeyCode.DPadLeft then
			return { sign = -1, size = sliderStepSizeModule.Step }
		end
	else
		return if p1 == Enum.KeyCode.Right or p1 == Enum.KeyCode.DPadRight then { sign = 1, size = sliderStepSizeModule.Step } elseif p1 == Enum.KeyCode.Left or p1 == Enum.KeyCode.DPadLeft then { sign = -1, size = sliderStepSizeModule.Step } elseif p1 == Enum.KeyCode.ButtonR1 then { sign = 1, size = sliderStepSizeModule.Page } elseif p1 == Enum.KeyCode.ButtonL1 then { sign = -1, size = sliderStepSizeModule.Page } else nil
	end
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), sliderStepSizeModule (ref), calculateDirectionalStepValueModule (ref), sliderStepDirectionModule (ref), getStepForKeyCode (ref), flagsModule (ref), servicesModule (ref)
	local var1 = reactModule.useRef({ step = p2, range = p3, handlers = p5 })
	var1.current = { step = p2, range = p3, handlers = p5 }
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), sliderStepSizeModule (copy), var1 (ref), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy), getStepForKeyCode (copy), p4 (ref), flagsModule (copy), servicesModule (copy)
		if p1 then
			local var2 = nil
			local var3 = 0
			local step = sliderStepSizeModule.Step
			local var4 = nil
			
			local function _(p6, p7)
				-- upvalues: var1 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
				local current = var1.current
				current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p6 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p7))
			end
			
			local function stopStepping(p6)
				-- upvalues: var2 (write), var3 (write), var4 (write)
				if p6 ~= nil and p6 ~= var2 then return end
				var2 = nil
				var3 = 0
				
				if var4 then
					task.cancel(var4)
					var4 = nil
				end
			end
			
			local function startStepping(p6, p7, p8)
				-- upvalues: var2 (write), var3 (write), step (write), var4 (write), var1 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
				if p6 == var2 and p7 == var3 and p8 == step then return end
				var2 = nil
				var3 = 0
				
				if var4 then
					task.cancel(var4)
					var4 = nil
				end
				var2 = p6
				var3 = p7
				step = p8
				local current = var1.current
				current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p7 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p8))
				var4 = task.spawn(function()
					-- upvalues: var2 (copy), p6 (ref), var3 (copy), p7 (ref), step (copy), p8 (ref), var1 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
					task.wait(0.4)
					while var2 == p6 and (var3 == p7 and step == p8) do
						local current = var1.current
						current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p7 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p8))
						task.wait(0.1)
					end
				end)
			end
			
			local function evaluateInput(p9)
				-- upvalues: getStepForKeyCode (copy), p4 (copy), startStepping (ref), flagsModule (copy), sliderStepSizeModule (copy), var2 (write), var3 (write), var4 (write)
				local var5 = getStepForKeyCode(p9.KeyCode, p4)
				
				if var5 then
					startStepping(p9, var5.sign, var5.size)
					
					return
				elseif p9.KeyCode == Enum.KeyCode.Thumbstick1 then
					if flagsModule.FoundationSliderBeta then
						local var6 = if p4 then p9.Position.Y else p9.Position.X
						
						if math.abs(var6) >= 0.8 then
							startStepping(p9, if var6 > 0 then 1 else -1, sliderStepSizeModule.Step)
							
							return
						elseif p9 ~= nil and p9 ~= var2 then return end
						var2 = nil
						var3 = 0
						
						if var4 then
							task.cancel(var4)
							var4 = nil
							
							return
						end
					elseif math.abs(p9.Position.X) >= 0.8 then
						startStepping(p9, if p9.Position.X > 0 then 1 else -1, sliderStepSizeModule.Step)
						
						return
					elseif p9 ~= nil and p9 ~= var2 then return end
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
	end, { p1, p4 })
end