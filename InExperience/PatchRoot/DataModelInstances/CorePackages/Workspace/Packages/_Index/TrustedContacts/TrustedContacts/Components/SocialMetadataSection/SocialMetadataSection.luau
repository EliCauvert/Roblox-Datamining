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
local var11 = if socialMetadataSectionMigrateUserProfileToSignals then userProfilesModule.Stores.UserProfileStore.get() else nil

return function(p0) --[[ line: 52 ]]
	-- upvalues: socialMetadataSectionMigrateUserProfileToSignals (ref), userProfilesModule (ref), reactModule (ref), signalsModule (ref), var11 (ref), signalsReactModule (ref), getFFlagEnableProfileInsightsApolloMigration (ref), useSignalProfileInsightsByUserId (ref), fFlagTFProfileInsightsBypassCache (ref), useProfileInsightsByUserIds (ref), getProfileInsightsByUserIdFromData (ref), isCustomNilModule (ref), useLocalization (ref), ampApiProvider (ref), fStringParentLinkAmpNameSpace (ref), accessResponseEnum (ref), foundationModule (ref), view (ref), userTile (ref), layoutMode (ref), skeleton (ref), fFlagProfilePlatformAddTC (ref), socialMetadataIconsAndTextsSectionModule (ref)
	local var12 = if not socialMetadataSectionMigrateUserProfileToSignals then userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { p0.userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	}) else nil
	local var13 = ""
	local var14 = ""
	
	if not socialMetadataSectionMigrateUserProfileToSignals and var12 and var12.data then
		var13 = userProfilesModule.Selectors.getCombinedNameFromId(var12.data, p0.userId) or ""
		var14 = userProfilesModule.Selectors.getUsernameFromId(var12.data, p0.userId) or ""
	end
	if socialMetadataSectionMigrateUserProfileToSignals then
		local var15 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 72 ]]
			-- upvalues: signalsModule (copy), var11 (copy), p0 (ref)
			return signalsModule.createComputed(function(p1) --[[ line: 73 ]]
				-- upvalues: var11 (copy), p0 (copy)
				local var27 = var11 and var11.fetchNamesByUserIds({ tostring(p0.userId) })(p1)
				local var28 = var27 and (var27.data and var27.data[1])
				local names = var28 and var28.names
				
				return {
					combinedName = if names then names.getCombinedName(p1) else "",
					username = if names then names.getUsername() else ""
				}
			end)
		end, { p0.userId }))
		var14 = var15.username
		var13 = var15.combinedName
	end
	local var19
	local t = {}
	local _ = nil
	
	if getFFlagEnableProfileInsightsApolloMigration() then
		local var17, var18 = useSignalProfileInsightsByUserId({
			rankingStrategy = "tc_info_boost",
			userId = p0.userId,
			forceFetch = fFlagTFProfileInsightsBypassCache
		})
		t = var17
		var19 = var18
	else
		local var20 = useProfileInsightsByUserIds({
			rankingStrategy = "tc_info_boost",
			fetchPolicy = "network-only",
			userIds = { p0.userId }
		})
		
		if var20 and var20.data and not var20.loading then
			t = getProfileInsightsByUserIdFromData(var20.data, p0.userId)
		end
		var19 = var20.loading
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
	local var21 = useLocalization({
		yourLinkedParent = "Feature.Friends.Label.YourLinkedParent",
		userAgeVerifiedBracket = if not isCustomNilModule(t.userAgeVerifiedBracket) then t.userAgeVerifiedBracket else nil
	})
	local _ = nil
	local _ = nil
	local var22, var23 = reactModule.useState(false)
	local var24 = var22
	local var25 = var23
	reactModule.useEffect(function() --[[ line: 141 ]]
		-- upvalues: p0 (ref), ampApiProvider (copy), fStringParentLinkAmpNameSpace (copy), var25 (write), accessResponseEnum (copy)
		var25(ampApiProvider.upsellFeatureAccess("IsLinkedChildOf", {}, fStringParentLinkAmpNameSpace, {
			{ name = "otherUser", type = "UserId", value = p0.userId }
		}).access == accessResponseEnum.Granted)
	end, { p0.userId })
	local var26 = reactModule.useMemo(function() --[[ line: 154 ]]
		-- upvalues: var21 (ref)
		return if var21.userAgeVerifiedBracket then ` \226\128\162 {var21.userAgeVerifiedBracket}` else nil
	end, { var21.userAgeVerifiedBracket })
	
	return reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = {
			["col size-full-0 auto-y align-x-left radius-medium bg-shift-100"] = true,
			["gap-medium padding-medium"] = p0.isVerticallyConstrained,
			["gap-large padding-large"] = not p0.isVerticallyConstrained
		}
	}, {
		AvatarWithNames = reactModule.useMemo(function() --[[ line: 165 ]]
			-- upvalues: foundationModule (copy), reactModule (copy), view (copy), userTile (copy), p0 (ref), layoutMode (copy), var24 (write), var21 (ref), var13 (write), var14 (write), var26 (ref)
			local var30 = foundationModule.Hooks.useTokens()
			
			return reactModule.createElement(view, {
				tag = "size-0-1200 auto-x row align-y-center",
				LayoutOrder = 1
			}, {
				UserTile = reactModule.createElement(userTile, {
					onActivated = nil,
					userId = p0.userId,
					userPresenceType = foundationModule.Enums.UserPresence.None,
					layoutMode = layoutMode.wide,
					title = if var24 then var21.yourLinkedParent else var13,
					subtitle = if var14 ~= "" then nil else `@{var14}{var26 or ""}`,
					titleStyle = var30.Typography.TitleMedium,
					subtitleStyle = var30.Typography.BodyMedium
				})
			})
		end, {
			p0.userId, var13, var24, var25, var21.yourLinkedParent, var14, var26
		}),
		SocialMetadataIconAndTextList = if var19 then reactModule.createElement(skeleton, {
			Size = UDim2.new(1, 0, 0, 50),
			LayoutOrder = if fFlagProfilePlatformAddTC then p0.layoutOrder else 2
		}) else reactModule.createElement(socialMetadataIconsAndTextsSectionModule, {
			profileInsightIconItems = reactModule.useMemo(function() --[[ line: 192 ]]
				-- upvalues: isCustomNilModule (copy), t (write)
				return {
					mutualFriends = if not isCustomNilModule(t.mutualFriends) then t.mutualFriends else nil,
					friendshipAgeUnixSeconds = if not isCustomNilModule(t.friendshipAgeUnixSeconds) then t.friendshipAgeUnixSeconds else nil,
					friendRequestOriginSource = if not isCustomNilModule(t.friendRequestOriginSource) then t.friendRequestOriginSource else nil,
					accountCreationDateUnixSeconds = if not isCustomNilModule(t.accountCreationDateUnixSeconds) then t.accountCreationDateUnixSeconds else nil,
					localizedCountryName = if not isCustomNilModule(t.localizedCountryName) then t.localizedCountryName else nil
				}
			end, { t }),
			isVerticallyConstrained = p0.isVerticallyConstrained,
			layoutOrder = if fFlagProfilePlatformAddTC then p0.layoutOrder else 2
		})
	})
end