local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local LocalizationRoactContext = require(Parent.Localization).LocalizationRoactContext
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script:FindFirstAncestor("NotificationsCommon").type)
local RobloxTranslatorModule = require(Parent.RobloxTranslator)

return {
	getLocalizedStrings = function(List) --[[ Line: 13 ]]
		-- upvalues: ReactModule (copy), LocalizationRoactContext (copy), UseLocalizationFunction (copy), RobloxTranslatorModule (copy)
		if ReactModule.useContext(LocalizationRoactContext) ~= nil then
			return UseLocalizationFunction(List)
		end
		local t = {}
		
		for i, value in pairs(List) do
			local Success, Result = pcall(function() --[[ Line: 24 ]]
				-- upvalues: RobloxTranslatorModule (upval), value (copy)
				return RobloxTranslatorModule:FormatByKey(value)
			end)
			
			if Success then
				t[i] = Result
			else
				t[i] = value
			end
		end
		return t
	end
}