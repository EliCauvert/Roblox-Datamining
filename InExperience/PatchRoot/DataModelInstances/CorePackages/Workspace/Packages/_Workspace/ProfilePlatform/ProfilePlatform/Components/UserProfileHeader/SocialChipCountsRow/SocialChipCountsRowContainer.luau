local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local _ = require(ProfilePlatform.Common.Types)
local ApolloProfileInsightsModule = require(Parent.ApolloProfileInsights)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseAreWebViewsSupportedModule = require(ProfilePlatform.Hooks.useAreWebViewsSupported)
local ChipGroup = require(ProfilePlatform.Components.ChipGroup).ChipGroup
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseProfileInsightsByUserIdsFunction = ApolloProfileInsightsModule.Hooks.useProfileInsightsByUserIds
local GetProfileInsightsByUserIdFromDataFunction = ApolloProfileInsightsModule.Selectors.getProfileInsightsByUserIdFromData
local UseSignalProfileInsightsByUserIdFunction = require(Parent.ProfileInsights).useSignalProfileInsightsByUserId
local GetFFlagEnableProfileInsightsApolloMigrationFunction = require(Parent.SharedFlags).GetFFlagEnableProfileInsightsApolloMigration
local Parent1 = script.Parent
local UseSocialCountsDataModule = require(Parent1.hooks.useSocialCountsData)
local UseSocialCountsActionsModule = require(Parent1.hooks.useSocialCountsActions)
local UseSchoolChipModule = require(Parent1.hooks.useSchoolChip)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local ChipSize = require(Parent.Foundation).Enums.ChipSize
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAddIEMProfilePage = SharedFlagsModule.FFlagAddIEMProfilePage
local FFlagEnableSocialTabsPage = SharedFlagsModule.FFlagEnableSocialTabsPage
local FFlagProfilePlatformEnableSchoolChip = SharedFlagsModule.FFlagProfilePlatformEnableSchoolChip

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseAreWebViewsSupportedModule (copy), UseLocalUserIdFunction (copy), UseDynamicSizeMarginModule (copy), FFlagAddIEMProfilePage (copy), GetFFlagEnableProfileInsightsApolloMigrationFunction (copy), UseSignalProfileInsightsByUserIdFunction (copy), UseProfileInsightsByUserIdsFunction (copy), GetProfileInsightsByUserIdFromDataFunction (copy), UseSocialCountsDataModule (copy), UseSocialCountsActionsModule (copy), FFlagEnableSocialTabsPage (copy), FFlagProfilePlatformEnableSchoolChip (copy), UseSchoolChipModule (copy), ReactModule (copy), EnumsModule (copy), ChipSize (copy), ChipGroup (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseAreWebViewsSupportedModuleResult = UseAreWebViewsSupportedModule()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local Source = if FFlagAddIEMProfilePage then UseProfileWrapperContextModuleResult.sourceInfo.source else nil
	local IsProfileIdMatch = ProfileId == tostring(UseLocalUserIdResult)
	local v1 = nil
	
	if GetFFlagEnableProfileInsightsApolloMigrationFunction() then
		v1 = UseSignalProfileInsightsByUserIdFunction({ rankingStrategy = "tc_info_boost", userId = ProfileId })
	else
		local UseProfileInsightsByUserIdsResult = UseProfileInsightsByUserIdsFunction({ userIds = { ProfileId } })
		
		if UseProfileInsightsByUserIdsResult and UseProfileInsightsByUserIdsResult.data and not UseProfileInsightsByUserIdsResult.loading then
			v1 = GetProfileInsightsByUserIdFromDataFunction(UseProfileInsightsByUserIdsResult.data, ProfileId)
		end
	end
	local Ids = {}
	
	for _, value in ipairs(if v1 and v1.mutualFriends then v1.mutualFriends else {}) do
		table.insert(Ids, value.id)
	end
	local UseSocialCountsDataModuleResult = UseSocialCountsDataModule(ProfileId, IsProfileIdMatch, UseAreWebViewsSupportedModuleResult, Ids)
	local UseSocialCountsActionsModuleResult = UseSocialCountsActionsModule(ProfileId, IsProfileIdMatch, UseProfileAnalyticsContextModuleResult, Ids, if FFlagEnableSocialTabsPage then p1.title else nil)
	local UseSchoolChipModuleResult = if FFlagProfilePlatformEnableSchoolChip then UseSchoolChipModule(UseProfileAnalyticsContextModuleResult) else nil
	
	return ReactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		Size = p1.size,
		BackgroundTransparency = 1,
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, UseDynamicSizeMarginModuleResult),
			PaddingRight = UDim.new(0, UseDynamicSizeMarginModuleResult)
		}),
		ChipGroup = ReactModule.createElement(ChipGroup, {
			scrollingEnabledOverride = true,
			chips = ReactModule.useMemo(function()
				-- upvalues: FFlagAddIEMProfilePage (upval), Source (copy), EnumsModule (upval), FFlagProfilePlatformEnableSchoolChip (upval), UseSchoolChipModuleResult (ref), UseSocialCountsDataModuleResult (copy), UseSocialCountsActionsModuleResult (copy), ChipSize (upval)
				local List = {}
				local IsSourceMatch: boolean = FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile
				
				if FFlagProfilePlatformEnableSchoolChip and UseSchoolChipModuleResult and not IsSourceMatch then
					table.insert(List, UseSchoolChipModuleResult)
				end
				for _, value in ipairs(UseSocialCountsDataModuleResult) do
					if value.fieldName ~= "mutualFriendsCount" or tonumber(value.count) ~= 0 then
						table.insert(List, {
							count = value.count,
							text = value.text,
							layoutOrder = value.layoutOrder,
							onActivated = if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then nil else UseSocialCountsActionsModuleResult[value.fieldName],
							isDisabled = value.isDisabled,
							size = ChipSize.Medium,
							leading = value.leading
						})
					end
				end
				return List
			end, {
				UseSocialCountsDataModuleResult,
				UseSocialCountsActionsModuleResult,
				UseSchoolChipModuleResult,
				Source
			}),
			automaticSize = Enum.AutomaticSize.Y,
			size = UDim2.new(1, 0, 0, 32),
			layoutOrder = p1.layoutOrder
		})
	})
end