local function _(p1)
	return p1:gsub("^%s*(.-)%s*$", "%1")
end

return function(p1)
	local var1
	local isLoading = p1.ttsState == "loading"
	local isError = p1.ttsState == "error"
	local var2 = p1.text:gsub("^%s*(.-)%s*$", "%1")
	local var3 = utf8.len(var2) or 0
	var2 = var2 ~= p1.lastGeneratedText
	local var4 = isError and (p1.errorReason == "moderated" and not var2)
	local text = utf8.len(p1.text) or 0
	local var5 = p1.maxChars < text
	local var6 = var3 == 0 and ((p1.hasGenerated or p1.lastSavedText ~= "") and var2)
	local var7 = var3 > 0 and (not var5 and var2:match("%w") ~= nil)
	local var8 = isError and not var4
	
	if not var6 then
		var1 = var7
		
		if var1 then
			if not var2 then
				var1 = var8 and not isLoading
			end
		end
		return {
			isGenerating = isLoading,
			isError = isError,
			charCount = text,
			isOverLimit = var5,
			canGenerate = var1,
			isModerated = var4,
			showSave = (p1.hasGenerated or p1.hasCleared) and (p1.lastGeneratedText ~= p1.lastSavedText and (not var2 and (not isLoading and not isError)))
		}
	end
end