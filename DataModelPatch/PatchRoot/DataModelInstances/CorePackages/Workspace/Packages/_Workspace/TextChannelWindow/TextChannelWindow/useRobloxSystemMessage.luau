local ReactModule = require(script.Parent.Parent.React)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local UseInExperienceLocalizationModule = require(script.Parent.useInExperienceLocalization)

return function()
	-- upvalues: MessageWriterContextModule (copy), UseInExperienceLocalizationModule (copy), ReactModule (copy), MessageModule (copy)
	local UseMessageWriterResult = MessageWriterContextModule.useMessageWriter()
	local UseInExperienceLocalizationModuleResult = UseInExperienceLocalizationModule()
	
	return {
		displayRobloxSystemMessage = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseMessageWriterResult (copy), UseInExperienceLocalizationModuleResult (copy), MessageModule (upval)
			if not UseMessageWriterResult then return end
			local UseInExperienceLocalizationModuleResultResult = UseInExperienceLocalizationModuleResult(p1)
			
			if UseInExperienceLocalizationModuleResultResult == "" then
				UseInExperienceLocalizationModuleResultResult = p2
			end
			if UseInExperienceLocalizationModuleResultResult ~= "" then
				UseMessageWriterResult.write(MessageModule.createSystemMessage(UseInExperienceLocalizationModuleResultResult, "Roblox.ChatDisabled.Info"))
				
				return
			end
		end, {
			UseMessageWriterResult,
			UseInExperienceLocalizationModuleResult
		}),
		clearAvailabilityMessage = ReactModule.useCallback(function()
			-- upvalues: UseMessageWriterResult (copy)
			if UseMessageWriterResult then
				UseMessageWriterResult.remove("Roblox.ChatDisabled.Info")
			end
		end, { UseMessageWriterResult })
	}
end