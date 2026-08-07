-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:40 2026 Pacific Standard Time.

local t = {}
t.__index = t

function t:__tostring() --[[ line: 3 ]]
	local t = {}
	
	for i, v in pairs(self) do
		table.insert(t, string.format("%s = %s", tostring(i), tostring(v)))
	end
	table.sort(t)
	
	return "<HttpResponse: " .. table.concat(t, ", ") .. ">"
end

function t.success(p0, p1) --[[ line: 14 ]]
	-- upvalues: t (ref)
	return setmetatable({ responseCode = p0, responseBody = p1 }, t)
end

function t.error(p2) --[[ line: 21 ]]
	-- upvalues: t (ref)
	return setmetatable({ HttpError = p2 }, t)
end

return t