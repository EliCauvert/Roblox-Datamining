local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local ExpChatOpenChatWindowHasChatAccessExperimentation = require(Parent.SocialExperiments).ExpChatOpenChatWindowHasChatAccessExperimentation
local GetChatStatusStoreModule = require(ExpChat.Stores.GetChatStatusStore)
local IsUserChatEnabledModule = require(ExpChat.isUserChatEnabled)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector

local function selectIsChatWindowVisible(p1)
	return p1.ChatVisibility.isChatWindowEnabled.value
end

return function()
	-- upvalues: UseSelectorFunction (copy), selectIsChatWindowVisible (copy), SignalsReactModule (copy), GetChatStatusStoreModule (copy), IsUserChatEnabledModule (copy), ReactModule (copy), ExpChatOpenChatWindowHasChatAccessExperimentation (copy)
	local UseSelectorResult = UseSelectorFunction(selectIsChatWindowVisible)
	local IsUserChatEnabledModule1 = IsUserChatEnabledModule((SignalsReactModule.useSignalState(GetChatStatusStoreModule(false).getChatStatus)))
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), IsUserChatEnabledModule1 (copy), ExpChatOpenChatWindowHasChatAccessExperimentation (upval)
		if UseSelectorResult and IsUserChatEnabledModule1 then
			ExpChatOpenChatWindowHasChatAccessExperimentation.logExposure()
		end
	end, { UseSelectorResult, IsUserChatEnabledModule1 })
	
	return nil
end