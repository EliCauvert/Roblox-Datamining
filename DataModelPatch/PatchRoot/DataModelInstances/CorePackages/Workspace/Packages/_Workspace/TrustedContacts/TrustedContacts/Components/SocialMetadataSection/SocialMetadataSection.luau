local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(Parent.GraphQLServer)
local ApolloProfileInsightsModule = require(Parent.ApolloProfileInsights)
local UseProfileInsightsByUserIdsFunction = ApolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local GetProfileInsightsByUserIdFromDataFunction = ApolloProfileInsightsModule.Selectors.getProfileInsightsByUserIdFromData
local IsCustomNilModule = require(TrustedContacts.Utils.isCustomNil)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local SocialMetadataIconsAndTextsSectionModule = require(script.Parent.SocialMetadataIconsAndTextsSection)
local UseSignalProfileInsightsByUserIdFunction = require(Parent.ProfileInsights).useSignalProfileInsightsByUserId
local AmpUpsellModule = require(Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local FFlagProfilePlatformAddTC = require(Parent.SharedFlags).FFlagProfilePlatformAddTC
local FFlagTCYourLinkedParentText = require(Parent.SharedFlags).FFlagTCYourLinkedParentText
local FStringParentLinkAmpNameSpace = require(Parent.SharedFlags).FStringParentLinkAmpNameSpace
local GetFFlagEnableProfileInsightsApolloMigrationFunction = require(Parent.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration
local SocialMetadataSectionMigrateUserProfileToSignals = game:DefineFastFlag("SocialMetadataSectionMigrateUserProfileToSignals", false)
local GetResult = if SocialMetadataSectionMigrateUserProfileToSignals then UserProfilesModule.Stores.UserProfileStore.get() else nil

return function(p1)
	-- upvalues: SocialMetadataSectionMigrateUserProfileToSignals (copy), UserProfilesModule (copy), ReactModule (copy), SignalsModule (copy), GetResult (copy), SignalsReactModule (copy), GetFFlagEnableProfileInsightsApolloMigrationFunction (copy), UseSignalProfileInsightsByUserIdFunction (copy), UseProfileInsightsByUserIdsFunction (copy), GetProfileInsightsByUserIdFromDataFunction (copy), IsCustomNilModule (copy), UseLocalizationFunction (copy), FFlagTCYourLinkedParentText (copy), AmpApiProvider (copy), FStringParentLinkAmpNameSpace (copy), AccessResponseEnum (copy), FoundationModule (copy), View (copy), UserTile (copy), LayoutMode (copy), Skeleton (copy), FFlagProfilePlatformAddTC (copy), SocialMetadataIconsAndTextsSectionModule (copy)
	local UseUserProfilesFetchResult = if SocialMetadataSectionMigrateUserProfileToSignals then nil else UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.userId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local CombinedName = ""
	local Username = ""
	
	if not SocialMetadataSectionMigrateUserProfileToSignals and UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then
		CombinedName = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.userId) or ""
		Username = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, p1.userId) or ""
	end
	if SocialMetadataSectionMigrateUserProfileToSignals then
		local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), GetResult (upval), p1 (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: GetResult (upval), p1 (upval)
				local v1 = GetResult and GetResult.fetchNamesByUserIds({ (tostring(p1.userId)) })(p2)
				local Entry = v1 and (v1.data and v1.data[1])
				local Names = Entry and Entry.names
				
				return {
					combinedName = if Names then Names.getCombinedName(p2) else "",
					username = if Names then Names.getUsername() else ""
				}
			end)
		end, { p1.userId })))
		Username = UseSignalStateResult.username
		CombinedName = UseSignalStateResult.combinedName
	end
	local t = {}
	local UseSignalProfileInsightsByUserIdResult2 = nil
	
	if GetFFlagEnableProfileInsightsApolloMigrationFunction() then
		t, UseSignalProfileInsightsByUserIdResult2 = UseSignalProfileInsightsByUserIdFunction({ rankingStrategy = "tc_info_boost", userId = p1.userId })
	else
		local UseProfileInsightsByUserIdsResult = UseProfileInsightsByUserIdsFunction({
			rankingStrategy = "tc_info_boost",
			fetchPolicy = "network-only",
			userIds = { p1.userId }
		})
		
		if UseProfileInsightsByUserIdsResult and UseProfileInsightsByUserIdsResult.data and not UseProfileInsightsByUserIdsResult.loading then
			t = GetProfileInsightsByUserIdFromDataFunction(UseProfileInsightsByUserIdsResult.data, p1.userId)
		end
		UseSignalProfileInsightsByUserIdResult2 = UseProfileInsightsByUserIdsResult.loading
	end
	local UseLocalizationResult = UseLocalizationFunction({
		userAgeVerifiedBracket = if IsCustomNilModule(t.userAgeVerifiedBracket) then nil else t.userAgeVerifiedBracket,
		yourLinkedParent = if FFlagTCYourLinkedParentText then "Feature.Friends.Label.YourLinkedParent" else nil
	})
	local v1 = nil
	local Callback = nil
	
	if FFlagTCYourLinkedParentText then
		v1, Callback = ReactModule.useState(false)
	end
	ReactModule.useEffect(function()
		-- upvalues: FFlagTCYourLinkedParentText (upval), p1 (copy), AmpApiProvider (upval), FStringParentLinkAmpNameSpace (upval), Callback (ref), AccessResponseEnum (upval)
		if FFlagTCYourLinkedParentText then
			Callback(AmpApiProvider.upsellFeatureAccess("IsLinkedChildOf", {}, FStringParentLinkAmpNameSpace, {
				{ name = "otherUser", type = "UserId", value = p1.userId }
			}).access == AccessResponseEnum.Granted)
		end
	end, { p1.userId })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return if UseLocalizationResult.userAgeVerifiedBracket then ` • {UseLocalizationResult.userAgeVerifiedBracket}` else nil
	end, { UseLocalizationResult.userAgeVerifiedBracket })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsCustomNilModule (upval), t (ref)
		return {
			mutualFriends = if IsCustomNilModule(t.mutualFriends) then nil else t.mutualFriends,
			friendshipAgeUnixSeconds = if IsCustomNilModule(t.friendshipAgeUnixSeconds) then nil else t.friendshipAgeUnixSeconds,
			friendRequestOriginSource = if IsCustomNilModule(t.friendRequestOriginSource) then nil else t.friendRequestOriginSource,
			accountCreationDateUnixSeconds = if IsCustomNilModule(t.accountCreationDateUnixSeconds) then nil else t.accountCreationDateUnixSeconds,
			localizedCountryName = if IsCustomNilModule(t.localizedCountryName) then nil else t.localizedCountryName
		}
	end, { t })
	
	return ReactModule.createElement(View, {
		LayoutOrder = 2,
		tag = {
			["col size-full-0 auto-y align-x-left radius-medium bg-shift-100"] = true,
			["gap-medium padding-medium"] = p1.isVerticallyConstrained,
			["gap-large padding-large"] = not p1.isVerticallyConstrained
		}
	}, {
		AvatarWithNames = ReactModule.useMemo(function()
			-- upvalues: FoundationModule (upval), ReactModule (upval), View (upval), UserTile (upval), p1 (copy), LayoutMode (upval), FFlagTCYourLinkedParentText (upval), v1 (ref), UseLocalizationResult (copy), CombinedName (ref), Username (ref), UseMemoResult (copy)
			local UseTokensResult = FoundationModule.Hooks.useTokens()
			
			return ReactModule.createElement(View, {
				tag = "size-0-1200 auto-x row align-y-center",
				LayoutOrder = 1
			}, {
				UserTile = ReactModule.createElement(UserTile, {
					onActivated = nil,
					userId = p1.userId,
					userPresenceType = FoundationModule.Enums.UserPresence.None,
					layoutMode = LayoutMode.wide,
					title = if FFlagTCYourLinkedParentText and v1 then UseLocalizationResult.yourLinkedParent else CombinedName,
					subtitle = if Username == "" then nil else `@{Username}{UseMemoResult or ""}`,
					titleStyle = UseTokensResult.Typography.TitleMedium,
					subtitleStyle = UseTokensResult.Typography.BodyMedium
				})
			})
		end, {
			p1.userId, CombinedName, if FFlagTCYourLinkedParentText then v1 else nil,
			if FFlagTCYourLinkedParentText then Callback else nil,
			if FFlagTCYourLinkedParentText then UseLocalizationResult.yourLinkedParent else nil,
			Username, UseMemoResult
		}),
		SocialMetadataIconAndTextList = if UseSignalProfileInsightsByUserIdResult2 then ReactModule.createElement(Skeleton, {
			Size = UDim2.new(1, 0, 0, 50),
			LayoutOrder = if FFlagProfilePlatformAddTC then p1.layoutOrder else 2
		}) else ReactModule.createElement(SocialMetadataIconsAndTextsSectionModule, {
			profileInsightIconItems = UseMemoResult1,
			isVerticallyConstrained = p1.isVerticallyConstrained,
			layoutOrder = if FFlagProfilePlatformAddTC then p1.layoutOrder else 2
		})
	})
end