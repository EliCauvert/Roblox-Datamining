local symbolsModule = require(script.Parent.symbols)
local spyModule = require(script.Parent.Spy)
local setReturnValueModule = require(script.Parent.setReturnValue)
local setSideEffectModule = require(script.Parent.setSideEffect)

local function _(p1, p2)
	-- upvalues: symbolsModule (ref)
	local spec = p1[symbolsModule.Spec]
	
	if spec then
		local ok, status = pcall(function()
			-- upvalues: spec (ref), p2 (ref)
			return spec[p2]
		end)
		
		return ok and status
	end
	return true
end

local t = { is = require(script.Parent.isAMagicMock) }
local t_1 = {
	__tostring = function(p1)
		-- upvalues: symbolsModule (ref)
		local var1 = getmetatable(p1)
		local list = { "id=" .. var15[symbolsModule.Address] }
		local name = var1[symbolsModule.Name]
		
		if name ~= nil and name ~= "mock" then
			table.insert(list, "name=" .. name)
		end
		return "<MagicMock " .. table.concat(list, " ") .. ">"
	end,
	__index = function(p1, p2)
		-- upvalues: symbolsModule (ref), t (ref)
		local status_1
		local var1 = getmetatable(p1)
		local spec = var1[symbolsModule.Spec]
		
		if spec then
			local ok, status = pcall(function()
				-- upvalues: spec (ref), p2 (ref)
				return spec[p2]
			end)
			status_1 = ok and status
		else
			status_1 = true
		end
		if not status_1 then
			error(string.format("MagicMock Error: Cannot index key %q since it is out of spec.", tostring(p2)))
		end
		local var2 = var1[symbolsModule.Children][p2]
		
		if var2 == nil then
			var2 = t.new({ name = var1[symbolsModule.Name] .. "." .. tostring(p2) })
			var1[symbolsModule.Children][p2] = var2
			
			return var2
		end
		return if var2 == symbolsModule.None then nil else var2
	end,
	__newindex = function(p1, p2, p3)
		-- upvalues: symbolsModule (ref), spyModule (ref)
		local status_1
		local var1 = getmetatable(p1)
		local spec = var1[symbolsModule.Spec]
		
		if spec then
			local ok, status = pcall(function()
				-- upvalues: spec (ref), p2 (ref)
				return spec[p2]
			end)
			status_1 = ok and status
		else
			status_1 = true
		end
		if not status_1 then
			error(string.format("MagicMock Error: Cannot write key %q since it is out of spec", tostring(p2)))
		end
		if type(p3) == "function" then
			local _, var2 = spyModule.new(p3)
			p3 = var2
		elseif p3 == nil then
			p3 = symbolsModule.None
		end
		if p2 == symbolsModule.ReturnValue then
			var1[symbolsModule.ReturnValue] = { p3, n = 1 }
			
			return
		end
		var1[symbolsModule.Children][p2] = p3
	end
}

local _ = function(p1)
	-- upvalues: symbolsModule (ref), t (ref)
	if type(p1) == "table" and p1[symbolsModule.isTuple] then
		return not t.is(p1)
	end
end

local function getReturnValue(p1, ...)
	-- upvalues: symbolsModule (ref), spyModule (ref), t (ref)
	if p1[symbolsModule.ReturnValue] then
		return p1[symbolsModule.ReturnValue]
	end
	local sideEffect = p1[symbolsModule.SideEffect]
	
	if sideEffect then
		sideEffect.calls += 1
		
		if type(sideEffect.value) == "function" or spyModule.is(sideEffect.value) then
			return { sideEffect.value(...) }
		elseif type(sideEffect.value) == "table" then
			local calls = sideEffect.calls
			local _ = nil
			local value = sideEffect.value
			local var1 = if if type(value) == "table" and value[symbolsModule.isTuple] then not t.is(value) else nil then sideEffect.value.values[calls] else sideEffect.value[calls]
			
			if var1 then
				return { var1 }
			end
			error("MagicMock Error: SideEffect iteration reached")
		else
			error("MagicMock Error: Invalid SideEffect")
		end
	end
	return nil
