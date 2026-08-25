local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local enumsModule = require(profilePlatform.Common.Enums)
local constantsModule = require(profilePlatform.Common.Constants)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local socialChipCountsRowContainer = require(profilePlatform.Components.UserProfileHeader.SocialChipCountsRow).SocialChipCountsRowContainer
local profileActionBarModule = require(profilePlatform.Components.ProfileActionBar)
local CTARowModule = require(profilePlatform.Components.CTARow)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableFontStylisticAlternativesOnSocialScreens = sharedFlagsModule.FFlagEnableFontStylisticAlternativesOnSocialScreens
local fFlagEnableSocialTabsPage = sharedFlagsModule.FFlagEnableSocialTabsPage
local var11 = if require(profilePlatform.Flags.FFlagProfilePlatformCTAsRefactor) then CTARowModule else profileActionBarModule

return function(p0)
	-- upvalues: useTokens (ref), useProfileWrapperContextModule (ref), useProfileFormFactorModule (ref), enumsModule (ref), useProfileJsonComponentModule (ref), fFlagEnableFontStylisticAlternativesOnSocialScreens (ref), constantsModule (ref), reactModule (ref), view (ref), userTile (ref), layoutMode (ref), var11 (ref), horizontalPageMargin (ref), socialChipCountsRowContainer (ref), fFlagEnableSocialTabsPage (ref)
	local var12 = useTokens()
	local profileId = useProfileWrapperContextModule().profileId
	local var13 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
	local userProfileHeader = useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader) or {}
	local names = userProfileHeader.names or {}
	local username = names.username or ""
	local var17 = if var13 then 128 else constantsModule.AVATAR_HEADSHOT_HEIGHT
	
	return reactModule.createElement(view, {
		tag = {
			["col size-full-0 auto-y"] = true,
			["gap-xxlarge"] = var13,
			["gap-large"] = not var13
		},
		LayoutOrder = p0.layoutOrder
	}, {
		HeaderBlock = reactModule.createElement(horizontalPageMargin, {
			backgroundTransparency = 1,
			useAutomaticSizing = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 0)
		}, {
			Row = reactModule.createElement(view, {
				tag = {
					["row align-y-center gap-medium size-full-0 auto-y"] = var13,
					["col gap-medium size-full-0 auto-y"] = not var13
				}
			}, {
				Identity = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = { grow = var13, ["size-full-0"] = not var13 },
					Size = if var13 then UDim2.fromOffset(0, var17) else UDim2.new(1, 0, 0, var17)
				}, {
					UserTile = reactModule.createElement(userTile, {
						userPresenceType = nil,
						userId = profileId,
						title = names.primaryName or "",
						subtitle = if username ~= "" then nil elseif fFlagEnableFontStylisticAlternativesOnSocialScreens then `<font features="zero, ss03">@{username}</font>` else "@" .. username,
						isPremium = userProfileHeader.isPremium,
						isVerified = userProfileHeader.isVerified,
						isRobloxAdmin = userProfileHeader.isRobloxAdmin,
						layoutMode = layoutMode.wide,
						titleStyle = if var13 then var12.Typography.HeadingLarge else var12.Typography.HeadingSmall,
						subtitleStyle = if var13 then var12.Typography.BodyLarge else var12.Typography.BodyMedium
					})
				}),
				Actions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = {
						["grow auto-y"] = var13,
						["size-full-0 auto-y"] = not var13
					}
				}, {
					Actions = reactModule.createElement(var11, { layoutOrder = 1 })
				})
			})
		}),
		SocialCountsRow = if userProfileHeader.counts ~= nil then reactModule.createElement(socialChipCountsRowContainer, {
			layoutOrder = 2,
			size = UDim2.fromScale(1, 0),
			title = if fFlagEnableSocialTabsPage then `@{username}` else nil
		}) else nil
	})
end