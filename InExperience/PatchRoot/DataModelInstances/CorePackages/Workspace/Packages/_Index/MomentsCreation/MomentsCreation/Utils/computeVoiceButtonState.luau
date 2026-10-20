local function _(Text: string): string
	return (Text:gsub("^%s*(.-)%s*$", "%1"))
end

return function(p1)
	local IsLoading = p1.ttsState == "loading"
	local IsError = p1.ttsState == "error"
	local SS = p1.text:gsub("^%s*(.-)%s*$", "%1")
	local Length: number = utf8.len(SS) or 0
	local IsNotSSMatch = SS ~= p1.lastGeneratedText
	local NoIsNotSSMatch: boolean = IsError and (p1.errorReason == "moderated" and not IsNotSSMatch)
	local NoIsNotSSMatch1: boolean = IsError and (p1.errorReason == "tooManyDigits" and not IsNotSSMatch)
	local Length1: number = utf8.len(p1.text) or 0
	local IsMaxCharsBelow = p1.maxChars < Length1
	local HasGenerated = p1.hasGenerated or p1.lastSavedText ~= ""
	local IsNotSSMatch1: boolean = Length == 0 and (HasGenerated and IsNotSSMatch)
	local HasW = SS:match("%w") ~= nil
	local HasW1: boolean = Length > 0 and (not IsMaxCharsBelow and HasW)
	local NoNoIsNotSSMatch1: boolean = IsError and (not NoIsNotSSMatch and not NoIsNotSSMatch1)
	local IsNotLastGeneratedTextMatch = p1.lastGeneratedText ~= p1.lastSavedText
	local v1: boolean = p1.hasGenerated and (p1.startTime or 0) ~= (p1.lastSavedStartTime or 0)
	local v2: boolean = p1.hasGenerated and (p1.voiceId or 0) ~= (p1.lastSavedVoiceId or 0)
	
	return {
		isGenerating = IsLoading,
		isError = IsError,
		charCount = Length1,
		isOverLimit = IsMaxCharsBelow,
		canGenerate = if IsNotSSMatch1 then if IsNotSSMatch then not IsLoading else NoNoIsNotSSMatch1 and not IsLoading else HasW1 and (if IsNotSSMatch then not IsLoading else NoNoIsNotSSMatch1 and not IsLoading),
		isModerated = NoIsNotSSMatch,
		isTooManyDigits = NoIsNotSSMatch1,
		showSave = (p1.hasGenerated or p1.hasCleared) and (if IsNotLastGeneratedTextMatch or v1 then not IsNotSSMatch and (not IsLoading and not IsError) else v2 and (not IsNotSSMatch and (not IsLoading and not IsError)))
	}
end