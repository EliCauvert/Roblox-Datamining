local ContactImporter = script:FindFirstAncestor("ContactImporter")
local Parent = ContactImporter.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseBeginContactImporterModule = require(ContactImporter.Hooks.useBeginContactImporter)

return function() --[[ Line: 10 | Named "ContactImporterLandingPage" ]]
	-- upvalues: UseNavigationFunction (copy), UseBeginContactImporterModule (copy), ReactModule (copy)
	local _, UseBeginContactImporterModuleResult2 = UseBeginContactImporterModule({
		entryPoint = (UseNavigationFunction().getParam("extraProps") or {}).entryPoint
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 17 ]]
		-- upvalues: UseBeginContactImporterModuleResult2 (copy)
		if UseBeginContactImporterModuleResult2 then
			UseBeginContactImporterModuleResult2()
		end
	end, { UseBeginContactImporterModuleResult2 })
	ReactModule.useEffect(function() --[[ Line: 23 ]]
		-- upvalues: UseResult (copy)
		UseResult()
	end, {})
end