end

function t_1:__call(...)
	-- upvalues: getReturnValue (ref), t (ref), symbolsModule (ref)
	local var1 = getmetatable(self)
	local t_1 = {
		args = table.pack(...),
		result = getReturnValue(var1, ...)
	}
	
	if t_1.result == nil then
		t_1.result = {
			t.new({ name = var1[symbolsModule.Name] .. "()" }),
			n = 1
		}
		var1[symbolsModule.ReturnValue] = t_1.result
	elseif t_1.result == symbolsModule.None then
		t_1.result = { n = 1 }
	else
		local var2 = t_1.result[1]
		
		if if type(var2) == "table" and var2[symbolsModule.isTuple] then not t.is(var2) else nil then
			t_1.result = t_1.result[1].values
		end
	end
	table.insert(var1[symbolsModule.Calls], t_1)
	
	return table.unpack(t_1.result)
end

local _ = function(p1)
	-- upvalues: symbolsModule (ref), t (ref)
	return function(p2, p3)
		-- upvalues: p1 (ref), symbolsModule (copy), t (copy)
		local var1, formattedText
		local _ = nil
		local _ = nil
		
		if type(p2) == "string" or not getmetatable(p2) then
			var1 = getmetatable(p3)
			formattedText = string.format("__r_%s()", p1)
		else
			var1 = getmetatable(p2)
			formattedText = string.format("__%s()", p1)
		end
		local var2 = var1[symbolsModule.Operations][formattedText]
		
		if var2 == nil then
			local var3 = t.new({ name = var1[symbolsModule.Name] .. "." .. formattedText })
			var1[symbolsModule.Operations][formattedText] = var3
			
			return var3
		end
		return var2
	end
end

local var1 = "add"

function t_1:__add(p1)
	-- upvalues: var1 (ref), symbolsModule (ref), t (ref)
	local var2, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var2 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var1)
	else
		var2 = getmetatable(self)
		formattedText = string.format("__%s()", var1)
	end
	local var3 = var2[symbolsModule.Operations][formattedText]
	
	if var3 == nil then
		local var4 = t.new({ name = var2[symbolsModule.Name] .. "." .. formattedText })
		var2[symbolsModule.Operations][formattedText] = var4
		
		return var4
	end
	return var3
end

local var2 = "sub"

function t_1:__sub(p1)
	-- upvalues: var2 (ref), symbolsModule (ref), t (ref)
	local var3, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var3 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var2)
	else
		var3 = getmetatable(self)
		formattedText = string.format("__%s()", var2)
	end
	local var4 = var3[symbolsModule.Operations][formattedText]
	
	if var4 == nil then
		local var5 = t.new({ name = var3[symbolsModule.Name] .. "." .. formattedText })
		var3[symbolsModule.Operations][formattedText] = var5
		
		return var5
	end
	return var4
end

local var3 = "div"

function t_1:__div(p1)
	-- upvalues: var3 (ref), symbolsModule (ref), t (ref)
	local var4, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var4 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var3)
	else
		var4 = getmetatable(self)
		formattedText = string.format("__%s()", var3)
	end
	local var5 = var4[symbolsModule.Operations][formattedText]
	
	if var5 == nil then
		local var6 = t.new({ name = var4[symbolsModule.Name] .. "." .. formattedText })
		var4[symbolsModule.Operations][formattedText] = var6
		
		return var6
	end
	return var5
end

local var4 = "mul"

function t_1:__mul(p1)
	-- upvalues: var4 (ref), symbolsModule (ref), t (ref)
	local var5, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var5 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var4)
	else
		var5 = getmetatable(self)
		formattedText = string.format("__%s()", var4)
	end
	local var6 = var5[symbolsModule.Operations][formattedText]
	
	if var6 == nil then
		local var7 = t.new({ name = var5[symbolsModule.Name] .. "." .. formattedText })
		var5[symbolsModule.Operations][formattedText] = var7
		
		return var7
	end
	return var6
