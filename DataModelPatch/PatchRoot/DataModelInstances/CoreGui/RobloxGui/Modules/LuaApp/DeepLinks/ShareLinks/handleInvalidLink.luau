local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local LinkStatusModule = require(script.Parent.LinkStatus)
local _ = require(script.Parent.Types)

return function(p1, p2)
	-- upvalues: LinkStatusModule (copy), AppPage (copy)
	local ShareLinksAnalytics = p2.analyticsImpls.shareLinksAnalytics
	local Code = p1.code
	local Type = p1.type
	ShareLinksAnalytics.resolveLink({
		isViaAppsFlyer = p1.isViaAppsFlyer,
		linkId = Code,
		linkStatus = LinkStatusModule.Invalid,
		linkType = Type
	})
	
	return {
		{
			{ name = AppPage.Home },
			{
				name = AppPage.ShareLinkInvalidModal,
				extraProps = {
					closeModal = function()
						-- upvalues: ShareLinksAnalytics (copy), Code (copy), LinkStatusModule (upval), Type (copy)
						ShareLinksAnalytics.errorDialogButtonClick({
							linkId = Code,
							linkStatus = LinkStatusModule.Invalid,
							linkType = Type
						})
					end
				}
			}
		}
	}
end