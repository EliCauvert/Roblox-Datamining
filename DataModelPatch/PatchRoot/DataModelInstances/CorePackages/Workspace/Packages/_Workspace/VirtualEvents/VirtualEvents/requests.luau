local GqlFunction = require(script:FindFirstAncestor("VirtualEvents").Parent.ApolloClient).gql

return {
	GET_VIRTUAL_EVENT = GqlFunction(require(script.Parent.GetVirtualEvent)),
	UPDATE_RSVP_STATUS = GqlFunction(require(script.Parent.UpdateRsvpStatus)),
	NEVER_SHOW_NOTIFICATIONS_MODAL_AGAIN = GqlFunction(require(script.Parent.NeverShowNotificationModalAgain)),
	ENABLE_PUSH_NOTIFICATIONS = GqlFunction(require(script.Parent.EnablePushNotifications)),
	GET_EVENTS_FOR_EXPERIENCE = GqlFunction(require(script.Parent.VirtualEventsForExperience))
}