local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Dropdown)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		if var2.current then
			for i, v in var2.current do
				v:Disconnect()
			end
			var2.current = nil
		end
	end, {})
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), p0 (ref), p1 (ref), var2 (ref)
		var3()
		
		if not p2 then return end
		local function scrollToSelected()
			-- upvalues: p0 (copy), p2 (ref), p1 (copy)
			local p0Count = #p0
			local y = p2.AbsoluteCanvasSize.Y
			local y_1 = p2.AbsoluteWindowSize.Y
			
			if p0Count == 0 or y_1 <= 0 or y <= y_1 then
				return false
			end
			local var8 = y / p0Count
			local var9 = 0
			
			for i, v in p0 do
				if v.id == p1 then
					var9 = i - 1
					break
				end
			end
			p2.CanvasPosition = Vector2.new(0, math.clamp(var9 * var8 - y_1 / 2 + var8 / 2, 0, y - y_1))
			
			return true
		end
		
		if not scrollToSelected() then
			local function onSizeChanged()
				-- upvalues: scrollToSelected (ref), var3 (copy)
				if scrollToSelected() then
					var3()
				end
			end
			
			var2.current = {
				p2:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onSizeChanged),
				p2:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onSizeChanged)
			}
		end
	end, { p0, p1, var3 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return var3
	end, { var3 })
	
	return var4
end