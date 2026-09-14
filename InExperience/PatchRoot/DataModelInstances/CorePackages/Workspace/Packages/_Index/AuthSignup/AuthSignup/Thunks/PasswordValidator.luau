local parent = script:FindFirstAncestor("AuthSignup").Parent
local authCommonModule = require(parent.AuthCommon)
local postPasswordValid = authCommonModule.Http.Requests.PostPasswordValid
local promiseModule = require(parent.Promise)
local passwordIssue = authCommonModule.Enums.PasswordIssue
local issueCondition = authCommonModule.Enums.IssueCondition
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = if sharedFlagsModule.FFlagSignUpPasswordCopyV2 then {
	[passwordIssue.Length] = "Authentication.SignUp.Label.PasswordPlaceholder",
	[passwordIssue.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2.V2",
	[passwordIssue.Simple] = "Authentication.SignUp.Label.PasswordError3.V2"
} else {
	[passwordIssue.Length] = if sharedFlagsModule.GetFFlagPasswordErrorLength() then "Authentication.SignUp.PasswordErrorLength" else "Authentication.SignUp.Label.PasswordError1",
	[passwordIssue.UsernameMatch] = "Authentication.SignUp.Label.PasswordError2",
	[passwordIssue.Simple] = "Authentication.SignUp.Label.PasswordError3"
}

local function _(p1, p2, p3, p4)
	-- upvalues: passwordIssue (ref), issueCondition (ref), promiseModule (ref), postPasswordValid (ref)
	return function(_)
		-- upvalues: passwordIssue (copy), issueCondition (copy), p4 (ref), p2 (ref), p3 (ref), promiseModule (copy), postPasswordValid (copy), p1 (ref)
		local t = {
			[passwordIssue.Length] = issueCondition.Resolved,
			[passwordIssue.UsernameMatch] = issueCondition.Resolved,
			[passwordIssue.Simple] = if p4[passwordIssue.Simple] ~= issueCondition.Hidden then issueCondition.Resolved else issueCondition.Hidden
		}
		
		if p2 ~= nil and p3 ~= nil and (p2 ~= "" and p3 ~= "") and string.match(p3, "%S") ~= nil then
			return postPasswordValid(p1, p2, p3):andThen(function(p5)
				-- upvalues: t (ref), passwordIssue (copy), issueCondition (copy), p3 (copy), promiseModule (copy)
				local t_1 = {}
				local code = p5 and (p5.responseBody and p5.responseBody.code)
				
				if type(code) ~= "number" then
					warn("JSON failure")
				elseif code == 2 then
					t[passwordIssue.Length] = issueCondition.Problematic
				elseif code == 3 then
					t[passwordIssue.UsernameMatch] = issueCondition.Problematic
				elseif code == 4 or code == 5 then
					t[passwordIssue.Simple] = issueCondition.Problematic
				end
				t_1.Input = p3
				t_1.InputValid = code == 0
				t_1.IssueCondition = t
				
				return promiseModule.resolve(t_1)
			end, function(_)
				-- upvalues: promiseModule (copy), p3 (copy), t (ref)
				return promiseModule.resolve({ InputValid = true, Input = p3, IssueCondition = t })
			end)
		end
		for i in pairs(t) do
			if t[i] == issueCondition.Resolved then
				t[i] = issueCondition.Problematic
			end
		end
		return promiseModule.resolve({ InputValid = false, Input = p3, IssueCondition = t })
	end
end

return {
	validateFunction = function(p5, p6, p7, p8)
		-- upvalues: passwordIssue (ref), issueCondition (ref), promiseModule (ref), postPasswordValid (ref)
		local username = (p8 or {}).username
		
		return function(_)
			-- upvalues: passwordIssue (copy), issueCondition (copy), p7 (ref), username (ref), p6 (ref), promiseModule (copy), postPasswordValid (copy), p5 (ref)
			local t = {
				[passwordIssue.Length] = issueCondition.Resolved,
				[passwordIssue.UsernameMatch] = issueCondition.Resolved,
				[passwordIssue.Simple] = if p7[passwordIssue.Simple] ~= issueCondition.Hidden then issueCondition.Resolved else issueCondition.Hidden
			}
			
			if username ~= nil and p6 ~= nil and (username ~= "" and p6 ~= "") and string.match(p6, "%S") ~= nil then
				return postPasswordValid(p5, username, p6):andThen(function(p9)
					-- upvalues: t (ref), passwordIssue (copy), issueCondition (copy), p6 (copy), promiseModule (copy)
					local t_1 = {}
					local code = p9 and (p9.responseBody and p9.responseBody.code)
					
					if type(code) ~= "number" then
						warn("JSON failure")
					elseif code == 2 then
						t[passwordIssue.Length] = issueCondition.Problematic
					elseif code == 3 then
						t[passwordIssue.UsernameMatch] = issueCondition.Problematic
					elseif code == 4 or code == 5 then
						t[passwordIssue.Simple] = issueCondition.Problematic
					end
					t_1.Input = p6
					t_1.InputValid = code == 0
					t_1.IssueCondition = t
					
					return promiseModule.resolve(t_1)
				end, function(_)
					-- upvalues: promiseModule (copy), p6 (copy), t (ref)
					return promiseModule.resolve({ InputValid = true, Input = p6, IssueCondition = t })
				end)
			end
			for i in pairs(t) do
				if t[i] == issueCondition.Resolved then
					t[i] = issueCondition.Problematic
				end
			end
			return promiseModule.resolve({ InputValid = false, Input = p6, IssueCondition = t })
		end
	end,
	getIssueMessageList = function()
		-- upvalues: var1 (ref)
		return var1
	end,
	getDefaultIssues = function()
		-- upvalues: var1 (ref), issueCondition (ref)
		local t = {}
		
		for i in pairs(var1) do
			t[i] = issueCondition.Problematic
		end
		return t
	end
}