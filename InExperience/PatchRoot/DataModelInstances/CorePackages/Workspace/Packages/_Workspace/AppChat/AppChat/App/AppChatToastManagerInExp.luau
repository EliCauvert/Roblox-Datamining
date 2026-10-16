local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatToastEventReceiverModule = require(AppChat.Components.EventReceivers.AppChatToastEventReceiver)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction = SharedFlagsModule.GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local FriendsSurfaceVisibility = require(Parent.ExpChatShared).FriendsSurfaceVisibility
local config = { hideAllChatToasts = false, isAppChatVisible = false }

function AppChatToastManagerInExp(p1) --[[ Line: 26 ]]
	-- upvalues: CryoModule (copy), config (copy), FFlagExpChatEnableFriendsTab (copy), SignalsReactModule (copy), FriendsSurfaceVisibility (copy), ReactModule (copy), AppChatToastEventReceiverModule (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	
	return ReactModule.createElement(AppChatToastEventReceiverModule, {
		isInExperience = true,
		navigateToChat = ReactModule.useCallback(function(p2) --[[ Line: 34 ]]
			-- upvalues: JoinResult (copy)
			JoinResult.navigateToChat(p2)
		end, { JoinResult.navigateToChat }),
		hideAllChatToasts = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then nil else JoinResult.hideAllChatToasts,
		isAppChatVisible = if GetFFlagAppChatInExpToastSnoozeMenuDismissFixFunction() then JoinResult.isAppChatVisible else nil,
		visibleFriendsConversationId = if FFlagExpChatEnableFriendsTab then SignalsReactModule.useSignalState(FriendsSurfaceVisibility.getVisibleConversationId) else nil
	})
end

return AppChatToastManagerInExp