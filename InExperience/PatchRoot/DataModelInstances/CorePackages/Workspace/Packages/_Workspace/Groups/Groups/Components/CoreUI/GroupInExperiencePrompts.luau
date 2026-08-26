local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local useState = reactModule.useState
local promptConnectionsModule = require(parent.Components.CoreUI.PromptConnections)
local groupJoinPromptModule = require(parent.Components.CoreUI.GroupJoinPrompt)
local focusNavigationUtilsModule = require(parent_1.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local _ = require(parent.Common.Types)
local _ = { PromptJoinGroup = "PromptJoinGroup" }
local t = { PromptJoinGroup = groupJoinPromptModule }

return function(p1)
	-- upvalues: useState (ref), reactModule (ref), cryoModule (ref), t (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1, var2 = useState({
		promptType = nil,
		promptData = nil,
		data = nil,
		callbacks = nil,
		promptQueue = {}
	})
	local promptData = var1.promptData
	local promptType = var1.promptType
	local data = var1.data
	local callbacks = var1.callbacks
	local var3 = reactModule.useCallback(function()
		-- upvalues: cryoModule (copy), var1 (ref), var2 (ref)
		if cryoModule.isEmpty(var1.promptQueue) then
			var2({
				promptType = nil,
				promptData = nil,
				data = nil,
				callbacks = nil,
				promptQueue = {}
			})
			
			return
		end
		var2(cryoModule.Dictionary.join(var1, {
			promptType = var1.promptQueue[1].promptType,
			promptData = var1.promptQueue[1].promptData,
			data = var1.promptQueue[1].data,
			callbacks = var1.promptQueue[1].callbacks,
			promptQueue = cryoModule.List.removeIndex(var1.promptQueue, 1)
		}))
	end, { var1, var2 })
	local var4 = nil
	
	if promptType then
		local var5 = t[promptType]
		
		if var5 then
			var4 = reactModule.createElement(var5, {
				enableInputDelayed = p1.enableInputDelayed,
				groupId = if promptData then promptData.groupId else nil,
				data = data,
				onJoin = if callbacks then callbacks.onJoin else nil,
				onClose = if callbacks then callbacks.onClose else nil
			})
		else
			error(`Unexpected prompt type: {promptType}!`)
		end
	end
	return reactModule.createElement(reactModule.Fragment, {}, {
		PromptConnections = reactModule.createElement(promptConnectionsModule, {
			openGroupJoinPrompt = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
				if var1.promptType == nil then
					var2({
						promptType = "PromptJoinGroup",
						promptData = { groupId = p2 },
						data = p3,
						callbacks = p4,
						promptQueue = {}
					})
					
					return
				end
				var2(cryoModule.Dictionary.join(var1, {
					promptQueue = cryoModule.List.join(var1.promptQueue, {
						{
							promptType = "PromptJoinGroup",
							promptData = { groupId = p2 },
							data = p3,
							callbacks = p4
						}
					})
				}))
			end, { var1, var2 }),
			closePrompt = var3
		}),
		FocusNavigationCoreScriptsWrapper = if var4 then reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var4 }) else nil
	})
end