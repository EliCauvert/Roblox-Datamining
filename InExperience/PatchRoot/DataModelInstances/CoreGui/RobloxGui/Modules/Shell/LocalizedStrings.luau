local localization = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppLocales).Localization
local _ = nil
local _ = nil
local var0 = nil
local ok, status = pcall(function() --[[ line: 7 ]]
	return game:GetService("LocalizationService").RobloxLocaleId
end)
local var1 = ok
local var2 = status

return {
	LocStringUA = function(_, p0) --[[ line: 11 ]]
		-- upvalues: var1 (write), var0 (write), localization (ref), var2 (write)
		var0 = if var1 and not var0 then localization.new(var2) else localization.new("en-us")
		
		return var0.localizationContext:getString(var2, p0) or p0
	end
}