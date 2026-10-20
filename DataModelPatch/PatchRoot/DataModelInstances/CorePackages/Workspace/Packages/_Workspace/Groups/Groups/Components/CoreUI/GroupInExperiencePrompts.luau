local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UseStateFunction = ReactModule.useState
local PromptConnectionsModule = require(Parent.Components.CoreUI.PromptConnections)
local FocusNavigationUtilsModule = require(Parent1.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local _ = require(Parent.Common.Types)
local config = {
	PromptJoinGroup = require(Parent.Components.CoreUI.GroupJoinPrompt)
}

return function(p1)
	-- upvalues: UseStateFunction (copy), ReactModule (copy), CryoModule (copy), config (copy), PromptConnectionsModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction({
		promptType = nil,
		promptData = nil,
		data = nil,
		callbacks = nil,
		promptQueue = {}
	})
	local PromptData = UseStateResult.promptData
	local PromptType = UseStateResult.promptType
	local Data = UseStateResult.data
	local Callbacks = UseStateResult.callbacks
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: CryoModule (upval), UseStateResult (copy), UseStateResult2 (copy)
		if CryoModule.isEmpty(UseStateResult.promptQueue) then
			UseStateResult2({
				promptType = nil,
				promptData = nil,
				data = nil,
				callbacks = nil,
				promptQueue = {}
			})
			
			return
		else
			UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
				promptType = UseStateResult.promptQueue[1].promptType,
				promptData = UseStateResult.promptQueue[1].promptData,
				data = UseStateResult.promptQueue[1].data,
				callbacks = UseStateResult.promptQueue[1].callbacks,
				promptQueue = CryoModule.List.removeIndex(UseStateResult.promptQueue, 1)
			}))
		end
	end, { UseStateResult, UseStateResult2 })
	local Element = nil
	
	if PromptType then
		local Entry = config[PromptType]
		
		if Entry then
			Element = ReactModule.createElement(Entry, {
				enableInputDelayed = p1.enableInputDelayed,
				groupId = if PromptData then PromptData.groupId else nil,
				data = Data,
				onJoin = if Callbacks then Callbacks.onJoin else nil,
				onClose = if Callbacks then Callbacks.onClose else nil
			})
		else
			error(`Unexpected prompt type: {PromptType}!`)
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		PromptConnections = ReactModule.createElement(PromptConnectionsModule, {
			openGroupJoinPrompt = ReactModule.useCallback(function(GroupId, Data, Callbacks)
				-- upvalues: UseStateResult (copy), UseStateResult2 (copy), CryoModule (upval)
				if UseStateResult.promptType == nil then
					UseStateResult2({
						promptType = "PromptJoinGroup",
						promptData = { groupId = GroupId },
						data = Data,
						callbacks = Callbacks,
						promptQueue = {}
					})
					
					return
				else
					UseStateResult2(CryoModule.Dictionary.join(UseStateResult, {
						promptQueue = CryoModule.List.join(UseStateResult.promptQueue, {
							{
								promptType = "PromptJoinGroup",
								promptData = { groupId = GroupId },
								data = Data,
								callbacks = Callbacks
							}
						})
					}))
				end
			end, { UseStateResult, UseStateResult2 }),
			closePrompt = UseResult
		}),
		FocusNavigationCoreScriptsWrapper = if Element then ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Prompt = Element }) else nil
	})
end