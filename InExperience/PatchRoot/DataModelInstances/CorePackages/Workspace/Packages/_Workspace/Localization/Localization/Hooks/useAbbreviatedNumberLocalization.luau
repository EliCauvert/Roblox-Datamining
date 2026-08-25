local localization = script:FindFirstAncestor("Localization")
local parent = localization.Parent
local localizationService = game:GetService("LocalizationService")
local reactModule = require(parent.React)
local abbreviateCountModule = require(localization.abbreviateCount)
local localizationRoactContextModule = require(localization.LocalizationRoactContext)
local useSignal = require(parent.RoactUtils).Hooks.useSignal

return function(p0)
	-- upvalues: reactModule (ref), localizationRoactContextModule (ref), localizationService (ref), useSignal (ref), abbreviateCountModule (ref)
	local var5 = reactModule.useContext(localizationRoactContextModule)
	local var6, var7 = reactModule.useState(localizationService.RobloxLocaleId)
	useSignal(var5.changed, reactModule.useCallback(function(_)
		-- upvalues: var5 (ref), var6 (ref), var7 (ref)
		local locale = var5:GetLocale()
		
		if locale ~= var6 then
			var7(locale)
		end
	end, { var5 }))
	
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), abbreviateCountModule (copy), var6 (ref)
		return if p0 == nil then nil else abbreviateCountModule(p0, var6)
	end, { p0, var6 })
end