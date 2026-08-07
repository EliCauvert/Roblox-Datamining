local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local formatNumberModule = require(parent.Utility.formatNumber)
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent_1.Foundation)
local enums = foundationModule.Enums
local getIconRichText = foundationModule.Utility.getIconRichText

function useRobuxText(p0) --[[ line: 10 ]]
	-- upvalues: reactModule (ref), formatNumberModule (ref), localizationService (ref), getIconRichText (ref), enums (ref)
	return reactModule.useMemo(function() --[[ line: 11 ]]
		-- upvalues: formatNumberModule (copy), localizationService (copy), p0 (ref), getIconRichText (copy), enums (copy)
		return `{getIconRichText(enums.IconName.Robux)} {formatNumberModule(localizationService.RobloxLocaleId, p0 or 0)}`
	end, { p0, localizationService.RobloxLocaleId })
end

return useRobuxText