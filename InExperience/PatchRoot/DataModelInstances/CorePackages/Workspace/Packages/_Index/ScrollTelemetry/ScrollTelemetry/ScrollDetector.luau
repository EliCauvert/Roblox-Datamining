local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local reactModule = require(parent.React)
local fFlagLuaAppScrollDetectorLifecycleHardening = require(parent.SharedFlags).FFlagLuaAppScrollDetectorLifecycleHardening
game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000)
game:DefineFastInt("ScrollDetectorDelayMillis", 250)

local function _() --[[ line: 12 | named "getDelaySeconds" ]]
	return game:GetFastInt("ScrollDetectorDelayMillis") / 1000
end

local _ = function() --[[ line: 16 | named "getThresholdSeconds" ]]
	return game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000
end

return function(p0) --[[ line: 27 ]]
	-- upvalues: reactModule (ref), fFlagLuaAppScrollDetectorLifecycleHardening (ref), runService (ref)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(0)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(p0.onScrollStart)
	var9.current = p0.onScrollStart
	local var10 = reactModule.useRef(p0.onScrollSettled)
	var10.current = p0.onScrollSettled
	
	if fFlagLuaAppScrollDetectorLifecycleHardening then
		local var11 = reactModule.useRef(p0.sendScrollEvent)
		var11.current = p0.sendScrollEvent
		reactModule.useEffect(function() --[[ line: 51 ]]
			-- upvalues: var2 (ref), var3 (ref), var11 (ref), var6 (ref), p0 (ref), var7 (ref), var4 (ref), var8 (ref), var10 (ref), var9 (ref), runService (copy), var5 (ref)
			local _ = function(p1) --[[ line: 52 ]]
				-- upvalues: var2 (copy), var3 (copy), var11 (copy), var6 (copy)
				local var17 = var2.current - var3.current
				
				if var17 == 0 then return end
				if var11.current then
					var11.current(var17, p1 - var6.current, var3.current)
				end
			end
			
			local var14 = function() --[[ line: 67 ]]
				-- upvalues: p0 (copy), var7 (copy), var2 (copy), var3 (copy), var11 (copy), var6 (copy), var4 (copy), var8 (copy), var10 (copy)
				if p0.scrollingFrameRef and p0.scrollingFrameRef.current then
					local var19 = nil
					local var20 = time()
					local var21 = var20 - var6.current
					
					if p0.scrollingFrameRef and p0.scrollingFrameRef.current then
						var19 = if p0.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p0.scrollingFrameRef.current.CanvasPosition.Y else p0.scrollingFrameRef.current.CanvasPosition.X
					end
					local var22 = var2.current - var3.current
					local var23 = var19 - var2.current
					
					if not var8.current and var23 == 0 then
						var8.current = var7.current
					elseif var8.current and var23 ~= 0 then
						var8.current = nil
					end
					if var8.current and var8.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < var20 then
						var2.current = var19
						local current = var8.current
						local var24 = var2.current - var3.current
						
						if var24 ~= 0 and var11.current then
							var11.current(var24, current - var6.current, var3.current)
						end
						if var10.current then
							var10.current(var2.current - var3.current)
						end
						var3.current = var19
						local current_1 = var4.current
						
						if current_1 then
							current_1:Disconnect()
						end
						var4.current = nil
						
						return
					elseif var22 ~= 0 and var23 ~= 0 and math.sign(var22) ~= math.sign(var23) then
						local current = var7.current
						local var25 = var2.current - var3.current
						
						if var25 ~= 0 and var11.current then
							var11.current(var25, current - var6.current, var3.current)
						end
						var3.current = var2.current
						var6.current = var7.current
					elseif not var8.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= var21 then
						var2.current = var19
						local var26 = var2.current - var3.current
						
						if var26 ~= 0 and var11.current then
							var11.current(var26, var20 - var6.current, var3.current)
						end
						var3.current = var19
						var6.current = var20
					end
					var2.current = var19
					var7.current = var20
					
					return
				else
					local current = var7.current
					local var18 = var2.current - var3.current
					
					if var18 ~= 0 and var11.current then
						var11.current(var18, current - var6.current, var3.current)
					end
					if var4.current then
						var4.current:Disconnect()
					end
					var4.current = nil
				end
			end
			
			local var15 = function() --[[ line: 139 ]]
				-- upvalues: var4 (copy), var6 (copy), var7 (copy), var3 (copy), var2 (copy), var8 (copy), var9 (copy), runService (copy), var14 (ref)
				if not var4.current then
					var6.current = time()
					var7.current = var6.current
					var3.current = var2.current
					var8.current = nil
					
					if var9.current then
						var9.current()
					end
					var4.current = runService.Stepped:Connect(function() --[[ line: 152 ]]
						-- upvalues: var14 (copy)
						var14()
					end)
				end
			end
			
			local var16 = nil
			
			if p0.scrollingFrameRef and p0.scrollingFrameRef.current and var5.current ~= p0.scrollingFrameRef.current then
				var2.current = if p0.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p0.scrollingFrameRef.current.CanvasPosition.Y else p0.scrollingFrameRef.current.CanvasPosition.X
				var16 = p0.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 170 ]]
					-- upvalues: var15 (ref)
					var15()
				end)
				var5.current = p0.scrollingFrameRef.current
			end
			return function() --[[ line: 177 ]]
				-- upvalues: var4 (copy), var7 (copy), var2 (copy), var3 (copy), var11 (copy), var6 (copy), var10 (copy), var16 (write), p0 (copy), var5 (copy)
				if var4.current then
					local current = var7.current
					local var27 = var2.current - var3.current
					
					if var27 ~= 0 and var11.current then
						var11.current(var27, current - var6.current, var3.current)
					end
					var4.current:Disconnect()
					
					if var10.current then
						var10.current(var2.current - var3.current)
					end
				end
				var4.current = nil
				
				if var16 then
					var16:Disconnect()
				end
				var16 = nil
				
				if not p0.scrollingFrameRef or not p0.scrollingFrameRef.current then
					var5.current = nil
				end
			end
		end, { p0.scrollingFrameRef })
	else
		local _ = function(p2) --[[ line: 201 ]]
			-- upvalues: var2 (ref), var3 (ref), p0 (ref), var6 (ref)
			local var28 = var2.current - var3.current
			
			if var28 == 0 then return end
			if p0.sendScrollEvent then
				p0.sendScrollEvent(var28, p2 - var6.current, var3.current)
			end
		end
		
		local var12 = function() --[[ line: 212 ]]
			-- upvalues: p0 (ref), var7 (ref), var2 (ref), var3 (ref), var6 (ref), var4 (ref), var8 (ref), var10 (ref)
			if p0.scrollingFrameRef and p0.scrollingFrameRef.current then
				local var30 = nil
				local var31 = time()
				local var32 = var31 - var6.current
				
				if p0.scrollingFrameRef and p0.scrollingFrameRef.current then
					var30 = if p0.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p0.scrollingFrameRef.current.CanvasPosition.Y else p0.scrollingFrameRef.current.CanvasPosition.X
				end
				local var33 = var2.current - var3.current
				local var34 = var30 - var2.current
				
				if not var8.current and var34 == 0 then
					var8.current = var7.current
				elseif var8.current and var34 ~= 0 then
					var8.current = nil
				end
				if var8.current and var8.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < var31 then
					var2.current = var30
					local current = var8.current
					local var35 = var2.current - var3.current
					
					if var35 ~= 0 and p0.sendScrollEvent then
						p0.sendScrollEvent(var35, current - var6.current, var3.current)
					end
					if var10.current then
						var10.current(var2.current - var3.current)
					end
					var3.current = var30
					local current_1 = var4.current
					
					if current_1 then
						current_1:Disconnect()
					end
					var4.current = nil
					
					return
				elseif var33 ~= 0 and var34 ~= 0 and math.sign(var33) ~= math.sign(var34) then
					local current = var7.current
					local var36 = var2.current - var3.current
					
					if var36 ~= 0 and p0.sendScrollEvent then
						p0.sendScrollEvent(var36, current - var6.current, var3.current)
					end
					var3.current = var2.current
					var6.current = var7.current
				elseif not var8.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= var32 then
					var2.current = var30
					local var37 = var2.current - var3.current
					
					if var37 ~= 0 and p0.sendScrollEvent then
						p0.sendScrollEvent(var37, var31 - var6.current, var3.current)
					end
					var3.current = var30
					var6.current = var31
				end
				var2.current = var30
				var7.current = var31
				
				return
			else
				local current = var7.current
				local var29 = var2.current - var3.current
				
				if var29 ~= 0 and p0.sendScrollEvent then
					p0.sendScrollEvent(var29, current - var6.current, var3.current)
				end
				if var4.current then
					var4.current:Disconnect()
				end
				var4.current = nil
			end
		end
		
		local var13 = function() --[[ line: 284 ]]
			-- upvalues: var4 (ref), var6 (ref), var7 (ref), var3 (ref), var2 (ref), var8 (ref), var9 (ref), runService (copy), var12 (ref)
			if not var4.current then
				var6.current = time()
				var7.current = var6.current
				var3.current = var2.current
				var8.current = nil
				
				if var9.current then
					var9.current()
				end
				var4.current = runService.Stepped:Connect(function() --[[ line: 297 ]]
					-- upvalues: var12 (copy)
					var12()
				end)
			end
		end
		
		reactModule.useEffect(function() --[[ line: 303 ]]
			-- upvalues: p0 (ref), var5 (ref), var2 (ref), var13 (ref), var4 (ref), var7 (ref), var3 (ref), var6 (ref), var10 (ref)
			local var38 = nil
			
			if p0.scrollingFrameRef and p0.scrollingFrameRef.current and var5.current ~= p0.scrollingFrameRef.current then
				var2.current = if p0.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p0.scrollingFrameRef.current.CanvasPosition.Y else p0.scrollingFrameRef.current.CanvasPosition.X
				var38 = p0.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 316 ]]
					-- upvalues: var13 (copy)
					var13()
				end)
				var5.current = p0.scrollingFrameRef.current
			end
			return function() --[[ line: 323 ]]
				-- upvalues: var4 (copy), var7 (copy), var2 (copy), var3 (copy), p0 (copy), var6 (copy), var10 (copy), var38 (write), var5 (copy)
				if var4.current then
					local current = var7.current
					local var39 = var2.current - var3.current
					
					if var39 ~= 0 and p0.sendScrollEvent then
						p0.sendScrollEvent(var39, current - var6.current, var3.current)
					end
					var4.current:Disconnect()
					
					if var10.current then
						var10.current(var2.current - var3.current)
					end
				end
				var4.current = nil
				
				if var38 then
					var38:Disconnect()
				end
				var38 = nil
				
				if not p0.scrollingFrameRef or not p0.scrollingFrameRef.current then
					var5.current = nil
				end
			end
		end, { p0.scrollingFrameRef })
	end
	return nil
end