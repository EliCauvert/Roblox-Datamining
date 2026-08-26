local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local t = {}
local t_1 = {}
local var1 = if reactGlobalsModule.__DEV__ then {} else nil
local var2 = 0

return {
	createCursor = function(p1)
		return { current = p1 }
	end,
	isEmpty = function()
		-- upvalues: var2 (write)
		return var2 == 0
	end,
	pop = function(p1, p2)
		-- upvalues: var2 (write), reactGlobalsModule (ref), console (ref), var1 (write), t_1 (ref), t (ref)
		if var2 < 1 then
			if reactGlobalsModule.__DEV__ then
				console.error("Unexpected pop.")
			end
			return
		elseif reactGlobalsModule.__DEV__ and p2 ~= var1[var2] then
			console.error("Unexpected Fiber popped.")
		end
		local var3 = t_1[var2]
		
		if var3 == t then
			p1.current = nil
		else
			p1.current = var3
		end
		t_1[var2] = nil
		
		if reactGlobalsModule.__DEV__ then
			var1[var2] = nil
		end
		var2 -= 1
	end,
	push = function(p1, p2, p3)
		-- upvalues: var2 (write), t_1 (ref), t (ref), reactGlobalsModule (ref), var1 (write)
		var2 += 1
		local current = p1.current
		
		if current == nil then
			t_1[var2] = t
		else
			t_1[var2] = current
		end
		if reactGlobalsModule.__DEV__ then
			var1[var2] = p3
		end
		p1.current = p2
	end,
	checkThatStackIsEmpty = function()
		-- upvalues: reactGlobalsModule (ref), var2 (write), console (ref)
		if reactGlobalsModule.__DEV__ and var2 ~= 0 then
			console.error("Expected an empty stack. Something was not reset properly.")
		end
	end,
	resetStackAfterFatalErrorInDev = function()
		-- upvalues: reactGlobalsModule (ref), var2 (write), t_1 (ref), var1 (write)
		if reactGlobalsModule.__DEV__ then
			var2 = 0
			table.clear(t_1)
			table.clear(var1)
		end
	end
}