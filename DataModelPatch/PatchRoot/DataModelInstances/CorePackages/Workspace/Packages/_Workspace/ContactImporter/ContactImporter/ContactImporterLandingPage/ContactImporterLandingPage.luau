local ContactImporter = script:FindFirstAncestor("ContactImporter")
local Parent = ContactImporter.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseBeginContactImporterModule = require(ContactImporter.Hooks.useBeginContactImporter)

return function()
	-- upvalues: UseNavigationFunction (copy), UseBeginContactImporterModule (copy), ReactModule (copy)
	local _, UseBeginContactImporterModuleResult2 = UseBeginContactImporterModule({
		entryPoint = (UseNavigationFunction().getParam("extraProps") or {}).entryPoint
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseBeginContactImporterModuleResult2 (copy)
		if UseBeginContactImporterModuleResult2 then
			UseBeginContactImporterModuleResult2()
		end
	end, { UseBeginContactImporterModuleResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, {})
end