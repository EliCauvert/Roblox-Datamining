local ReactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p1) --[[ Line: 10 | Named "getRefValue" ]]
	return if typeof(p1) == "table" then p1.current else p1
end

return function(p1, PropertyName) --[[ Line: 47 | Named "useProperty" ]]
	-- upvalues: ReactModule (copy)
	local Current = if typeof(p1) == "table" then p1.current else p1
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 50 ]]
		-- upvalues: Current (copy), PropertyName (copy)
		return if Current then Current[PropertyName] else nil
	end)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: p1 (copy), PropertyName (copy), UseStateResult2 (copy)
		local Current = if typeof(p1) == "table" then p1.current else p1
		
		if Current then
			UseStateResult2(Current[PropertyName])
		end
	end, { p1, PropertyName })
	ReactModule.useEffect(function() --[[ Line: 66 ]]
		-- upvalues: p1 (copy), PropertyName (copy), UseResult (copy)
		local Connection = nil
		local Current = if typeof(p1) == "table" then p1.current else p1
		
		if Current then
			Connection = Current:GetPropertyChangedSignal(PropertyName):Connect(UseResult)
			UseResult()
		end
		return function() --[[ Line: 76 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { Current, PropertyName, UseResult })
	
	return UseStateResult
end