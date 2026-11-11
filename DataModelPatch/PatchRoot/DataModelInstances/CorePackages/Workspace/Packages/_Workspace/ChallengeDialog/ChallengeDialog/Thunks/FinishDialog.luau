local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(ChallengeDialog.Parent.Promise)
local ChallengeDialogActionModule = require(ChallengeDialog.Enum.ChallengeDialogAction)
local ChallengeDialogErrorModule = require(ChallengeDialog.Enum.ChallengeDialogError)
local PostFinishDialogModule = require(ChallengeDialog.Requests.PostFinishDialog)

return function(p1, p2, p3)
	-- upvalues: PostFinishDialogModule (copy), ChallengeDialogActionModule (copy), PromiseModule (copy), ChallengeDialogErrorModule (copy), HttpService (copy)
	return function(_)
		-- upvalues: PostFinishDialogModule (upval), p1 (copy), p2 (copy), ChallengeDialogActionModule (upval), p3 (copy), PromiseModule (upval), ChallengeDialogErrorModule (upval), HttpService (upval)
		return PostFinishDialogModule(p1, p2, ChallengeDialogActionModule.toRawValue(p3)):andThen(function(Result)
			return Result.responseBody
		end):catch(function(Err)
			-- upvalues: PromiseModule (upval), ChallengeDialogErrorModule (upval), HttpService (upval)
			return if Err.Body then PromiseModule.reject(ChallengeDialogErrorModule.fromRawValue(HttpService:JSONDecode(Err.Body).errors[1].code) or ChallengeDialogErrorModule.Unknown) else PromiseModule.reject(ChallengeDialogErrorModule.Unknown)
		end)
	end
end