local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local promptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local isPinShortcutAvailableModule = require(script.Parent.isPinShortcutAvailable)
local fFlagEdpGameLeavePromptsPassPinShortcutAvailable = require(parent.SharedFlags).FFlagEdpGameLeavePromptsPassPinShortcutAvailable

return function(p1)
	-- upvalues: reactModule (ref), isPinShortcutAvailableModule (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (ref), messageBus (ref), tModule (ref), promptsHandler (ref), promptsEntryPointModule (ref)
	local var1, var2 = reactModule.useState(0)
	local var3 = reactModule.useMemo(isPinShortcutAvailableModule, {})
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), var3 (ref)
		return if p1.universeId == nil then nil elseif fFlagEdpGameLeavePromptsPassPinShortcutAvailable then {
			universeId = p1.universeId,
			isPinnedShortcutAvailable = tostring(var3)
		} else { universeId = p1.universeId }
	end, { p1.universeId, var3 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), var3 (ref), messageBus (copy), tModule (copy), var2 (ref)
		if p1.universeId == nil then return end
		if fFlagEdpGameLeavePromptsPassPinShortcutAvailable or var3 then
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
	
	return if var1 == 0 or var4 == nil then nil elseif fFlagEdpGameLeavePromptsPassPinShortcutAvailable or var3 then reactModule.createElement(promptsHandler, {
		key = "EdpPrompts" .. tostring(var1),
		entryPoint = promptsEntryPointModule.ExperienceDetailsPageSessionEnd,
		clientAttributes = var4
	}) else nil
end