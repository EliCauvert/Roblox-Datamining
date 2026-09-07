local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local promptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local isPinShortcutAvailableModule = require(script.Parent.isPinShortcutAvailable)

return function(p1)
	-- upvalues: reactModule (ref), isPinShortcutAvailableModule (ref), messageBus (ref), tModule (ref), promptsHandler (ref), promptsEntryPointModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3 = reactModule.useMemo(isPinShortcutAvailableModule, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.universeId == nil then nil else { universeId = p1.universeId }
	end, { p1.universeId })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref), messageBus (copy), tModule (copy), var2 (ref)
		if var3 and p1.universeId ~= nil then
			local var5 = messageBus.Subscriber.new()
			local game = messageBus.getMessageId("Game", "onGameLeave")
			var5:subscribe({ mid = game, validateParams = tModule.table }, function()
				-- upvalues: var2 (copy)
				var2(function(p2)
					return p2 + 1
				end)
			end)
			
			return function()
				-- upvalues: var5 (ref), game (ref)
				var5:unsubscribeWithMsgId(game)
			end
		end
	end, { var3, p1.universeId })
	
	return if var3 and var1 ~= 0 and var4 ~= nil then reactModule.createElement(promptsHandler, {
		key = "EdpPrompts" .. tostring(var1),
		entryPoint = promptsEntryPointModule.ExperienceDetailsPageSessionEnd,
		clientAttributes = var4
	}) else nil
end