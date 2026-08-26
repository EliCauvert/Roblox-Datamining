local function _(p1)
	local var1 = newproxy(true)
	p1 = ("Mocks.%s"):format(p1)
	
	getmetatable(var1).__tostring = function()
		-- upvalues: p1 (write)
		return p1
	end
	
	return var1
end

local t = {}
local var1 = newproxy(true)
local calls = ("Mocks.%s"):format("Calls")

getmetatable(var1).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Calls = var1
local var2 = newproxy(true)
calls = ("Mocks.%s"):format("Children")

getmetatable(var2).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Children = var2
local var3 = newproxy(true)
calls = ("Mocks.%s"):format("Lock")

getmetatable(var3).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Lock = var3
local var4 = newproxy(true)
calls = ("Mocks.%s"):format("None")

getmetatable(var4).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.None = var4
local var5 = newproxy(true)
calls = ("Mocks.%s"):format("ReturnValue")

getmetatable(var5).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.ReturnValue = var5

return t