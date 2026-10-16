local Parent = script:FindFirstAncestor("AuthSignup").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local UsernameIssue = require(Parent.AuthCommon).Enums.UsernameIssue

return {
	isLengthTooShortOrTooLong = function(Text: string): boolean --[[ Line: 9 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "username passed into isLengthTooShortOrTooLong")
		local Length = string.len(Text)
		
		return Length < 3 or Length > 20
	end,
	hasBoundingUnderscore = function(Text: string): boolean --[[ Line: 16 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "username passed into hasBoundingUnderscore")
		
		return string.sub(Text, 1, 1) == "_" or string.sub(Text, -1) == "_"
	end,
	hasMultipleUnderscores = function(Text: string): boolean --[[ Line: 22 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "username passed into hasMultipleUnderscores")
		local _, Replaced2 = string.gsub(Text, "_", "")
		
		return Replaced2 > 1
	end,
	containsInvalidCharacter = function(Text: string): boolean --[[ Line: 29 ]]
		-- upvalues: ArgCheckModule (copy)
		ArgCheckModule.isType(Text, "string", "username passed into containsInvalidCharacter")
		
		return string.match(Text, "[^_%w]") ~= nil
	end,
	locallyValidateUsername = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: ArgCheckModule (copy), UsernameIssue (copy)
		ArgCheckModule.isType(p2, "string", "username passed into locallyValidateUsername")
		
		return {
			[UsernameIssue.LengthTooShortOrTooLong] = p1.isLengthTooShortOrTooLong(p2),
			[UsernameIssue.BoundingUnderscore] = p1.hasBoundingUnderscore(p2),
			[UsernameIssue.MultipleUnderscores] = p1.hasMultipleUnderscores(p2),
			[UsernameIssue.ContainsInvalidCharacter] = p1.containsInvalidCharacter(p2)
		}
	end
}