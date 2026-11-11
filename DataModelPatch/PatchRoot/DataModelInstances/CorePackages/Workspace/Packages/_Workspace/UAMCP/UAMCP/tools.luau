local ToolsModule = {
	ready = require(script.ready),
	current_page = require(script.current_page),
	find_text = require(script.find_text),
	find_clickable = require(script.find_clickable),
	find_by_testid = require(script.find_by_testid),
	inspect = require(script.inspect),
	get_property = require(script.get_property),
	tree = require(script.tree),
	visible_at = require(script.visible_at),
	search = require(script.search),
	scroll_to = require(script.scroll_to),
	list_controls = require(script.list_controls),
	menu_items = require(script.menu_items)
}
ToolsModule.help = {
	description = "List all available tools and their parameters.",
	call = function(_): string
		-- upvalues: ToolsModule (copy)
		local List = { "UA MCP Tools", "============", "" }
		local List1 = {}
		
		for i in pairs(ToolsModule) do
			List1[#List1 + 1] = i
		end
		table.sort(List1)
		
		for _, value in ipairs(List1) do
			local ToolsModuleEntry = ToolsModule[value]
			table.insert(List, ("• %s — %s"):format(value, ToolsModuleEntry.description))
			
			if ToolsModuleEntry.params then
				for _, param in ipairs(ToolsModuleEntry.params) do
					table.insert(List, ("    %s: %s%s"):format(param.name, param.desc, if param.required then " (required)" else ""))
				end
			end
			table.insert(List, "")
		end
		return table.concat(List, "\n")
	end
}

return ToolsModule