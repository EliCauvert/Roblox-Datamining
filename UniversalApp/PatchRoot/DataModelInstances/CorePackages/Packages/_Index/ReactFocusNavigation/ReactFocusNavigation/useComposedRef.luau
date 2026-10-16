local ReactModule = require(script.Parent.Parent.React)

local function _(Callback: (any) -> (), Current) --[[ Line: 8 | Named "forwardRefValue" ]]
	if type(Callback) == "function" then
		Callback(Current)
		
		return
	end
	if type(Callback) == "table" then
		Callback.current = Current
	end
end

return function(Callback, Callback1) --[[ Line: 21 | Named "useComposedRef" ]]
	-- upvalues: ReactModule (copy)
	return (ReactModule.useCallback(function(Current) --[[ Line: 22 ]]
		-- upvalues: Callback (copy), Callback1 (copy)
		if type(Callback) == "function" then
			Callback(Current)
		elseif type(Callback) == "table" then
			Callback.current = Current
		end
		if type(Callback1) == "function" then
			Callback1(Current)
			
			return
		end
		if type(Callback1) == "table" then
			Callback1.current = Current
		end
	end, { Callback, Callback1 }))
end