local function _(p1) --[[ Line: 1 | Named "newSymbol" ]]
	local Proxy = newproxy(true)
	local MocksName: string = ("Mocks.%s"):format(p1)
	
	getmetatable(Proxy).__tostring = function() --[[ Line: 4 ]]
		-- upvalues: MocksName (ref)
		return MocksName
	end
	
	return Proxy
end

local Proxy = newproxy(true)
local MocksName: string = ("Mocks.%s"):format("Calls")

getmetatable(Proxy).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName (ref)
	return MocksName
end

local Proxy1 = newproxy(true)
local MocksName1: string = ("Mocks.%s"):format("Children")

getmetatable(Proxy1).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName1 (ref)
	return MocksName1
end

local Proxy2 = newproxy(true)
local MocksName2: string = ("Mocks.%s"):format("Lock")

getmetatable(Proxy2).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName2 (ref)
	return MocksName2
end

local Proxy3 = newproxy(true)
local MocksName3: string = ("Mocks.%s"):format("None")

getmetatable(Proxy3).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName3 (ref)
	return MocksName3
end

local Proxy4 = newproxy(true)
local MocksName4: string = ("Mocks.%s"):format("ReturnValue")

getmetatable(Proxy4).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName4 (ref)
	return MocksName4
end

return {
	Calls = Proxy,
	Children = Proxy1,
	Lock = Proxy2,
	None = Proxy3,
	ReturnValue = Proxy4
}