local symbolsModule = require(script.Parent.symbols)
local spyModule = require(script.Parent.Spy)
local setReturnValueModule = require(script.Parent.setReturnValue)
local setSideEffectModule = require(script.Parent.setSideEffect)

local function _(p0, p1)
	-- upvalues: symbolsModule (ref)
	local spec = p0[symbolsModule.Spec]
	
	if spec then
		local ok, status = pcall(function()
			-- upvalues: spec (ref), p1 (ref)
			return spec[p1]
		end)
		
		return ok and status
	end
	return true
end

local t = { is = require(script.Parent.isAMagicMock) }
local t_1 = {
	__tostring = function(p2)
		-- upvalues: symbolsModule (ref)
		local var15 = getmetatable(p2)
		local list = { "id=" .. var15[symbolsModule.Address] }
		local name = var15[symbolsModule.Name]
		
		if name ~= nil and name ~= "mock" then
			table.insert(list, "name=" .. name)
		end
		return "<MagicMock " .. table.concat(list, " ") .. ">"
	end,
	__index = function(p3, p4)
		-- upvalues: symbolsModule (ref), t (ref)
		local status_1
		local var17 = getmetatable(p3)
		local spec = var17[symbolsModule.Spec]
		
		if spec then
			local ok, status = pcall(function()
				-- upvalues: spec (ref), p4 (ref)
				return spec[p4]
			end)
			status_1 = ok and status
		else
			status_1 = true
		end
		if not status_1 then
			error(string.format("MagicMock Error: Cannot index key %q since it is out of spec.", tostring(p4)))
		end
		local var19 = var17[symbolsModule.Children][p4]
		
		if var19 == nil then
			var19 = t.new({ name = var17[symbolsModule.Name] .. "." .. tostring(p4) })
			var17[symbolsModule.Children][p4] = var19
			
			return var19
		end
		return if var19 == symbolsModule.None then nil else var19
	end,
	__newindex = function(p5, p6, p7)
		-- upvalues: symbolsModule (ref), spyModule (ref)
		local status_1
		local var20 = getmetatable(p5)
		local spec = var20[symbolsModule.Spec]
		
		if spec then
			local ok, status = pcall(function()
				-- upvalues: spec (ref), p6 (ref)
				return spec[p6]
			end)
			status_1 = ok and status
		else
			status_1 = true
		end
		if not status_1 then
			error(string.format("MagicMock Error: Cannot write key %q since it is out of spec", tostring(p6)))
		end
		if type(p7) == "function" then
			local _, var22 = spyModule.new(p7)
			p7 = var22
		elseif p7 == nil then
			p7 = symbolsModule.None
		end
		if p6 == symbolsModule.ReturnValue then
			var20[symbolsModule.ReturnValue] = { p7, n = 1 }
			
			return
		end
		var20[symbolsModule.Children][p6] = p7
	end
}

local _ = function(p8)
	-- upvalues: symbolsModule (ref), t (ref)
	if type(p8) == "table" and p8[symbolsModule.isTuple] then
		return not t.is(p8)
	end
end

local function getReturnValue(p9, ...)
	-- upvalues: symbolsModule (ref), spyModule (ref), t (ref)
	if p9[symbolsModule.ReturnValue] then
		return p9[symbolsModule.ReturnValue]
	end
	local sideEffect = p9[symbolsModule.SideEffect]
	
	if sideEffect then
		sideEffect.calls += 1
		
		if type(sideEffect.value) == "function" or spyModule.is(sideEffect.value) then
			return { sideEffect.value(...) }
		elseif type(sideEffect.value) == "table" then
			local calls = sideEffect.calls
			local _ = nil
			local value = sideEffect.value
			local var23 = if if type(value) == "table" and value[symbolsModule.isTuple] then not t.is(value) else nil then sideEffect.value.values[calls] else sideEffect.value[calls]
			
			if var23 then
				return { var23 }
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
	local var24 = getmetatable(self)
	local t_1 = {
		args = table.pack(...),
		result = getReturnValue(var24, ...)
	}
	
	if t_1.result == nil then
		t_1.result = {
			t.new({ name = var24[symbolsModule.Name] .. "()" }),
			n = 1
		}
		var24[symbolsModule.ReturnValue] = t_1.result
	elseif t_1.result == symbolsModule.None then
		t_1.result = { n = 1 }
	else
		local var26 = t_1.result[1]
		
		if if type(var26) == "table" and var26[symbolsModule.isTuple] then not t.is(var26) else nil then
			t_1.result = t_1.result[1].values
		end
	end
	table.insert(var24[symbolsModule.Calls], t_1)
	
	return table.unpack(t_1.result)
