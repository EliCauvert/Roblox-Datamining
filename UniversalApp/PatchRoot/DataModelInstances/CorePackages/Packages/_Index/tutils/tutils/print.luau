return function(p1)
	local function _(p2)
		return if type(p2) == "string" then string.format("%s", p2) else string.format("[%s]", tostring(p2))
	end
	
	local function makeValueString(p2)
		local var1 = type(p2)
		
		return if var1 == "string" then string.format("%q", p2) elseif var1 == "function" or var1 == "table" then string.format("<%s>", tostring(p2)) else string.format("%s", tostring(p2))
	end
	
	local function printKeypair(p2, p3, p4, p5)
		-- upvalues: makeValueString (ref), p1 (ref)
		p1(string.format("%s%s = %s,%s", p4, if type(p2) == "string" then string.format("%s", p2) else string.format("[%s]", tostring(p2)), makeValueString(p3), p5 and string.format(" -- %s", p5) or ""))
	end
	
	return function(p2, p3)
		-- upvalues: p1 (ref), makeValueString (ref), printKeypair (ref)
		p3 = p3 or "  "
		
		if type(p2) ~= "table" then
			error("tutils.Print must be passed a table", 2)
		end
		local t = {}
		
		local function recurse(p4, p5, p6)
			-- upvalues: t (ref), p3 (write), p1 (copy), makeValueString (copy), printKeypair (copy), recurse (ref)
			t[p4] = true
			local repeated = string.rep(p3, p6)
			local repeated_1 = string.rep(p3, p6 + 1)
			
			if p5 then
				p1(string.format("%s%s = %s {", repeated, if type(p5) == "string" then string.format("%s", p5) else string.format("[%s]", tostring(p5)), makeValueString(p4)))
			else
				p1(string.format("%s%s {", repeated, makeValueString(p4)))
			end
			for i, v in pairs(p4) do
				if type(v) ~= "table" then
					p1(string.format("%s%s = %s,%s", repeated_1, if type(i) == "string" then string.format("%s", i) else string.format("[%s]", tostring(i)), makeValueString(v), ""))
				elseif t[v] then
					printKeypair(i, v, repeated_1, "Possible cycle")
				else
					recurse(v, i, p6 + 1)
				end
			end
			p1(string.format("%s}%s", repeated, if p6 > 0 then "," else ""))
		end
		
		recurse(p2, nil, 0)
	end
end