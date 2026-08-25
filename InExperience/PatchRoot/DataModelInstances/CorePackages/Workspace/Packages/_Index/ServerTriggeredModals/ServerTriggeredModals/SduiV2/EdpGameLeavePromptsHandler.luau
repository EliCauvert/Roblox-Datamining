local parent = script:FindFirstAncestor("ServerTriggeredModals").Parent
local reactModule = require(parent.React)
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local promptsHandler = require(script.Parent.PromptsHandler).PromptsHandler
local promptsEntryPointModule = require(script.Parent.PromptsEntryPoint)
local isPinShortcutAvailableModule = require(script.Parent.isPinShortcutAvailable)
local fFlagEdpGameLeavePromptsPassPinShortcutAvailable = require(parent.SharedFlags).FFlagEdpGameLeavePromptsPassPinShortcutAvailable

return function(p0)
	-- upvalues: reactModule (ref), isPinShortcutAvailableModule (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (ref), messageBus (ref), tModule (ref), promptsHandler (ref), promptsEntryPointModule (ref)
	local var4, var5 = reactModule.useState(0)
	local var6 = reactModule.useMemo(isPinShortcutAvailableModule, {})
	local var7 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), var6 (ref)
		return if p0.universeId == nil then nil elseif fFlagEdpGameLeavePromptsPassPinShortcutAvailable then {
			universeId = p0.universeId,
			isPinnedShortcutAvailable = tostring(var6)
		} else { universeId = p0.universeId }
	end, { p0.universeId, var6 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), fFlagEdpGameLeavePromptsPassPinShortcutAvailable (copy), var6 (ref), messageBus (copy), tModule (copy), var5 (ref)
		if p0.universeId == nil then return end
		if fFlagEdpGameLeavePromptsPassPinShortcutAvailable or var6 then
			local var8 = messageBus.Subscriber.new()
			local game = messageBus.getMessageId("Game", "onGameLeave")
			var8:subscribe({ mid = game, validateParams = tModule.table }, function()
				-- upvalues: var5 (copy)
				var5(function(p1)
					return p1 + 1
				end)
			end)
			
			return function()
				-- upvalues: var8 (ref), game (ref)
				var8:unsubscribeWithMsgId(game)
			end
		end
	end, { var6, p0.universeId })
	
	return if var4 == 0 or var7 == nil then nil elseif fFlagEdpGameLeavePromptsPassPinShortcutAvailable or var6 then reactModule.createElement(promptsHandler, {
		key = "EdpPrompts" .. tostring(var4),
		entryPoint = promptsEntryPointModule.ExperienceDetailsPageSessionEnd,
		clientAttributes = var7
	}) else nil
end