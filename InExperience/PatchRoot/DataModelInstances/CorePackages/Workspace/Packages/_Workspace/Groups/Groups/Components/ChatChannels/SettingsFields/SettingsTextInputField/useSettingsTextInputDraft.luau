local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)

return function(DraftValue, p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(DraftValue)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(DraftValue)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), UseBindingResult2 (copy)
		UseStateResult2(p2)
		UseBindingResult2(p2)
	end, { UseBindingResult2 })
	local Length = utf8.len(UseStateResult)
	local NoLength: boolean = Length == nil or (Length == 0 or p1 < Length)
	
	return {
		draft = UseBindingResult,
		draftValue = UseStateResult,
		setDraft = UseResult,
		onDraftChanged = ReactModule.useCallback(function(Text: string)
			-- upvalues: p1 (copy), UseResult (copy)
			local Length = utf8.len(Text)
			
			if Length and p1 < Length then
				Text = string.sub(Text, 1, utf8.offset(Text, p1 + 1) - 1)
			end
			UseResult(Text)
		end, { p1, UseResult }),
		hasError = NoLength,
		canSave = not NoLength and UseStateResult ~= DraftValue,
		remainingCharacters = p1 - (Length or 0)
	}
end