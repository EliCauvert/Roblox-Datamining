-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local magicMockModule = require(parent.MagicMock)
local spyModule = require(parent.Spy)
local anyCallMatchesModule = require(parent.AnyCallMatches)
local fmtArgsModule = require(parent.fmtArgs)
local symbolsModule = require(parent.symbols)

local function _(p0) --[[ line: 8 | named "getLiteralPredicate" ]]
	return function(p1) --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		return p1 == p0
	end
end

local _ = function(p2) --[[ line: 14 | named "isPredicate" ]]
	-- upvalues: symbolsModule (ref), magicMockModule (ref)
	if type(p2) == "table" and p2[symbolsModule.isPredicate] then
		return not magicMockModule.is(p2)
	end
end

return function(p3, ...) --[[ line: 20 ]]
	-- upvalues: magicMockModule (ref), spyModule (ref), symbolsModule (ref), anyCallMatchesModule (ref), fmtArgsModule (ref)
	if not magicMockModule.is(p3) and not spyModule.is(p3) then
		return {
			pass = false,
			message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalledWith is used. Given %s instead", tostring(p3))
		}
	end
	local packed = table.pack(...)
	local t = {}
	
	for i, v in ipairs(packed) do
		if if type(v) == "table" and v[symbolsModule.isPredicate] then not magicMockModule.is(v) else nil then
			table.insert(t, v.predicate)
		else
			table.insert(t, function(p4) --[[ line: 9 ]]
				-- upvalues: v (ref)
				return p4 == v
			end)
		end
	end
	local var7, var8 = anyCallMatchesModule.predicates(p3, table.unpack(t))
	
	return {
		pass = var7,
		message = var7 and string.format("Expected %s to never have been called with args: %s", tostring(p3), fmtArgsModule(packed)) or string.format("Expected %s to have been called with args: %s", tostring(p3), var8)
	}
end