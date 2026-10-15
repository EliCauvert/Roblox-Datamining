local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local signalsReactModule = require(parent.SignalsReact)
local expChatPresetChatEmojiTabExperimentation = require(parent.SocialExperiments).ExpChatPresetChatEmojiTabExperimentation
local getChatStatusStoreModule = require(expChat.Stores.GetChatStatusStore)
local isUserChatEnabledModule = require(expChat.isUserChatEnabled)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

local function selectIsChatWindowVisible(p1)
	return p1.ChatVisibility.isChatWindowEnabled.value
end

return function()
	-- upvalues: useSelector (ref), selectIsChatWindowVisible (ref), signalsReactModule (ref), getChatStatusStoreModule (ref), isUserChatEnabledModule (ref), reactModule (ref), expChatPresetChatEmojiTabExperimentation (ref)
	local var1 = useSelector(selectIsChatWindowVisible)
	local var2 = isUserChatEnabledModule(signalsReactModule.useSignalState(getChatStatusStoreModule(false).getChatStatus))
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), expChatPresetChatEmojiTabExperimentation (copy)
		if var1 and var2 then
			expChatPresetChatEmojiTabExperimentation.logExposure()
		end
	end, { var1, var2 })
	
	return nil
end