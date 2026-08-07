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

return function(p0) --[[ line: 54 ]]
	-- upvalues: useState (ref), reactModule (ref), cryoModule (ref), t (ref), promptConnectionsModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var6, var7 = useState({
		promptType = nil,
		promptData = nil,
		data = nil,
		callbacks = nil,
		promptQueue = {}
	})
	local promptData = var6.promptData
	local promptType = var6.promptType
	local data = var6.data
	local callbacks = var6.callbacks
	local var8 = reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: cryoModule (copy), var6 (ref), var7 (ref)
		if cryoModule.isEmpty(var6.promptQueue) then
			var7({
				promptType = nil,
				promptData = nil,
				data = nil,
				callbacks = nil,
				promptQueue = {}
			})
			
			return
		end
		var7(cryoModule.Dictionary.join(var6, {
			promptType = var6.promptQueue[1].promptType,
			promptData = var6.promptQueue[1].promptData,
			data = var6.promptQueue[1].data,
			callbacks = var6.promptQueue[1].callbacks,
			promptQueue = cryoModule.List.removeIndex(var6.promptQueue, 1)
		}))
	end, { var6, var7 })
	local var9 = nil
	
	if promptType then
		local var10 = t[promptType]
		
		if var10 then
			var9 = reactModule.createElement(var10, {
				enableInputDelayed = p0.enableInputDelayed,
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
			openGroupJoinPrompt = reactModule.useCallback(function(p1, p2, p3) --[[ line: 105 ]]
				-- upvalues: var6 (ref), var7 (ref), cryoModule (copy)
				if var6.promptType == nil then
					var7({
						promptType = "PromptJoinGroup",
						promptData = { groupId = p1 },
						data = p2,
						callbacks = p3,
						promptQueue = {}
					})
					
					return
				end
				var7(cryoModule.Dictionary.join(var6, {
					promptQueue = cryoModule.List.join(var6.promptQueue, {
						{
							promptType = "PromptJoinGroup",
							promptData = { groupId = p1 },
							data = p2,
							callbacks = p3
						}
					})
				}))
			end, { var6, var7 }),
			closePrompt = var8
		}),
		FocusNavigationCoreScriptsWrapper = if var9 then reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = var9 }) else nil
	})
end