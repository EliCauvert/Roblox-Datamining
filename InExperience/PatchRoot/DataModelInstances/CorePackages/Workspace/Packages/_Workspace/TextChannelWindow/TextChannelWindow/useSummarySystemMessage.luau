local parent = script.Parent.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local foundationModule = require(parent.Foundation)
local chatUIPrimitivesModule = require(parent.ChatUIPrimitives)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local fFlagExpChatTextChannelWindowWelcomeAndSummaryModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowWelcomeAndSummary)
local useInExperienceLocalization = chatUIPrimitivesModule.Hooks.useInExperienceLocalization
local tbl = setmetatable({}, { __mode = "k" })

return function(p1, p2)
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalization (ref), reactModule (ref), fFlagExpChatTextChannelWindowWelcomeAndSummaryModule (ref), signalsModule (ref), tbl (ref), messageModule (ref), foundationModule (ref)
	local var1 = messageWriterContextModule.useMessageWriter()
	local var2 = useInExperienceLocalization()
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTextChannelWindowWelcomeAndSummaryModule (copy), var1 (ref), p1 (ref), signalsModule (copy), p2 (ref), tbl (copy), var2 (ref), messageModule (copy), foundationModule (copy)
		if not fFlagExpChatTextChannelWindowWelcomeAndSummaryModule then return end
		if not var1 or p1 == nil then return end
		if p1.Name == "RBXGeneral" then
			return signalsModule.createEffect(function(p3)
				-- upvalues: p2 (copy), tbl (copy), p1 (ref), var2 (copy), var1 (copy), messageModule (copy), foundationModule (copy)
				if not p2(p3) or tbl[p1] then return end
				local var3 = var2("CoreScripts.TextChat.ChatWindow.SummarySystemMessage")
				
				if var3 == "" then
					var3 = "Roblox auto-generates summaries of players' messages."
				end
				tbl[p1] = true
				var1.write(messageModule.createExperienceSystemMessage(var3, "Roblox.Summary.Info:" .. p0.Name, foundationModule.Enums.IconName.Nebula))
			end)
		end
	end, { var1, var2, p1, p2 })
end