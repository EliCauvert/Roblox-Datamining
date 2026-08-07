-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:26 2026 Pacific Standard Time.

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
local var5 = t.strictInterface({
	context = t.any,
	eventType = t.any,
	additionalInfo = t.optional(t.table),
	formatRulesForAdditionalInfo = t.optional(t.table)
})

return function(p0, p1) --[[ line: 23 ]]
	-- upvalues: llama (ref), isEnumModule (ref), contexts (ref), formatKeyValidationErrorModule (ref), eventTypes (ref), formatErrorForIncorrectKeyModule (ref), var5 (ref), subPages (ref), pages (ref)
	llama.Dictionary.map(p0, function(p2, p3) --[[ line: 24 ]]
		-- upvalues: isEnumModule (copy), contexts (copy), formatKeyValidationErrorModule (copy), eventTypes (copy), formatErrorForIncorrectKeyModule (copy), var5 (copy), subPages (copy), pages (copy), llama (copy), p1 (ref)
		local var6 = if isEnumModule(p3) then p3.rawValue() else p3
		assert(contexts.isEnumValue(p2.context), formatKeyValidationErrorModule("context", "a Context enum", var6))
		assert(eventTypes.isEnumValue(p2.eventType), formatKeyValidationErrorModule("eventType", "an EventType enum", var6))
		assert(if type(p2.additionalInfo) ~= "table" then p2.additionalInfo == nil else true, formatKeyValidationErrorModule("additionalInfo", "nil or a table", var6))
		assert(if type(p2.formatRulesForAdditionalInfo) ~= "table" then p2.formatRulesForAdditionalInfo == nil else true, formatKeyValidationErrorModule("formatRulesForAdditionalInfo", "nil or a table", var6))
		assert(formatErrorForIncorrectKeyModule(var5)(p2, var6))
		
		if p2.additionalInfo then
			assert(if p2.additionalInfo.subpage ~= nil then subPages.isEnumValue(p2.additionalInfo.subpage) else true, formatKeyValidationErrorModule("subpage additional info", "SubPages enum", var6))
			assert(if p2.additionalInfo.page ~= nil then pages.isEnumValue(p2.additionalInfo.page) else true, formatKeyValidationErrorModule("page additional info", "Pages enum", var6))
			llama.Dictionary.map(p1 or {}, function(p4, p5) --[[ line: 53 ]]
				-- upvalues: p2 (ref), var6 (ref)
				assert(p4(p2.additionalInfo[p5]), p5 .. " key is invalid. Issue with: " .. var6)
			end)
		end
	end)
	
	return true
end