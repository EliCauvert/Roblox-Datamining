local function _(p0)
	local var15 = newproxy(true)
	p0 = ("Mocks.%s"):format(p0)
	
	getmetatable(var15).__tostring = function()
		-- upvalues: p0 (write)
		return p0
	end
	
	return var15
end

local t = {}
local var1 = newproxy(true)
local calls = ("Mocks.%s"):format("Calls")

getmetatable(var1).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Calls = var1
local var3 = newproxy(true)
calls = ("Mocks.%s"):format("Children")

getmetatable(var3).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Children = var3
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
local var6 = newproxy(true)
calls = ("Mocks.%s"):format("Name")

getmetatable(var6).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Name = var6
local var7 = newproxy(true)
calls = ("Mocks.%s"):format("Address")

getmetatable(var7).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Address = var7
local var8 = newproxy(true)
calls = ("Mocks.%s"):format("Operations")

getmetatable(var8).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Operations = var8
local var9 = newproxy(true)
calls = ("Mocks.%s"):format("Spec")

getmetatable(var9).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.Spec = var9
local var10 = newproxy(true)
calls = ("Mocks.%s"):format("SideEffect")

getmetatable(var10).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.SideEffect = var10
local var11 = newproxy(true)
calls = ("Mocks.%s"):format("isSpy")

getmetatable(var11).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isSpy = var11
local var12 = newproxy(true)
calls = ("Mocks.%s"):format("isTuple")

getmetatable(var12).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isTuple = var12
local var13 = newproxy(true)
calls = ("Mocks.%s"):format("isMagicMock")

getmetatable(var13).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isMagicMock = var13
local var14 = newproxy(true)
calls = ("Mocks.%s"):format("isPredicate")

getmetatable(var14).__tostring = function()
	-- upvalues: calls (write)
	return calls
end

t.isPredicate = var14

return t