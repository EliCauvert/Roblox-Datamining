-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local t = {}
t.__index = t

function t.new() --[[ line: 4 ]]
	-- upvalues: t (ref)
	return setmetatable({ passed = true, reasons = {} }, t)
end

function t:updateReasons(p0, p1) --[[ line: 13 ]]
	if p0 then
		return
	end
	table.insert(self.reasons, table.concat(p1, "\n"))
	self.passed = false
end

function t:getFinalResults() --[[ line: 22 ]]
	if self.passed then
		return true
	end
	return false, self.reasons
end

return t