local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("ScrollTelemetry").Parent
local reactModule = require(parent.React)
local fFlagLuaAppScrollDetectorLifecycleHardening = require(parent.SharedFlags).FFlagLuaAppScrollDetectorLifecycleHardening
game:DefineFastInt("ScrollDetectorTimeThresholdMillis", 300000)
game:DefineFastInt("ScrollDetectorDelayMillis", 250)

local function _()
	return game:GetFastInt("ScrollDetectorDelayMillis") / 1000
end

local _ = function()
	return game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagLuaAppScrollDetectorLifecycleHardening (ref), runService (ref)
	local var1 = reactModule.useRef(0)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(p1.onScrollStart)
	var8.current = p1.onScrollStart
	local var9 = reactModule.useRef(p1.onScrollSettled)
	var9.current = p1.onScrollSettled
	
	if fFlagLuaAppScrollDetectorLifecycleHardening then
		local var10 = reactModule.useRef(p1.sendScrollEvent)
		var10.current = p1.sendScrollEvent
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var2 (ref), var10 (ref), var5 (ref), p1 (ref), var6 (ref), var3 (ref), var7 (ref), var9 (ref), var8 (ref), runService (copy), var4 (ref)
			local _ = function(p2)
				-- upvalues: var1 (copy), var2 (copy), var10 (copy), var5 (copy)
				local var11 = var1.current - var2.current
				
				if var11 == 0 then return end
				if var10.current then
					var10.current(var11, p2 - var5.current, var2.current)
				end
			end
			
			local var11 = function()
				-- upvalues: p1 (copy), var6 (copy), var1 (copy), var2 (copy), var10 (copy), var5 (copy), var3 (copy), var7 (copy), var9 (copy)
				if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
					local var12 = nil
					local var13 = time()
					local var14 = var13 - var5.current
					
					if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
						var12 = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
					end
					local var15 = var1.current - var2.current
					local var16 = var12 - var1.current
					
					if not var7.current and var16 == 0 then
						var7.current = var6.current
					elseif var7.current and var16 ~= 0 then
						var7.current = nil
					end
					if var7.current and var7.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < var13 then
						var1.current = var12
						local current = var7.current
						local var17 = var1.current - var2.current
						
						if var17 ~= 0 and var10.current then
							var10.current(var17, current - var5.current, var2.current)
						end
						if var9.current then
							var9.current(var1.current - var2.current)
						end
						var2.current = var12
						local current_1 = var3.current
						
						if current_1 then
							current_1:Disconnect()
						end
						var3.current = nil
						
						return
					elseif var15 ~= 0 and var16 ~= 0 and math.sign(var15) ~= math.sign(var16) then
						local current = var6.current
						local var18 = var1.current - var2.current
						
						if var18 ~= 0 and var10.current then
							var10.current(var18, current - var5.current, var2.current)
						end
						var2.current = var1.current
						var5.current = var6.current
					elseif not var7.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= var14 then
						var1.current = var12
						local var19 = var1.current - var2.current
						
						if var19 ~= 0 and var10.current then
							var10.current(var19, var13 - var5.current, var2.current)
						end
						var2.current = var12
						var5.current = var13
					end
					var1.current = var12
					var6.current = var13
					
					return
				else
					local current = var6.current
					local var20 = var1.current - var2.current
					
					if var20 ~= 0 and var10.current then
						var10.current(var20, current - var5.current, var2.current)
					end
					if var3.current then
						var3.current:Disconnect()
					end
					var3.current = nil
				end
			end
			
			local var12 = function()
				-- upvalues: var3 (copy), var5 (copy), var6 (copy), var2 (copy), var1 (copy), var7 (copy), var8 (copy), runService (copy), var11 (ref)
				if not var3.current then
					var5.current = time()
					var6.current = var5.current
					var2.current = var1.current
					var7.current = nil
					
					if var8.current then
						var8.current()
					end
					var3.current = runService.Stepped:Connect(function()
						-- upvalues: var11 (copy)
						var11()
					end)
				end
			end
			
			local var13 = nil
			
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current and var4.current ~= p1.scrollingFrameRef.current then
				var1.current = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
				var13 = p1.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					-- upvalues: var12 (ref)
					var12()
				end)
				var4.current = p1.scrollingFrameRef.current
			end
			return function()
				-- upvalues: var3 (copy), var6 (copy), var1 (copy), var2 (copy), var10 (copy), var5 (copy), var9 (copy), var13 (write), p1 (copy), var4 (copy)
				if var3.current then
					local current = var6.current
					local var14 = var1.current - var2.current
					
					if var14 ~= 0 and var10.current then
						var10.current(var14, current - var5.current, var2.current)
					end
					var3.current:Disconnect()
					
					if var9.current then
						var9.current(var1.current - var2.current)
					end
				end
				var3.current = nil
				
				if var13 then
					var13:Disconnect()
				end
				var13 = nil
				
				if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
					var4.current = nil
				end
			end
		end, { p1.scrollingFrameRef })
	else
		local _ = function(p2)
			-- upvalues: var1 (ref), var2 (ref), p1 (ref), var5 (ref)
			local var11 = var1.current - var2.current
			
			if var11 == 0 then return end
			if p1.sendScrollEvent then
				p1.sendScrollEvent(var11, p2 - var5.current, var2.current)
			end
		end
		
		local var11 = function()
			-- upvalues: p1 (ref), var6 (ref), var1 (ref), var2 (ref), var5 (ref), var3 (ref), var7 (ref), var9 (ref)
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
				local var12 = nil
				local var13 = time()
				local var14 = var13 - var5.current
				
				if p1.scrollingFrameRef and p1.scrollingFrameRef.current then
					var12 = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
				end
				local var15 = var1.current - var2.current
				local var16 = var12 - var1.current
				
				if not var7.current and var16 == 0 then
					var7.current = var6.current
				elseif var7.current and var16 ~= 0 then
					var7.current = nil
				end
				if var7.current and var7.current + game:GetFastInt("ScrollDetectorDelayMillis") / 1000 < var13 then
					var1.current = var12
					local current = var7.current
					local var17 = var1.current - var2.current
					
					if var17 ~= 0 and p1.sendScrollEvent then
						p1.sendScrollEvent(var17, current - var5.current, var2.current)
					end
					if var9.current then
						var9.current(var1.current - var2.current)
					end
					var2.current = var12
					local current_1 = var3.current
					
					if current_1 then
						current_1:Disconnect()
					end
					var3.current = nil
					
					return
				elseif var15 ~= 0 and var16 ~= 0 and math.sign(var15) ~= math.sign(var16) then
					local current = var6.current
					local var18 = var1.current - var2.current
					
					if var18 ~= 0 and p1.sendScrollEvent then
						p1.sendScrollEvent(var18, current - var5.current, var2.current)
					end
					var2.current = var1.current
					var5.current = var6.current
				elseif not var7.current and game:GetFastInt("ScrollDetectorTimeThresholdMillis") / 1000 <= var14 then
					var1.current = var12
					local var19 = var1.current - var2.current
					
					if var19 ~= 0 and p1.sendScrollEvent then
						p1.sendScrollEvent(var19, var13 - var5.current, var2.current)
					end
					var2.current = var12
					var5.current = var13
				end
				var1.current = var12
				var6.current = var13
				
				return
			else
				local current = var6.current
				local var20 = var1.current - var2.current
				
				if var20 ~= 0 and p1.sendScrollEvent then
					p1.sendScrollEvent(var20, current - var5.current, var2.current)
				end
				if var3.current then
					var3.current:Disconnect()
				end
				var3.current = nil
			end
		end
		
		local var12 = function()
			-- upvalues: var3 (ref), var5 (ref), var6 (ref), var2 (ref), var1 (ref), var7 (ref), var8 (ref), runService (copy), var11 (ref)
			if not var3.current then
				var5.current = time()
				var6.current = var5.current
				var2.current = var1.current
				var7.current = nil
				
				if var8.current then
					var8.current()
				end
				var3.current = runService.Stepped:Connect(function()
					-- upvalues: var11 (copy)
					var11()
				end)
			end
		end
		
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var4 (ref), var1 (ref), var12 (ref), var3 (ref), var6 (ref), var2 (ref), var5 (ref), var9 (ref)
			local var13 = nil
			
			if p1.scrollingFrameRef and p1.scrollingFrameRef.current and var4.current ~= p1.scrollingFrameRef.current then
				var1.current = if p1.scrollingFrameRef.current.ScrollingDirection == Enum.ScrollingDirection.Y then p1.scrollingFrameRef.current.CanvasPosition.Y else p1.scrollingFrameRef.current.CanvasPosition.X
				var13 = p1.scrollingFrameRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					-- upvalues: var12 (copy)
					var12()
				end)
				var4.current = p1.scrollingFrameRef.current
			end
			return function()
				-- upvalues: var3 (copy), var6 (copy), var1 (copy), var2 (copy), p1 (copy), var5 (copy), var9 (copy), var13 (write), var4 (copy)
				if var3.current then
					local current = var6.current
					local var14 = var1.current - var2.current
					
					if var14 ~= 0 and p1.sendScrollEvent then
						p1.sendScrollEvent(var14, current - var5.current, var2.current)
					end
					var3.current:Disconnect()
					
					if var9.current then
						var9.current(var1.current - var2.current)
					end
				end
				var3.current = nil
				
				if var13 then
					var13:Disconnect()
				end
				var13 = nil
				
				if not p1.scrollingFrameRef or not p1.scrollingFrameRef.current then
					var4.current = nil
				end
			end
		end, { p1.scrollingFrameRef })
	end
	return nil
end