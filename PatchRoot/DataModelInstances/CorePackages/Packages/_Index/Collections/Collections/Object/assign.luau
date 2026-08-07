-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local parent = script.Parent
local noneModule = require(parent.None)
local _ = require(parent.Parent.Parent.ES7Types)

return function(p0, p1, p2, p3, ...) --[[ line: 30 ]]
	-- upvalues: noneModule (ref)
	if p1 ~= nil and typeof(p1) == "table" then
		for i, v in pairs(p1) do
			if v == noneModule then
				p0[i] = nil
			else
				p0[i] = v
			end
		end
	end
	if p2 ~= nil and typeof(p2) == "table" then
		for i, v in pairs(p2) do
			if v == noneModule then
				p0[i] = nil
			else
				p0[i] = v
			end
		end
	end
	if p3 ~= nil and typeof(p3) == "table" then
		for i, v in pairs(p3) do
			if v == noneModule then
				p0[i] = nil
			else
				p0[i] = v
			end
		end
	end
	for i = 1, select("#", ...) do
		local var1 = select(i, ...)
		
		if var1 ~= nil and typeof(var1) == "table" then
			for i, v in pairs(var1) do
				if v == noneModule then
					p0[i] = nil
				else
					p0[i] = v
				end
			end
		end
	end
	return p0
end