local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local ExternalEventConnectionModule = require(Modules.Common.RoactUtilities.ExternalEventConnection)
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)

function UpdateLocalizationWithLocale(p1)
	-- upvalues: LocalizationService (copy), LuaAppBacktraceReporterModule (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	p1:SetLocale(RobloxLocaleId)
	LuaAppBacktraceReporterModule:updateSharedAttributes({ Locale = RobloxLocaleId })
end

return function(p1)
	-- upvalues: ReactModule (copy), LocalizationService (copy), RoactModule (copy), ExternalEventConnectionModule (copy)
	local Localization = p1.localization
	ReactModule.useEffect(function()
		-- upvalues: Localization (copy), LocalizationService (upval)
		if Localization:GetLocale() ~= LocalizationService.RobloxLocaleId then
			UpdateLocalizationWithLocale(Localization)
		end
	end, { p1.localization })
	
	return RoactModule.createElement(ExternalEventConnectionModule, {
		event = LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"),
		callback = function()
			-- upvalues: Localization (copy)
			UpdateLocalizationWithLocale(Localization)
		end
	})
end