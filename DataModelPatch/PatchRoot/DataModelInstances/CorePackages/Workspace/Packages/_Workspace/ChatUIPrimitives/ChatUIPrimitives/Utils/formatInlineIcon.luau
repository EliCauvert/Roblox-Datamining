local EscapeRichTextModule = require(script:FindFirstAncestor("ChatUIPrimitives").Utils.escapeRichText)

return function(p1, List): string
	-- upvalues: EscapeRichTextModule (copy)
	local List1 = { "family" }
	local config = {
		family = "rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json"
	}
	
	if List ~= nil then
		for i, value in List do
			if i ~= "family" then
				if config[i] == nil then
					table.insert(List1, i)
				end
				config[i] = value
			end
		end
	end
	table.sort(List1)
	local Buffer = table.create(#List1)
	
	for i1, value1 in List1 do
		Buffer[i1] = `{EscapeRichTextModule(value1)}='{EscapeRichTextModule(config[value1])}'`
	end
	return `<font {table.concat(Buffer, " ")}>{EscapeRichTextModule(p1)}</font>`
end