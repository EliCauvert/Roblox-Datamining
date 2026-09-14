local parent = script:FindFirstAncestor("AuthSignup").Parent
local argCheckModule = require(parent.ArgCheck)
local usernameIssue = require(parent.AuthCommon).Enums.UsernameIssue

return {
	isLengthTooShortOrTooLong = function(p1)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p1, "string", "displayName passed into isLengthTooShortOrTooLong")
		local var1 = string.len(p1)
		
		return if var1 >= 3 then var1 > 20 else true
	end,
	hasBoundingUnderscore = function(p1)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p1, "string", "displayName passed into hasBoundingUnderscore")
		
		return if string.sub(p1, 1, 1) ~= "_" then string.sub(p1, -1) == "_" else true
	end,
	hasMultipleUnderscores = function(p1)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p1, "string", "displayName passed into hasMultipleUnderscores")
		local _, replaced = string.gsub(p1, "_", "")
		
		return replaced > 1
	end,
	containsInvalidCharacter = function(p1)
		-- upvalues: argCheckModule (ref)
		argCheckModule.isType(p1, "string", "displayName passed into containsInvalidCharacter")
		
		return utf8.len(p1) == nil
	end,
	locallyValidateDisplayName = function(p1, p2)
		-- upvalues: argCheckModule (ref), usernameIssue (ref)
		argCheckModule.isType(p2, "string", "username passed into locallyValidateDisplayName")
		
		return {
			[usernameIssue.LengthTooShortOrTooLong] = p1.isLengthTooShortOrTooLong(p2),
			[usernameIssue.BoundingUnderscore] = p1.hasBoundingUnderscore(p2),
			[usernameIssue.MultipleUnderscores] = p1.hasMultipleUnderscores(p2),
			[usernameIssue.ContainsInvalidCharacter] = p1.containsInvalidCharacter(p2)
		}
	end
}