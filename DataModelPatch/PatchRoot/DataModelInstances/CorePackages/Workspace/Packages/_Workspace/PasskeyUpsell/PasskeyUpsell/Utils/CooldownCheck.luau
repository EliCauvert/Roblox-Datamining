local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local Logger = require(Parent.Loggers).Logger
local GetPromptAssignmentsFunction = require(Parent.PromptAssignments).Thunks.GetPromptAssignments
local PromptType = require(Parent.PromptAssignments).Enum.PromptType

return function(p1, p2)
	-- upvalues: GetPromptAssignmentsFunction (copy), PromptType (copy), Logger (copy)
	return p2:dispatch(GetPromptAssignmentsFunction(p1)):andThen(function(Result): boolean
		-- upvalues: PromptType (upval), Logger (upval)
		for _, value in ipairs(Result) do
			if value and PromptType.fromRawValue(value.promptType) == PromptType.PasskeyUpsell then
				Logger:info("User does NOT have a cooldown for passkey upsell.")
				
				return false
			end
		end
		Logger:info("User has a cooldown for passkey upsell.")
		
		return true
	end):catch(function(Err): boolean
		-- upvalues: Logger (upval)
		Logger:debug("Error checking for passkey cooldown: {}", Err)
		
		return false
	end)
end