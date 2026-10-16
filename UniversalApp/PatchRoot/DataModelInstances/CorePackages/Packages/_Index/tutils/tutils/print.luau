return function(Callback) --[[ Line: 1 ]]
	local function _(p1): string --[[ Line: 2 | Named "makeKeyString" ]]
		return if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", (tostring(p1)))
	end
	
	local function makeValueString(Key): string --[[ Line: 10 ]]
		local ValueType = type(Key)
		
		return if ValueType == "string" then string.format("%q", Key) elseif ValueType == "function" or ValueType == "table" then string.format("<%s>", (tostring(Key))) else string.format("%s", (tostring(Key)))
	end
	
	local function printKeypair(p1, p2, Repeated, p3) --[[ Line: 21 ]]
		-- upvalues: makeValueString (copy), Callback (copy)
		Callback(string.format("%s%s = %s,%s", Repeated, if type(p1) == "string" then string.format("%s", p1) else string.format("[%s]", (tostring(p1))), makeValueString(p2), p3 and string.format(" -- %s", p3) or ""))
	end
	
	return function(p1, p2) --[[ Line: 33 ]]
		-- upvalues: Callback (copy), makeValueString (copy), printKeypair (copy)
		local Text = p2 or "  "
		
		if type(p1) ~= "table" then
			error("tutils.Print must be passed a table", 2)
		end
		local t = {}
		
		local function recurse(Key, p3, Count: number) --[[ Line: 43 ]]
			-- upvalues: t (copy), Text (ref), Callback (upval), makeValueString (upval), printKeypair (upval), recurse (copy)
			t[Key] = true
			local Repeated = string.rep(Text, Count)
			local Repeated1 = string.rep(Text, Count + 1)
			
			if p3 then
				Callback(string.format("%s%s = %s {", Repeated, if type(p3) == "string" then string.format("%s", p3) else string.format("[%s]", (tostring(p3))), makeValueString(Key)))
			else
				Callback(string.format("%s%s {", Repeated, makeValueString(Key)))
			end
			for i, value in pairs(Key) do
				if type(value) ~= "table" then
					Callback(string.format("%s%s = %s,%s", Repeated1, if type(i) == "string" then string.format("%s", i) else string.format("[%s]", (tostring(i))), makeValueString(value), ""))
					continue
				end
				if t[value] then
					printKeypair(i, value, Repeated1, "Possible cycle")
				else
					recurse(value, i, Count + 1)
				end
			end
			Callback(string.format("%s}%s", Repeated, if Count > 0 then "," else ""))
		end
		
		recurse(p1, nil, 0)
	end
end