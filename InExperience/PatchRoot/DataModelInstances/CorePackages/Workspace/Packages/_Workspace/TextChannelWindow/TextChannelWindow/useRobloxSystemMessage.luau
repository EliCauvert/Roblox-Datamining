local parent = script.Parent.Parent
local reactModule = require(parent.React)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization

return function()
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalization (ref), reactModule (ref), messageModule (ref)
	local var1 = messageWriterContextModule.useMessageWriter()
	local var2 = useInExperienceLocalization()
	
	return {
		displayRobloxSystemMessage = reactModule.useCallback(function(p1, p2)
			-- upvalues: var1 (ref), var2 (ref), messageModule (copy)
			if not var1 then return end
			local var3 = var2(p1)
			
			if var3 == "" then
				var3 = p2
			end
			if var3 == "" then
				return
			end
			var1.write(messageModule.createSystemMessage(var3, "Roblox.ChatDisabled.Info"))
		end, { var1, var2 }),
		clearAvailabilityMessage = reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			if var1 then
				var1.remove("Roblox.ChatDisabled.Info")
			end
		end, { var1 })
	}
end