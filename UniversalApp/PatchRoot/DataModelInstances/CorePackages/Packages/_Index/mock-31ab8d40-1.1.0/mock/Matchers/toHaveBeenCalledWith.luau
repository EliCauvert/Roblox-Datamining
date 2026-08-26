local parent = script.Parent.Parent
local magicMockModule = require(parent.MagicMock)
local spyModule = require(parent.Spy)
local anyCallMatchesModule = require(parent.AnyCallMatches)
local fmtArgsModule = require(parent.fmtArgs)
local symbolsModule = require(parent.symbols)

local function _(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		return p2 == p1
	end
end

local _ = function(p1)
	-- upvalues: symbolsModule (ref), magicMockModule (ref)
	if type(p1) == "table" and p1[symbolsModule.isPredicate] then
		return not magicMockModule.is(p1)
	end
end

return function(p1, ...)
	-- upvalues: magicMockModule (ref), spyModule (ref), symbolsModule (ref), anyCallMatchesModule (ref), fmtArgsModule (ref)
	if not magicMockModule.is(p1) and not spyModule.is(p1) then
		return {
			pass = false,
			message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalledWith is used. Given %s instead", tostring(p1))
		}
	end
	local packed = table.pack(...)
	local t = {}
	
	for i, v in ipairs(packed) do
		if if type(v) == "table" and v[symbolsModule.isPredicate] then not magicMockModule.is(v) else nil then
			table.insert(t, v.predicate)
		else
			table.insert(t, function(p2)
				-- upvalues: v (ref)
				return p2 == v
			end)
		end
	end
	local var1, var2 = anyCallMatchesModule.predicates(p1, table.unpack(t))
	
	return {
		pass = var1,
		message = var1 and string.format("Expected %s to never have been called with args: %s", tostring(p1), fmtArgsModule(packed)) or string.format("Expected %s to have been called with args: %s", tostring(p1), var2)
	}
end