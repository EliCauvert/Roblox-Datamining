local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Dropdown)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1.current then
			for i, v in var1.current do
				v:Disconnect()
			end
			var1.current = nil
		end
	end, {})
	local var3 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref), p1 (ref), p2 (ref), var1 (ref)
		var2()
		
		if not p3 then return end
		local function scrollToSelected()
			-- upvalues: p1 (copy), p3 (ref), p2 (copy)
			local p0Count = #p1
			local y = p3.AbsoluteCanvasSize.Y
			local y_1 = p3.AbsoluteWindowSize.Y
			
			if p0Count == 0 or y_1 <= 0 or y <= y_1 then
				return false
			end
			local var4 = y / p0Count
			local var5 = 0
			
			for i, v in p1 do
				if v.id == p2 then
					var5 = i - 1
					break
				end
			end
			p3.CanvasPosition = Vector2.new(0, math.clamp(var5 * var4 - y_1 / 2 + var4 / 2, 0, y - y_1))
			
			return true
		end
		
		if not scrollToSelected() then
			local function onSizeChanged()
				-- upvalues: scrollToSelected (ref), var2 (copy)
				if scrollToSelected() then
					var2()
				end
			end
			
			var1.current = {
				p3:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onSizeChanged),
				p3:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onSizeChanged)
			}
		end
	end, { p1, p2, var2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return var2
	end, { var2 })
	
	return var3
end