local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.GraphQLServer)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local VirtualEventsModule = require(CorePackages.Workspace.Packages.VirtualEvents)
local UseMutationFunction = require(CorePackages.Packages.ApolloClient).useMutation
local EventNotificationsModal = VirtualEventsModule.EventNotificationsModal

return function(p1)
	-- upvalues: UseMutationFunction (copy), VirtualEventsModule (copy), ReactModule (copy), EventNotificationsModal (copy), CryoModule (copy)
	local UseMutationResult = UseMutationFunction(VirtualEventsModule.requests.NEVER_SHOW_NOTIFICATIONS_MODAL_AGAIN)
	local UseMutationResult1 = UseMutationFunction(VirtualEventsModule.requests.ENABLE_PUSH_NOTIFICATIONS)
	
	return ReactModule.createElement(EventNotificationsModal, CryoModule.Dictionary.join(p1, {
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseMutationResult (copy), p1 (copy)
			UseMutationResult[1]()
			
			if p1.onClose then
				p1.onClose()
			end
		end, { UseMutationResult, p1.onClose }),
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: UseMutationResult1 (copy), VirtualEventsModule (upval), p1 (copy)
			UseMutationResult1[1]()
			VirtualEventsModule.fireEventNotificationEnabled({
				virtualEventId = p1.virtualEvent.id,
				universeId = p1.virtualEvent.universeId,
				channel = p1.channel
			})
			
			if p1.onConfirm then
				p1.onConfirm()
			end
		end, {
			UseMutationResult1,
			p1.virtualEvent,
			p1.channel,
			p1.onConfirm
		})
	}))
end