local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local LinkStatusModule = require(script.Parent.Parent.LinkStatus)
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local SocialLuaAnalyticsModule = require(CorePackages.Workspace.Packages.SocialLuaAnalytics)
local _ = require(script.Parent.Parent.Types)
local FFlagTCUpdateProfileCTAButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCUpdateProfileCTAButton
local FFlagTCShareLinkErrorModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal
local GetResult = require(CorePackages.Workspace.Packages.DataHydration).TrustedConnections.TrustedConnectionsStore.get()

local function trustedConnectionModal(Detail, Tokens, p1)
	-- upvalues: AppPage (copy), SocialLuaAnalyticsModule (copy), FFlagTCUpdateProfileCTAButton (copy)
	return {
		{
			{ name = AppPage.Home },
			{
				name = AppPage.ProfilePlatform,
				detail = Detail,
				extraProps = {
					source = SocialLuaAnalyticsModule.Analytics.Enums.Sources.ShareLink
				}
			},
			{
				name = AppPage.TrustedContactsModal,
				props = {
					userId = Detail,
					source = SocialLuaAnalyticsModule.Analytics.Enums.Sources.ShareLink,
					modalVariantOverride = SocialLuaAnalyticsModule.Analytics.Enums.Sources.ShareLinkReceiver,
					tokens = Tokens,
					onRequestAccepted = if FFlagTCUpdateProfileCTAButton and p1 and p1.RefreshProfilePlatformActionInfo then function()
						-- upvalues: p1 (copy), Detail (copy)
						p1.RefreshProfilePlatformActionInfo((tostring(Detail)))
					end else nil
				}
			}
		}
	}
end

local function expiredLinkModal(CloseModal)
	-- upvalues: AppPage (copy), FFlagTCShareLinkErrorModal (copy), LinkStatusModule (copy)
	return {
		{
			{ name = AppPage.Home },
			if FFlagTCShareLinkErrorModal then {
				name = AppPage.TrustedFriendsShareLinkErrorModal,
				extraProps = {
					errorType = LinkStatusModule.Expired,
					closeModal = CloseModal
				}
			} else {
				name = AppPage.InviteLinkExpiredModal,
				extraProps = { closeModal = CloseModal }
			}
		}
	}
end

local function invalidLinkModal(CloseModal)
	-- upvalues: AppPage (copy), FFlagTCShareLinkErrorModal (copy), LinkStatusModule (copy)
	return {
		{
			{ name = AppPage.Home },
			if FFlagTCShareLinkErrorModal then {
				name = AppPage.TrustedFriendsShareLinkErrorModal,
				extraProps = {
					errorType = LinkStatusModule.Invalid,
					closeModal = CloseModal
				}
			} else {
				name = AppPage.ShareLinkInvalidModal,
				extraProps = { closeModal = CloseModal }
			}
		}
	}
end

return function(Expired, Detail, Tokens, CloseModal, p1)
	-- upvalues: LinkStatusModule (copy), GetResult (copy), trustedConnectionModal (copy), FFlagTCUpdateProfileCTAButton (copy), expiredLinkModal (copy), invalidLinkModal (copy)
	if Expired == LinkStatusModule.Valid then
		local v1, v2 = GetResult.validateTrustedFriendLink(Detail, Tokens):await()
		
		if v1 and v2.responseBody.valid then
			return (trustedConnectionModal(Detail, Tokens, if FFlagTCUpdateProfileCTAButton then p1 else nil))
		end
	elseif Expired == LinkStatusModule.Expired then
		return (expiredLinkModal(CloseModal))
	end
	return (invalidLinkModal(CloseModal))
end