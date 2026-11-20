local SharedFlagsModule = require(script.Parent.Parent.Parent.SharedFlags)

return game:DefineFastFlag("PYMKViewProfileAfterAccept", false) and (SharedFlagsModule.FFlagUserListCtaIntegrationEnabled or SharedFlagsModule.FFlagFriendsPageViewBtnEnabled)