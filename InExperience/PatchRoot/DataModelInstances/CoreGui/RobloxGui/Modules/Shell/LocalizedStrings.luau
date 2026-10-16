local Localization = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppLocales).Localization
local Success = nil
local Result = nil
local NewResult = nil
Success, Result = pcall(function() --[[ Line: 7 ]]
	return game:GetService("LocalizationService").RobloxLocaleId
end)

return {
	LocStringUA = function(_, p1) --[[ Line: 11 ]]
		-- upvalues: Success (ref), NewResult (ref), Localization (copy), Result (ref)
		NewResult = if Success and not NewResult then Localization.new(Result) else Localization.new("en-us")
		
		return NewResult.localizationContext:getString(Result, p1) or p1
	end
}