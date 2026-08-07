local asFocusableModule = require(script.Parent.asFocusable)

local function checkHostProperties(p0) --[[ line: 3 ]]
	assert(Instance.new(p0):IsA("GuiObject"))
end

local function _(p1) --[[ line: 9 | named "isValidFocusable" ]]
	-- upvalues: checkHostProperties (ref)
	local var2 = typeof(p1)
	
	if var2 == "string" then
		local ok, _ = pcall(checkHostProperties, p1)
		
		return ok
	end
	return var2 == "function" or var2 == "table"
end

return function() --[[ line: 25 | named "createFocusableCache" ]]
	-- upvalues: checkHostProperties (ref), asFocusableModule (ref)
	local t = {}
	setmetatable(t, {
		__index = function(_, p2) --[[ line: 29 ]]
			-- upvalues: checkHostProperties (copy), asFocusableModule (copy), t (ref)
			local var5
			local var4 = typeof(p2)
			
			if var4 == "string" then
				local ok, _ = pcall(checkHostProperties, p2)
				var5 = ok
			elseif var4 ~= "function" then
				var5 = var4 ~= "table"
			end
			if not var5 then
				error("Component " .. tostring(p2) .. " (" .. typeof(p2) .. ") is not a valid focusable component", 2)
			end
			local var6 = asFocusableModule(p2)
			t[p2] = var6
			
			return var6
		end,
		__tostring = function(p3) --[[ line: 39 ]]
			local var7 = "{"
			
			for i, v in pairs(p3) do
				var7 = ("%s\n\t%s -> %s"):format(var7, tostring(i), tostring(v))
			end
			return var7 .. "\n}"
		end
	})
	
	return t
end