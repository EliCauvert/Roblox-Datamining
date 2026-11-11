local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local _ = require(script.Parent.ReactInternalTypes)
local Current = {}
local Currents = {}
local T = if ReactGlobalsModule.__DEV__ then {} else nil
local Count = 0

return {
	createCursor = function(Current)
		return { current = Current }
	end,
	isEmpty = function(): boolean
		-- upvalues: Count (ref)
		return Count == 0
	end,
	pop = function(p1, p2)
		-- upvalues: Count (ref), ReactGlobalsModule (copy), Console (copy), T (ref), Currents (copy), Current (copy)
		if Count >= 1 then
			if ReactGlobalsModule.__DEV__ and p2 ~= T[Count] then
				Console.error("Unexpected Fiber popped.")
			end
			local Current1 = Currents[Count]
			
			if Current1 == Current then
				p1.current = nil
			else
				p1.current = Current1
			end
			Currents[Count] = nil
			
			if ReactGlobalsModule.__DEV__ then
				T[Count] = nil
			end
			Count -= 1
			
			return
		elseif ReactGlobalsModule.__DEV__ then
			Console.error("Unexpected pop.")
		end
	end,
	push = function(p1, Current1, p2)
		-- upvalues: Count (ref), Currents (copy), Current (copy), ReactGlobalsModule (copy), T (ref)
		Count += 1
		local Current2 = p1.current
		
		if Current2 == nil then
			Currents[Count] = Current
		else
			Currents[Count] = Current2
		end
		if ReactGlobalsModule.__DEV__ then
			T[Count] = p2
		end
		p1.current = Current1
	end,
	checkThatStackIsEmpty = function()
		-- upvalues: ReactGlobalsModule (copy), Count (ref), Console (copy)
		if ReactGlobalsModule.__DEV__ and Count ~= 0 then
			Console.error("Expected an empty stack. Something was not reset properly.")
		end
	end,
	resetStackAfterFatalErrorInDev = function()
		-- upvalues: ReactGlobalsModule (copy), Count (ref), Currents (copy), T (ref)
		if ReactGlobalsModule.__DEV__ then
			Count = 0
			table.clear(Currents)
			table.clear(T)
		end
	end
}