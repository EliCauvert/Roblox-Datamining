local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(CorePackages.Packages.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)
local GetDisplayNamesValidModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.GetDisplayNamesValid)
local FIntDisplayNameMaxLength = game:DefineFastInt("FIntDisplayNameMaxLength", 20)
local FIntDisplayNameMinLength = game:DefineFastInt("FIntDisplayNameMinLength", 3)
local IssueCondition = require(CorePackages.Workspace.Packages.AuthCommon).Enums.IssueCondition
local config = {
	[0] = "None",
	[1] = "LengthTooShortOrTooLong",
	[2] = "LengthTooShortOrTooLong",
	[3] = "ContainsInvalidCharacter",
	[4] = "Inappropriate",
	[5] = "ValidationFailed",
	[8] = "TooManyCharacterSets"
}
local config1 = {
	ContainsInvalidCharacter = "Feature.DisplayName.Label.ValidCharacters",
	LengthTooShortOrTooLong = "Authentication.SignUp.Label.UsernameError2",
	MixedCharactersError = "Feature.DisplayName.Label.MixedCharactersError",
	Inappropriate = "Feature.DisplayName.Label.ModeratedCheck",
	ValidationFailed = "Feature.DisplayName.Label.ValidationFailed"
}
local config2 = {
	LengthTooShortOrTooLong = true,
	ContainsInvalidCharacter = true
}

local function v11()
	-- upvalues: config1 (copy), config2 (copy), IssueCondition (copy)
	local Hiddens = {}
	
	for i, _ in config1 do
		if not config2[i] then
			Hiddens[i] = IssueCondition.Hidden
		end
	end
	return Hiddens
end

function isValidLength(Text: string): boolean
	-- upvalues: FIntDisplayNameMinLength (copy), FIntDisplayNameMaxLength (copy)
	local Length = string.len(Text)
	
	return Length < FIntDisplayNameMinLength or FIntDisplayNameMaxLength < Length
end

function locallyValidateDisplayName(p1)
	-- upvalues: IssueCondition (copy)
	return isValidLength(p1), {
		LengthTooShortOrTooLong = if isValidLength(p1) then IssueCondition.Problematic else IssueCondition.Resolved
	}
end

return {
	validateFunction = function(p1, Input, IssueCondition1, p2)
		-- upvalues: v11 (copy), IssueCondition (copy), PromiseModule (copy), config2 (copy), CryoModule (copy), GetDisplayNamesValidModule (copy), HttpService (copy), config (copy)
		return function(_)
			-- upvalues: v11 (upval), Input (copy), IssueCondition1 (copy), IssueCondition (upval), PromiseModule (upval), config2 (upval), CryoModule (upval), GetDisplayNamesValidModule (upval), p1 (copy), p2 (copy), HttpService (upval), config (upval)
			local IssueCondition2 = v11()
			
			if Input == "" then
				return if IssueCondition1.ValidationFailed == IssueCondition.Problematic then PromiseModule.resolve({
					InputValid = false,
					hasRequestFailed = true,
					Input = Input,
					IssueCondition = IssueCondition1
				}) else PromiseModule.resolve({
					InputValid = false,
					Input = Input,
					IssueCondition = IssueCondition2
				})
			end
			local t = {}
			
			for i in config2 do
				t[i] = IssueCondition.Resolved
			end
			local JoinResult = CryoModule.Dictionary.join(IssueCondition2, t)
			local LocallyValidateDisplayNameResult, LocallyValidateDisplayNameResult2 = locallyValidateDisplayName(Input)
			
			return if LocallyValidateDisplayNameResult then if IssueCondition1.ValidationFailed == IssueCondition.Problematic then PromiseModule.resolve({
				InputValid = false,
				hasRequestFailed = true,
				Input = Input,
				IssueCondition = IssueCondition1
			}) else PromiseModule.resolve({
				InputValid = false,
				Input = Input,
				IssueCondition = CryoModule.Dictionary.join(JoinResult, LocallyValidateDisplayNameResult2)
			}) else GetDisplayNamesValidModule(p1, Input, p2.birthday):andThen(function()
				-- upvalues: PromiseModule (upval), Input (upval), JoinResult (copy)
				return PromiseModule.resolve({
					InputValid = true,
					hasRequestFailed = false,
					Input = Input,
					IssueCondition = JoinResult
				})
			end, function(p3)
				-- upvalues: HttpService (upval), JoinResult (copy), CryoModule (upval), config (upval), IssueCondition (upval), PromiseModule (upval), Input (upval)
				if p3 and p3.StatusCode == 400 then
					local Data = if p3 and p3.Body then HttpService:JSONDecode(p3.Body) else nil
					CryoModule.List.map(if Data and Data.errors then Data.errors else {}, function(p4)
						-- upvalues: config (upval), JoinResult (copy), IssueCondition (upval)
						JoinResult[config[p4.code]] = IssueCondition.Problematic
					end)
					
					return PromiseModule.resolve({
						InputValid = false,
						hasRequestFailed = false,
						Input = Input,
						IssueCondition = JoinResult
					})
				end
				local IssueCondition1 = {}
				
				for i in pairs(JoinResult) do
					IssueCondition1[i] = IssueCondition.Hidden
				end
				IssueCondition1.ValidationFailed = IssueCondition.Problematic
				
				return PromiseModule.resolve({
					InputValid = false,
					hasRequestFailed = true,
					Input = Input,
					IssueCondition = IssueCondition1
				})
			end)
		end
	end,
	getIssueMessageList = function()
		-- upvalues: config1 (copy)
		return config1
	end,
	getDefaultIssues = function()
		-- upvalues: config1 (copy), config2 (copy), IssueCondition (copy)
		local Hiddens = {}
		
		for i in pairs(config1) do
			if config2[i] then
				Hiddens[i] = IssueCondition.Problematic
			else
				Hiddens[i] = IssueCondition.Hidden
			end
		end
		return Hiddens
	end
}