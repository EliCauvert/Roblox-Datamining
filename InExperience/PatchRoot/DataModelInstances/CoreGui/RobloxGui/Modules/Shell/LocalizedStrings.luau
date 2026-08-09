local corePackagesService = game:GetService("CorePackages")
local locales = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell").Locales
local unknownModule = require(locales:FindFirstChild("en-us"))
local localization = require(corePackagesService.Workspace.Packages.RobloxAppLocales).Localization
local fFlagAppShellMigrateLocales = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales
local var2 = nil
local _ = nil
local _ = nil
local var3 = nil
local ok, status = pcall(function() --[[ line: 18 ]]
	return game:GetService("LocalizationService").RobloxLocaleId
end)
local var4 = ok
local var5 = status
local t = {
	GetLocale = function(_) --[[ line: 22 ]]
		-- upvalues: fFlagAppShellMigrateLocales (ref), locales (ref), var5 (write), var4 (write), var2 (write), unknownModule (ref)
		if fFlagAppShellMigrateLocales then
			error("Attempt to use GetLocale with FFlagAppShellMigrateLocales enabled")
		end
		local var7 = locales:FindFirstChild(var5)
		
		if var4 and var7 then
			var2 = require(var7)
		end
		if var2 == nil then
			var2 = unknownModule
		end
		return var2
	end,
	LocString = function(p0, p1) --[[ line: 40 ]]
		-- upvalues: fFlagAppShellMigrateLocales (ref), var2 (write), unknownModule (ref)
		if fFlagAppShellMigrateLocales then
			error("Attempt to use LocString with FFlagAppShellMigrateLocales enabled")
		end
		local var8 = var2 or p0:GetLocale()
		
		return var8 and var8[p1] or (unknownModule[p1] or p1)
	end
}

function t.LocalizedString(_, p2) --[[ line: 57 ]]
	-- upvalues: fFlagAppShellMigrateLocales (ref), t (ref)
	if fFlagAppShellMigrateLocales then
		error("Attempt to use LocalizedString with FFlagAppShellMigrateLocales enabled")
	end
	return t:LocString("Xbox.Old." .. p2)
end

function t.LocStringUA(_, p3) --[[ line: 68 ]]
	-- upvalues: var4 (write), var3 (write), localization (ref), var5 (write)
	var3 = if var4 and not var3 then localization.new(var5) else localization.new("en-us")
	
	return var3.localizationContext:getString(var5, p3) or p3
end

return t