end

local var5 = "mod"

function t_1:__mod(p1)
	-- upvalues: var5 (ref), symbolsModule (ref), t (ref)
	local var6, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var6 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var5)
	else
		var6 = getmetatable(self)
		formattedText = string.format("__%s()", var5)
	end
	local var7 = var6[symbolsModule.Operations][formattedText]
	
	if var7 == nil then
		local var8 = t.new({ name = var6[symbolsModule.Name] .. "." .. formattedText })
		var6[symbolsModule.Operations][formattedText] = var8
		
		return var8
	end
	return var7
end

local var6 = "pow"

function t_1:__pow(p1)
	-- upvalues: var6 (ref), symbolsModule (ref), t (ref)
	local var7, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var7 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var6)
	else
		var7 = getmetatable(self)
		formattedText = string.format("__%s()", var6)
	end
	local var8 = var7[symbolsModule.Operations][formattedText]
	
	if var8 == nil then
		local var9 = t.new({ name = var7[symbolsModule.Name] .. "." .. formattedText })
		var7[symbolsModule.Operations][formattedText] = var9
		
		return var9
	end
	return var8
end

local var7 = "neg"

function t_1:__unm(p1)
	-- upvalues: var7 (ref), symbolsModule (ref), t (ref)
	local var8, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var8 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var7)
	else
		var8 = getmetatable(self)
		formattedText = string.format("__%s()", var7)
	end
	local var9 = var8[symbolsModule.Operations][formattedText]
	
	if var9 == nil then
		local var10 = t.new({ name = var8[symbolsModule.Name] .. "." .. formattedText })
		var8[symbolsModule.Operations][formattedText] = var10
		
		return var10
	end
	return var9
end

local var8 = "concat"

function t_1:__concat(p1)
	-- upvalues: var8 (ref), symbolsModule (ref), t (ref)
	local var9, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var9 = getmetatable(p1)
		formattedText = string.format("__r_%s()", var8)
	else
		var9 = getmetatable(self)
		formattedText = string.format("__%s()", var8)
	end
	local var10 = var9[symbolsModule.Operations][formattedText]
	
	if var10 == nil then
		local var11 = t.new({ name = var9[symbolsModule.Name] .. "." .. formattedText })
		var9[symbolsModule.Operations][formattedText] = var11
		
		return var11
	end
	return var10
end

function t.new(p1)
	-- upvalues: symbolsModule (ref), t_1 (ref), setReturnValueModule (ref), setSideEffectModule (ref)
	p1 = p1 or {}
	
	local function _()
		-- upvalues: p1 (write)
		return if p1.name then p1.name elseif p1.spec then tostring(p1.spec) else "mock"
	end
	
	local t = {}
	local t_2 = {
		[symbolsModule.isMagicMock] = true,
		[symbolsModule.Address] = tostring(t),
		[symbolsModule.Name] = if p1.name then p1.name elseif p1.spec then tostring(p1.spec) else "mock",
		[symbolsModule.Operations] = {},
		[symbolsModule.Calls] = {},
		[symbolsModule.Children] = {},
		[symbolsModule.Spec] = p1.spec or nil,
		[symbolsModule.ReturnValue] = nil,
		[symbolsModule.SideEffect] = nil
	}
	
	for i, v in pairs(t_1) do
		t_2[i] = v
	end
	local tbl = setmetatable(t, t_2)
	
	if p1.returnValue then
		setReturnValueModule(tbl, p1.returnValue)
	end
	if p1.sideEffect then
		setSideEffectModule(tbl, p1.sideEffect)
	end
	return tbl
end

function t.is(p2)
	-- upvalues: symbolsModule (ref)
	local var9 = getmetatable(p2)
	
	return if var9 then var9[symbolsModule.isMagicMock] ~= nil else false
end

return t