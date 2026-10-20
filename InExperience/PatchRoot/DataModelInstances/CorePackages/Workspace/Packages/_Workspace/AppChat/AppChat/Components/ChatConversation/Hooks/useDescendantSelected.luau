local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)

local function _(Ancestor, p1, Object)
	return p1 or Object ~= nil and Object:IsDescendantOf(Ancestor)
end

return {
	useDescendantSelected = function()
		-- upvalues: ReactModule (copy)
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
		local UseResult = ReactModule.useCallback(function(p1)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p1)
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult2_1 (copy), UseStateResult (copy)
			UseStateResult2_1(false)
			
			if not UseStateResult then return end
			local SelectionChangedConnection = UseStateResult.SelectionChanged:Connect(function(p1, _, Object)
				-- upvalues: UseStateResult2_1 (upval), UseStateResult (upval)
				UseStateResult2_1(p1 or Object ~= nil and Object:IsDescendantOf(UseStateResult))
			end)
			
			return function()
				-- upvalues: SelectionChangedConnection (copy)
				SelectionChangedConnection:Disconnect()
			end
		end, { UseStateResult })
		
		return UseStateResult1, UseResult
	end
}