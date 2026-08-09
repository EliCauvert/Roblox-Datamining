local reactModule = require(script.Parent.Parent.React)
local _ = require(script.Parent.ChatApp)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local useInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)

return function() --[[ line: 18 | named "useRobloxSystemMessage" ]]
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalizationModule (ref), reactModule (ref)
	local var3 = messageWriterContextModule.useMessageWriter()
	local var4 = useInExperienceLocalizationModule()
	
	return {
		displayRobloxSystemMessage = reactModule.useCallback(function(p0, p1) --[[ line: 22 ]]
			-- upvalues: var3 (ref), var4 (ref)
			if not var3 then return end
			local var5 = var4(p0)
			
			if var5 == "" then
				var5 = p1
			end
			if var5 == "" then
				return
			end
			var3.write({
				messageType = "system-roblox",
				messageId = "Roblox.ChatDisabled.Info",
				content = var5,
				timestamp = DateTime.now()
			})
		end, { var3, var4 }),
		clearAvailabilityMessage = reactModule.useCallback(function() --[[ line: 41 ]]
			-- upvalues: var3 (ref)
			if var3 then
				var3.remove("Roblox.ChatDisabled.Info")
			end
		end, { var3 })
	}
end