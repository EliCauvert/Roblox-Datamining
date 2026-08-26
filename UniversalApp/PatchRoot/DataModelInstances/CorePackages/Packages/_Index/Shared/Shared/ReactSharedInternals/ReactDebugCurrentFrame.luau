local reactGlobalsModule = require(script.Parent.Parent.Parent.ReactGlobals)
local t = {}
local var1 = nil

function t.setExtraStackFrame(value)
	-- upvalues: reactGlobalsModule (ref), var1 (write)
	if reactGlobalsModule.__DEV__ then
		var1 = value
	end
end

if reactGlobalsModule.__DEV__ then
	t.getCurrentStack = nil
	
	function t.getStackAddendum()
		-- upvalues: var1 (write), t (ref)
		local var2 = ""
		
		if var1 then
			var2 ..= var1
		end
		local getCurrentStack = t.getCurrentStack
		
		if getCurrentStack then
			var2 ..= getCurrentStack() or ""
		end
		return var2
	end
end
return t