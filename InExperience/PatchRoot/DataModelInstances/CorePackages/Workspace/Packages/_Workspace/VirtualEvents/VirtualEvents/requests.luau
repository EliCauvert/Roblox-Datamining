local gql = require(script:FindFirstAncestor("VirtualEvents").Parent.ApolloClient).gql

return {
	GET_VIRTUAL_EVENT = gql(require(script.Parent.GetVirtualEvent)),
	UPDATE_RSVP_STATUS = gql(require(script.Parent.UpdateRsvpStatus)),
	NEVER_SHOW_NOTIFICATIONS_MODAL_AGAIN = gql(require(script.Parent.NeverShowNotificationModalAgain)),
	ENABLE_PUSH_NOTIFICATIONS = gql(require(script.Parent.EnablePushNotifications)),
	GET_EVENTS_FOR_EXPERIENCE = gql(require(script.Parent.VirtualEventsForExperience))
}