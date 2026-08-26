local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local llama = dependenciesModule.llama
local enumsModule = require(script.Parent.Parent.Analytics.Enums)
local contexts = enumsModule.Contexts
local eventTypes = enumsModule.EventTypes
local subPages = enumsModule.SubPages
local pages = enumsModule.Pages
local _ = require(script.Parent.Parent.Analytics.FireEvent.Types)
local isEnumModule = require(script.Parent.Parent.Utils.isEnum)
local t = dependenciesModule.t
local formatKeyValidationErrorModule = require(script.Parent.formatKeyValidationError)
local formatErrorForIncorrectKeyModule = require(script.Parent.formatErrorForIncorrectKey)
local var1 = t.strictInterface({
	context = t.any,
	eventType = t.any,
	additionalInfo = t.optional(t.table),
	formatRulesForAdditionalInfo = t.optional(t.table)
})

return function(p1, p2)
	-- upvalues: llama (ref), isEnumModule (ref), contexts (ref), formatKeyValidationErrorModule (ref), eventTypes (ref), formatErrorForIncorrectKeyModule (ref), var1 (ref), subPages (ref), pages (ref)
	llama.Dictionary.map(p1, function(p3, p4)
		-- upvalues: isEnumModule (copy), contexts (copy), formatKeyValidationErrorModule (copy), eventTypes (copy), formatErrorForIncorrectKeyModule (copy), var1 (copy), subPages (copy), pages (copy), llama (copy), p2 (ref)
		local var2 = if isEnumModule(p4) then p4.rawValue() else p4
		assert(contexts.isEnumValue(p3.context), formatKeyValidationErrorModule("context", "a Context enum", var2))
		assert(eventTypes.isEnumValue(p3.eventType), formatKeyValidationErrorModule("eventType", "an EventType enum", var2))
		assert(if type(p3.additionalInfo) ~= "table" then p3.additionalInfo == nil else true, formatKeyValidationErrorModule("additionalInfo", "nil or a table", var2))
		assert(if type(p3.formatRulesForAdditionalInfo) ~= "table" then p3.formatRulesForAdditionalInfo == nil else true, formatKeyValidationErrorModule("formatRulesForAdditionalInfo", "nil or a table", var2))
		assert(formatErrorForIncorrectKeyModule(var1)(p3, var2))
		
		if p3.additionalInfo then
			assert(if p3.additionalInfo.subpage ~= nil then subPages.isEnumValue(p3.additionalInfo.subpage) else true, formatKeyValidationErrorModule("subpage additional info", "SubPages enum", var2))
			assert(if p3.additionalInfo.page ~= nil then pages.isEnumValue(p3.additionalInfo.page) else true, formatKeyValidationErrorModule("page additional info", "Pages enum", var2))
			llama.Dictionary.map(p2 or {}, function(p5, p6)
				-- upvalues: p3 (ref), var2 (ref)
				assert(p5(p3.additionalInfo[p6]), p6 .. " key is invalid. Issue with: " .. var6)
			end)
		end
	end)
	
	return true
end