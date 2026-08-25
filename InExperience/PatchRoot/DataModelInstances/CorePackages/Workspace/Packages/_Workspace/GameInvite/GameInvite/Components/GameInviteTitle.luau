local gameInvite = script:FindFirstAncestor("GameInvite")
local textService = game:GetService("TextService")
local components = gameInvite.Components
local context = gameInvite.Context
local parent = gameInvite.Parent
local utils = gameInvite.utils
local friendsMenuModule = require(parent.FriendsMenu)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local deviceInfo = require(parent.NotificationsCommon).DeviceInfo
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local friendsMenuSearch = friendsMenuModule.FriendsMenuSearch
local friendsListContext = friendsMenuModule.FriendsListContext
local inviteFriendContext = friendsMenuModule.InviteFriendContext
local gameInviteAnalyticsManagerModule = require(gameInvite.analytics.GameInviteAnalyticsManager)
local gameInviteModalManagerModule = require(gameInvite.GameInviteModalManager)
local shareGameInviteLinkModule = require(components.ShareGameInviteLink)
local isExperienceOlderThanOneWeekModule = require(utils.isExperienceOlderThanOneWeek)
local _ = require(gameInvite.gameInviteModalType)
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local gameInviteConstantsModule = require(gameInvite.GameInviteConstants)
local gameInviteModalLayoutContextModule = require(context.GameInviteModalLayoutContext)
local gameDetailsContextModule = require(context.GameDetailsContext)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
local getLocalizedStrings = localizationHelper.getLocalizedStrings
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableGameInviteModalVRSupport = sharedFlagsModule.GetFFlagEnableGameInviteModalVRSupport
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local titleIconSize = gameInviteConstantsModule.Layout.TitleIconSize
local sidePadding = gameInviteConstantsModule.Layout.SidePadding
local close = images["icons/navigation/close"]
local search = images["icons/menu/search"]
local t = {
	cancelText = "Feature.SettingsHub.Action.CancelSearch",
	copyLink = "Feature.SocialShare.Action.CopyLink",
	inviteFriends = if fFlagConnectionsToFriendsRename then "CoreScripts.InGameMenu.PageTitle.InviteFriends" else nil,
	inviteConnections = if fFlagConnectionsToFriendsRename then nil else "CommonUI.Features.Label.InviteConnections"
}

local var15 = function(p0, p1, p2)
	-- upvalues: getFFlagEnableGameInviteModalVRSupport (ref), isVRAppBuild (ref), isExperienceOlderThanOneWeekModule (ref)
	return if getFFlagEnableGameInviteModalVRSupport() then not isVRAppBuild() and (p2 and (not p1 and (p0 and (p0.isCoreScript and (p0.serverType == "StandardServer" and isExperienceOlderThanOneWeekModule(p0.gameDetails)))))) else not p1 and (p2 and (p0 and (p0.isCoreScript and (p0.serverType == "StandardServer" and isExperienceOlderThanOneWeekModule(p0.gameDetails)))))
end

