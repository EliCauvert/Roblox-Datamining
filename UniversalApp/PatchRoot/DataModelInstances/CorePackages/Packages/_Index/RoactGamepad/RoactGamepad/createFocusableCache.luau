local asFocusableModule = require(script.Parent.asFocusable)

local function checkHostProperties(p1)
	assert(Instance.new(p1):IsA("GuiObject"))
end

local function _(p1)
	-- upvalues: checkHostProperties (ref)
	local var1 = typeof(p1)
	
	if var1 == "string" then
		local ok, _ = pcall(checkHostProperties, p1)
		
		return ok
	end
	return var1 == "function" or var1 == "table"
end

return function()
	-- upvalues: checkHostProperties (ref), asFocusableModule (ref)
	local t = {}
	setmetatable(t, {
		__index = function(_, p1)
			-- upvalues: checkHostProperties (copy), asFocusableModule (copy), t (ref)
			local var1
			local var2 = typeof(p1)
			
			if var2 == "string" then
				local ok, _ = pcall(checkHostProperties, p1)
				var1 = ok
			elseif var2 ~= "function" then
				var1 = var2 ~= "table"
			end
			if not var1 then
				error("Component " .. tostring(p1) .. " (" .. typeof(p1) .. ") is not a valid focusable component", 2)
			end
			local var3 = asFocusableModule(p1)
			t[p1] = var3
			
			return var3
		end,
		__tostring = function(p1)
			local var1 = "{"
			
			for i, v in pairs(p1) do
				var1 = ("%s\n\t%s -> %s"):format(var1, tostring(i), tostring(v))
			end
			return var1 .. "\n}"
		end
	})
	
	return t
end