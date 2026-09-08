local parent = script.Parent.Parent
local reactModule = require(parent.React)
local messageModule = require(script.Parent.Message)
local messageWriterContextModule = require(script.Parent.MessageWriterContext)
local useInExperienceLocalization = require(parent.ChatUIPrimitives).Hooks.useInExperienceLocalization
local fFlagExpChatMemoizeSystemMessageModule = require(script.Parent.Flags.FFlagExpChatMemoizeSystemMessage)

return function()
	-- upvalues: messageWriterContextModule (ref), useInExperienceLocalization (ref), reactModule (ref), messageModule (ref), fFlagExpChatMemoizeSystemMessageModule (ref)
	local var1 = messageWriterContextModule.useMessageWriter()
	local var2 = useInExperienceLocalization()
	local var3 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var1 (ref), var2 (ref), messageModule (copy)
		if not var1 then return end
		local var4 = var2(p1)
		
		if var4 == "" then
			var4 = p2
		end
		if var4 == "" then
			return
		end
		var1.write(messageModule.createSystemMessage(var4, "Roblox.ChatDisabled.Info"))
	end, { var1, var2 })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1 then
			var1.remove("Roblox.ChatDisabled.Info")
		end
	end, { var1 })
	
	return if fFlagExpChatMemoizeSystemMessageModule then reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref)
		return {
			displayRobloxSystemMessage = var3,
			clearAvailabilityMessage = var4
		}
	end, { var3, var4 }) else {
		displayRobloxSystemMessage = var3,
		clearAvailabilityMessage = var4
	}
end