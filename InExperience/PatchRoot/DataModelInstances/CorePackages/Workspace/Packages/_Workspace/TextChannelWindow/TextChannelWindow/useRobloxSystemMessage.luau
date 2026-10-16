local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local FFlagExpChatMemoizeSystemMessageModule = require(script.Parent.Flags.FFlagExpChatMemoizeSystemMessage)

return function() --[[ Line: 18 | Named "useRobloxSystemMessage" ]]
	-- upvalues: MessageWriterContextModule (copy), UseInExperienceLocalizationFunction (copy), ReactModule (copy), MessageModule (copy), FFlagExpChatMemoizeSystemMessageModule (copy)
	local UseMessageWriterResult = MessageWriterContextModule.useMessageWriter()
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	local UseResult = ReactModule.useCallback(function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: UseMessageWriterResult (copy), UseInExperienceLocalizationResult (copy), MessageModule (upval)
		if not UseMessageWriterResult then return end
		local UseInExperienceLocalizationResultResult = UseInExperienceLocalizationResult(p1)
		
		if UseInExperienceLocalizationResultResult == "" then
			UseInExperienceLocalizationResultResult = p2
		end
		if UseInExperienceLocalizationResultResult ~= "" then
			UseMessageWriterResult.write(MessageModule.createSystemMessage(UseInExperienceLocalizationResultResult, "Roblox.ChatDisabled.Info"))
			
			return
		end
	end, {
		UseMessageWriterResult,
		UseInExperienceLocalizationResult
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 36 ]]
		-- upvalues: UseMessageWriterResult (copy)
		if UseMessageWriterResult then
			UseMessageWriterResult.remove("Roblox.ChatDisabled.Info")
		end
	end, { UseMessageWriterResult })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 42 ]]
		-- upvalues: UseResult (copy), UseResult1 (copy)
		return {
			displayRobloxSystemMessage = UseResult,
			clearAvailabilityMessage = UseResult1
		}
	end, { UseResult, UseResult1 })
	
	return if FFlagExpChatMemoizeSystemMessageModule then UseMemoResult else {
		displayRobloxSystemMessage = UseResult,
		clearAvailabilityMessage = UseResult1
	}
end