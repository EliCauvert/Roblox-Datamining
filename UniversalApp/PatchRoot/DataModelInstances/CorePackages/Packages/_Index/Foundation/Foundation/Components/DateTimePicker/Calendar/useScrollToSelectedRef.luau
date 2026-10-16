local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Dropdown)

return function(p1, Id) --[[ Line: 13 | Named "useScrollToSelectedRef" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 15 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			for _, Connection in UseRefResult.current do
				Connection:Disconnect()
			end
			UseRefResult.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame) --[[ Line: 24 ]]
		-- upvalues: UseResult (copy), p1 (copy), Id (copy), UseRefResult (copy)
		UseResult()
		
		if not ScrollFrame then return end
		local function scrollToSelected(): boolean --[[ Line: 31 ]]
			-- upvalues: p1 (upval), ScrollFrame (copy), Id (upval)
			local CountP0 = #p1
			local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
			local Y1: number = ScrollFrame.AbsoluteWindowSize.Y
			
			if CountP0 == 0 or Y1 <= 0 or Y <= Y1 then
				return false
			end
			local YRatio = Y / CountP0
			local v1 = 0
			
			for i, value in p1 do
				if value.id == Id then
					v1 = i - 1
					break
				end
			end
			ScrollFrame.CanvasPosition = Vector2.new(0, (math.clamp(v1 * YRatio - Y1 / 2 + YRatio / 2, 0, Y - Y1)))
			
			return true
		end
		
		if not scrollToSelected() then
			local function onSizeChanged() --[[ Line: 52 ]]
				-- upvalues: scrollToSelected (copy), UseResult (upval)
				if scrollToSelected() then
					UseResult()
				end
			end
			
			UseRefResult.current = {
				ScrollFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onSizeChanged),
				ScrollFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onSizeChanged)
			}
		end
	end, { p1, Id, UseResult })
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: UseResult (copy)
		return UseResult
	end, { UseResult })
	
	return UseResult1
end