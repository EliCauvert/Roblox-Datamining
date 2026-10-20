local AppPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage)
local LinkStatusModule = require(script.Parent.LinkStatus)
local GetDeepValueFunction = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local _ = require(script.Parent.Types)
local CorePackages = game:GetService("CorePackages")
local Enums = require(CorePackages.Workspace.Packages.SocialCommon).Enums
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)

return function(p1, p2)
	-- upvalues: GetDeepValueFunction (copy), AppPageModule (copy), Enums (copy), EnumsModule (copy), LinkStatusModule (copy)
	local ResponseBodyFriendInviteData = GetDeepValueFunction(p1, "responseBody.friendInviteData") or {}
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	
	if ResponseBodyFriendInviteData.senderUserId then
		local IsNotFriendingTokenMatch: boolean = ResponseBodyFriendInviteData.friendingToken and ResponseBodyFriendInviteData.friendingToken ~= ""
		ShareLinksAnalytics.resolveLink({
			linkStatus = ResponseBodyFriendInviteData.status,
			linkId = p1.linkId,
			linkType = p1.linkType,
			isViaAppsFlyer = p1.isViaAppsFlyer
		})
		
		return {
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.ProfilePlatform,
					detail = tostring(ResponseBodyFriendInviteData.senderUserId),
					extraProps = if IsNotFriendingTokenMatch then {
						offNetworkFriendRequestToken = ResponseBodyFriendInviteData.friendingToken,
						shareLinkId = p1.linkId,
						contextualInfoType = Enums.ContextualInfoTypes.OffNetworkFriendRequest,
						source = EnumsModule.Sources.OffNetworkFriendRequest
					} else { source = EnumsModule.Sources.OffNetworkFriendRequest }
				}
			}
		}
	else
		ShareLinksAnalytics.resolveLink({
			linkStatus = LinkStatusModule.Invalid,
			linkId = p1.linkId,
			linkType = p1.linkType,
			isViaAppsFlyer = p1.isViaAppsFlyer
		})
		
		return {
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.ShareLinkInvalidModal,
					extraProps = {
						closeModal = function()
							-- upvalues: ShareLinksAnalytics (copy), p1 (copy), LinkStatusModule (upval)
							ShareLinksAnalytics.errorDialogButtonClick({
								linkId = p1.linkId,
								linkStatus = LinkStatusModule.Invalid,
								linkType = p1.linkType
							})
						end
					}
				}
			}
		}
	end
end