local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local t = {}
local t_1 = {}
local var3 = if reactGlobalsModule.__DEV__ then {} else nil
local var4 = 0

return {
	createCursor = function(p0)
		return { current = p0 }
	end,
	isEmpty = function()
		-- upvalues: var4 (write)
		return var4 == 0
	end,
	pop = function(p1, p2)
		-- upvalues: var4 (write), reactGlobalsModule (ref), console (ref), var3 (write), t_1 (ref), t (ref)
		if var4 < 1 then
			if reactGlobalsModule.__DEV__ then
				console.error("Unexpected pop.")
			end
			return
		elseif reactGlobalsModule.__DEV__ and p2 ~= var3[var4] then
			console.error("Unexpected Fiber popped.")
		end
		local var5 = t_1[var4]
		
		if var5 == t then
			p1.current = nil
		else
			p1.current = var5
		end
		t_1[var4] = nil
		
		if reactGlobalsModule.__DEV__ then
			var3[var4] = nil
		end
		var4 -= 1
	end,
	push = function(p3, p4, p5)
		-- upvalues: var4 (write), t_1 (ref), t (ref), reactGlobalsModule (ref), var3 (write)
		var4 += 1
		local current = p3.current
		
		if current == nil then
			t_1[var4] = t
		else
			t_1[var4] = current
		end
		if reactGlobalsModule.__DEV__ then
			var3[var4] = p5
		end
		p3.current = p4
	end,
	checkThatStackIsEmpty = function()
		-- upvalues: reactGlobalsModule (ref), var4 (write), console (ref)
		if reactGlobalsModule.__DEV__ and var4 ~= 0 then
			console.error("Expected an empty stack. Something was not reset properly.")
		end
	end,
	resetStackAfterFatalErrorInDev = function()
		-- upvalues: reactGlobalsModule (ref), var4 (write), t_1 (ref), var3 (write)
		if reactGlobalsModule.__DEV__ then
			var4 = 0
			table.clear(t_1)
			table.clear(var3)
		end
	end
}