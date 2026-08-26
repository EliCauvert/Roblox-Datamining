local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local _ = require(profilePlatform.Common.Types)
local foundationModule = require(parent.Foundation)
local apolloProfileInsightsModule = require(parent.ApolloProfileInsights)
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useAreWebViewsSupportedModule = require(profilePlatform.Hooks.useAreWebViewsSupported)
local chipGroup = require(profilePlatform.Components.ChipGroup).ChipGroup
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local useProfileInsightsByUserIds = apolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local getProfileInsightsByUserIdFromData = apolloProfileInsightsModule.Selectors.getProfileInsightsByUserIdFromData
local useSignalProfileInsightsByUserId = require(parent.ProfileInsights).useSignalProfileInsightsByUserId
local getFFlagEnableProfileInsightsApolloMigration = require(parent.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration
local parent_1 = script.Parent
local useSocialCountsDataModule = require(parent_1.hooks.useSocialCountsData)
local useSocialCountsActionsModule = require(parent_1.hooks.useSocialCountsActions)
local useSchoolChipModule = require(parent_1.hooks.useSchoolChip)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local chipSize = foundationModule.Enums.ChipSize
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddIEMProfilePage = sharedFlagsModule.FFlagAddIEMProfilePage
local fFlagEnableSocialTabsPage = sharedFlagsModule.FFlagEnableSocialTabsPage
local fFlagProfilePlatformEnableSchoolChip = sharedFlagsModule.FFlagProfilePlatformEnableSchoolChip

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useAreWebViewsSupportedModule (ref), useLocalUserId (ref), useDynamicSizeMarginModule (ref), fFlagAddIEMProfilePage (ref), getFFlagEnableProfileInsightsApolloMigration (ref), useSignalProfileInsightsByUserId (ref), useProfileInsightsByUserIds (ref), getProfileInsightsByUserIdFromData (ref), useSocialCountsDataModule (ref), useSocialCountsActionsModule (ref), fFlagEnableSocialTabsPage (ref), fFlagProfilePlatformEnableSchoolChip (ref), useSchoolChipModule (ref), reactModule (ref), enumsModule (ref), chipSize (ref), chipGroup (ref)
	local var1 = useProfileWrapperContextModule()
	local var2 = useProfileAnalyticsContextModule()
	local var3 = useAreWebViewsSupportedModule()
	local var4 = useLocalUserId()
	local var5, var6 = useDynamicSizeMarginModule()
	local profileId = var1.profileId
	local var7 = if fFlagAddIEMProfilePage then var1.sourceInfo.source else nil
	local var8 = profileId == tostring(var4)
	local var9 = nil
	
	if getFFlagEnableProfileInsightsApolloMigration() then
		var9 = useSignalProfileInsightsByUserId({ rankingStrategy = "tc_info_boost", userId = profileId })
	else
		local var10 = useProfileInsightsByUserIds({ userIds = { profileId } })
		
		if var10 and var10.data and not var10.loading then
			var9 = getProfileInsightsByUserIdFromData(var10.data, profileId)
		end
	end
	local t = {}
	
	for i, v in ipairs(if var9 and var9.mutualFriends then var9.mutualFriends else {}) do
		table.insert(t, v.id)
	end
	local var11 = useSocialCountsDataModule(profileId, var8, var3, t)
	local var12 = useSocialCountsActionsModule(profileId, var8, var2, t, if fFlagEnableSocialTabsPage then p1.title else nil)
	local var13 = if fFlagProfilePlatformEnableSchoolChip then useSchoolChipModule(var2) else nil
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var6,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var5),
			PaddingRight = UDim.new(0, var5)
		}),
		ChipGroup = reactModule.createElement(chipGroup, {
			scrollingEnabledOverride = true,
			chips = reactModule.useMemo(function()
				-- upvalues: fFlagAddIEMProfilePage (copy), var7 (ref), enumsModule (copy), fFlagProfilePlatformEnableSchoolChip (copy), var13 (write), var11 (ref), var12 (ref), chipSize (copy)
				local t = {}
				
				if fFlagProfilePlatformEnableSchoolChip and var13 and not (fFlagAddIEMProfilePage and var7 == enumsModule.Sources.InExperienceProfile) then
					table.insert(t, var13)
				end
				for i, v in ipairs(var11) do
					if v.fieldName ~= "mutualFriendsCount" or tonumber(v.count) ~= 0 then
						table.insert(t, {
							count = v.count,
							text = v.text,
							layoutOrder = v.layoutOrder,
							onActivated = if fFlagAddIEMProfilePage and var7 == enumsModule.Sources.InExperienceProfile then nil else var12[v.fieldName],
							isDisabled = v.isDisabled,
							size = chipSize.Medium,
							leading = v.leading
						})
					end
				end
				return t
			end, { var11, var12, var13, var7 }),
			automaticSize = Enum.AutomaticSize.Y,
			size = UDim2.new(1, 0, 0, 32),
			layoutOrder = p1.layoutOrder
		})
	})
end