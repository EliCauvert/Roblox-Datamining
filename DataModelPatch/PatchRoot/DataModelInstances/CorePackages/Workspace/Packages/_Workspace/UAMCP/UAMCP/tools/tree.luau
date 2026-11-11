local UtilsModule = require(script.Parent.Parent.utils)

return {
	description = "Print a subtree of the DataModel as an indented tree, showing GUI properties.",
	params = {
		{
			name = "path",
			desc = "root path for the tree (default \"game.CoreGui\")",
			required = false
		},
		{
			name = "depth",
			desc = "max depth to traverse (default 3)",
			required = false
		},
		{
			name = "gui_only",
			desc = "if true, only show GuiObject descendants (default false)",
			required = false
		}
	},
	call = function(p1): string
		-- upvalues: UtilsModule (copy)
		local ResolveInstanceResult = UtilsModule.resolveInstance(p1.path or "game.CoreGui")
		
		if not ResolveInstanceResult then
			return "ERROR: could not resolve path: " .. tostring(p1.path)
		end
		local Depth = p1.depth or 3
		local GuiOnly = p1.gui_only or false
		local List = {}
		local Count = 0
		
		local function recurse(Gui, Count1: number)
			-- upvalues: Depth (copy), Count (ref), UtilsModule (upval), GuiOnly (copy), List (copy), recurse (copy)
			if Depth < Count1 or UtilsModule.MAX_RESULTS <= Count then return end
			if GuiOnly and not Gui:IsA("GuiObject") and Count1 > 0 then return end
			local Text: string = ("%s%s \"%s\""):format(string.rep("  ", Count1), Gui.ClassName, Gui.Name)
			local GuiPropsResult = UtilsModule.guiProps(Gui)
			
			if GuiPropsResult ~= "" then
				Text ..= "  " .. GuiPropsResult
			end
			table.insert(List, Text)
			Count += 1
			
			for _, child in ipairs(Gui:GetChildren()) do
				recurse(child, Count1 + 1)
			end
		end
		
		recurse(ResolveInstanceResult, 0)
		
		if UtilsModule.MAX_RESULTS <= Count then
			table.insert(List, ("\n... truncated at %d entries. Use a narrower path or smaller depth."):format(UtilsModule.MAX_RESULTS))
		end
		return table.concat(List, "\n")
	end
}