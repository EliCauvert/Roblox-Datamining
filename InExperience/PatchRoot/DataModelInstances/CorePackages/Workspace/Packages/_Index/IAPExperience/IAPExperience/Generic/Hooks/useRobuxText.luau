local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent1.Foundation)
local Enums = FoundationModule.Enums
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText

function useRobuxText(p1)
	-- upvalues: ReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), GetIconRichTextFunction (copy), Enums (copy)
	return (ReactModule.useMemo(function(): string
		-- upvalues: FormatNumberModule (upval), LocalizationService (upval), p1 (copy), GetIconRichTextFunction (upval), Enums (upval)
		return `{GetIconRichTextFunction(Enums.IconName.Robux)} {FormatNumberModule(LocalizationService.RobloxLocaleId, p1 or 0)}`
	end, { p1, LocalizationService.RobloxLocaleId }))
end

return useRobuxText