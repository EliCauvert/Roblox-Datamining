local escapeRichTextModule = require(script:FindFirstAncestor("ChatUIPrimitives").Utils.escapeRichText)

return function(p0, p1)
	-- upvalues: escapeRichTextModule (ref)
	local list = { "family" }
	local t = {
		family = "rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json"
	}
	
	if p1 ~= nil then
		for i, v in p1 do
			if i ~= "family" then
				if t[i] == nil then
					table.insert(list, i)
				end
				t[i] = v
			end
		end
	end
	table.sort(list)
	local list_1 = table.create(#list)
	
	for i, v in list do
		list_1[i] = `{escapeRichTextModule(v)}='{escapeRichTextModule(t[v])}'`
	end
	return `<font {table.concat(list_1, " ")}>{escapeRichTextModule(p0)}</font>`
end