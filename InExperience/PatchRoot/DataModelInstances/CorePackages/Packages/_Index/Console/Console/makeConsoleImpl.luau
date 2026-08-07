local inspect = require(script.Parent.Parent.Collections).inspect

return function() --[[ line: 22 ]]
	-- upvalues: inspect (ref)
	local t = {}
	local var1 = 0
	
	local function _() --[[ line: 26 | named "indent" ]]
		-- upvalues: var1 (write)
		return string.rep("  ", var1)
	end
	
	function t.log(p0, ...) --[[ line: 30 ]]
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p0) == "string" then string.format(p0, ...) else inspect(p0)))
	end
	
	function t.debug(p1, ...) --[[ line: 40 ]]
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p1) == "string" then string.format(p1, ...) else inspect(p1)))
	end
	
	function t.info(p2, ...) --[[ line: 50 ]]
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p2) == "string" then string.format(p2, ...) else inspect(p2)))
	end
	
	function t.warn(p3, ...) --[[ line: 60 ]]
		-- upvalues: inspect (copy), var1 (write)
		warn(string.rep("  ", var1) .. (if typeof(p3) == "string" then string.format(p3, ...) else inspect(p3)))
	end
	
	function t.error(p4, ...) --[[ line: 70 ]]
		-- upvalues: inspect (copy), var1 (write)
		warn(string.rep("  ", var1) .. (if typeof(p4) == "string" then string.format(p4, ...) else inspect(p4)))
	end
	
	function t.group(p5, ...) --[[ line: 82 ]]
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p5) == "string" then string.format(p5, ...) else inspect(p5)))
		var1 += 1
	end
	
	function t.groupCollapsed(p6, ...) --[[ line: 93 ]]
		-- upvalues: inspect (copy), var1 (write)
		print(string.rep("  ", var1) .. (if typeof(p6) == "string" then string.format(p6, ...) else inspect(p6)))
		var1 += 1
	end
	
	function t.groupEnd() --[[ line: 105 ]]
		-- upvalues: var1 (write)
		if var1 > 0 then
			var1 -= 1
		end
	end
	
	return t
end