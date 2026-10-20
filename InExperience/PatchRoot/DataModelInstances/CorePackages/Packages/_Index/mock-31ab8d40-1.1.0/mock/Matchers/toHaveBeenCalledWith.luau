local Parent = script.Parent.Parent
local MagicMockModule = require(Parent.MagicMock)
local SpyModule = require(Parent.Spy)
local AnyCallMatchesModule = require(Parent.AnyCallMatches)
local FmtArgsModule = require(Parent.fmtArgs)
local SymbolsModule = require(Parent.symbols)

local function _(p1)
	return function(p2): boolean
		-- upvalues: p1 (copy)
		return p2 == p1
	end
end

local _ = function(p1): boolean?
	-- upvalues: SymbolsModule (copy), MagicMockModule (copy)
	if type(p1) ~= "table" or not p1[SymbolsModule.isPredicate] then return end
	return not MagicMockModule.is(p1)
end

return function(p1, ...)
	-- upvalues: MagicMockModule (copy), SpyModule (copy), SymbolsModule (copy), AnyCallMatchesModule (copy), FmtArgsModule (copy)
	if not MagicMockModule.is(p1) and not SpyModule.is(p1) then
		return {
			pass = false,
			message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalledWith is used. Given %s instead", (tostring(p1)))
		}
	end
	local Packed = table.pack(...)
	local List = {}
	
	for _, value in ipairs(Packed) do
		if if type(value) == "table" and value[SymbolsModule.isPredicate] then not MagicMockModule.is(value) else nil then
			table.insert(List, value.predicate)
		else
			table.insert(List, function(p2): boolean
				-- upvalues: value (copy)
				return p2 == value
			end)
		end
	end
	local PredicatesResult, PredicatesResult2 = AnyCallMatchesModule.predicates(p1, table.unpack(List))
	
	return {
		pass = PredicatesResult,
		message = PredicatesResult and string.format("Expected %s to never have been called with args: %s", tostring(p1), FmtArgsModule(Packed)) or string.format("Expected %s to have been called with args: %s", tostring(p1), PredicatesResult2)
	}
end