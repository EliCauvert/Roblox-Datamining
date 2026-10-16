return function(Text: string): string --[[ Line: 6 | Named "getTransferRequestInternalId" ]]
	return if Text == nil or Text == "" then "" elseif #Text >= 4 and string.lower((string.sub(Text, 1, 4))) == "rxt-" then string.sub(Text, 5) else Text
end