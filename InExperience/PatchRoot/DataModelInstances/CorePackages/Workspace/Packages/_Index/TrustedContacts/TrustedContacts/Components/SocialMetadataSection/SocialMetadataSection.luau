local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(parent.GraphQLServer)
local apolloProfileInsightsModule = require(parent.ApolloProfileInsights)
local useProfileInsightsByUserIds = apolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local getProfileInsightsByUserIdFromData = apolloProfileInsightsModule.Selectors.getProfileInsightsByUserIdFromData
local isCustomNilModule = require(trustedContacts.Utils.isCustomNil)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local socialMetadataIconsAndTextsSectionModule = require(script.Parent.SocialMetadataIconsAndTextsSection)
local useSignalProfileInsightsByUserId = require(parent.ProfileInsights).useSignalProfileInsightsByUserId
local ampUpsellModule = require(parent.AmpUpsell)
local ampApiProvider = ampUpsellModule.AmpApiProvider
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local fFlagProfilePlatformAddTC = require(parent.SharedFlags).FFlagProfilePlatformAddTC
local fStringParentLinkAmpNameSpace = require(parent.SharedFlags).FStringParentLinkAmpNameSpace
local getFFlagEnableProfileInsightsApolloMigration = require(parent.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration
local fFlagTFProfileInsightsBypassCache = require(parent.SharedFlags).FFlagTFProfileInsightsBypassCache
local socialMetadataSectionMigrateUserProfileToSignals = game:DefineFastFlag("SocialMetadataSectionMigrateUserProfileToSignals", false)
local var1 = if socialMetadataSectionMigrateUserProfileToSignals then userProfilesModule.Stores.UserProfileStore.get() else nil

return function(p1)
	-- upvalues: socialMetadataSectionMigrateUserProfileToSignals (ref), userProfilesModule (ref), reactModule (ref), signalsModule (ref), var1 (ref), signalsReactModule (ref), getFFlagEnableProfileInsightsApolloMigration (ref), useSignalProfileInsightsByUserId (ref), fFlagTFProfileInsightsBypassCache (ref), useProfileInsightsByUserIds (ref), getProfileInsightsByUserIdFromData (ref), isCustomNilModule (ref), useLocalization (ref), ampApiProvider (ref), fStringParentLinkAmpNameSpace (ref), accessResponseEnum (ref), foundationModule (ref), view (ref), userTile (ref), layoutMode (ref), skeleton (ref), fFlagProfilePlatformAddTC (ref), socialMetadataIconsAndTextsSectionModule (ref)
	local var2 = if not socialMetadataSectionMigrateUserProfileToSignals then userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p1.userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	}) else nil
	local var3 = ""
	local var4 = ""
	
	if not socialMetadataSectionMigrateUserProfileToSignals and var2 and var2.data then
		var3 = userProfilesModule.Selectors.getCombinedNameFromId(var2.data, p1.userId) or ""
		var4 = userProfilesModule.Selectors.getUsernameFromId(var2.data, p1.userId) or ""
	end
	if socialMetadataSectionMigrateUserProfileToSignals then
		local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), var1 (copy), p1 (ref)
			return signalsModule.createComputed(function(p2)
				-- upvalues: var1 (copy), p1 (copy)
				local var6 = var1 and var1.fetchNamesByUserIds({ tostring(p1.userId) })(p2)
				local var7 = var6 and (var6.data and var6.data[1])
				local names = var7 and var7.names
				
				return {
					combinedName = if names then names.getCombinedName(p2) else "",
					username = if names then names.getUsername() else ""
				}
			end)
		end, { p1.userId }))
		var4 = var5.username
		var3 = var5.combinedName
	end
	local var6
	local t = {}
	local _ = nil
	
	if getFFlagEnableProfileInsightsApolloMigration() then
		local var7, var8 = useSignalProfileInsightsByUserId({
			rankingStrategy = "tc_info_boost",
			userId = p1.userId,
			forceFetch = fFlagTFProfileInsightsBypassCache
		})
		t = var7
		var6 = var8
	else
		local var9 = useProfileInsightsByUserIds({
			rankingStrategy = "tc_info_boost",
			fetchPolicy = "network-only",
			userIds = { p1.userId }
		})
		
		if var9 and var9.data and not var9.loading then
			t = getProfileInsightsByUserIdFromData(var9.data, p1.userId)
		end
		var6 = var9.loading
	end
	local _ = {
		under13 = "AccountIdentity.AgeCheck.Label.AgeBandUnder13",
		under17 = "AccountIdentity.AgeCheck.Label.AgeBandOver13",
		under17checked = "AccountIdentity.AgeCheck.Label.AgeBandOver13Checked",
		over18 = "AccountIdentity.AgeCheck.Label.AgeBandOver18",
		over18checked = "AccountIdentity.AgeCheck.Label.AgeBandOver18Checked",
		ageGroupUnder9 = "AccountIdentity.AgeCheck.Label.AgeGroupUnder9",
		ageGroup9To12 = "AccountIdentity.AgeCheck.Label.AgeGroup9To12",
		ageGroup13To15 = "AccountIdentity.AgeCheck.Label.AgeGroup13To15",
		ageGroup16To17 = "AccountIdentity.AgeCheck.Label.AgeGroup16To17",
		ageGroup18To20 = "AccountIdentity.AgeCheck.Label.AgeGroup18To20",
		ageGroupOver21 = "AccountIdentity.AgeCheck.Label.AgeGroupOver21",
		ageGroup18To24 = "AccountIdentity.AgeCheck.Label.AgeGroup18To24",
		ageGroupOver25 = "AccountIdentity.AgeCheck.Label.AgeGroupOver25"
	}
	local var10 = useLocalization({
		yourLinkedParent = "Feature.Friends.Label.YourLinkedParent",
		userAgeVerifiedBracket = if not isCustomNilModule(t.userAgeVerifiedBracket) then t.userAgeVerifiedBracket else nil
	})
	local _ = nil
	local _ = nil
	local var11, var12 = reactModule.useState(false)
	local var13 = var11
	local var14 = var12
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), ampApiProvider (copy), fStringParentLinkAmpNameSpace (copy), var14 (write), accessResponseEnum (copy)
		var14(ampApiProvider.upsellFeatureAccess("IsLinkedChildOf", {}, fStringParentLinkAmpNameSpace, {
			{ name = "otherUser", type = "UserId", value = p1.userId }
		}).access == accessResponseEnum.Granted)
	end, { p1.userId })
	local var15 = reactModule.useMemo(function()
		-- upvalues: var10 (ref)
		return if var10.userAgeVerifiedBracket then ` \226\128\162 {var10.userAgeVerifiedBracket}` else nil
	end, { var10.userAgeVerifiedBracket })
	
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = {
			["col size-full-0 auto-y align-x-left radius-medium bg-shift-100"] = true,
			["gap-medium padding-medium"] = p1.isVerticallyConstrained,
			["gap-large padding-large"] = not p1.isVerticallyConstrained
		}
	}, {
		AvatarWithNames = reactModule.useMemo(function()
			-- upvalues: foundationModule (copy), reactModule (copy), view (copy), userTile (copy), p1 (ref), layoutMode (copy), var13 (write), var10 (ref), var3 (write), var4 (write), var15 (ref)
			local var16 = foundationModule.Hooks.useTokens()
			
			return reactModule.createElement(view, {
				tag = "size-0-1200 auto-x row align-y-center",
				LayoutOrder = 1
			}, {
				UserTile = reactModule.createElement(userTile, {
					onActivated = nil,
					userId = p1.userId,
					userPresenceType = foundationModule.Enums.UserPresence.None,
					layoutMode = layoutMode.wide,
					title = if var13 then var10.yourLinkedParent else var3,
					subtitle = if var4 ~= "" then nil else `@{var4}{var15 or ""}`,
					titleStyle = var16.Typography.TitleMedium,
					subtitleStyle = var16.Typography.BodyMedium
				})
			})
		end, {
			p1.userId, var3, var13, var14, var10.yourLinkedParent, var4, var15
		}),
		SocialMetadataIconAndTextList = if var6 then reactModule.createElement(skeleton, {
			Size = UDim2.new(1, 0, 0, 50),
			LayoutOrder = if fFlagProfilePlatformAddTC then p1.layoutOrder else 2
		}) else reactModule.createElement(socialMetadataIconsAndTextsSectionModule, {
			profileInsightIconItems = reactModule.useMemo(function()
				-- upvalues: isCustomNilModule (copy), t (write)
				return {
					mutualFriends = if not isCustomNilModule(t.mutualFriends) then t.mutualFriends else nil,
					friendshipAgeUnixSeconds = if not isCustomNilModule(t.friendshipAgeUnixSeconds) then t.friendshipAgeUnixSeconds else nil,
					friendRequestOriginSource = if not isCustomNilModule(t.friendRequestOriginSource) then t.friendRequestOriginSource else nil,
					accountCreationDateUnixSeconds = if not isCustomNilModule(t.accountCreationDateUnixSeconds) then t.accountCreationDateUnixSeconds else nil,
					localizedCountryName = if not isCustomNilModule(t.localizedCountryName) then t.localizedCountryName else nil
				}
			end, { t }),
			isVerticallyConstrained = p1.isVerticallyConstrained,
			layoutOrder = if fFlagProfilePlatformAddTC then p1.layoutOrder else 2
		})
	})
end