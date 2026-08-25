local contactImporter = script:FindFirstAncestor("ContactImporter")
local parent = contactImporter.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useBeginContactImporterModule = require(contactImporter.Hooks.useBeginContactImporter)

return function()
	-- upvalues: useNavigation (ref), useBeginContactImporterModule (ref), reactModule (ref)
	local _, var3 = useBeginContactImporterModule({
		entryPoint = (useNavigation().getParam("extraProps") or {}).entryPoint
	})
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		if var3 then
			var3()
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4()
	end, {})
end