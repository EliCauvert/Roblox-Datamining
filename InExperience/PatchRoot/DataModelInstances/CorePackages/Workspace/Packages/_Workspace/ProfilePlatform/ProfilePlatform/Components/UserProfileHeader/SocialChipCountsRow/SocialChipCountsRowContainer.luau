local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local _ = require(ProfilePlatform.Common.Types)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseAreWebViewsSupportedModule = require(ProfilePlatform.Hooks.useAreWebViewsSupported)
local ChipGroup = require(ProfilePlatform.Components.ChipGroup).ChipGroup
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSignalProfileInsightsByUserIdFunction = require(Parent.ProfileInsights).useSignalProfileInsightsByUserId
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
local FFlagProfilePlatformGracefulVisibilityModule = require(ProfilePlatform.Flags.FFlagProfilePlatformGracefulVisibility)
local FFlagSocialTabsPageIxpEnabledModule = require(ProfilePlatform.Flags.FFlagSocialTabsPageIxpEnabled)

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseAreWebViewsSupportedModule (copy), UseLocalUserIdFunction (copy), UseDynamicSizeMarginModule (copy), FFlagAddIEMProfilePage (copy), UseSignalProfileInsightsByUserIdFunction (copy), UseSocialCountsDataModule (copy), UseSocialCountsActionsModule (copy), FFlagEnableSocialTabsPage (copy), FFlagSocialTabsPageIxpEnabledModule (copy), FFlagProfilePlatformEnableSchoolChip (copy), UseSchoolChipModule (copy), ReactModule (copy), EnumsModule (copy), FFlagProfilePlatformGracefulVisibilityModule (copy), ChipSize (copy), ChipGroup (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseAreWebViewsSupportedModuleResult = UseAreWebViewsSupportedModule()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local Source = if FFlagAddIEMProfilePage then UseProfileWrapperContextModuleResult.sourceInfo.source else nil
	local IsProfileIdMatch = ProfileId == tostring(UseLocalUserIdResult)
	local UseSignalProfileInsightsByUserIdResult = UseSignalProfileInsightsByUserIdFunction({ rankingStrategy = "tc_info_boost", userId = ProfileId })
	local MutualFriends = if UseSignalProfileInsightsByUserIdResult and UseSignalProfileInsightsByUserIdResult.mutualFriends then UseSignalProfileInsightsByUserIdResult.mutualFriends else {}
	local Ids = {}
	
	for _, mutualFriend in ipairs(MutualFriends) do
		table.insert(Ids, mutualFriend.id)
	end
	local UseSocialCountsDataModuleResult = UseSocialCountsDataModule(ProfileId, IsProfileIdMatch, UseAreWebViewsSupportedModuleResult, Ids)
	local UseSocialCountsActionsModuleResult = UseSocialCountsActionsModule(ProfileId, IsProfileIdMatch, UseProfileAnalyticsContextModuleResult, Ids, if FFlagEnableSocialTabsPage then p1.title else nil, if FFlagSocialTabsPageIxpEnabledModule then UseAreWebViewsSupportedModuleResult else nil)
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
				-- upvalues: FFlagAddIEMProfilePage (upval), Source (copy), EnumsModule (upval), FFlagProfilePlatformEnableSchoolChip (upval), UseSchoolChipModuleResult (ref), UseSocialCountsDataModuleResult (copy), FFlagProfilePlatformGracefulVisibilityModule (upval), UseSocialCountsActionsModuleResult (copy), ChipSize (upval)
				local List = {}
				local IsSourceMatch: boolean = FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile
				
				if FFlagProfilePlatformEnableSchoolChip and UseSchoolChipModuleResult and not IsSourceMatch then
					table.insert(List, UseSchoolChipModuleResult)
				end
				for _, value in ipairs(UseSocialCountsDataModuleResult) do
					if value.fieldName ~= "mutualFriendsCount" or tonumber(value.count) ~= 0 then
						local IsDisabled = FFlagProfilePlatformGracefulVisibilityModule and (value.fieldName == "friendsCount" and value.isDisabled)
						table.insert(List, {
							count = value.count,
							text = value.text,
							layoutOrder = value.layoutOrder,
							onActivated = if IsDisabled or FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then nil else UseSocialCountsActionsModuleResult[value.fieldName],
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