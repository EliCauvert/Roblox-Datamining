local GameInvite = script:FindFirstAncestor("GameInvite")
local TextService = game:GetService("TextService")
local Context = GameInvite.Context
local Parent = GameInvite.Parent
local FriendsMenuModule = require(Parent.FriendsMenu)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local DeviceInfo = require(Parent.NotificationsCommon).DeviceInfo
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local FriendsMenuSearch = FriendsMenuModule.FriendsMenuSearch
local FriendsListContext = FriendsMenuModule.FriendsListContext
local InviteFriendContext = FriendsMenuModule.InviteFriendContext
local GameInviteAnalyticsManagerModule = require(GameInvite.analytics.GameInviteAnalyticsManager)
local GameInviteModalManagerModule = require(GameInvite.GameInviteModalManager)
local ShareGameInviteLinkModule = require(GameInvite.Components.ShareGameInviteLink)
local IsExperienceOlderThanOneWeekModule = require(GameInvite.utils.isExperienceOlderThanOneWeek)
local _ = require(GameInvite.gameInviteModalType)
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local GameInviteModalLayoutContextModule = require(Context.GameInviteModalLayoutContext)
local GameDetailsContextModule = require(Context.GameDetailsContext)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GetFFlagEnableGameInviteModalVRSupportFunction = require(Parent.SharedFlags).GetFFlagEnableGameInviteModalVRSupport
local TitleIconSize = GameInviteConstantsModule.Layout.TitleIconSize
local SidePadding = GameInviteConstantsModule.Layout.SidePadding
local IconsNavigationClose = Images["icons/navigation/close"]
local IconsMenuSearch = Images["icons/menu/search"]
local config = {
	cancelText = "Feature.SettingsHub.Action.CancelSearch",
	inviteFriends = "CoreScripts.InGameMenu.PageTitle.InviteFriends",
	copyLink = "Feature.SocialShare.Action.CopyLink"
}

local function v28(UseContextResult, IsConsole, p1) --[[ Line: 58 ]]
	-- upvalues: GetFFlagEnableGameInviteModalVRSupportFunction (copy), IsVRAppBuildFunction (copy), IsExperienceOlderThanOneWeekModule (copy)
	return if GetFFlagEnableGameInviteModalVRSupportFunction() then not IsVRAppBuildFunction() and (p1 and (not IsConsole and (UseContextResult and (UseContextResult.isCoreScript and (UseContextResult.serverType == "StandardServer" and IsExperienceOlderThanOneWeekModule(UseContextResult.gameDetails)))))) else not IsConsole and (p1 and (UseContextResult and (UseContextResult.isCoreScript and (UseContextResult.serverType == "StandardServer" and IsExperienceOlderThanOneWeekModule(UseContextResult.gameDetails)))))
end

