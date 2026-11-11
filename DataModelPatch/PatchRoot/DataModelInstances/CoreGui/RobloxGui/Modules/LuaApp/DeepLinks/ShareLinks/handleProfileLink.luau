local CorePackages = game:GetService("CorePackages")
local AppPageModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.AppPage)
local LinkStatusModule = require(script.Parent.LinkStatus)
local GetDeepValueFunction = require(script.Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local _ = require(script.Parent.Types)
local FriendshipOriginSourceType = require(CorePackages.Workspace.Packages.FriendsNetworking).Enums.FriendshipOriginSourceType
local EnumsModule = require(CorePackages.Workspace.Packages.ProfilePlatform.Enums)

return function(p1, p2, p3)
	-- upvalues: GetDeepValueFunction (copy), LinkStatusModule (copy), AppPageModule (copy), EnumsModule (copy), FriendshipOriginSourceType (copy)
	local ResponseBodyProfileLinkResolutionResponseData = GetDeepValueFunction(p1, "responseBody.profileLinkResolutionResponseData") or {}
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	
	if ResponseBodyProfileLinkResolutionResponseData.userId then
		ShareLinksAnalytics.resolveLink({
			linkStatus = LinkStatusModule.Valid,
			linkId = p1.linkId,
			linkType = p1.linkType,
			isViaAppsFlyer = p1.isViaAppsFlyer
		})
		
		return {
			{
				{ name = AppPageModule.Home },
				{
					name = AppPageModule.ProfilePlatform,
					detail = tostring(ResponseBodyProfileLinkResolutionResponseData.userId),
					extraProps = {
						friendshipOriginSourceType = if string.lower(p3 or "") == string.lower(EnumsModule.Sources.ProfileShare) then FriendshipOriginSourceType.ProfileShare.rawValue() else FriendshipOriginSourceType.QrCode.rawValue(),
						source = if string.lower(p3 or "") == string.lower(EnumsModule.Sources.ProfileShare) then EnumsModule.Sources.ProfileShare else EnumsModule.Sources.QrCode,
						shareLinkId = p1.linkId
					}
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
				{ name = AppPageModule.ShareLinkInvalidModal }
			}
		}
	end
end