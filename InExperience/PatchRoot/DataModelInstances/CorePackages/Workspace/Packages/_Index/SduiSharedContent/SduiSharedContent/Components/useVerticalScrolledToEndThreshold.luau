local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)
local sduiFeedCacheScrollExtents = game:DefineFastFlag("SduiFeedCacheScrollExtents", false)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), sduiFeedCacheScrollExtents (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(p3)
	var2.current = p3
	
	if p3 == nil then
		p2 = nil
	end
	reactModule.useEffect(function()
		-- upvalues: p2 (write), p1 (ref), sduiFeedCacheScrollExtents (copy), var1 (ref), var2 (ref)
		if p2 == nil or p1.current == nil then
			return nil
		end
		local var3
		local t = {}
		local current = p1.current
		local _ = nil
		
		if sduiFeedCacheScrollExtents then
			local y = current.AbsoluteCanvasSize.Y
			local y_1 = current.AbsoluteWindowSize.Y
			
			local function _()
				-- upvalues: y (write), current (ref), y_1 (write)
				y = current.AbsoluteCanvasSize.Y
				y_1 = current.AbsoluteWindowSize.Y
			end
			
			local function evaluateThreshold()
				-- upvalues: y (write), y_1 (write), p2 (copy), current (ref), var1 (copy), var2 (copy)
				local var4 = y - y_1 - p2
				local y_2 = current.CanvasPosition.Y
				
				if y_2 < var4 and var1.current then
					var1.current = false
					
					return
				elseif var4 < y_2 and not var1.current then
					var1.current = true
					
					if var2.current then
						var2.current()
					end
				end
			end
			
			local function refreshSizesAndEvaluate()
				-- upvalues: y (write), current (ref), y_1 (write), p2 (copy), var1 (copy), var2 (copy)
				y = current.AbsoluteCanvasSize.Y
				y_1 = current.AbsoluteWindowSize.Y
				local var4 = y - y_1 - p2
				local y_2 = current.CanvasPosition.Y
				
				if y_2 < var4 and var1.current then
					var1.current = false
					
					return
				elseif var4 < y_2 and not var1.current then
					var1.current = true
					
					if var2.current then
						var2.current()
					end
				end
			end
			
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(refreshSizesAndEvaluate))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(refreshSizesAndEvaluate))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(evaluateThreshold))
			var3 = refreshSizesAndEvaluate
		else
			local function y()
				-- upvalues: current (ref), p2 (copy), var1 (copy), var2 (copy)
				local var4 = current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y - p2
				local y = current.CanvasPosition.Y
				
				if y < var4 and var1.current then
					var1.current = false
					
					return
				elseif var4 < y and not var1.current then
					var1.current = true
					
					if var2.current then
						var2.current()
					end
				end
			end
			
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(y))
			table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(y))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(y))
			var3 = y
		end
		local y = false
		task.defer(function()
			-- upvalues: y (write), var3 (write)
			if not y then
				var3()
			end
		end)
		
		return function()
			-- upvalues: y (write), t (ref)
			y = true
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1, p2 })
end