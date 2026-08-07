local reactModule = require(script.Parent.Parent.React)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local useInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)

return function() --[[ line: 17 | named "useRobloxSystemMessage" ]]
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalizationModule (ref), reactModule (ref), messageModule (ref)
	local var4 = messageWriterContextModule.useMessageWriter()
	local var5 = useInExperienceLocalizationModule()
	
	return {
		displayRobloxSystemMessage = reactModule.useCallback(function(p0, p1) --[[ line: 21 ]]
			-- upvalues: var4 (ref), var5 (ref), messageModule (copy)
			if not var4 then return end
			local var6 = var5(p0)
			
			if var6 == "" then
				var6 = p1
			end
			if var6 == "" then
				return
			end
			var4.write(messageModule.createSystemMessage(var6, "Roblox.ChatDisabled.Info"))
		end, { var4, var5 }),
		clearAvailabilityMessage = reactModule.useCallback(function() --[[ line: 35 ]]
			-- upvalues: var4 (ref)
			if var4 then
				var4.remove("Roblox.ChatDisabled.Info")
			end
		end, { var4 })
	}
end