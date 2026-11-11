local UtilsModule = require(script.Parent.Parent.utils)

return {
	description = "Read arbitrary properties from an instance by name. Use when inspect doesn't show the property you need (e.g. FontFace, Active, AutoButtonColor).",
	params = {
		{
			name = "path",
			desc = "DataModel path to the instance",
			required = true
		},
		{
			name = "props",
			desc = "array of property names to read, e.g. { \"FontFace\", \"Active\" }",
			required = true
		}
	},
	call = function(p1): string
		-- upvalues: UtilsModule (copy)
		if not p1.path then
			return "ERROR: 'path' is required"
		end
		if not p1.props or #p1.props == 0 then
			return "ERROR: 'props' is required (array of property names)"
		end
		local ResolveInstanceResult = UtilsModule.resolveInstance(p1.path)
		
		if not ResolveInstanceResult then
			return "NOT FOUND: \"" .. tostring(p1.path) .. "\" does not resolve to an instance."
		end
		local Messages = {
			("%s (%s)"):format(ResolveInstanceResult.Name, ResolveInstanceResult.ClassName),
			ResolveInstanceResult:GetFullName(),
			""
		}
		
		for _, prop in ipairs(p1.props) do
			local Success, Result = pcall(function()
				-- upvalues: ResolveInstanceResult (copy), prop (copy)
				return ResolveInstanceResult[prop]
			end)
			
			if Success then
				Messages[#Messages + 1] = ("%s = %s"):format(prop, (tostring(Result)))
			else
				Messages[#Messages + 1] = ("%s = ERROR: %s"):format(prop, (tostring(Result)))
			end
		end
		return table.concat(Messages, "\n")
	end
}