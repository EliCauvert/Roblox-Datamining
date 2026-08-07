-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:09 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local servicesModule = require(foundation.Utility.Wrappers.Services)
local sliderStepDirectionModule = require(script.Parent.SliderStepDirection)
local sliderStepSizeModule = require(script.Parent.SliderStepSize)
local calculateDirectionalStepValueModule = require(script.Parent.calculateDirectionalStepValue)

local function getStepForKeyCode(p0) --[[ line: 28 ]]
	-- upvalues: sliderStepSizeModule (ref)
	return if p0 == Enum.KeyCode.Right or p0 == Enum.KeyCode.DPadRight then { sign = 1, size = sliderStepSizeModule.Step } elseif p0 == Enum.KeyCode.Left or p0 == Enum.KeyCode.DPadLeft then { sign = -1, size = sliderStepSizeModule.Step } elseif p0 == Enum.KeyCode.ButtonR1 then { sign = 1, size = sliderStepSizeModule.Page } elseif p0 == Enum.KeyCode.ButtonL1 then { sign = -1, size = sliderStepSizeModule.Page } else nil
end

return function(p1, p2, p3, p4) --[[ line: 47 | named "useSliderDirectionalInput" ]]
	-- upvalues: reactModule (ref), sliderStepSizeModule (ref), calculateDirectionalStepValueModule (ref), sliderStepDirectionModule (ref), getStepForKeyCode (ref), servicesModule (ref)
	local var7 = reactModule.useRef({ step = p2, range = p3, handlers = p4 })
	var7.current = { step = p2, range = p3, handlers = p4 }
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: p1 (ref), sliderStepSizeModule (copy), var7 (ref), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy), getStepForKeyCode (copy), servicesModule (copy)
		if p1 then
			local var8 = nil
			local var9 = 0
			local step = sliderStepSizeModule.Step
			local var10 = nil
			
			local function _(p5, p6) --[[ line: 70 | named "performStep" ]]
				-- upvalues: var7 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
				local current = var7.current
				current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p5 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p6))
			end
			
			local function stopStepping(p7) --[[ line: 83 ]]
				-- upvalues: var8 (write), var9 (write), var10 (write)
				if p7 ~= nil and p7 ~= var8 then return end
				var8 = nil
				var9 = 0
				
				if var10 then
					task.cancel(var10)
					var10 = nil
				end
			end
			
			local function startStepping(p8, p9, p10) --[[ line: 95 ]]
				-- upvalues: var8 (write), var9 (write), step (write), var10 (write), var7 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
				if p8 == var8 and p9 == var9 and p10 == step then return end
				var8 = nil
				var9 = 0
				
				if var10 then
					task.cancel(var10)
					var10 = nil
				end
				var8 = p8
				var9 = p9
				step = p10
				local current = var7.current
				current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p9 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p10))
				var10 = task.spawn(function() --[[ line: 107 ]]
					-- upvalues: var8 (copy), p8 (ref), var9 (copy), p9 (ref), step (copy), p10 (ref), var7 (copy), calculateDirectionalStepValueModule (copy), sliderStepDirectionModule (copy)
					task.wait(0.4)
					while var8 == p8 and (var9 == p9 and step == p10) do
						local current = var7.current
						current.handlers.onStep(calculateDirectionalStepValueModule(current.handlers.getValue(), if p9 > 0 then sliderStepDirectionModule.Increment else sliderStepDirectionModule.Decrement, current.range, current.step, p10))
						task.wait(0.1)
					end
				end)
			end
			
			local function evaluateInput(p11) --[[ line: 119 ]]
				-- upvalues: getStepForKeyCode (copy), startStepping (ref), sliderStepSizeModule (copy), var8 (write), var9 (write), var10 (write)
				local var15 = getStepForKeyCode(p11.KeyCode)
				
				if var15 then
					startStepping(p11, var15.sign, var15.size)
					
					return
				elseif p11.KeyCode == Enum.KeyCode.Thumbstick1 then
					if math.abs(p11.Position.X) >= 0.8 then
						startStepping(p11, if p11.Position.X > 0 then 1 else -1, sliderStepSizeModule.Step)
						
						return
					elseif p11 ~= nil and p11 ~= var8 then return end
					var8 = nil
					var9 = 0
					
					if var10 then
						task.cancel(var10)
						var10 = nil
					end
				end
			end
			
			local list = {
				servicesModule.UserInputService.InputBegan:Connect(evaluateInput),
				servicesModule.UserInputService.InputChanged:Connect(evaluateInput),
				servicesModule.UserInputService.InputEnded:Connect(stopStepping)
			}
			
			return function() --[[ line: 141 ]]
				-- upvalues: var8 (write), var9 (write), var10 (write), list (ref)
				var8 = nil
				var9 = 0
				
				if var10 then
					task.cancel(var10)
					var10 = nil
				end
				for i, v in list do
					v:Disconnect()
				end
			end
		end
	end, { p1 })
end