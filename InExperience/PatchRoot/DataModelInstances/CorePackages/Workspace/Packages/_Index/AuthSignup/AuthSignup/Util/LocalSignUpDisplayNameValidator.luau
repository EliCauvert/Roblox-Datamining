local Parent = script:FindFirstAncestor("AuthSignup").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local UsernameIssue = require(Parent.AuthCommon).Enums.UsernameIssue

return {
	isLengthTooShortOrTooLong = function(Text: string): boolean --[[ Line: 10 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "displayName passed into isLengthTooShortOrTooLong")
		local Length = string.len(Text)
		
		return Length < 3 or Length > 20
	end,
	hasBoundingUnderscore = function(Text: string): boolean --[[ Line: 17 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "displayName passed into hasBoundingUnderscore")
		
		return string.sub(Text, 1, 1) == "_" or string.sub(Text, -1) == "_"
	end,
	hasMultipleUnderscores = function(Text: string): boolean --[[ Line: 23 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "displayName passed into hasMultipleUnderscores")
		local _, Replaced2 = string.gsub(Text, "_", "")
		
		return Replaced2 > 1
	end,
	containsInvalidCharacter = function(Text): boolean --[[ Line: 30 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "displayName passed into containsInvalidCharacter")
		
		return utf8.len(Text) == nil
	end,
	locallyValidateDisplayName = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: ArgCheckModule (copy), UsernameIssue (copy)
		ArgCheckModule.isType(p2, "string", "username passed into locallyValidateDisplayName")
		
		return {
			[UsernameIssue.LengthTooShortOrTooLong] = p1.isLengthTooShortOrTooLong(p2),
			[UsernameIssue.BoundingUnderscore] = p1.hasBoundingUnderscore(p2),
			[UsernameIssue.MultipleUnderscores] = p1.hasMultipleUnderscores(p2),
			[UsernameIssue.ContainsInvalidCharacter] = p1.containsInvalidCharacter(p2)
		}
	end
}