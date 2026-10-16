local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Llama = DependenciesModule.llama
local EnumsModule = require(script.Parent.Parent.Analytics.Enums)
local Contexts = EnumsModule.Contexts
local EventTypes = EnumsModule.EventTypes
local SubPages = EnumsModule.SubPages
local Pages = EnumsModule.Pages
local _ = require(script.Parent.Parent.Analytics.FireEvent.Types)
local IsEnumModule = require(script.Parent.Parent.Utils.isEnum)
local T = DependenciesModule.t
local FormatKeyValidationErrorModule = require(script.Parent.formatKeyValidationError)
local FormatErrorForIncorrectKeyModule = require(script.Parent.formatErrorForIncorrectKey)
local StrictInterfaceResult = T.strictInterface({
	context = T.any,
	eventType = T.any,
	additionalInfo = T.optional(T.table),
	formatRulesForAdditionalInfo = T.optional(T.table)
})

return function(p1, p2): boolean --[[ Line: 23 ]]
	-- upvalues: Llama (copy), IsEnumModule (copy), Contexts (copy), FormatKeyValidationErrorModule (copy), EventTypes (copy), FormatErrorForIncorrectKeyModule (copy), StrictInterfaceResult (copy), SubPages (copy), Pages (copy)
	Llama.Dictionary.map(p1, function(p3, p4) --[[ Line: 24 ]]
		-- upvalues: IsEnumModule (upval), Contexts (upval), FormatKeyValidationErrorModule (upval), EventTypes (upval), FormatErrorForIncorrectKeyModule (upval), StrictInterfaceResult (upval), SubPages (upval), Pages (upval), Llama (upval), p2 (copy)
		local RawValueResult = if IsEnumModule(p4) then p4.rawValue() else p4
		assert(Contexts.isEnumValue(p3.context), FormatKeyValidationErrorModule("context", "a Context enum", RawValueResult))
		assert(EventTypes.isEnumValue(p3.eventType), FormatKeyValidationErrorModule("eventType", "an EventType enum", RawValueResult))
		assert(type(p3.additionalInfo) == "table" or p3.additionalInfo == nil, FormatKeyValidationErrorModule("additionalInfo", "nil or a table", RawValueResult))
		assert(type(p3.formatRulesForAdditionalInfo) == "table" or p3.formatRulesForAdditionalInfo == nil, FormatKeyValidationErrorModule("formatRulesForAdditionalInfo", "nil or a table", RawValueResult))
		assert(FormatErrorForIncorrectKeyModule(StrictInterfaceResult)(p3, RawValueResult))
		
		if p3.additionalInfo then
			assert(p3.additionalInfo.subpage == nil or SubPages.isEnumValue(p3.additionalInfo.subpage), FormatKeyValidationErrorModule("subpage additional info", "SubPages enum", RawValueResult))
			assert(p3.additionalInfo.page == nil or Pages.isEnumValue(p3.additionalInfo.page), FormatKeyValidationErrorModule("page additional info", "Pages enum", RawValueResult))
			Llama.Dictionary.map(p2 or {}, function(Callback, Text) --[[ Line: 53 ]]
				-- upvalues: p3 (copy), RawValueResult (copy)
				assert(Callback(p3.additionalInfo[Text]), Text .. " key is invalid. Issue with: " .. RawValueResult)
			end)
		end
	end)
	
	return true
end