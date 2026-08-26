local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local formatNumberModule = require(parent.Utility.formatNumber)
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent_1.Foundation)
local enums = foundationModule.Enums
local getIconRichText = foundationModule.Utility.getIconRichText

function useRobuxText(p1)
	-- upvalues: reactModule (ref), formatNumberModule (ref), localizationService (ref), getIconRichText (ref), enums (ref)
	return reactModule.useMemo(function()
		-- upvalues: formatNumberModule (copy), localizationService (copy), p1 (ref), getIconRichText (copy), enums (copy)
		return `{getIconRichText(enums.IconName.Robux)} {formatNumberModule(localizationService.RobloxLocaleId, p1 or 0)}`
	end, { p1, localizationService.RobloxLocaleId })
end

return useRobuxText