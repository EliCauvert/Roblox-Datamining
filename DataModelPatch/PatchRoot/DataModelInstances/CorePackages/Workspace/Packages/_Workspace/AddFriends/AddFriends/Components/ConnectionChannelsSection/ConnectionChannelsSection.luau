local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local Images = require(Parent.UIBlox).App.ImageSet.Images
local AddFriendsGenericBannerModule = require(AddFriends.Components.AddFriendsGenericBanner)
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local ConnectionChannelsCarouselModule = require(script.Parent.ConnectionChannelsCarousel)
local ConnectionChannelsHeaderModule = require(script.Parent.ConnectionChannelsHeader)
local ConnectionChannelsTileModule = require(script.Parent.ConnectionChannelsTile)
local ContactImporterChannelModule = require(script.Parent.ContactImporterChannel)
local QRCodeChannelModule = require(script.Parent.QRCodeChannel)
local SchoolChannelModule = require(script.Parent.SchoolChannel)
local FFlagAddFriendsBannersNewUIIXP = require(Parent.SharedFlags).FFlagAddFriendsBannersNewUI_IXP
local FFlagAFPConnectionsChannelsHeader = require(Parent.SharedFlags).FFlagAFPConnectionsChannelsHeader
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local _ = require(script.Parent.Types)
local Items = {
	{ component = ContactImporterChannelModule },
	{ component = QRCodeChannelModule }
}

if require(Parent.SharedFlags).FFlagEnableSchoolEntry then
	table.insert(Items, { component = SchoolChannelModule })
end
return function(p1)
	-- upvalues: UseFireAnalyticsEventModule (copy), UseAppPolicyFunction (copy), FFlagAddFriendsBannersNewUIIXP (copy), ReactModule (copy), ConnectionChannelsTileModule (copy), ConnectionChannelsCarouselModule (copy), Items (copy), FFlagAFPConnectionsChannelsHeader (copy), ConnectionChannelsHeaderModule (copy), AddFriendsGenericBannerModule (copy), Images (copy), RoactModule (copy), ContactImporterChannelModule (copy), QRCodeChannelModule (copy)
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getEnableProfileQrCode()
	end)
	
	if FFlagAddFriendsBannersNewUIIXP then
		return ReactModule.createElement(ConnectionChannelsCarouselModule, {
			contextualInfoHeight = 25,
			layoutOrder = p1.layoutOrder,
			items = Items,
			renderItem = ReactModule.useCallback(function(p2, LayoutOrder, ItemSize)
				-- upvalues: ReactModule (upval), ConnectionChannelsTileModule (upval), UseFireAnalyticsEventModuleResult (copy), p1 (copy)
				return ReactModule.createElement(p2.component, {
					component = ConnectionChannelsTileModule,
					componentUIProps = { layoutOrder = LayoutOrder, itemSize = ItemSize },
					fireAnalyticsEvent = UseFireAnalyticsEventModuleResult,
					navigateToLuaAppPages = p1.navigateToLuaAppPages
				}), "Item"
			end, {
				UseFireAnalyticsEventModuleResult,
				p1.navigateToLuaAppPages
			}),
			headerComponent = if FFlagAFPConnectionsChannelsHeader and UseAppPolicyResult then ReactModule.createElement(ConnectionChannelsHeaderModule) else nil
		})
	else
		local LayoutOrder = p1.layoutOrder or 1
		local UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: ReactModule (upval), AddFriendsGenericBannerModule (upval), Images (upval)
			return ReactModule.createElement(AddFriendsGenericBannerModule, {
				maxWidth = 640,
				bannerIcon = Images[p2.icon],
				bannerTitle = p2.title,
				bannerText = p2.text,
				onActivated = p2.onActivated,
				onBannerMounted = p2.onMounted,
				layoutOrder = p2.componentUIProps.layoutOrder
			})
		end, {})
		
		return RoactModule.createFragment({
			ContactImporterBanner = ReactModule.createElement(ContactImporterChannelModule, {
				component = UseResult,
				componentUIProps = { layoutOrder = LayoutOrder },
				fireAnalyticsEvent = UseFireAnalyticsEventModuleResult
			}),
			QRCodeBanner = ReactModule.createElement(QRCodeChannelModule, {
				component = UseResult,
				componentUIProps = { layoutOrder = LayoutOrder + 1 },
				fireAnalyticsEvent = UseFireAnalyticsEventModuleResult,
				navigateToLuaAppPages = p1.navigateToLuaAppPages
			})
		})
	end
end