return function(p1) --[[ Line: 87 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), GameInviteModalLayoutContextModule (copy), GameDetailsContextModule (copy), FriendsListContext (copy), InviteFriendContext (copy), GetLocalizedStringsFunction (copy), config (copy), UseAppPolicyFunction (copy), DeviceInfo (copy), v28 (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TitleIconSize (copy), TextService (copy), GameInviteModalManagerModule (copy), SidePadding (copy), ImageSetButton (copy), IconsNavigationClose (copy), NormalizeFontFaceFunction (copy), IconsMenuSearch (copy), ShareGameInviteLinkModule (copy), FriendsMenuSearch (copy), GameInviteAnalyticsManagerModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseContextResult = ReactModule.useContext(GameInviteModalLayoutContextModule)
	local UseContextResult1 = ReactModule.useContext(GameDetailsContextModule)
	local UseContextResult2 = ReactModule.useContext(FriendsListContext)
	local UseContextResult3 = ReactModule.useContext(InviteFriendContext)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local LocalizedStrings = GetLocalizedStringsFunction(config)
	local SearchFriendsFunction: (any) -> () = UseContextResult2.searchFriends
	local IsCompact = UseContextResult.modalMode == "compact"
	local IsFullWidth = UseContextResult.isFullWidth
	local IsDesktopDevice = DeviceInfo.isDesktopDevice()
	local v1 = v28(UseContextResult1, DeviceInfo.isConsole(), (UseAppPolicyFunction(function(p2) --[[ Line: 99 ]]
		return p2.getExperienceInviteShareLinkEnabled()
	end)))
	local NoIsFullWidth: boolean = IsDesktopDevice and not IsFullWidth
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Header2.RelativeSize
	local ScaledBaseSize1 = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize
	local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(LocalizedStrings.copyLink, ScaledBaseSize, UseStyleResult.Tokens.Typography.TitleLarge.Font, Vector2.new(300 - TitleIconSize, 1e999), { addTemporaryPadding = false }) else TextService:GetTextSize(LocalizedStrings.copyLink, ScaledBaseSize, UseStyleResult.Font.Header2.Font, Vector2.new(300 - TitleIconSize, 1e999))
	local Size: UDim2? = nil
	local XOffset = 0
	
	if v1 then
		if IsDesktopDevice and NoIsFullWidth then
			local NewCeiled = math.ceil(TextSize.X) + 10
			Size = UDim2.new(0, NewCeiled, 1, 0)
			XOffset += NewCeiled
		else
			Size = UDim2.new(0, TitleIconSize, 0, TitleIconSize)
			XOffset += TitleIconSize
		end
	end
	if IsCompact then
		XOffset += TitleIconSize
	end
	if IsCompact and v1 then
		XOffset += 4
	end
	local function v47() --[[ Line: 148 ]]
		-- upvalues: GameInviteModalManagerModule (upval), UseContextResult3 (copy)
		GameInviteModalManagerModule:closeModal(UseContextResult3.getMaxRecipientRowNum())
	end
	
	local function v48() --[[ Line: 152 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end
	
	local function v49() --[[ Line: 156 ]]
		-- upvalues: UseStateResult2 (copy), SearchFriendsFunction (copy)
		UseStateResult2(false)
		SearchFriendsFunction("")
	end
	
	if not IsCompact and UseStateResult then
		UseStateResult2(false)
		SearchFriendsFunction("")
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 167 ]]
		-- upvalues: ReactModule (upval), SidePadding (upval), XOffset (ref), p1 (copy), ImageSetButton (upval), TitleIconSize (upval), v47 (copy), IconsNavigationClose (upval), UseStyleResult (copy), LocalizedStrings (copy), ScaledBaseSize (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), IsCompact (copy), v48 (copy), IconsMenuSearch (upval), v1 (copy), ShareGameInviteLinkModule (upval), IsDesktopDevice (copy), NoIsFullWidth (copy), Size (ref)
		return {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, SidePadding),
				PaddingRight = UDim.new(0, SidePadding)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			LeftActionContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, XOffset, 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, 4)
				}),
				CloseButton = if p1.hideCloseButton then nil else ReactModule.createElement(ImageSetButton, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, TitleIconSize, 0, TitleIconSize),
					[ReactModule.Event.Activated] = v47,
					Image = IconsNavigationClose,
					ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
					ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
					BorderSizePixel = 0
				})
			}),
			Title = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = LocalizedStrings.inviteFriends,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
				Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Header2.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
				Size = UDim2.new(1, XOffset * 2 * -1, 1, 0)
			}),
			RightActionContainer = ReactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, XOffset, 1, 0)
			}, {
				UIListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					Padding = UDim.new(0, 4)
				}),
				SearchButton = IsCompact and ReactModule.createElement(ImageSetButton, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0, TitleIconSize, 0, TitleIconSize),
					[ReactModule.Event.Activated] = v48,
					Image = IconsMenuSearch,
					ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
					ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
					BorderSizePixel = 0
				}) or nil,
				ShareGameInviteLink = v1 and ReactModule.createElement(ShareGameInviteLinkModule, {
					layoutOrder = 1,
					isDesktop = IsDesktopDevice,
					isFullSize = NoIsFullWidth,
					size = Size
				}) or nil
			})
		}
	end, {
		UseStateResult,
		NoIsFullWidth,
		IsCompact,
		v1,
		IsDesktopDevice
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 249 ]]
		-- upvalues: ReactModule (upval), FriendsMenuSearch (upval), GameInviteAnalyticsManagerModule (upval), ScaledBaseSize1 (copy), UseStyleResult (copy), LocalizedStrings (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), v49 (copy)
		return {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				Padding = UDim.new(0, 4)
			}),
			SearchBox = ReactModule.createElement(FriendsMenuSearch, {
				layoutOrder = 0,
				focusElement = true,
				size = UDim2.new(1, -120, 1, -20),
				onFocus = function() --[[ Line: 262 ]]
					-- upvalues: GameInviteAnalyticsManagerModule (upval)
					GameInviteAnalyticsManagerModule:onSearchFocused()
				end
			}),
			CancelButton = ReactModule.createElement("TextButton", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.new(0, 100, 1, 0),
				TextSize = ScaledBaseSize1,
				TextColor3 = UseStyleResult.Theme.UIDefault.Color,
				Text = LocalizedStrings.cancelText,
				Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
				[ReactModule.Event.Activated] = v49
			})
		}
	end, { UseStateResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 1),
		LayoutOrder = p1.layoutOrder,
		Position = UDim2.new(0, 0, 1, 0),
		Size = p1.size
	}, if UseStateResult then UseMemoResult1 else UseMemoResult)
end