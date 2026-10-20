local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local FoundationModule = require(Parent.Foundation)
local MessageModule = require(script.Parent.Message)
local MessageWriterContextModule = require(script.Parent.MessageWriterContext)
local FFlagExpChatTextChannelWindowWelcomeAndSummaryModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowWelcomeAndSummary)
local UseInExperienceLocalizationFunction = require(Parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local self = setmetatable({}, { __mode = "k" })

return function(p1, Callback)
	-- upvalues: MessageWriterContextModule (copy), UseInExperienceLocalizationFunction (copy), ReactModule (copy), FFlagExpChatTextChannelWindowWelcomeAndSummaryModule (copy), SignalsModule (copy), self (copy), MessageModule (copy), FoundationModule (copy)
	local UseMessageWriterResult = MessageWriterContextModule.useMessageWriter()
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTextChannelWindowWelcomeAndSummaryModule (upval), UseMessageWriterResult (copy), p1 (copy), SignalsModule (upval), Callback (copy), self (upval), UseInExperienceLocalizationResult (copy), MessageModule (upval), FoundationModule (upval)
		if not FFlagExpChatTextChannelWindowWelcomeAndSummaryModule then return end
		if not UseMessageWriterResult or p1 == nil then return end
		if p1.Name ~= "RBXGeneral" then return end
		return (SignalsModule.createEffect(function(p2)
			-- upvalues: Callback (upval), self (upval), p1 (copy), UseInExperienceLocalizationResult (upval), UseMessageWriterResult (upval), MessageModule (upval), FoundationModule (upval)
			if not Callback(p2) or self[p1] then return end
			local CoreScriptsTextChatChatWindowSummarySystemMessage = UseInExperienceLocalizationResult("CoreScripts.TextChat.ChatWindow.SummarySystemMessage")
			
			if CoreScriptsTextChatChatWindowSummarySystemMessage == "" then
				CoreScriptsTextChatChatWindowSummarySystemMessage = "Roblox auto-generates summaries of players' messages."
			end
			self[p1] = true
			UseMessageWriterResult.write(MessageModule.createExperienceSystemMessage(CoreScriptsTextChatChatWindowSummarySystemMessage, "Roblox.Summary.Info:" .. p1.Name, FoundationModule.Enums.IconName.Nebula))
		end))
	end, {
		UseMessageWriterResult,
		UseInExperienceLocalizationResult,
		p1,
		Callback
	})
end