local UseModalButtonActionsModule = require(script.useModalButtonActions)

return if require(script:FindFirstAncestor("TrustedContacts").Parent.SharedFlags).FFlagTrustedFriendsUseEnumCTA then UseModalButtonActionsModule else require(script.useModalButtonActions_legacy)