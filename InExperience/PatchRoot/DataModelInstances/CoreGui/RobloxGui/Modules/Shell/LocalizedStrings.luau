local localization = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppLocales).Localization
local _ = nil
local _ = nil
local var1 = nil
local ok, status = pcall(function()
	return game:GetService("LocalizationService").RobloxLocaleId
end)
local var2 = ok
local var3 = status

return {
	LocStringUA = function(_, p1)
		-- upvalues: var2 (write), var1 (write), localization (ref), var3 (write)
		var1 = if var2 and not var1 then localization.new(var3) else localization.new("en-us")
		
		return var1.localizationContext:getString(var3, p1) or p1
	end
}