return function(p3)
	-- upvalues: useStyle (ref), reactModule (ref), gameInviteModalLayoutContextModule (ref), gameDetailsContextModule (ref), friendsListContext (ref), inviteFriendContext (ref), getLocalizedStrings (ref), t (ref), useAppPolicy (ref), deviceInfo (ref), var15 (ref), textService (ref), titleIconSize (ref), gameInviteModalManagerModule (ref), sidePadding (ref), imageSetButton (ref), close (ref), fFlagConnectionsToFriendsRename (ref), search (ref), shareGameInviteLinkModule (ref), friendsMenuSearch (ref), gameInviteAnalyticsManagerModule (ref)
	local var16 = useStyle()
	local var17 = reactModule.useContext(gameInviteModalLayoutContextModule)
	local var18 = reactModule.useContext(gameDetailsContextModule)
	local var19 = reactModule.useContext(friendsListContext)
	local var20 = reactModule.useContext(inviteFriendContext)
	local var21, var22 = reactModule.useState(false)
	local var23 = getLocalizedStrings(t)
	local searchFriends = var19.searchFriends
	local var24 = useAppPolicy(function(p4)
		return p4.getExperienceInviteShareLinkEnabled()
	end)
	local isCompact = var17.modalMode == "compact"
	local isFullWidth = var17.isFullWidth
	local var26 = deviceInfo.isDesktopDevice()
	local var27 = var15(var18, deviceInfo.isConsole(), var24)
	local var28 = var26 and not isFullWidth
	local var29 = var16.Font.BaseSize * var16.Font.Header2.RelativeSize
	local var30 = var16.Font.BaseSize * var16.Font.Body.RelativeSize
	local copyLinkTextSize = textService:GetTextSize(var23.copyLink, var29, var16.Font.Header2.Font, Vector2.new(300 - titleIconSize, 1e999))
	local uDim2 = nil
	local var33 = 0
	
	if var27 then
		if var26 and var28 then
			local var34 = math.ceil(copyLinkTextSize.X) + 10
			uDim2 = UDim2.new(0, var34, 1, 0)
			var33 += var34
		else
			uDim2 = UDim2.new(0, titleIconSize, 0, titleIconSize)
			var33 += titleIconSize
		end
	end
	if isCompact then
		var33 += titleIconSize
	end
	if isCompact and var27 then
		var33 += 4
	end
	local var35 = function()
		-- upvalues: gameInviteModalManagerModule (copy), var20 (ref)
		gameInviteModalManagerModule:closeModal(var20.getMaxRecipientRowNum())
	end
	
	local var36 = function()
		-- upvalues: var22 (ref)
		var22(true)
	end
	
	local var37 = function()
		-- upvalues: var22 (ref), searchFriends (ref)
		var22(false)
		searchFriends("")
	end
	
	if not isCompact and var21 then
		var22(false)
		searchFriends("")
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 1),
		LayoutOrder = p3.layoutOrder,
		Position = UDim2.new(0, 0, 1, 0),
		Size = p3.size
	}, if var21 then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), friendsMenuSearch (copy), gameInviteAnalyticsManagerModule (copy), var30 (ref), var16 (ref), var23 (ref), var37 (ref)
		return {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				Padding = UDim.new(0, 4)
			}),
			SearchBox = reactModule.createElement(friendsMenuSearch, {
				layoutOrder = 0,
				focusElement = true,
				size = UDim2.new(1, -120, 1, -20),
				onFocus = function()
					-- upvalues: gameInviteAnalyticsManagerModule (copy)
					gameInviteAnalyticsManagerModule:onSearchFocused()
				end
			}),
			CancelButton = reactModule.createElement("TextButton", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.new(0, 100, 1, 0),
				TextSize = var30,
				TextColor3 = var16.Theme.UIDefault.Color,
				Text = var23.cancelText,
				Font = var16.Font.Body.Font,
				[reactModule.Event.Activated] = var37
			})
		}
	end, { var21 }) else reactModule.useMemo(function()
		-- upvalues: reactModule (copy), sidePadding (copy), var33 (write), p3 (ref), imageSetButton (copy), titleIconSize (copy), var35 (ref), close (copy), var16 (ref), fFlagConnectionsToFriendsRename (copy), var23 (ref), var29 (ref), isCompact (ref), var36 (ref), search (copy), var27 (ref), shareGameInviteLinkModule (copy), var26 (ref), var28 (ref), uDim2 (write)
		return {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, sidePadding),
				PaddingRight = UDim.new(0, sidePadding)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			LeftActionContainer = reactModule.createElement("Frame", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var33, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, 4)
				}),
				CloseButton = if not p3.hideCloseButton then reactModule.createElement(imageSetButton, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, titleIconSize, 0, titleIconSize),
					[reactModule.Event.Activated] = var35,
					Image = close,
					ImageColor3 = var16.Theme.IconEmphasis.Color,
					ImageTransparency = var16.Theme.IconEmphasis.Transparency,
					BorderSizePixel = 0
				}) else nil
			}),
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = if fFlagConnectionsToFriendsRename then var23.inviteFriends else var23.inviteConnections,
				TextSize = var29,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextColor3 = var16.Theme.TextEmphasis.Color,
				Font = var16.Font.Header2.Font,
				Size = UDim2.new(1, var33 * 2 * -1, 1, 0)
			}),
			RightActionContainer = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var33, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					Padding = UDim.new(0, 4)
				}),
				SearchButton = isCompact and reactModule.createElement(imageSetButton, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0, titleIconSize, 0, titleIconSize),
					[reactModule.Event.Activated] = var36,
					Image = search,
					ImageColor3 = var16.Theme.IconEmphasis.Color,
					ImageTransparency = var16.Theme.IconEmphasis.Transparency,
					BorderSizePixel = 0
				}) or nil,
				ShareGameInviteLink = var27 and reactModule.createElement(shareGameInviteLinkModule, {
					layoutOrder = 1,
					isDesktop = var26,
					isFullSize = var28,
					size = uDim2
				}) or nil
			})
		}
	end, {
		var21,
		var28,
		isCompact,
		var27,
		var26
	}))
end