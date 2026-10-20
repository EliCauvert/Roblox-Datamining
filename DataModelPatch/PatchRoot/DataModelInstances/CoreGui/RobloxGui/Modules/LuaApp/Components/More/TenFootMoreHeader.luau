local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppPageLocalizationKeysModule = require(Modules.LuaApp.AppPageLocalizationKeys)
local UserInfoWidgetModule = require(Modules.LuaApp.Components.Home.UserInfoWidget)
local GetFFlagFixUserInfoSelectionModule = require(Modules.LuaApp.Flags.GetFFlagFixUserInfoSelection)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local GetFFlagFixUserInfoWidgetPlusBadgeFunction = SharedFlagsModule.GetFFlagFixUserInfoWidgetPlusBadge
local DisplayMorePageThirdPartyUserName2 = game:DefineFastFlag("DisplayMorePageThirdPartyUserName2", false)
local FixMorePageThirdPartyUserNameBug = game:DefineFastFlag("FixMorePageThirdPartyUserNameBug", false)
local ThirdPartyLinkedUserInfoWidgetModule = nil
local ThirdPartyUserService = nil
local Players = nil
local VerifiedBadgesModule = nil
local IsPlayerVerifiedFunction = nil
local UseAppPolicyFunction = nil

if DisplayMorePageThirdPartyUserName2 then
	ThirdPartyLinkedUserInfoWidgetModule = require(Modules.LuaApp.Components.More.ThirdPartyLinkedUserInfoWidget)
	ThirdPartyUserService = game:GetService("ThirdPartyUserService")
	Players = game:GetService("Players")
	VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
	IsPlayerVerifiedFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.isPlayerVerified
	UseAppPolicyFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
end
return function()
	-- upvalues: UseDesignTokensFunction (copy), UseLocalizationFunction (copy), AppPageLocalizationKeysModule (copy), AppPageModule (copy), UseSelectorFunction (copy), DisplayMorePageThirdPartyUserName2 (copy), FixMorePageThirdPartyUserNameBug (copy), UseAppPolicyFunction (ref), ThirdPartyUserService (ref), Players (ref), GetFFlagFixUserInfoWidgetPlusBadgeFunction (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), IsPlayerVerifiedFunction (ref), VerifiedBadgesModule (ref), ReactModule (copy), ThirdPartyLinkedUserInfoWidgetModule (ref), UserInfoWidgetModule (copy), GetFFlagFixUserInfoSelectionModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local HeadingLarge = UseDesignTokensResult.Typography.HeadingLarge
	local Emphasis = UseDesignTokensResult.Color.Content.Emphasis
	local Size800 = UseDesignTokensResult.Size.Size_800
	local TitleHeight = UseDesignTokensResult.LuaApps.More.TitleHeight
	local UserIconSize = UseDesignTokensResult.LuaApps.More.UserIconSize
	local UsernameTextFont = UseDesignTokensResult.LuaApps.More.UsernameTextFont
	local UsernameTextStyle = UseDesignTokensResult.LuaApps.More.UsernameTextStyle
	local UseLocalizationResult = UseLocalizationFunction({
		title = AppPageLocalizationKeysModule[AppPageModule.More]
	})
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.Users[p1.LocalUserId]
	end)
	local Id = nil
	local DisplayName = nil
	local UserPlatformName = nil
	local Verified = nil
	local ShowRobloxPlusBadge = false
	
	if DisplayMorePageThirdPartyUserName2 then
		local UseAppPolicyResult = if FixMorePageThirdPartyUserNameBug then UseAppPolicyFunction(function(p1)
			return p1.getShowDisplayName()
		end) else nil
		
		if ThirdPartyUserService and ThirdPartyUserService:IsSingleSignOnSupported() then
			UserPlatformName = ThirdPartyUserService:GetUserPlatformName()
		end
		if UseSelectorResult then
			if not FixMorePageThirdPartyUserNameBug then
				UseAppPolicyResult = UseAppPolicyFunction(function(p1)
					return p1.getShowDisplayName()
				end)
			end
			Id = UseSelectorResult.id
			DisplayName = if UseAppPolicyResult then UseSelectorResult.displayName else UseSelectorResult.name
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				local IsMembershipMatch = UseSelectorResult.membership == Enum.MembershipType.Premium
				local IsHasRobloxSubscription = UseSelectorResult.hasRobloxSubscription == true
				local FFlagFixUserInfoWidgetPlusBadge = GetFFlagFixUserInfoWidgetPlusBadgeFunction()
				local Inverted: boolean = IsMembershipMatch and (not (FFlagFixUserInfoWidgetPlusBadge and (FFlagEnableBlackbirdCheck and IsHasRobloxSubscription)) and not (FFlagFixUserInfoWidgetPlusBadge and FFlagHidePremiumIconography))
				Verified = if IsPlayerVerifiedFunction({
					DisplayName = LocalPlayer.DisplayName,
					Name = LocalPlayer.Name,
					HasVerifiedBadge = LocalPlayer.HasVerifiedBadge,
					UserId = LocalPlayer.UserId
				}) then VerifiedBadgesModule.emoji.verified elseif Inverted then VerifiedBadgesModule.emoji.premium else ""
				ShowRobloxPlusBadge = FFlagFixUserInfoWidgetPlusBadge and (FFlagEnableBlackbirdCheck and IsHasRobloxSubscription)
			end
		end
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Size800)
		}),
		TitleFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, TitleHeight)
		}, {
			Title = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Text = UseLocalizationResult.title,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = HeadingLarge.Font,
				TextSize = HeadingLarge.FontSize,
				TextColor3 = Emphasis.Color3,
				TextTransparency = Emphasis.Transparency
			})
		}),
		UserInfo = if DisplayMorePageThirdPartyUserName2 then ReactModule.createElement(ThirdPartyLinkedUserInfoWidgetModule, {
			layoutOrder = 2,
			thirdPartyPlatformIcon = "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png",
			userId = Id,
			userName = DisplayName,
			userBadgeEmoji = Verified,
			showRobloxPlusBadge = ShowRobloxPlusBadge,
			thirdPartyUserName = UserPlatformName
		}) else ReactModule.createElement(UserInfoWidgetModule, {
			layoutOrder = 2,
			onActivated = nil,
			localUserModel = UseSelectorResult,
			selectable = not GetFFlagFixUserInfoSelectionModule() and nil,
			sideMargin = UseDesignTokensResult.Size.Size_300,
			thumbnailSize = UserIconSize,
			usernameTextFont = UsernameTextFont,
			usernameTextStyle = UsernameTextStyle
		})
	})
end