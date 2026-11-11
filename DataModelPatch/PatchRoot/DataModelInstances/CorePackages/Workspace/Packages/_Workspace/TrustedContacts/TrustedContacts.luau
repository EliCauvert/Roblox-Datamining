local _ = require(script.Enums)

return {
	["jest.config"] = script["jest.config"],
	TrustedFriendsModalEntry = require(script.Components.TrustedFriendsModalEntry),
	TrustedFriendsShareLinkErrorModal = require(script.Components.TrustedFriendsShareLinkErrorModal),
	Enums = require(script.Enums),
	EventHandlers = require(script.EventHandlers),
	Analytics = require(script.Analytics),
	FriendsRenameInfoModal = require(script.Components.FriendsRenameInfoModal),
	TrustedContactsEducationModal = require(script.Components.TrustedContactsEducationModal)
}