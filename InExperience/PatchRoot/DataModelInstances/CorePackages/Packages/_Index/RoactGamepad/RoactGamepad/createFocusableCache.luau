local AsFocusableModule = require(script.Parent.asFocusable)

local function checkHostProperties(p1) --[[ Line: 3 ]]
	assert(Instance.new(p1):IsA("GuiObject"))
end

local function _(p1) --[[ Line: 9 | Named "isValidFocusable" ]]
	-- upvalues: checkHostProperties (copy)
	local ValueType = typeof(p1)
	
	if ValueType == "string" then
		local Success, _ = pcall(checkHostProperties, p1)
		
		return Success
	else
		return ValueType == "function" or ValueType == "table"
	end
end

return function() --[[ Line: 25 | Named "createFocusableCache" ]]
	-- upvalues: checkHostProperties (copy), AsFocusableModule (copy)
	local t = {}
	setmetatable(t, {
		__index = function(_, Key) --[[ Line: 29 ]]
			-- upvalues: checkHostProperties (upval), AsFocusableModule (upval), t (copy)
			local ValueType = typeof(Key)
			local Success = nil
			
			if ValueType == "string" then
				local _
				Success, _ = pcall(checkHostProperties, Key)
			else
				Success = ValueType == "function" or ValueType == "table"
			end
			if not Success then
				error("Component " .. tostring(Key) .. " (" .. typeof(Key) .. ") is not a valid focusable component", 2)
			end
			local AsFocusableModuleResult = AsFocusableModule(Key)
			t[Key] = AsFocusableModuleResult
			
			return AsFocusableModuleResult
		end,
		__tostring = function(List): string --[[ Line: 39 ]]
			local Message = "{"
			
			for i, value in pairs(List) do
				Message = ("%s\n\t%s -> %s"):format(Message, tostring(i), (tostring(value)))
			end
			return Message .. "\n}"
		end
	})
	
	return t
end