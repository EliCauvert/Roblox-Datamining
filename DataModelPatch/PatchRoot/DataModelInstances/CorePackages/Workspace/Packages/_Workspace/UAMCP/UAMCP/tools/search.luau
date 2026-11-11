local UtilsModule = require(script.Parent.Parent.utils)

return {
	description = "Search the DataModel for instances whose Name matches a query (case-insensitive substring). Defaults to GuiObject/ScreenGui classes only.",
	params = {
		{
			name = "query",
			desc = "substring to match against instance Name",
			required = true
		},
		{
			name = "root",
			desc = "root path to search under (default \"game.CoreGui\")",
			required = false
		},
		{
			name = "class",
			desc = "ClassName filter (overrides default GUI-only filter)",
			required = false
		},
		{
			name = "all",
			desc = "if true, search all classes instead of only GUI instances",
			required = false
		},
		{
			name = "limit",
			required = false,
			desc = ("max results (default %d)"):format(UtilsModule.MAX_RESULTS)
		}
	},
	call = function(p1): string
		-- upvalues: UtilsModule (copy)
		local Lowered = p1.query and p1.query:lower()
		
		if not Lowered or Lowered == "" then
			return "ERROR: 'query' is required"
		end
		local ResolveInstanceResult = UtilsModule.resolveInstance(p1.root or "game.CoreGui")
		
		if ResolveInstanceResult then
			local Class = p1.class
			local NoClass: boolean = not p1.all and not Class
			local Limit = p1.limit or UtilsModule.MAX_RESULTS
			local List = {}
			
			local function recurse(Object)
				-- upvalues: List (copy), Limit (copy), Lowered (copy), Class (copy), NoClass (copy), UtilsModule (upval), recurse (copy)
				if Limit <= #List then return end
				if Object.Name:lower():find(Lowered, 1, true) then
					local IsClassNameMatch = true
					
					if Class then
						IsClassNameMatch = Object.ClassName == Class
					elseif NoClass then
						IsClassNameMatch = Object:IsA("GuiObject") or Object:IsA("ScreenGui")
					end
					if IsClassNameMatch then
						local Message: string = ("%s \"%s\"  —  %s"):format(Object.ClassName, Object.Name, Object:GetFullName())
						local GuiPropsResult = UtilsModule.guiProps(Object)
						
						if GuiPropsResult ~= "" then
							Message ..= "\n    " .. GuiPropsResult
						end
						List[#List + 1] = Message
					end
				end
				for _, child in ipairs(Object:GetChildren()) do
					recurse(child)
				end
			end
			
			recurse(ResolveInstanceResult)
			
			return if #List == 0 then "No instances found matching \"" .. tostring(p1.query) .. "\"" else ("Found %d result(s):\n\n"):format(#List) .. table.concat(List, "\n\n")
		else
			return "ERROR: could not resolve root path: " .. tostring(p1.root)
		end
	end
}