local contactImporter = script:FindFirstAncestor("ContactImporter")
local parent = contactImporter.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useBeginContactImporterModule = require(contactImporter.Hooks.useBeginContactImporter)

return function()
	-- upvalues: useNavigation (ref), useBeginContactImporterModule (ref), reactModule (ref)
	local _, var1 = useBeginContactImporterModule({
		entryPoint = (useNavigation().getParam("extraProps") or {}).entryPoint
	})
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1 then
			var1()
		end
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2()
	end, {})
end