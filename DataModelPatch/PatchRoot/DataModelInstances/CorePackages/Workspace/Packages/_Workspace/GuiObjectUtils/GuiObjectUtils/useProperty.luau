local ReactModule = require(script:FindFirstAncestor("GuiObjectUtils").Parent.React)

local function _(p1)
	return if typeof(p1) == "table" then p1.current else p1
end

return function(p1, PropertyName)
	-- upvalues: ReactModule (copy)
	local Current = if typeof(p1) == "table" then p1.current else p1
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: Current (copy), PropertyName (copy)
		return if Current then Current[PropertyName] else nil
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), PropertyName (copy), UseStateResult2 (copy)
		local Current = if typeof(p1) == "table" then p1.current else p1
		
		if Current then
			UseStateResult2(Current[PropertyName])
		end
	end, { p1, PropertyName })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), PropertyName (copy), UseResult (copy)
		local Connection = nil
		local Current = if typeof(p1) == "table" then p1.current else p1
		
		if Current then
			Connection = Current:GetPropertyChangedSignal(PropertyName):Connect(UseResult)
			UseResult()
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { Current, PropertyName, UseResult })
	
	return UseStateResult
end