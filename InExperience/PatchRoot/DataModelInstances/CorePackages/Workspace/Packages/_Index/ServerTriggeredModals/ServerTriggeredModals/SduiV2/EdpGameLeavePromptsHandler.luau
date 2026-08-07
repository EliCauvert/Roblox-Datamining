local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local promptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local isPinShortcutAvailableModule = require(script.Parent.isPinShortcutAvailable)

return function(p0) --[[ line: 16 | named "EdpGameLeavePromptsHandler" ]]
	-- upvalues: reactModule (ref), isPinShortcutAvailableModule (ref), messageBus (ref), tModule (ref), promptsHandler (ref), promptsEntryPointModule (ref)
	local var4, var5 = reactModule.useState(0)
	local var6 = reactModule.useMemo(isPinShortcutAvailableModule, {})
	local var7 = reactModule.useMemo(function() --[[ line: 20 ]]
		-- upvalues: p0 (ref)
		return if p0.universeId == nil then nil else { universeId = p0.universeId }
	end, { p0.universeId })
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: var6 (ref), p0 (ref), messageBus (copy), tModule (copy), var5 (ref)
		if var6 and p0.universeId ~= nil then
			local var8 = messageBus.Subscriber.new()
			local game = messageBus.getMessageId("Game", "onGameLeave")
			var8:subscribe({ mid = game, validateParams = tModule.table }, function() --[[ line: 39 ]]
				-- upvalues: var5 (copy)
				var5(function(p1) --[[ line: 40 ]]
					return p1 + 1
				end)
			end)
			
			return function() --[[ line: 45 ]]
				-- upvalues: var8 (ref), game (ref)
				var8:unsubscribeWithMsgId(game)
			end
		end
	end, { var6, p0.universeId })
	
	return if var6 and var4 ~= 0 and var7 ~= nil then reactModule.createElement(promptsHandler, {
		key = "EdpPrompts" .. tostring(var4),
		entryPoint = promptsEntryPointModule.ExperienceDetailsPageSessionEnd,
		clientAttributes = var7
	}) else nil
end