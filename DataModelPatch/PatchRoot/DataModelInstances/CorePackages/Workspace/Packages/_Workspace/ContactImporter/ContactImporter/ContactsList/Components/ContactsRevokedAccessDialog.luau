local _ = require(script.ContactsRevokedAccessDialog)

return if require(script.Parent.Parent.Parent.Flags.getFFlagPassNavigationToContactsRevoked)() then require(script.ContactsRevokedAccessDialogEntryPoint) else require(script.ContactsRevokedAccessDialog)