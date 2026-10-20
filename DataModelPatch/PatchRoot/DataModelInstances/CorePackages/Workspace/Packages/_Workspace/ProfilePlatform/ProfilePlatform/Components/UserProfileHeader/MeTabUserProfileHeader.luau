local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local SocialChipCountsRowContainer = require(ProfilePlatform.Components.UserProfileHeader.SocialChipCountsRow).SocialChipCountsRowContainer
local ProfileActionBarModule = require(ProfilePlatform.Components.ProfileActionBar)
local CTARowModule = require(ProfilePlatform.Components.CTARow)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableFontStylisticAlternativesOnSocialScreens = SharedFlagsModule.FFlagEnableFontStylisticAlternativesOnSocialScreens
local FFlagEnableSocialTabsPage = SharedFlagsModule.FFlagEnableSocialTabsPage
local CTARowModule1 = if require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor) then CTARowModule else ProfileActionBarModule

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseProfileWrapperContextModule (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), UseProfileJsonComponentModule (copy), FFlagEnableFontStylisticAlternativesOnSocialScreens (copy), ConstantsModule (copy), ReactModule (copy), View (copy), UserTile (copy), LayoutMode (copy), CTARowModule1 (copy), HorizontalPageMargin (copy), SocialChipCountsRowContainer (copy), FFlagEnableSocialTabsPage (copy)
	local UseTokensResult = UseTokensFunction()
	local ProfileId = UseProfileWrapperContextModule().profileId
	local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader) or {}
	local Names = UseProfileJsonComponentModuleResult.names or {}
	local Username = Names.username or ""
	local AVATARHEADSHOTHEIGHT = if IsFormFactorMatch then 128 else ConstantsModule.AVATAR_HEADSHOT_HEIGHT
	
	return ReactModule.createElement(View, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["gap-xxlarge"] = IsFormFactorMatch,
			["gap-large"] = not IsFormFactorMatch
		},
		LayoutOrder = p1.layoutOrder
	}, {
		HeaderBlock = ReactModule.createElement(HorizontalPageMargin, {
			backgroundTransparency = 1,
			useAutomaticSizing = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 0)
		}, {
			Row = ReactModule.createElement(View, {
				tag = {
					["row align-y-center gap-medium size-full-0 auto-y"] = IsFormFactorMatch,
					["col gap-medium size-full-0 auto-y"] = not IsFormFactorMatch
				}
			}, {
				Identity = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = {
						grow = IsFormFactorMatch,
						["size-full-0"] = not IsFormFactorMatch
					},
					Size = if IsFormFactorMatch then UDim2.fromOffset(0, AVATARHEADSHOTHEIGHT) else UDim2.new(1, 0, 0, AVATARHEADSHOTHEIGHT)
				}, {
					UserTile = ReactModule.createElement(UserTile, {
						userPresenceType = nil,
						userId = ProfileId,
						title = Names.primaryName or "",
						subtitle = if Username == "" then nil elseif FFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">@{Username}</font>` else "@" .. Username,
						isPremium = UseProfileJsonComponentModuleResult.isPremium,
						isVerified = UseProfileJsonComponentModuleResult.isVerified,
						isRobloxAdmin = UseProfileJsonComponentModuleResult.isRobloxAdmin,
						layoutMode = LayoutMode.wide,
						titleStyle = if IsFormFactorMatch then UseTokensResult.Typography.HeadingLarge else UseTokensResult.Typography.HeadingSmall,
						subtitleStyle = if IsFormFactorMatch then UseTokensResult.Typography.BodyLarge else UseTokensResult.Typography.BodyMedium
					})
				}),
				Actions = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = {
						["grow auto-y"] = IsFormFactorMatch,
						["size-full-0 auto-y"] = not IsFormFactorMatch
					}
				}, {
					Actions = ReactModule.createElement(CTARowModule1, { layoutOrder = 1 })
				})
			})
		}),
		SocialCountsRow = if UseProfileJsonComponentModuleResult.counts ~= nil then ReactModule.createElement(SocialChipCountsRowContainer, {
			layoutOrder = 2,
			size = UDim2.fromScale(1, 0),
			title = if FFlagEnableSocialTabsPage then `@{Username}` else nil
		}) else nil
	})
end