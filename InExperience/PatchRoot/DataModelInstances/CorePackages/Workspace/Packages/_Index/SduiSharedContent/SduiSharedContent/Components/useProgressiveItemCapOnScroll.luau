local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local ReactModule = require(SduiSharedContent.Parent.React)
local FFlagSduiProgressiveScrollMathFixModule = require(SduiSharedContent.Flags.FFlagSduiProgressiveScrollMathFix)

local function _(List, p1: number)
	if p1 <= 0 then
		return 0
	end
	local Total = 0
	
	for i, value in List do
		Total += if value > 0 then value else 1
		
		if p1 <= Total then
			return i
		end
	end
	return #List
end

local _ = function(p2, p3): boolean
	if p2 == p3 then
		return true
	end
	if #p2 ~= #p3 then
		return false
	end
	for i = 1, #p2 do
		if p2[i] ~= p3[i] then
			return false
		end
	end
	return true
end

return function(Current, p4: number, p5: number, p6, p7, p8, p9)
	-- upvalues: ReactModule (copy), FFlagSduiProgressiveScrollMathFixModule (copy)
	local Largest = math.max(0, p4)
	local Largest1 = math.max(1, p5)
	local Total = 0
	
	for _, value in Current do
		Total += if value > 0 then value else 1
	end
	local CountCurrent = #Current
	local UseStateResult, UseStateResult2 = ReactModule.useState(Largest)
	local UseRefResult = if FFlagSduiProgressiveScrollMathFixModule then ReactModule.useRef(0) else nil
	local UseRefResult1 = if FFlagSduiProgressiveScrollMathFixModule then ReactModule.useRef(false) else nil
	local UseRefResult2 = if FFlagSduiProgressiveScrollMathFixModule then ReactModule.useRef(Current) else nil
	local Smallest = math.min(UseStateResult, Total)
	local Current1 = nil
	
	if Smallest <= 0 then
		Current1 = 0
	else
		local Total1 = 0
		
		for i, value1 in Current do
			Total1 += if value1 > 0 then value1 else 1
			
			if Smallest <= Total1 then
				Current1 = i
			else
				continue
			end
		end
		Current1 = #Current
	end
	if FFlagSduiProgressiveScrollMathFixModule and CountCurrent > 0 then
		if CountCurrent < UseRefResult.current then
			UseRefResult.current = CountCurrent
		end
		if Current1 < UseRefResult.current then
			Current1 = UseRefResult.current
		else
			UseRefResult.current = Current1
		end
	end
	local IsCurrentBelow = Current1 < CountCurrent
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), UseRefResult2 (copy), Current (copy), UseRefResult3 (copy), UseRefResult4 (copy), p6 (copy), IsCurrentBelow (copy), p7 (copy), UseRefResult (copy), UseStateResult2 (copy), Total (ref), Largest1 (copy), UseRefResult1 (copy), p8 (copy), p9 (copy)
		local Flag: boolean? = nil
		
		if FFlagSduiProgressiveScrollMathFixModule then
			local Current1 = UseRefResult2.current
			local Flag1 = nil
			
			if Current1 == Current then
				Flag1 = true
			elseif #Current1 == #Current then
				Flag1 = true
				
				for i = 1, #Current1 do
					if Current1[i] == Current[i] then
						continue
					end
					Flag1 = false
					break
				end
			else
				Flag1 = false
			end
			if not Flag1 then
				UseRefResult2.current = Current
				
				if UseRefResult3.current ~= nil then
					UseRefResult3.current = nil
					UseRefResult4.current = nil
					Flag = true
				end
			end
		end
		local Current2 = if p6 then p6.current else nil
		
		if not IsCurrentBelow or Current2 == nil then
			return nil
		end
		local Flag2 = false
		
		local function _()
			-- upvalues: p7 (upval)
			local Current = if p7 then p7.current else nil
			
			return if Current == nil then nil else Current.AbsoluteContentSize.Y
		end
		
		local Y = nil
		local Y1 = nil
		local Y2 = nil
		
		if FFlagSduiProgressiveScrollMathFixModule then
			Y = Current2.AbsoluteCanvasSize.Y
			Y1 = Current2.AbsoluteWindowSize.Y
			local Current3 = if p7 then p7.current else nil
			Y2 = if Current3 == nil then nil else Current3.AbsoluteContentSize.Y
		end
		local _ = function()
			-- upvalues: UseRefResult4 (upval), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (ref), Y (ref), p7 (upval), Current2 (copy), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
			local Y2_1 = nil
			if FFlagSduiProgressiveScrollMathFixModule then
				Y2_1 = Y2 or Y
			else
				local Current1 = if p7 then p7.current else nil
				Y2_1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
			end
			UseRefResult4.current = Y2_1
			local Current3 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
			UseStateResult2(function(p10: number): number
				-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current3 (copy), Largest1 (upval)
				if FFlagSduiProgressiveScrollMathFixModule then
					local Smallest = math.min(p10, Total)
					local Count = nil
					
					if Smallest <= 0 then
						Count = 0
					else
						local Total = 0
						
						for i1, value in Current do
							Total += if value > 0 then value else 1
							
							if Smallest <= Total then
								Count = i1
							else
								continue
							end
						end
						Count = #Current
					end
					local v1 = if Count < Current3 then Largest1 else 1
					local Total1 = 0
					
					for i = 1, math.min(#Current, (math.max(Count, Current3))) do
						local v2: number = Current[i]
						Total1 += if v2 > 0 then v2 else 1
					end
					return (math.max(p10 + Largest1, Total1 + v1))
				else
					local Smallest1 = math.min(p10, Total)
					local Count = nil
					
					if Smallest1 <= 0 then
						Count = 0
					else
						local Total = 0
						
						for i3, value1 in Current do
							Total += if value1 > 0 then value1 else 1
							
							if Smallest1 <= Total then
								Count = i3
							else
								continue
							end
						end
						Count = #Current
					end
					local Total2 = 0
					
					for i2 = 1, Count do
						local v3: number = Current[i2]
						Total2 += if v3 > 0 then v3 else 1
					end
					return (math.max(p10 + Largest1, Total2 + 1))
				end
			end)
		end
		
		local function showNextBatchIfNearEnd()
			-- upvalues: Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), UseRefResult1 (upval), Current2 (copy), Y (ref), Y1 (ref), Y2 (ref), p7 (upval), UseRefResult4 (upval), p8 (upval), UseRefResult3 (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
			if Flag2 then return end
			if FFlagSduiProgressiveScrollMathFixModule then
				UseRefResult1.current = true
			end
			local Y3 = Current2.CanvasPosition.Y
			local Y4 = nil
			local Y5 = nil
			local Y2_1 = nil
			
			if FFlagSduiProgressiveScrollMathFixModule then
				Y4 = Y
				Y5 = Y1
				Y2_1 = Y2 or Y4
				
				if Y2_1 <= 0 then return end
			else
				Y4 = Current2.AbsoluteCanvasSize.Y
				Y5 = Current2.AbsoluteWindowSize.Y
				local Current1 = if p7 then p7.current else nil
				Y2_1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Y4
			end
			local Current3 = UseRefResult4.current
			
			if Current3 ~= nil and Y2_1 == Current3 then return end
			if math.max(0, p8) < Y4 - Y5 - Y3 then return end
			local Current4 = UseRefResult3.current
			
			if Current4 ~= nil and Y3 <= Current4 then return end
			if FFlagSduiProgressiveScrollMathFixModule then
				UseRefResult1.current = false
			end
			UseRefResult3.current = Y3
			local Y2_2 = nil
			
			if FFlagSduiProgressiveScrollMathFixModule then
				Y2_2 = Y2 or Y
			else
				local Current5 = if p7 then p7.current else nil
				Y2_2 = (if Current5 == nil then nil else Current5.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
			end
			UseRefResult4.current = Y2_2
			local Current6 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
			UseStateResult2(function(p11: number): number
				-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current6 (copy), Largest1 (upval)
				if FFlagSduiProgressiveScrollMathFixModule then
					local Smallest = math.min(p11, Total)
					local Count = nil
					
					if Smallest <= 0 then
						Count = 0
					else
						local Total = 0
						
						for i1, value in Current do
							Total += if value > 0 then value else 1
							
							if Smallest <= Total then
								Count = i1
							else
								continue
							end
						end
						Count = #Current
					end
					local v4 = if Count < Current6 then Largest1 else 1
					local Total1 = 0
					
					for i = 1, math.min(#Current, (math.max(Count, Current6))) do
						local v5: number = Current[i]
						Total1 += if v5 > 0 then v5 else 1
					end
					return (math.max(p11 + Largest1, Total1 + v4))
				else
					local Smallest1 = math.min(p11, Total)
					local Count = nil
					
					if Smallest1 <= 0 then
						Count = 0
					else
						local Total = 0
						
						for i3, value1 in Current do
							Total += if value1 > 0 then value1 else 1
							
							if Smallest1 <= Total then
								Count = i3
							else
								continue
							end
						end
						Count = #Current
					end
					local Total2 = 0
					
					for i2 = 1, Count do
						local v6: number = Current[i2]
						Total2 += if v6 > 0 then v6 else 1
					end
					return (math.max(p11 + Largest1, Total2 + 1))
				end
			end)
		end
		
		local _ = function()
			-- upvalues: Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (ref), p7 (upval), Y1 (ref), Current2 (copy), UseRefResult4 (upval), Y (ref), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
			if Flag2 then return end
			local Y3 = nil
			if FFlagSduiProgressiveScrollMathFixModule then
				Y3 = Y2
			else
				local Current1 = if p7 then p7.current else nil
				Y3 = if Current1 == nil then nil else Current1.AbsoluteContentSize.Y
			end
			if Y3 == nil or Y3 <= 0 then return end
			if (if FFlagSduiProgressiveScrollMathFixModule then Y1 else Current2.AbsoluteWindowSize.Y) <= Y3 then return end
			local Current3 = UseRefResult4.current
			
			if Current3 ~= nil and Y3 == Current3 then return end
			UseRefResult4.current = Y3
			local Y2_1 = nil
			
			if FFlagSduiProgressiveScrollMathFixModule then
				Y2_1 = Y2 or Y
			else
				local Current4 = if p7 then p7.current else nil
				Y2_1 = (if Current4 == nil then nil else Current4.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
			end
			UseRefResult4.current = Y2_1
			local Current5 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
			UseStateResult2(function(p12: number): number
				-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current5 (copy), Largest1 (upval)
				if FFlagSduiProgressiveScrollMathFixModule then
					local Smallest = math.min(p12, Total)
					local Count = nil
					
					if Smallest <= 0 then
						Count = 0
					else
						local Total = 0
						
						for i1, value in Current do
							Total += if value > 0 then value else 1
							
							if Smallest <= Total then
								Count = i1
							else
								continue
							end
						end
						Count = #Current
					end
					local v7 = if Count < Current5 then Largest1 else 1
					local Total1 = 0
					
					for i = 1, math.min(#Current, (math.max(Count, Current5))) do
						local v8: number = Current[i]
						Total1 += if v8 > 0 then v8 else 1
					end
					return (math.max(p12 + Largest1, Total1 + v7))
				else
					local Smallest1 = math.min(p12, Total)
					local Count = nil
					
					if Smallest1 <= 0 then
						Count = 0
					else
						local Total = 0
						
						for i3, value1 in Current do
							Total += if value1 > 0 then value1 else 1
							
							if Smallest1 <= Total then
								Count = i3
							else
								continue
							end
						end
						Count = #Current
					end
					local Total2 = 0
					
					for i2 = 1, Count do
						local v9: number = Current[i2]
						Total2 += if v9 > 0 then v9 else 1
					end
					return (math.max(p12 + Largest1, Total2 + 1))
				end
			end)
		end
		
		local DelayedThread = nil
		
		local function scheduleUnderfillDecision()
			-- upvalues: DelayedThread (ref), p9 (upval), Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (ref), p7 (upval), Y1 (ref), Current2 (copy), UseRefResult4 (upval), Y (ref), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
			DelayedThread = task.delay(p9 / 1000, function()
				-- upvalues: DelayedThread (upval), Flag2 (upval), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (upval), p7 (upval), Y1 (upval), Current2 (upval), UseRefResult4 (upval), Y (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
				DelayedThread = nil
				
				if not Flag2 then
					if Flag2 then return end
					local Y = nil
					if FFlagSduiProgressiveScrollMathFixModule then
						Y = Y2
					else
						local Current = if p7 then p7.current else nil
						Y = if Current == nil then nil else Current.AbsoluteContentSize.Y
					end
					if Y ~= nil then
						if Y <= 0 then return end
						if (if FFlagSduiProgressiveScrollMathFixModule then Y1 else Current2.AbsoluteWindowSize.Y) <= Y then return end
						local Current = UseRefResult4.current
						
						if Current ~= nil and Y == Current then return end
						UseRefResult4.current = Y
						local Y1 = nil
						
						if FFlagSduiProgressiveScrollMathFixModule then
							Y1 = Y2 or Y
						else
							local Current1 = if p7 then p7.current else nil
							Y1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
						end
						UseRefResult4.current = Y1
						local Current2 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
						UseStateResult2(function(p13: number): number
							-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current2 (copy), Largest1 (upval)
							if FFlagSduiProgressiveScrollMathFixModule then
								local Smallest = math.min(p13, Total)
								local Count = nil
								
								if Smallest <= 0 then
									Count = 0
								else
									local Total = 0
									
									for i1, value in Current do
										Total += if value > 0 then value else 1
										
										if Smallest <= Total then
											Count = i1
										else
											continue
										end
									end
									Count = #Current
								end
								local v10 = if Count < Current2 then Largest1 else 1
								local Total1 = 0
								
								for i = 1, math.min(#Current, (math.max(Count, Current2))) do
									local v11: number = Current[i]
									Total1 += if v11 > 0 then v11 else 1
								end
								return (math.max(p13 + Largest1, Total1 + v10))
							else
								local Smallest1 = math.min(p13, Total)
								local Count = nil
								
								if Smallest1 <= 0 then
									Count = 0
								else
									local Total = 0
									
									for i3, value1 in Current do
										Total += if value1 > 0 then value1 else 1
										
										if Smallest1 <= Total then
											Count = i3
										else
											continue
										end
									end
									Count = #Current
								end
								local Total2 = 0
								
								for i2 = 1, Count do
									local v12: number = Current[i2]
									Total2 += if v12 > 0 then v12 else 1
								end
								return (math.max(p13 + Largest1, Total2 + 1))
							end
						end)
					end
				end
			end)
		end
		
		local List = nil
		
		if FFlagSduiProgressiveScrollMathFixModule then
			List = {
				Current2:GetPropertyChangedSignal("CanvasPosition"):Connect(showNextBatchIfNearEnd),
				Current2:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
					-- upvalues: Y (ref), Current2 (copy), UseRefResult1 (upval), showNextBatchIfNearEnd (copy), DelayedThread (ref), p9 (upval), Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (ref), p7 (upval), Y1 (ref), UseRefResult4 (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
					Y = Current2.AbsoluteCanvasSize.Y
					
					if UseRefResult1.current then
						showNextBatchIfNearEnd()
					end
					if DelayedThread then
						task.cancel(DelayedThread)
					end
					DelayedThread = task.delay(p9 / 1000, function()
						-- upvalues: DelayedThread (upval), Flag2 (upval), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (upval), p7 (upval), Y1 (upval), Current2 (upval), UseRefResult4 (upval), Y (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
						DelayedThread = nil
						
						if not Flag2 then
							if Flag2 then return end
							local Y = nil
							if FFlagSduiProgressiveScrollMathFixModule then
								Y = Y2
							else
								local Current = if p7 then p7.current else nil
								Y = if Current == nil then nil else Current.AbsoluteContentSize.Y
							end
							if Y ~= nil then
								if Y <= 0 then return end
								if (if FFlagSduiProgressiveScrollMathFixModule then Y1 else Current2.AbsoluteWindowSize.Y) <= Y then return end
								local Current = UseRefResult4.current
								
								if Current ~= nil and Y == Current then return end
								UseRefResult4.current = Y
								local Y1 = nil
								
								if FFlagSduiProgressiveScrollMathFixModule then
									Y1 = Y2 or Y
								else
									local Current1 = if p7 then p7.current else nil
									Y1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
								end
								UseRefResult4.current = Y1
								local Current2 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
								UseStateResult2(function(p13: number): number
									-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current2 (copy), Largest1 (upval)
									if FFlagSduiProgressiveScrollMathFixModule then
										local Smallest = math.min(p13, Total)
										local Count = nil
										
										if Smallest <= 0 then
											Count = 0
										else
											local Total = 0
											
											for i1, value in Current do
												Total += if value > 0 then value else 1
												
												if Smallest <= Total then
													Count = i1
												else
													continue
												end
											end
											Count = #Current
										end
										local v10 = if Count < Current2 then Largest1 else 1
										local Total1 = 0
										
										for i = 1, math.min(#Current, (math.max(Count, Current2))) do
											local v11: number = Current[i]
											Total1 += if v11 > 0 then v11 else 1
										end
										return (math.max(p13 + Largest1, Total1 + v10))
									else
										local Smallest1 = math.min(p13, Total)
										local Count = nil
										
										if Smallest1 <= 0 then
											Count = 0
										else
											local Total = 0
											
											for i3, value1 in Current do
												Total += if value1 > 0 then value1 else 1
												
												if Smallest1 <= Total then
													Count = i3
												else
													continue
												end
											end
											Count = #Current
										end
										local Total2 = 0
										
										for i2 = 1, Count do
											local v12: number = Current[i2]
											Total2 += if v12 > 0 then v12 else 1
										end
										return (math.max(p13 + Largest1, Total2 + 1))
									end
								end)
							end
						end
					end)
				end),
				Current2:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
					-- upvalues: Y1 (ref), Current2 (copy), UseRefResult3 (upval), Y (ref), UseRefResult4 (upval), showNextBatchIfNearEnd (copy), DelayedThread (ref), p9 (upval), Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (ref), p7 (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
					Y1 = Current2.AbsoluteWindowSize.Y
					local Current1 = UseRefResult3.current
					
					if Current1 ~= nil and Y - Y1 < Current1 then
						UseRefResult3.current = nil
						UseRefResult4.current = nil
						showNextBatchIfNearEnd()
					end
					if DelayedThread then
						task.cancel(DelayedThread)
					end
					DelayedThread = task.delay(p9 / 1000, function()
						-- upvalues: DelayedThread (upval), Flag2 (upval), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (upval), p7 (upval), Y1 (upval), Current2 (upval), UseRefResult4 (upval), Y (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
						DelayedThread = nil
						
						if not Flag2 then
							if Flag2 then return end
							local Y = nil
							if FFlagSduiProgressiveScrollMathFixModule then
								Y = Y2
							else
								local Current = if p7 then p7.current else nil
								Y = if Current == nil then nil else Current.AbsoluteContentSize.Y
							end
							if Y ~= nil then
								if Y <= 0 then return end
								if (if FFlagSduiProgressiveScrollMathFixModule then Y1 else Current2.AbsoluteWindowSize.Y) <= Y then return end
								local Current = UseRefResult4.current
								
								if Current ~= nil and Y == Current then return end
								UseRefResult4.current = Y
								local Y1 = nil
								
								if FFlagSduiProgressiveScrollMathFixModule then
									Y1 = Y2 or Y
								else
									local Current1 = if p7 then p7.current else nil
									Y1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
								end
								UseRefResult4.current = Y1
								local Current2 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
								UseStateResult2(function(p13: number): number
									-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current2 (copy), Largest1 (upval)
									if FFlagSduiProgressiveScrollMathFixModule then
										local Smallest = math.min(p13, Total)
										local Count = nil
										
										if Smallest <= 0 then
											Count = 0
										else
											local Total = 0
											
											for i1, value in Current do
												Total += if value > 0 then value else 1
												
												if Smallest <= Total then
													Count = i1
												else
													continue
												end
											end
											Count = #Current
										end
										local v10 = if Count < Current2 then Largest1 else 1
										local Total1 = 0
										
										for i = 1, math.min(#Current, (math.max(Count, Current2))) do
											local v11: number = Current[i]
											Total1 += if v11 > 0 then v11 else 1
										end
										return (math.max(p13 + Largest1, Total1 + v10))
									else
										local Smallest1 = math.min(p13, Total)
										local Count = nil
										
										if Smallest1 <= 0 then
											Count = 0
										else
											local Total = 0
											
											for i3, value1 in Current do
												Total += if value1 > 0 then value1 else 1
												
												if Smallest1 <= Total then
													Count = i3
												else
													continue
												end
											end
											Count = #Current
										end
										local Total2 = 0
										
										for i2 = 1, Count do
											local v12: number = Current[i2]
											Total2 += if v12 > 0 then v12 else 1
										end
										return (math.max(p13 + Largest1, Total2 + 1))
									end
								end)
							end
						end
					end)
				end)
			}
			local Current4 = p7 and p7.current
			
			if Current4 ~= nil then
				table.insert(List, Current4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					-- upvalues: Y2 (ref), Current4 (copy), UseRefResult1 (upval), showNextBatchIfNearEnd (copy), DelayedThread (ref), p9 (upval), Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), p7 (upval), Y1 (ref), Current2 (copy), UseRefResult4 (upval), Y (ref), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
					Y2 = Current4.AbsoluteContentSize.Y
					
					if UseRefResult1.current then
						showNextBatchIfNearEnd()
					end
					if DelayedThread then
						task.cancel(DelayedThread)
					end
					DelayedThread = task.delay(p9 / 1000, function()
						-- upvalues: DelayedThread (upval), Flag2 (upval), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (upval), p7 (upval), Y1 (upval), Current2 (upval), UseRefResult4 (upval), Y (upval), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
						DelayedThread = nil
						
						if not Flag2 then
							if Flag2 then return end
							local Y = nil
							if FFlagSduiProgressiveScrollMathFixModule then
								Y = Y2
							else
								local Current = if p7 then p7.current else nil
								Y = if Current == nil then nil else Current.AbsoluteContentSize.Y
							end
							if Y ~= nil then
								if Y <= 0 then return end
								if (if FFlagSduiProgressiveScrollMathFixModule then Y1 else Current2.AbsoluteWindowSize.Y) <= Y then return end
								local Current = UseRefResult4.current
								
								if Current ~= nil and Y == Current then return end
								UseRefResult4.current = Y
								local Y1 = nil
								
								if FFlagSduiProgressiveScrollMathFixModule then
									Y1 = Y2 or Y
								else
									local Current1 = if p7 then p7.current else nil
									Y1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
								end
								UseRefResult4.current = Y1
								local Current2 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
								UseStateResult2(function(p13: number): number
									-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current2 (copy), Largest1 (upval)
									if FFlagSduiProgressiveScrollMathFixModule then
										local Smallest = math.min(p13, Total)
										local Count = nil
										
										if Smallest <= 0 then
											Count = 0
										else
											local Total = 0
											
											for i1, value in Current do
												Total += if value > 0 then value else 1
												
												if Smallest <= Total then
													Count = i1
												else
													continue
												end
											end
											Count = #Current
										end
										local v10 = if Count < Current2 then Largest1 else 1
										local Total1 = 0
										
										for i = 1, math.min(#Current, (math.max(Count, Current2))) do
											local v11: number = Current[i]
											Total1 += if v11 > 0 then v11 else 1
										end
										return (math.max(p13 + Largest1, Total1 + v10))
									else
										local Smallest1 = math.min(p13, Total)
										local Count = nil
										
										if Smallest1 <= 0 then
											Count = 0
										else
											local Total = 0
											
											for i3, value1 in Current do
												Total += if value1 > 0 then value1 else 1
												
												if Smallest1 <= Total then
													Count = i3
												else
													continue
												end
											end
											Count = #Current
										end
										local Total2 = 0
										
										for i2 = 1, Count do
											local v12: number = Current[i2]
											Total2 += if v12 > 0 then v12 else 1
										end
										return (math.max(p13 + Largest1, Total2 + 1))
									end
								end)
							end
						end
					end)
				end))
			end
		else
			List = {
				Current2:GetPropertyChangedSignal("CanvasPosition"):Connect(showNextBatchIfNearEnd),
				Current2:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(scheduleUnderfillDecision)
			}
			
			if p7 ~= nil and p7.current ~= nil then
				table.insert(List, p7.current:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(scheduleUnderfillDecision))
			end
		end
		if DelayedThread then
			task.cancel(DelayedThread)
		end
		DelayedThread = task.delay(p9 / 1000, function()
			-- upvalues: DelayedThread (ref), Flag2 (ref), FFlagSduiProgressiveScrollMathFixModule (upval), Y2 (ref), p7 (upval), Y1 (ref), Current2 (copy), UseRefResult4 (upval), Y (ref), UseRefResult (upval), UseStateResult2 (upval), Current (upval), Total (upval), Largest1 (upval)
			DelayedThread = nil
			
			if not Flag2 then
				if Flag2 then return end
				local Y = nil
				if FFlagSduiProgressiveScrollMathFixModule then
					Y = Y2
				else
					local Current = if p7 then p7.current else nil
					Y = if Current == nil then nil else Current.AbsoluteContentSize.Y
				end
				if Y ~= nil then
					if Y <= 0 then return end
					if (if FFlagSduiProgressiveScrollMathFixModule then Y1 else Current2.AbsoluteWindowSize.Y) <= Y then return end
					local Current = UseRefResult4.current
					
					if Current ~= nil and Y == Current then return end
					UseRefResult4.current = Y
					local Y1 = nil
					
					if FFlagSduiProgressiveScrollMathFixModule then
						Y1 = Y2 or Y
					else
						local Current1 = if p7 then p7.current else nil
						Y1 = (if Current1 == nil then nil else Current1.AbsoluteContentSize.Y) or Current2.AbsoluteCanvasSize.Y
					end
					UseRefResult4.current = Y1
					local Current2 = if FFlagSduiProgressiveScrollMathFixModule then UseRefResult.current else nil
					UseStateResult2(function(p13: number): number
						-- upvalues: FFlagSduiProgressiveScrollMathFixModule (upval), Current (upval), Total (upval), Current2 (copy), Largest1 (upval)
						if FFlagSduiProgressiveScrollMathFixModule then
							local Smallest = math.min(p13, Total)
							local Count = nil
							
							if Smallest <= 0 then
								Count = 0
							else
								local Total = 0
								
								for i1, value in Current do
									Total += if value > 0 then value else 1
									
									if Smallest <= Total then
										Count = i1
									else
										continue
									end
								end
								Count = #Current
							end
							local v10 = if Count < Current2 then Largest1 else 1
							local Total1 = 0
							
							for i = 1, math.min(#Current, (math.max(Count, Current2))) do
								local v11: number = Current[i]
								Total1 += if v11 > 0 then v11 else 1
							end
							return (math.max(p13 + Largest1, Total1 + v10))
						else
							local Smallest1 = math.min(p13, Total)
							local Count = nil
							
							if Smallest1 <= 0 then
								Count = 0
							else
								local Total = 0
								
								for i3, value1 in Current do
									Total += if value1 > 0 then value1 else 1
									
									if Smallest1 <= Total then
										Count = i3
									else
										continue
									end
								end
								Count = #Current
							end
							local Total2 = 0
							
							for i2 = 1, Count do
								local v12: number = Current[i2]
								Total2 += if v12 > 0 then v12 else 1
							end
							return (math.max(p13 + Largest1, Total2 + 1))
						end
					end)
				end
			end
		end)
		
		if FFlagSduiProgressiveScrollMathFixModule and (Flag or UseRefResult1.current) then
			showNextBatchIfNearEnd()
		end
		return function()
			-- upvalues: Flag2 (ref), DelayedThread (ref), List (ref)
			Flag2 = true
			
			if DelayedThread then
				task.cancel(DelayedThread)
			end
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		IsCurrentBelow, Largest1, Total, p6, p7, p8, Current, p9
	})
	
	return Current1, IsCurrentBelow
end