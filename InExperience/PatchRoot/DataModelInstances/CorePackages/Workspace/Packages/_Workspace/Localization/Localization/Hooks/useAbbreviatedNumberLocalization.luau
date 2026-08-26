local localization = script:FindFirstAncestor("Localization")
local parent = localization.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local abbreviateCountModule = require(localization.abbreviateCount)
local localizationRoactContextModule = require(localization.LocalizationRoactContext)
local useSignal = require(parent.RoactUtils).Hooks.useSignal

return function(p1)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref), localizationService (ref), useSignal (ref), abbreviateCountModule (ref)
	local var1 = reactModule.useContext(localizationRoactContextModule)
	local var2, var3 = reactModule.useState(localizationService.RobloxLocaleId)
	useSignal(var1.changed, reactModule.useCallback(function(_)
		-- upvalues: var1 (ref), var2 (ref), var3 (ref)
		local locale = var1:GetLocale()
		
		if locale ~= var2 then
			var3(locale)
		end
	end, { var1 }))
	
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), abbreviateCountModule (copy), var2 (ref)
		return if p1 == nil then nil else abbreviateCountModule(p1, var2)
	end, { p1, var2 })
end