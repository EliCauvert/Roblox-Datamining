local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

return function() --[[ Line: 8 | Named "useRobloxLocale" ]]
	-- upvalues: ReactModule (copy), LocalizationService (copy), UseEventConnectionFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
	UseEventConnectionFunction(LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ Line: 11 ]]
		-- upvalues: UseStateResult2 (copy), LocalizationService (upval)
		UseStateResult2(LocalizationService.RobloxLocaleId)
	end, {})
	
	return UseStateResult
end