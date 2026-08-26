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
calls = ("Mocks.%s"):format("None")

getmetatable(var3).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.None = var3
local var4 = newproxy(true)
calls = ("Mocks.%s"):format("ReturnValue")

getmetatable(var4).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.ReturnValue = var4
local var5 = newproxy(true)
calls = ("Mocks.%s"):format("Name")

getmetatable(var5).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Name = var5
local var6 = newproxy(true)
calls = ("Mocks.%s"):format("Address")

getmetatable(var6).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Address = var6
local var7 = newproxy(true)
calls = ("Mocks.%s"):format("Operations")

getmetatable(var7).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Operations = var7
local var8 = newproxy(true)
calls = ("Mocks.%s"):format("Spec")

getmetatable(var8).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Spec = var8
local var9 = newproxy(true)
calls = ("Mocks.%s"):format("SideEffect")

getmetatable(var9).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.SideEffect = var9
local var10 = newproxy(true)
calls = ("Mocks.%s"):format("isSpy")

getmetatable(var10).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isSpy = var10
local var11 = newproxy(true)
calls = ("Mocks.%s"):format("isTuple")

getmetatable(var11).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isTuple = var11
local var12 = newproxy(true)
calls = ("Mocks.%s"):format("isMagicMock")

getmetatable(var12).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isMagicMock = var12
local var13 = newproxy(true)
calls = ("Mocks.%s"):format("isPredicate")

getmetatable(var13).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isPredicate = var13

return t