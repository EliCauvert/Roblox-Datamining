local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local UpdatePromptAssignmentFunction = require(Parent.PromptAssignments).Thunks.UpdatePromptAssignment
local PromptType = require(Parent.PromptAssignments).Enum.PromptType
local PromptAssignmentAction = require(Parent.PromptAssignments).Enum.PromptAssignmentAction
local HttpService = game:GetService("HttpService")
local Logger = require(Parent.Loggers).Logger

return function(p1, Callback)
	-- upvalues: UpdatePromptAssignmentFunction (copy), PromptType (copy), PromptAssignmentAction (copy), Logger (copy), HttpService (copy)
	return Callback(UpdatePromptAssignmentFunction(p1, PromptType.PasskeyUpsell, PromptAssignmentAction.DismissPrompt)):catch(function(Err)
		-- upvalues: Logger (upval), HttpService (upval)
		Logger:debug("Error updating passkey upsell prompt cooldown {}", HttpService:JSONEncode(Err))
	end)
end