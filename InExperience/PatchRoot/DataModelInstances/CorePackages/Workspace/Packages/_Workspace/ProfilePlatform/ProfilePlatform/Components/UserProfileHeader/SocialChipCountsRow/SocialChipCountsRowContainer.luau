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

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useAreWebViewsSupportedModule (ref), useLocalUserId (ref), useDynamicSizeMarginModule (ref), fFlagAddIEMProfilePage (ref), getFFlagEnableProfileInsightsApolloMigration (ref), useSignalProfileInsightsByUserId (ref), useProfileInsightsByUserIds (ref), getProfileInsightsByUserIdFromData (ref), useSocialCountsDataModule (ref), useSocialCountsActionsModule (ref), fFlagEnableSocialTabsPage (ref), fFlagProfilePlatformEnableSchoolChip (ref), useSchoolChipModule (ref), reactModule (ref), enumsModule (ref), chipSize (ref), chipGroup (ref)
	local var14 = useProfileWrapperContextModule()
	local var15 = useProfileAnalyticsContextModule()
	local var16 = useAreWebViewsSupportedModule()
	local var17 = useLocalUserId()
	local var18, var19 = useDynamicSizeMarginModule()
	local profileId = var14.profileId
	local var20 = if fFlagAddIEMProfilePage then var14.sourceInfo.source else nil
	local var21 = profileId == tostring(var17)
	local var22 = nil
	
	if getFFlagEnableProfileInsightsApolloMigration() then
		var22 = useSignalProfileInsightsByUserId({ rankingStrategy = "tc_info_boost", userId = profileId })
	else
		local var23 = useProfileInsightsByUserIds({ userIds = { profileId } })
		
		if var23 and var23.data and not var23.loading then
			var22 = getProfileInsightsByUserIdFromData(var23.data, profileId)
		end
	end
	local t = {}
	
	for i, v in ipairs(if var22 and var22.mutualFriends then var22.mutualFriends else {}) do
		table.insert(t, v.id)
	end
	local var25 = useSocialCountsDataModule(profileId, var21, var16, t)
	local var26 = useSocialCountsActionsModule(profileId, var21, var15, t, if fFlagEnableSocialTabsPage then p0.title else nil)
	local var27 = if fFlagProfilePlatformEnableSchoolChip then useSchoolChipModule(var15) else nil
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.layoutOrder,
		Size = p0.size,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var19,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var18),
			PaddingRight = UDim.new(0, var18)
		}),
		ChipGroup = reactModule.createElement(chipGroup, {
			scrollingEnabledOverride = true,
			chips = reactModule.useMemo(function()
				-- upvalues: fFlagAddIEMProfilePage (copy), var20 (ref), enumsModule (copy), fFlagProfilePlatformEnableSchoolChip (copy), var27 (write), var25 (ref), var26 (ref), chipSize (copy)
				local t = {}
				
				if fFlagProfilePlatformEnableSchoolChip and var27 and not (fFlagAddIEMProfilePage and var20 == enumsModule.Sources.InExperienceProfile) then
					table.insert(t, var27)
				end
				for i, v in ipairs(var25) do
					if v.fieldName ~= "mutualFriendsCount" or tonumber(v.count) ~= 0 then
						table.insert(t, {
							count = v.count,
							text = v.text,
							layoutOrder = v.layoutOrder,
							onActivated = if fFlagAddIEMProfilePage and var20 == enumsModule.Sources.InExperienceProfile then nil else var26[v.fieldName],
							isDisabled = v.isDisabled,
							size = chipSize.Medium,
							leading = v.leading
						})
					end
				end
				return t
			end, { var25, var26, var27, var20 }),
			automaticSize = Enum.AutomaticSize.Y,
			size = UDim2.new(1, 0, 0, 32),
			layoutOrder = p0.layoutOrder
		})
	})
end