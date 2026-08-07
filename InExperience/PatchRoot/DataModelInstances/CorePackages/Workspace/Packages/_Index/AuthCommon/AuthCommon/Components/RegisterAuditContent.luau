local authCommon = script:FindFirstAncestor("AuthCommon")
local useMemo = require(authCommon.Parent.React).useMemo
local useCapturedAuditContent = require(authCommon.Stores.AuditContentContext.AuditContentContext).useCapturedAuditContent
local getFFlagEnableAuditSystemModule = require(authCommon.Flags.GetFFlagEnableAuditSystem)

local function parseTranslationKey(value) --[[ line: 45 ]]
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

return function(p0) --[[ line: 70 | named "RegisterAuditContent" ]]
	-- upvalues: getFFlagEnableAuditSystemModule (ref), useMemo (ref), parseTranslationKey (ref), useCapturedAuditContent (ref)
	if getFFlagEnableAuditSystemModule() then
		local translationKey = p0.translationKey
		local translatedSourceString = p0.translatedSourceString
		local parameters = p0.parameters
		useCapturedAuditContent(translationKey, useMemo(function() --[[ line: 79 ]]
			-- upvalues: translationKey (ref), translatedSourceString (ref), parseTranslationKey (copy), parameters (ref)
			if not translationKey or not translatedSourceString then
				return nil
			end
			local var6, var7 = parseTranslationKey(translationKey)
			
			return if var6 == "" then nil else {
				translationKey = var7,
				translationNamespace = var6,
				translatedSourceString = translatedSourceString,
				parameters = parameters
			}
		end, { translationKey, translatedSourceString, parameters }))
		
		return nil
	end
	return nil
end