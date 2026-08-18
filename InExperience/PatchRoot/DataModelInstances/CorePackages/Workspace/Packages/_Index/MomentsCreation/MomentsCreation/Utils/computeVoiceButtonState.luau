local function _(p0) --[[ line: 12 | named "trimWhitespace" ]]
	return p0:gsub("^%s*(.-)%s*$", "%1")
end

return function(p1) --[[ line: 41 | named "computeVoiceButtonState" ]]
	local var8
	local isLoading = p1.ttsState == "loading"
	local isError = p1.ttsState == "error"
	local var2 = p1.text:gsub("^%s*(.-)%s*$", "%1")
	local var3 = utf8.len(var2) or 0
	var2 = var2 ~= p1.lastGeneratedText
	local var4 = isError and (p1.errorReason == "moderated" and not var2)
	local text = utf8.len(p1.text) or 0
	local var6 = p1.maxChars < text
	local var7 = isError and not var4
	
	if not (var3 == 0 and (p1.lastGeneratedText ~= "" and var2)) then
		var8 = false
		
		if var3 > 0 then
			var8 = not var6
			
			if var8 then
				if not var2 then
					var8 = var7 and not isLoading
				end
			end
		end
		return {
			isGenerating = isLoading,
			isError = isError,
			charCount = text,
			isOverLimit = var6,
			canGenerate = var8,
			isModerated = var4,
			showSave = (p1.hasGenerated or p1.hasCleared) and (p1.lastGeneratedText ~= p1.lastSavedText and (not var2 and (not isLoading and not isError)))
		}
	end
end