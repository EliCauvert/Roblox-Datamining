local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatToastEventReceiverModule = require(appChat.Components.EventReceivers.AppChatToastEventReceiver)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local getFFlagAppChatInExpToastSnoozeMenuDismissFix = sharedFlagsModule.GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local friendsSurfaceVisibility = require(parent.ExpChatShared).FriendsSurfaceVisibility
local t = { hideAllChatToasts = false, isAppChatVisible = false }

function AppChatToastManagerInExp(p0)
	-- upvalues: cryoModule (ref), t (ref), fFlagExpChatEnableFriendsTab (ref), signalsReactModule (ref), friendsSurfaceVisibility (ref), reactModule (ref), appChatToastEventReceiverModule (ref), getFFlagAppChatInExpToastSnoozeMenuDismissFix (ref)
	local var7 = cryoModule.Dictionary.join(t, p0)
	
	return reactModule.createElement(appChatToastEventReceiverModule, {
		isInExperience = true,
		navigateToChat = reactModule.useCallback(function(p1)
			-- upvalues: var7 (ref)
			var7.navigateToChat(p1)
		end, { var7.navigateToChat }),
		hideAllChatToasts = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then nil else var7.hideAllChatToasts,
		isAppChatVisible = if getFFlagAppChatInExpToastSnoozeMenuDismissFix() then var7.isAppChatVisible else nil,
		visibleFriendsConversationId = if fFlagExpChatEnableFriendsTab then signalsReactModule.useSignalState(friendsSurfaceVisibility.getVisibleConversationId) else nil
	})
end

return AppChatToastManagerInExp