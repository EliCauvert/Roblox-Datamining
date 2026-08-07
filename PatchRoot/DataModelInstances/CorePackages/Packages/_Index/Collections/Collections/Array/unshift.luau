-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local dEV = _G.__DEV__
local parent = script.Parent
local isArrayModule = require(parent.isArray)
local _ = require(parent.Parent.Parent.ES7Types)

return function(p0, ...) --[[ line: 23 ]]
	-- upvalues: dEV (ref), isArrayModule (ref)
	if dEV and not isArrayModule(p0) then
		error(string.format("Array.unshift called on non-array %s", typeof(p0)))
	end
	local var1 = select("#", ...)
	
	if var1 > 0 then
		for i = var1, 1, -1 do
			table.insert(p0, 1, select(i, ...))
		end
	end
	return #p0
end