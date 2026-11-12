local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local ReactModule = require(Parent.React)
local FFlagLuaAppScrollDetectorLifecycleHardening = require(Parent.SharedFlags).FFlagLuaAppScrollDetectorLifecycleHardening
game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000)
game:DefineFastInt("ScrollDetectorDelayMillis", 250)

local function _()
	return game:GetFastInt("ScrollDetectorDelayMillis") / 1000
end

local _ = function()
	return game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000
end

return function(p1)
	-- upvalues: ReactModule (copy), FFlagLuaAppScrollDetectorLifecycleHardening (copy), RunService (copy)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(p1.onScrollStart)
	UseRefResult7.current = p1.onScrollStart
	local UseRefResult8 = ReactModule.useRef(p1.onScrollSettled)
	UseRefResult8.current = p1.onScrollSettled
	
	if FFlagLuaAppScrollDetectorLifecycleHardening then
		local UseRefResult9 = ReactModule.useRef(p1.sendScrollEvent)
		UseRefResult9.current = p1.sendScrollEvent
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult9 (copy), UseRefResult4 (copy), p1 (copy), UseRefResult5 (copy), UseRefResult2 (copy), UseRefResult6 (copy), UseRefResult8 (copy), UseRefResult7 (copy), RunService (upval), UseRefResult3 (copy)
			local function _(p2)
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), UseRefResult9 (upval), UseRefResult4 (upval)
				local CurrentDelta = UseRefResult.current - UseRefResult1.current
				
				if CurrentDelta == 0 then return end
				if UseRefResult9.current then
					UseRefResult9.current(CurrentDelta, p2 - UseRefResult4.current, UseRefResult1.current)
				end
			end
			
			local function v20()
				-- upvalues: p1 (upval), UseRefResult5 (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult9 (upval), UseRefResult4 (upval), UseRefResult2 (upval), UseRefResult6 (upval), UseRefResult8 (upval)
				if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
					local Current1 = nil
					local CurrentTime = time()
					local CurrentTimeDelta = CurrentTime - UseRefResult4.current
					
					if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
						Current1 = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
					end
					local CurrentDelta = UseRefResult.current - UseRefResult1.current
					local CurrentDelta1 = Current1 - UseRefResult.current
					
					if UseRefResult6.current or CurrentDelta1 ~= 0 then
						if UseRefResult6.current and CurrentDelta1 ~= 0 then
							UseRefResult6.current = nil
						end
					else
						UseRefResult6.current = UseRefResult5.current
					end
					if UseRefResult6.current and UseRefResult6.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < CurrentTime then
						UseRefResult.current = Current1
						local Current = UseRefResult6.current
						local CurrentDelta2 = UseRefResult.current - UseRefResult1.current
						
						if CurrentDelta2 ~= 0 and UseRefResult9.current then
							UseRefResult9.current(CurrentDelta2, Current - UseRefResult4.current, UseRefResult1.current)
						end
						if UseRefResult8.current then
							UseRefResult8.current(UseRefResult.current - UseRefResult1.current)
						end
						UseRefResult1.current = Current1
						local Current2 = UseRefResult2.current
						
						if Current2 then
							Current2:Disconnect()
						end
						UseRefResult2.current = nil
						
						return
					else
						if CurrentDelta == 0 or CurrentDelta1 == 0 or math.sign(CurrentDelta) == math.sign(CurrentDelta1) then
							if not UseRefResult6.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= CurrentTimeDelta then
								UseRefResult.current = Current1
								local CurrentDelta3 = UseRefResult.current - UseRefResult1.current
								
								if CurrentDelta3 ~= 0 and UseRefResult9.current then
									UseRefResult9.current(CurrentDelta3, CurrentTime - UseRefResult4.current, UseRefResult1.current)
								end
								UseRefResult1.current = Current1
								UseRefResult4.current = CurrentTime
							end
						else
							local Current = UseRefResult5.current
							local CurrentDelta4 = UseRefResult.current - UseRefResult1.current
							
							if CurrentDelta4 ~= 0 and UseRefResult9.current then
								UseRefResult9.current(CurrentDelta4, Current - UseRefResult4.current, UseRefResult1.current)
							end
							UseRefResult1.current = UseRefResult.current
							UseRefResult4.current = UseRefResult5.current
						end
						UseRefResult.current = Current1
						UseRefResult5.current = CurrentTime
						
						return
					end
				else
					local Current = UseRefResult5.current
					local CurrentDelta = UseRefResult.current - UseRefResult1.current
					
					if CurrentDelta ~= 0 and UseRefResult9.current then
						UseRefResult9.current(CurrentDelta, Current - UseRefResult4.current, UseRefResult1.current)
					end
					if UseRefResult2.current then
						UseRefResult2.current:Disconnect()
					end
					UseRefResult2.current = nil
				end
			end
			
			local function v21()
				-- upvalues: UseRefResult2 (upval), UseRefResult4 (upval), UseRefResult5 (upval), UseRefResult1 (upval), UseRefResult (upval), UseRefResult6 (upval), UseRefResult7 (upval), RunService (upval), v20 (copy)
				if not UseRefResult2.current then
					UseRefResult4.current = time()
					UseRefResult5.current = UseRefResult4.current
					UseRefResult1.current = UseRefResult.current
					UseRefResult6.current = nil
					
					if UseRefResult7.current then
						UseRefResult7.current()
					end
					UseRefResult2.current = RunService.Stepped:Connect(function()
						-- upvalues: v20 (upval)
						v20()
					end)
				end
			end
			
			local Connection = nil
			
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current and UseRefResult3.current ~= p1.scrollingFrameRef.current then
				UseRefResult.current = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
				Connection = p1.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					-- upvalues: v21 (copy)
					v21()
				end)
				UseRefResult3.current = p1.scrollingFrameRef.current
			end
			return function()
				-- upvalues: UseRefResult2 (upval), UseRefResult5 (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult9 (upval), UseRefResult4 (upval), UseRefResult8 (upval), Connection (ref), p1 (upval), UseRefResult3 (upval)
				if UseRefResult2.current then
					local Current = UseRefResult5.current
					local CurrentDelta = UseRefResult.current - UseRefResult1.current
					
					if CurrentDelta ~= 0 and UseRefResult9.current then
						UseRefResult9.current(CurrentDelta, Current - UseRefResult4.current, UseRefResult1.current)
					end
					UseRefResult2.current:Disconnect()
					
					if UseRefResult8.current then
						UseRefResult8.current(UseRefResult.current - UseRefResult1.current)
					end
				end
				UseRefResult2.current = nil
				
				if Connection then
					Connection:Disconnect()
				end
				Connection = nil
				
				if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
					UseRefResult3.current = nil
				end
			end
		end, { p1.scrollingFrameRef })
	else
		local function _(p2)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), p1 (copy), UseRefResult4 (copy)
			local CurrentDelta = UseRefResult.current - UseRefResult1.current
			
			if CurrentDelta == 0 then return end
			if p1.sendScrollEvent then
				p1.sendScrollEvent(CurrentDelta, p2 - UseRefResult4.current, UseRefResult1.current)
			end
		end
		
		local function v17()
			-- upvalues: p1 (copy), UseRefResult5 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult2 (copy), UseRefResult6 (copy), UseRefResult8 (copy)
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
				local Current1 = nil
				local CurrentTime = time()
				local CurrentTimeDelta = CurrentTime - UseRefResult4.current
				
				if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
					Current1 = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
				end
				local CurrentDelta = UseRefResult.current - UseRefResult1.current
				local CurrentDelta1 = Current1 - UseRefResult.current
				
				if UseRefResult6.current or CurrentDelta1 ~= 0 then
					if UseRefResult6.current and CurrentDelta1 ~= 0 then
						UseRefResult6.current = nil
					end
				else
					UseRefResult6.current = UseRefResult5.current
				end
				if UseRefResult6.current and UseRefResult6.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < CurrentTime then
					UseRefResult.current = Current1
					local Current = UseRefResult6.current
					local CurrentDelta2 = UseRefResult.current - UseRefResult1.current
					
					if CurrentDelta2 ~= 0 and p1.sendScrollEvent then
						p1.sendScrollEvent(CurrentDelta2, Current - UseRefResult4.current, UseRefResult1.current)
					end
					if UseRefResult8.current then
						UseRefResult8.current(UseRefResult.current - UseRefResult1.current)
					end
					UseRefResult1.current = Current1
					local Current2 = UseRefResult2.current
					
					if Current2 then
						Current2:Disconnect()
					end
					UseRefResult2.current = nil
					
					return
				else
					if CurrentDelta == 0 or CurrentDelta1 == 0 or math.sign(CurrentDelta) == math.sign(CurrentDelta1) then
						if not UseRefResult6.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= CurrentTimeDelta then
							UseRefResult.current = Current1
							local CurrentDelta3 = UseRefResult.current - UseRefResult1.current
							
							if CurrentDelta3 ~= 0 and p1.sendScrollEvent then
								p1.sendScrollEvent(CurrentDelta3, CurrentTime - UseRefResult4.current, UseRefResult1.current)
							end
							UseRefResult1.current = Current1
							UseRefResult4.current = CurrentTime
						end
					else
						local Current = UseRefResult5.current
						local CurrentDelta4 = UseRefResult.current - UseRefResult1.current
						
						if CurrentDelta4 ~= 0 and p1.sendScrollEvent then
							p1.sendScrollEvent(CurrentDelta4, Current - UseRefResult4.current, UseRefResult1.current)
						end
						UseRefResult1.current = UseRefResult.current
						UseRefResult4.current = UseRefResult5.current
					end
					UseRefResult.current = Current1
					UseRefResult5.current = CurrentTime
					
					return
				end
			else
				local Current = UseRefResult5.current
				local CurrentDelta = UseRefResult.current - UseRefResult1.current
				
				if CurrentDelta ~= 0 and p1.sendScrollEvent then
					p1.sendScrollEvent(CurrentDelta, Current - UseRefResult4.current, UseRefResult1.current)
				end
				if UseRefResult2.current then
					UseRefResult2.current:Disconnect()
				end
				UseRefResult2.current = nil
			end
		end
		
		local function v18()
			-- upvalues: UseRefResult2 (copy), UseRefResult4 (copy), UseRefResult5 (copy), UseRefResult1 (copy), UseRefResult (copy), UseRefResult6 (copy), UseRefResult7 (copy), RunService (upval), v17 (copy)
			if not UseRefResult2.current then
				UseRefResult4.current = time()
				UseRefResult5.current = UseRefResult4.current
				UseRefResult1.current = UseRefResult.current
				UseRefResult6.current = nil
				
				if UseRefResult7.current then
					UseRefResult7.current()
				end
				UseRefResult2.current = RunService.Stepped:Connect(function()
					-- upvalues: v17 (upval)
					v17()
				end)
			end
		end
		
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult3 (copy), UseRefResult (copy), v18 (copy), UseRefResult2 (copy), UseRefResult5 (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult8 (copy)
			local Connection = nil
			
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current and UseRefResult3.current ~= p1.scrollingFrameRef.current then
				UseRefResult.current = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
				Connection = p1.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					-- upvalues: v18 (upval)
					v18()
				end)
				UseRefResult3.current = p1.scrollingFrameRef.current
			end
			return function()
				-- upvalues: UseRefResult2 (upval), UseRefResult5 (upval), UseRefResult (upval), UseRefResult1 (upval), p1 (upval), UseRefResult4 (upval), UseRefResult8 (upval), Connection (ref), UseRefResult3 (upval)
				if UseRefResult2.current then
					local Current = UseRefResult5.current
					local CurrentDelta = UseRefResult.current - UseRefResult1.current
					
					if CurrentDelta ~= 0 and p1.sendScrollEvent then
						p1.sendScrollEvent(CurrentDelta, Current - UseRefResult4.current, UseRefResult1.current)
					end
					UseRefResult2.current:Disconnect()
					
					if UseRefResult8.current then
						UseRefResult8.current(UseRefResult.current - UseRefResult1.current)
					end
				end
				UseRefResult2.current = nil
				
				if Connection then
					Connection:Disconnect()
				end
				Connection = nil
				
				if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
					UseRefResult3.current = nil
				end
			end
		end, { p1.scrollingFrameRef })
	end
	return nil
end