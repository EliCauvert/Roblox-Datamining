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
local MocksName2: string = ("Mocks.%s"):format("None")

getmetatable(Proxy2).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName2 (ref)
	return MocksName2
end

local Proxy3 = newproxy(true)
local MocksName3: string = ("Mocks.%s"):format("ReturnValue")

getmetatable(Proxy3).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName3 (ref)
	return MocksName3
end

local Proxy4 = newproxy(true)
local MocksName4: string = ("Mocks.%s"):format("Name")

getmetatable(Proxy4).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName4 (ref)
	return MocksName4
end

local Proxy5 = newproxy(true)
local MocksName5: string = ("Mocks.%s"):format("Address")

getmetatable(Proxy5).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName5 (ref)
	return MocksName5
end

local Proxy6 = newproxy(true)
local MocksName6: string = ("Mocks.%s"):format("Operations")

getmetatable(Proxy6).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName6 (ref)
	return MocksName6
end

local Proxy7 = newproxy(true)
local MocksName7: string = ("Mocks.%s"):format("Spec")

getmetatable(Proxy7).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName7 (ref)
	return MocksName7
end

local Proxy8 = newproxy(true)
local MocksName8: string = ("Mocks.%s"):format("SideEffect")

getmetatable(Proxy8).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName8 (ref)
	return MocksName8
end

local Proxy9 = newproxy(true)
local MocksName9: string = ("Mocks.%s"):format("isSpy")

getmetatable(Proxy9).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName9 (ref)
	return MocksName9
end

local Proxy10 = newproxy(true)
local MocksName10: string = ("Mocks.%s"):format("isTuple")

getmetatable(Proxy10).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName10 (ref)
	return MocksName10
end

local Proxy11 = newproxy(true)
local MocksName11: string = ("Mocks.%s"):format("isMagicMock")

getmetatable(Proxy11).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName11 (ref)
	return MocksName11
end

local Proxy12 = newproxy(true)
local MocksName12: string = ("Mocks.%s"):format("isPredicate")

getmetatable(Proxy12).__tostring = function() --[[ Line: 4 ]]
	-- upvalues: MocksName12 (ref)
	return MocksName12
end

return {
	Calls = Proxy,
	Children = Proxy1,
	None = Proxy2,
	ReturnValue = Proxy3,
	Name = Proxy4,
	Address = Proxy5,
	Operations = Proxy6,
	Spec = Proxy7,
	SideEffect = Proxy8,
	isSpy = Proxy9,
	isTuple = Proxy10,
	isMagicMock = Proxy11,
	isPredicate = Proxy12
}