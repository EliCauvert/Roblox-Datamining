local inspect = require(script.Parent.Parent.Collections).inspect

return function()
	-- upvalues: inspect (ref)
	local t = {}
	local var1 = 0
	
	local function _()
		-- upvalues: var1 (write)
		return string.rep("  ", var1)
	end
	
	function t.log(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
	end
	
	function t.debug(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
	end
	
	function t.info(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
	end
	
	function t.warn(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		warn(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
	end
	
	function t.error(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		warn(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
	end
	
	function t.group(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
		var1 += 1
	end
	
	function t.groupCollapsed(p1, ...)
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
		var1 += 1
	end
	
	function t.groupEnd()
		-- upvalues: var1 (write)
		if var1 > 0 then
			var1 -= 1
		end
	end
	
	return t
end