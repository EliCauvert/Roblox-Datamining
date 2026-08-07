-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:29 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	local function _(p1) --[[ line: 2 | named "makeKeyString" ]]
		return if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", tostring(p1))
	end
	
	local function makeValueString(p2) --[[ line: 10 ]]
		local var2 = type(p2)
		
		return if var2 == "string" then string.format("%q", p2) elseif var2 == "function" or var2 == "table" then string.format("<%s>", tostring(p2)) else string.format("%s", tostring(p2))
	end
	
	local function printKeypair(p3, p4, p5, p6) --[[ line: 21 ]]
		-- upvalues: makeValueString (ref), p0 (ref)
		p0(string.format("%s%s = %s,%s", p5, if type(p3) == "string" then string.format("%s", p3) else string.format("[%s]", tostring(p3)), makeValueString(p4), p6 and string.format(" -- %s", p6) or ""))
	end
	
	return function(p7, p8) --[[ line: 33 ]]
		-- upvalues: p0 (ref), makeValueString (ref), printKeypair (ref)
		p8 = p8 or "  "
		
		if type(p7) ~= "table" then
			error("tutils.Print must be passed a table", 2)
		end
		local t = {}
		
		local function recurse(p9, p10, p11) --[[ line: 43 ]]
			-- upvalues: t (ref), p8 (write), p0 (copy), makeValueString (copy), printKeypair (copy), recurse (ref)
			t[p9] = true
			local repeated = string.rep(p8, p11)
			local repeated_1 = string.rep(p8, p11 + 1)
			
			if p10 then
				p0(string.format("%s%s = %s {", repeated, if type(p10) == "string" then string.format("%s", p10) else string.format("[%s]", tostring(p10)), makeValueString(p9)))
			else
				p0(string.format("%s%s {", repeated, makeValueString(p9)))
			end
			for i, v in pairs(p9) do
				if type(v) ~= "table" then
					p0(string.format("%s%s = %s,%s", repeated_1, if type(i) == "string" then string.format("%s", i) else string.format("[%s]", tostring(i)), makeValueString(v), ""))
				elseif t[v] then
					printKeypair(i, v, repeated_1, "Possible cycle")
				else
					recurse(v, i, p11 + 1)
				end
			end
			p0(string.format("%s}%s", repeated, if p11 > 0 then "," else ""))
		end
		
		recurse(p7, nil, 0)
	end
end