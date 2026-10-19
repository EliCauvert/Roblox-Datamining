local SharedFlagsModule = require(script:FindFirstAncestor("GameInvite").Parent.SharedFlags)
local FFlagGameInviteInExpUserListRendererModule = require(script.Parent.FFlagGameInviteInExpUserListRenderer)

return game:DefineFastFlag("GameInviteInExpJoinCta", false) and (FFlagGameInviteInExpUserListRendererModule and (SharedFlagsModule.FFlagUserListCtaIntegrationEnabled and SharedFlagsModule.FFlagUserListComposeRenderRowWithCta))