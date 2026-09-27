local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local servicesModule = require(foundation.Utility.Wrappers.Services)
local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)
local flagsModule = require(foundation.Utility.Flags)
local calculateAdjacentStepValueModule = require(script.Parent.calculateAdjacentStepValue)
local calculateDirectionalStepValueModule = require(script.Parent.calculateDirectionalStepValue)
local constantsModule = require(script.Parent.constants)

local function getStepForKeyCode(p1, p2)
	-- upvalues: flagsModule (ref), constantsModule (ref), sliderStepSizeModule (ref)
	if not flagsModule.FoundationSliderCapture then
		if table.find(constantsModule.coarseIncrement, p1) then
			return { sign = 1, size = sliderStepSizeModule.Page }
		elseif table.find(constantsModule.coarseDecrement, p1) then
			return { sign = -1, size = sliderStepSizeModule.Page }
		end
	end
	local var1 = if flagsModule.FoundationSliderBeta and p2 then "vertical" else "horizontal"
	
	return if table.find(constantsModule.stepIncrement[var1], p1) then { sign = 1, size = sliderStepSizeModule.Step } elseif table.find(constantsModule.stepDecrement[var1], p1) then { sign = -1, size = sliderStepSizeModule.Step } else nil
end

local function _(p1)
	-- upvalues: constantsModule (ref)
	return table.find(constantsModule.exit, p1) ~= nil
end

local _ = function(p1, p2)
	-- upvalues: flagsModule (ref)
	return if not (not flagsModule.FoundationSliderCapture or p2 ~= nil and p2 > 0) then if p1 >= 15 then 0.03 elseif p1 >= 5 then 0.06 else 0.1 else 0.1
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), sliderStepSizeModule (ref), sliderStepDirectionModule (ref), flagsModule (ref), calculateAdjacentStepValueModule (ref), calculateDirectionalStepValueModule (ref), constantsModule (ref), getStepForKeyCode (ref), servicesModule (ref)
	local var1 = reactModule.useRef({ step = p2, range = p3, handlers = p5 })
	var1.current = { step = p2, range = p3, handlers = p5 }
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), sliderStepSizeModule (copy), var1 (ref), sliderStepDirectionModule (copy), flagsModule (copy), calculateAdjacentStepValueModule (copy), calculateDirectionalStepValueModule (copy), constantsModule (copy), getStepForKeyCode (copy), p4 (ref), servicesModule (copy)
		if p1 then
			local var2 = nil
			local var3 = 0
			local step = sliderStepSizeModule.Step
			local var4 = nil
			local var5 = 0
			local var6 = 0
			
			local function performStep(p6, p7)
				-- upvalues: var1 (copy), sliderStepDirectionModule (copy), flagsModule (copy), calculateAdjacentStepValueModule (copy), calculateDirectionalStepValueModule (copy)
				local current = var1.current
				local var7 = if p6 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement
				current.handlers.onStep(if flagsModule.FoundationSliderCapture then calculateAdjacentStepValueModule(current.handlers.getValue(), var7, current.range, current.step, p7) else calculateDirectionalStepValueModule(current.handlers.getValue(), var7, current.range, current.step, p7))
			end
			
			local function _(p6)
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
				-- upvalues: var2 (write), var3 (write), step (write), var4 (write), performStep (ref), var1 (copy), flagsModule (copy)
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
				performStep(p7, p8)
				var4 = task.spawn(function()
					-- upvalues: var2 (copy), p6 (ref), var3 (copy), p7 (ref), step (copy), p8 (ref), performStep (copy), var1 (copy), flagsModule (copy)
					task.wait(0.4)
					local var7 = 0
					while var2 == p6 and (var3 == p7 and step == p8) do
						performStep(p7, p8)
						var7 += 1
						local wait = task.wait
						local var8 = var7
						local step_1 = var1.current.step
						wait(if flagsModule.FoundationSliderCapture and (step_1 == nil or step_1 <= 0) then if var8 >= 15 then 0.03 elseif var8 >= 5 then 0.06 else 0.1 else 0.1)
					end
				end)
			end
			
			local function evaluateInput(p9)
				-- upvalues: flagsModule (copy), constantsModule (copy), var1 (copy), getStepForKeyCode (copy), p4 (copy), startStepping (ref), var5 (write), var6 (write), var2 (write), var3 (write), var4 (write), sliderStepSizeModule (copy)
				if flagsModule.FoundationSliderCapture and table.find(constantsModule.exit, p9.KeyCode) ~= nil then
					local onExit = var1.current.handlers.onExit
					
					if onExit then
						onExit()
					end
					return
				else
					local var7 = getStepForKeyCode(p9.KeyCode, p4)
					
					if var7 then
						startStepping(p9, var7.sign, var7.size)
						
						return
					elseif table.find(constantsModule.analogStep, p9.KeyCode) then
						local var8 = if flagsModule.FoundationSliderBeta and p4 then p9.Position.Y else p9.Position.X
						
						if constantsModule.thumbstickDeadzone <= math.abs(var8) then
							local var9 = if var8 > 0 then 1 else -1
							local var10 = var5 ~= 0 and var9 ~= var5
							var6 = if var10 then var6 + 1 else 0
							
							if flagsModule.FoundationSliderCapture and var10 and var6 < 3 then
								if p9 ~= nil and p9 ~= var2 then return end
								var2 = nil
								var3 = 0
								
								if var4 then
									task.cancel(var4)
									var4 = nil
									
									return
								end
							else
								var5 = var9
								startStepping(p9, var9, sliderStepSizeModule.Step)
								
								return
							end
						else
							var5 = 0
							var6 = 0
							
							if p9 ~= nil and p9 ~= var2 then return end
							var2 = nil
							var3 = 0
							
							if var4 then
								task.cancel(var4)
								var4 = nil
							end
						end
					end
				end
			end
			
			local list = {
				servicesModule.UserInputService.InputBegan:Connect(evaluateInput),
				servicesModule.UserInputService.InputChanged:Connect(evaluateInput),
				servicesModule.UserInputService.InputEnded:Connect(function(p9)
					-- upvalues: constantsModule (copy), var5 (write), var6 (write), var2 (write), var3 (write), var4 (write)
					if table.find(constantsModule.analogStep, p9.KeyCode) then
						var5 = 0
						var6 = 0
					end
					if p9 ~= nil and p9 ~= var2 then return end
					var2 = nil
					var3 = 0
					
					if var4 then
						task.cancel(var4)
						var4 = nil
					end
				end)
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