local parent = script.Parent.Parent
local reactModule = require(parent.React)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization

return function() --[[ line: 17 | named "useRobloxSystemMessage" ]]
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalization (ref), reactModule (ref), messageModule (ref)
	local var3 = messageWriterContextModule.useMessageWriter()
	local var4 = useInExperienceLocalization()
	
	return {
		displayRobloxSystemMessage = reactModule.useCallback(function(p0, p1) --[[ line: 21 ]]
			-- upvalues: var3 (ref), var4 (ref), messageModule (copy)
			if not var3 then return end
			local var5 = var4(p0)
			
			if var5 == "" then
				var5 = p1
			end
			if var5 == "" then
				return
			end
			var3.write(messageModule.createSystemMessage(var5, "Roblox.ChatDisabled.Info"))
		end, { var3, var4 }),
		clearAvailabilityMessage = reactModule.useCallback(function() --[[ line: 35 ]]
			-- upvalues: var3 (ref)
			if var3 then
				var3.remove("Roblox.ChatDisabled.Info")
			end
		end, { var3 })
	}
end