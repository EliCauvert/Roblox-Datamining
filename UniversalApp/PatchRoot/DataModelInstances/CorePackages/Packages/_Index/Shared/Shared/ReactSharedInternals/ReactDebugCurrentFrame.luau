local reactGlobalsModule = require(script.Parent.Parent.Parent.ReactGlobals)
local t = {}
local var2 = nil

function t.setExtraStackFrame(value) --[[ line: 19 ]]
	-- upvalues: reactGlobalsModule (ref), var2 (write)
	if reactGlobalsModule.__DEV__ then
		var2 = value
	end
end

if reactGlobalsModule.__DEV__ then
	t.getCurrentStack = nil
	
	function t.getStackAddendum() --[[ line: 36 ]]
		-- upvalues: var2 (write), t (ref)
		local var3 = ""
		
		if var2 then
			var3 ..= var2
		end
		local getCurrentStack = t.getCurrentStack
		
		if getCurrentStack then
			var3 ..= getCurrentStack() or ""
		end
		return var3
	end
end
return t