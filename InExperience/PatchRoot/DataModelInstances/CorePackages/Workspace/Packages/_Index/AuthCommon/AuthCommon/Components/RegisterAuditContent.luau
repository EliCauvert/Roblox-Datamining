local authCommon = script:FindFirstAncestor("AuthCommon")
local useMemo = require(authCommon.Parent.React).useMemo
local useCapturedAuditContent = require(authCommon.Stores.AuditContentContext.AuditContentContext).useCapturedAuditContent
local getFFlagEnableAuditSystemModule = require(authCommon.Flags.GetFFlagEnableAuditSystem)

local function parseTranslationKey(value)
	if not value or value == "" then
		return "", ""
	end
	local parts = string.split(value, ".")
	
	if #parts < 3 then
		return "", value
	end
	local text = parts[1] .. "." .. parts[2]
	local t = {}
	
	for i = 3, #parts do
		table.insert(t, parts[i])
	end
	return text, table.concat(t, ".")
end

return function(p1)
	-- upvalues: getFFlagEnableAuditSystemModule (ref), useMemo (ref), parseTranslationKey (ref), useCapturedAuditContent (ref)
	if getFFlagEnableAuditSystemModule() then
		local translationKey = p1.translationKey
		local translatedSourceString = p1.translatedSourceString
		local parameters = p1.parameters
		useCapturedAuditContent(translationKey, useMemo(function()
			-- upvalues: translationKey (ref), translatedSourceString (ref), parseTranslationKey (copy), parameters (ref)
			if not translationKey or not translatedSourceString then
				return nil
			end
			local var1, var2 = parseTranslationKey(translationKey)
			
			return if var1 == "" then nil else {
				translationKey = var2,
				translationNamespace = var1,
				translatedSourceString = translatedSourceString,
				parameters = parameters
			}
		end, { translationKey, translatedSourceString, parameters }))
		
		return nil
	end
	return nil
end