local function _(Text: string, p1): string
	return (Text:gsub("{(.-)}", function(Text): string
		-- upvalues: p1 (copy)
		return (tostring(p1[Text] or "{" .. Text .. "}"))
	end))
end

return function(List, p1)
	local t = {}
	
	for i, value in List do
		if type(value) == "string" then
			local t1 = {}
			t[i] = (p1[value] or value .. "-translated"):gsub("{(.-)}", function(Text): string
				-- upvalues: t1 (copy)
				return (tostring(t1[Text] or "{" .. Text .. "}"))
			end)
		elseif type(value) == "table" then
			local Entry = value[1]
			local t2 = {}
			
			for i1, value1 in value do
				if type(i1) ~= "number" then
					t2[i1] = value1
				end
			end
			t[i] = (p1[Entry] or Entry .. "-translated"):gsub("{(.-)}", function(Text): string
				-- upvalues: t2 (copy)
				return (tostring(t2[Text] or "{" .. Text .. "}"))
			end)
		end
	end
	return t
end