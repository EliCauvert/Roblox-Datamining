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
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local chipSize = foundationModule.Enums.ChipSize
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAddIEMProfilePage = sharedFlagsModule.FFlagAddIEMProfilePage
local fFlagEnableSocialTabsPage = sharedFlagsModule.FFlagEnableSocialTabsPage

return function(p0) --[[ line: 44 | named "SocialCountsChipRowContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useAreWebViewsSupportedModule (ref), useLocalUserId (ref), useDynamicSizeMarginModule (ref), fFlagAddIEMProfilePage (ref), getFFlagEnableProfileInsightsApolloMigration (ref), useSignalProfileInsightsByUserId (ref), useProfileInsightsByUserIds (ref), getProfileInsightsByUserIdFromData (ref), useSocialCountsDataModule (ref), useSocialCountsActionsModule (ref), fFlagEnableSocialTabsPage (ref), reactModule (ref), enumsModule (ref), chipSize (ref), chipGroup (ref)
	local var13 = useProfileWrapperContextModule()
	local var14 = useProfileAnalyticsContextModule()
	local var15 = useAreWebViewsSupportedModule()
	local var16 = useLocalUserId()
	local var17, var18 = useDynamicSizeMarginModule()
	local profileId = var13.profileId
	local var19 = if fFlagAddIEMProfilePage then var13.sourceInfo.source else nil
	local var20 = profileId == tostring(var16)
	local var21 = nil
	
	if getFFlagEnableProfileInsightsApolloMigration() then
		var21 = useSignalProfileInsightsByUserId({ rankingStrategy = "tc_info_boost", userId = profileId })
	else
		local var22 = useProfileInsightsByUserIds({ userIds = { profileId } })
		
		if var22 and var22.data and not var22.loading then
			var21 = getProfileInsightsByUserIdFromData(var22.data, profileId)
		end
	end
	local t = {}
	
	for i, v in ipairs(if var21 and var21.mutualFriends then var21.mutualFriends else {}) do
		table.insert(t, v.id)
	end
	local var24 = useSocialCountsDataModule(profileId, var20, var15, t)
	local var25 = useSocialCountsActionsModule(profileId, var20, var14, t, if fFlagEnableSocialTabsPage then p0.title else nil)
	
	return reactModule.createElement("Frame", {
		LayoutOrder = p0.layoutOrder,
		Size = p0.size,
		BackgroundTransparency = 1,
		[reactModule.Change.AbsoluteSize] = var18,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var17),
			PaddingRight = UDim.new(0, var17)
		}),
		ChipGroup = reactModule.createElement(chipGroup, {
			scrollingEnabledOverride = true,
			chips = reactModule.useMemo(function() --[[ line: 92 ]]
				-- upvalues: var24 (ref), fFlagAddIEMProfilePage (copy), var19 (ref), enumsModule (copy), var25 (ref), chipSize (copy)
				local t = {}
				
				for i, v in ipairs(var24) do
					if v.fieldName ~= "mutualFriendsCount" or tonumber(v.count) ~= 0 then
						table.insert(t, {
							count = v.count,
							text = v.text,
							layoutOrder = v.layoutOrder,
							onActivated = if fFlagAddIEMProfilePage and var19 == enumsModule.Sources.InExperienceProfile then nil else var25[v.fieldName],
							isDisabled = v.isDisabled,
							size = chipSize.Medium,
							leading = v.leading
						})
					end
				end
				return t
			end, { var24, var25 }),
			automaticSize = Enum.AutomaticSize.Y,
			size = UDim2.new(1, 0, 0, 32),
			layoutOrder = p0.layoutOrder
		})
	})
end