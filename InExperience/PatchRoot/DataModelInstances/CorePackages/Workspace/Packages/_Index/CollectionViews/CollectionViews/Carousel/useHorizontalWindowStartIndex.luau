local ReactModule = require(script:FindFirstAncestor("CollectionViews").Parent.React)

return function(p1, p2, p3, p4) --[[ Line: 7 | Named "useHorizontalWindowStartIndex" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(1)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 17 ]]
		-- upvalues: p4 (copy), p1 (copy), p2 (copy), p3 (copy), UseStateResult2 (copy)
		if not p4 then
			UseStateResult2(1)
		elseif p1.current ~= nil then
			local X = p1.current.CanvasPosition.X
			local NewX = p2:getValue().X + p3
			
			if NewX > 0 then
				UseStateResult2((math.max(1, (math.floor(X / NewX)))))
				
				return
			else
				UseStateResult2(1)
				
				return
			end
		end
	end, { p4, p1, p2, p3 })
	ReactModule.useEffect(function() --[[ Line: 42 ]]
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: p4 (copy), p1 (copy), UseResult (copy)
		if not p4 then
			return nil
		end
		local List = {}
		
		if p1.current ~= nil then
			UseResult()
			table.insert(List, p1.current:GetPropertyChangedSignal("CanvasPosition"):Connect(UseResult))
			table.insert(List, p1.current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(UseResult))
		end
		return function() --[[ Line: 66 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, UseResult, p4 })
	
	return UseStateResult
end