end

local _ = function(p10)
	-- upvalues: symbolsModule (ref), t (ref)
	return function(p11, p12)
		-- upvalues: p10 (ref), symbolsModule (copy), t (copy)
		local var27, formattedText
		local _ = nil
		local _ = nil
		
		if type(p11) == "string" or not getmetatable(p11) then
			var27 = getmetatable(p12)
			formattedText = string.format("__r_%s()", p10)
		else
			var27 = getmetatable(p11)
			formattedText = string.format("__%s()", p10)
		end
		local var29 = var27[symbolsModule.Operations][formattedText]
		
		if var29 == nil then
			local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
			var27[symbolsModule.Operations][formattedText] = var30
			
			return var30
		end
		return var29
	end
end

local var7 = "add"

function t_1:__add(p13)
	-- upvalues: var7 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p13)
		formattedText = string.format("__r_%s()", var7)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var7)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var8 = "sub"

function t_1:__sub(p14)
	-- upvalues: var8 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p14)
		formattedText = string.format("__r_%s()", var8)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var8)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var9 = "div"

function t_1:__div(p15)
	-- upvalues: var9 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p15)
		formattedText = string.format("__r_%s()", var9)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var9)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var10 = "mul"

function t_1:__mul(p16)
	-- upvalues: var10 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p16)
		formattedText = string.format("__r_%s()", var10)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var10)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var11 = "mod"

function t_1:__mod(p17)
	-- upvalues: var11 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p17)
		formattedText = string.format("__r_%s()", var11)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var11)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var12 = "pow"

function t_1:__pow(p18)
	-- upvalues: var12 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p18)
		formattedText = string.format("__r_%s()", var12)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var12)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var13 = "neg"

function t_1:__unm(p19)
	-- upvalues: var13 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p19)
		formattedText = string.format("__r_%s()", var13)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var13)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

local var14 = "concat"

function t_1:__concat(p20)
	-- upvalues: var14 (ref), symbolsModule (ref), t (ref)
	local var27, formattedText
	local _ = nil
	local _ = nil
	
	if type(self) == "string" or not getmetatable(self) then
		var27 = getmetatable(p20)
		formattedText = string.format("__r_%s()", var14)
	else
		var27 = getmetatable(self)
		formattedText = string.format("__%s()", var14)
	end
	local var29 = var27[symbolsModule.Operations][formattedText]
	
	if var29 == nil then
		local var30 = t.new({ name = var27[symbolsModule.Name] .. "." .. formattedText })
		var27[symbolsModule.Operations][formattedText] = var30
		
		return var30
	end
	return var29
end

function t.new(p21)
	-- upvalues: symbolsModule (ref), t_1 (ref), setReturnValueModule (ref), setSideEffectModule (ref)
	p21 = p21 or {}
	
	local function _()
		-- upvalues: p21 (write)
		return if p21.name then p21.name elseif p21.spec then tostring(p21.spec) else "mock"
	end
	
	local t = {}
	local t_2 = {
		[symbolsModule.isMagicMock] = true,
		[symbolsModule.Address] = tostring(t),
		[symbolsModule.Name] = if p21.name then p21.name elseif p21.spec then tostring(p21.spec) else "mock",
		[symbolsModule.Operations] = {},
		[symbolsModule.Calls] = {},
		[symbolsModule.Children] = {},
		[symbolsModule.Spec] = p21.spec or nil,
		[symbolsModule.ReturnValue] = nil,
		[symbolsModule.SideEffect] = nil
	}
	
	for i, v in pairs(t_1) do
		t_2[i] = v
	end
	local tbl = setmetatable(t, t_2)
	
	if p21.returnValue then
		setReturnValueModule(tbl, p21.returnValue)
	end
	if p21.sideEffect then
		setSideEffectModule(tbl, p21.sideEffect)
	end
	return tbl
end

function t.is(p22)
	-- upvalues: symbolsModule (ref)
	local var34 = getmetatable(p22)
	
	return if var34 then var34[symbolsModule.isMagicMock] ~= nil else false
end

return t