local AuthCommon = script:FindFirstAncestor("AuthCommon")
local UseMemoFunction = require(AuthCommon.Parent.React).useMemo
local UseCapturedAuditContentFunction = require(AuthCommon.Stores.AuditContentContext.AuditContentContext).useCapturedAuditContent
local GetFFlagEnableAuditSystemModule = require(AuthCommon.Flags.GetFFlagEnableAuditSystem)

local function parseTranslationKey(Text: string)
	if not Text or Text == "" then
		return "", ""
	end
	local Parts = string.split(Text, ".")
	
	if #Parts < 3 then
		return "", Text
	end
	local Text1 = Parts[1] .. "." .. Parts[2]
	local List = {}
	
	for i = 3, #Parts do
		table.insert(List, Parts[i])
	end
	return Text1, (table.concat(List, "."))
end

return function(p1)
	-- upvalues: GetFFlagEnableAuditSystemModule (copy), UseMemoFunction (copy), parseTranslationKey (copy), UseCapturedAuditContentFunction (copy)
	if GetFFlagEnableAuditSystemModule() then
		local TranslationKey = p1.translationKey
		local TranslatedSourceString = p1.translatedSourceString
		local Parameters = p1.parameters
		UseCapturedAuditContentFunction(TranslationKey, (UseMemoFunction(function()
			-- upvalues: TranslationKey (copy), TranslatedSourceString (copy), parseTranslationKey (upval), Parameters (copy)
			if TranslationKey and TranslatedSourceString then
				local ParseTranslationKeyResult, ParseTranslationKeyResult2 = parseTranslationKey(TranslationKey)
				
				return if ParseTranslationKeyResult == "" then nil else {
					translationKey = ParseTranslationKeyResult2,
					translationNamespace = ParseTranslationKeyResult,
					translatedSourceString = TranslatedSourceString,
					parameters = Parameters
				}
			else
				return nil
			end
		end, { TranslationKey, TranslatedSourceString, Parameters })))
		
		return nil
	else
		return nil
	end
end