local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseBeginContactImporterFunction = require(Parent.ContactImporter).useBeginContactImporter
local Analytics = require(Parent.DiscoverabilityModal).Analytics
local EventNames = require(AddFriends.Analytics).EventNames
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAddFriendsBannersNewUIIXP = require(Parent.SharedFlags).FFlagAddFriendsBannersNewUI_IXP
local FFlagAddFriendsCINewIconExp = require(Parent.SharedFlags).FFlagAddFriendsCINewIcon_exp
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: UseBeginContactImporterFunction (copy), Analytics (copy), ReactModule (copy), EventNames (copy), UseLocalizationFunction (copy), FFlagAddFriendsBannersNewUIIXP (copy), FFlagAddFriendsCINewIconExp (copy)
	local Component = p1.component
	local ComponentUIProps = p1.componentUIProps
	local FireAnalyticsEventFunction = p1.fireAnalyticsEvent
	local UseBeginContactImporterResult, UseBeginContactImporterResult2 = UseBeginContactImporterFunction({ entryPoint = Analytics.EntryPoints.AddFriends })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseBeginContactImporterResult2 (copy)
		FireAnalyticsEventFunction(EventNames.CIBtnClick)
		UseBeginContactImporterResult2()
	end, {
		FireAnalyticsEventFunction,
		UseBeginContactImporterResult2
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval)
		FireAnalyticsEventFunction(EventNames.CIBtnImpression)
	end, { FireAnalyticsEventFunction })
	local FeatureAddFriendsLabelConnectWithContacts: string = if UseBeginContactImporterResult then "Feature.AddFriends.Label.ConnectWithContacts" else "Feature.AddFriends.Label.SyncContactsInvitePeople"
	local UseLocalizationResult = UseLocalizationFunction({
		contactImporterBannerTitle = if FFlagAddFriendsBannersNewUIIXP then nil else "Feature.AddFriends.Title.ConnectWithContacts",
		contactImporterBannerText = if FFlagAddFriendsBannersNewUIIXP then nil else FeatureAddFriendsLabelConnectWithContacts,
		contactTitle = if FFlagAddFriendsBannersNewUIIXP then "Feature.AddFriends.Label.ContactsTile" else nil
	})
	
	return if if UseBeginContactImporterResult2 then true else false then ReactModule.createElement(Component, {
		icon = if FFlagAddFriendsBannersNewUIIXP and FFlagAddFriendsCINewIconExp then "icons/menu/contacts_large" else "icons/graphic/contacts_large",
		title = if FFlagAddFriendsBannersNewUIIXP then UseLocalizationResult.contactTitle else UseLocalizationResult.contactImporterBannerTitle,
		text = if FFlagAddFriendsBannersNewUIIXP then nil else UseLocalizationResult.contactImporterBannerText,
		onActivated = UseResult,
		onMounted = UseResult1,
		componentUIProps = ComponentUIProps
	}) else nil
end