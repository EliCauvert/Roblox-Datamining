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

local var1 = function(p1, p2, p3)
	-- upvalues: getFFlagEnableGameInviteModalVRSupport (ref), isVRAppBuild (ref), isExperienceOlderThanOneWeekModule (ref)
	return if getFFlagEnableGameInviteModalVRSupport() then not isVRAppBuild() and (p3 and (not p2 and (p1 and (p1.isCoreScript and (p1.serverType == "StandardServer" and isExperienceOlderThanOneWeekModule(p1.gameDetails)))))) else not p2 and (p3 and (p1 and (p1.isCoreScript and (p1.serverType == "StandardServer" and isExperienceOlderThanOneWeekModule(p1.gameDetails)))))
end

return function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), gameInviteModalLayoutContextModule (ref), gameDetailsContextModule (ref), friendsListContext (ref), inviteFriendContext (ref), getLocalizedStrings (ref), t (ref), useAppPolicy (ref), deviceInfo (ref), var1 (ref), textService (ref), titleIconSize (ref), gameInviteModalManagerModule (ref), sidePadding (ref), imageSetButton (ref), close (ref), fFlagConnectionsToFriendsRename (ref), search (ref), shareGameInviteLinkModule (ref), friendsMenuSearch (ref), gameInviteAnalyticsManagerModule (ref)
	local var2 = useStyle()
	local var3 = reactModule.useContext(gameInviteModalLayoutContextModule)
	local var4 = reactModule.useContext(gameDetailsContextModule)
	local var5 = reactModule.useContext(friendsListContext)
	local var6 = reactModule.useContext(inviteFriendContext)
	local var7, var8 = reactModule.useState(false)
	local var9 = getLocalizedStrings(t)
	local searchFriends = var5.searchFriends
	local var10 = useAppPolicy(function(p2)
		return p2.getExperienceInviteShareLinkEnabled()
	end)
	local isCompact = var3.modalMode == "compact"
	local isFullWidth = var3.isFullWidth
	local var11 = deviceInfo.isDesktopDevice()
	local var12 = var1(var4, deviceInfo.isConsole(), var10)
	local var13 = var11 and not isFullWidth
	local var14 = var2.Font.BaseSize * var2.Font.Header2.RelativeSize
	local var15 = var2.Font.BaseSize * var2.Font.Body.RelativeSize
	local copyLinkTextSize = textService:GetTextSize(var9.copyLink, var14, var2.Font.Header2.Font, Vector2.new(300 - titleIconSize, 1e999))
	local uDim2 = nil
	local var16 = 0
	
	if var12 then
		if var11 and var13 then
			local var17 = math.ceil(copyLinkTextSize.X) + 10
			uDim2 = UDim2.new(0, var17, 1, 0)
			var16 += var17
		else
			uDim2 = UDim2.new(0, titleIconSize, 0, titleIconSize)
			var16 += titleIconSize
		end
	end
	if isCompact then
		var16 += titleIconSize
	end
	if isCompact and var12 then
		var16 += 4
	end
	local var18 = function()
		-- upvalues: gameInviteModalManagerModule (copy), var6 (ref)
		gameInviteModalManagerModule:closeModal(var6.getMaxRecipientRowNum())
	end
	
	local var19 = function()
		-- upvalues: var8 (ref)
		var8(true)
	end
	
	local var20 = function()
		-- upvalues: var8 (ref), searchFriends (ref)
		var8(false)
		searchFriends("")
	end
	
	if not isCompact and var7 then
		var8(false)
		searchFriends("")
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 1),
		LayoutOrder = p1.layoutOrder,
		Position = UDim2.new(0, 0, 1, 0),
		Size = p1.size
	}, if var7 then reactModule.useMemo(function()
		-- upvalues: reactModule (copy), friendsMenuSearch (copy), gameInviteAnalyticsManagerModule (copy), var15 (ref), var2 (ref), var9 (ref), var20 (ref)
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
				TextSize = var15,
				TextColor3 = var2.Theme.UIDefault.Color,
				Text = var9.cancelText,
				Font = var2.Font.Body.Font,
				[reactModule.Event.Activated] = var20
			})
		}
	end, { var7 }) else reactModule.useMemo(function()
		-- upvalues: reactModule (copy), sidePadding (copy), var16 (write), p1 (ref), imageSetButton (copy), titleIconSize (copy), var18 (ref), close (copy), var2 (ref), fFlagConnectionsToFriendsRename (copy), var9 (ref), var14 (ref), isCompact (ref), var19 (ref), search (copy), var12 (ref), shareGameInviteLinkModule (copy), var11 (ref), var13 (ref), uDim2 (write)
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
				Size = UDim2.new(0, var16, 1, 0)
			}, {
				UIListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, 4)
				}),
				CloseButton = if not p1.hideCloseButton then reactModule.createElement(imageSetButton, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, titleIconSize, 0, titleIconSize),
					[reactModule.Event.Activated] = var18,
					Image = close,
					ImageColor3 = var2.Theme.IconEmphasis.Color,
					ImageTransparency = var2.Theme.IconEmphasis.Transparency,
					BorderSizePixel = 0
				}) else nil
			}),
			Title = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = if fFlagConnectionsToFriendsRename then var9.inviteFriends else var9.inviteConnections,
				TextSize = var14,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextColor3 = var2.Theme.TextEmphasis.Color,
				Font = var2.Font.Header2.Font,
				Size = UDim2.new(1, var16 * 2 * -1, 1, 0)
			}),
			RightActionContainer = reactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var16, 1, 0)
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
					[reactModule.Event.Activated] = var19,
					Image = search,
					ImageColor3 = var2.Theme.IconEmphasis.Color,
					ImageTransparency = var2.Theme.IconEmphasis.Transparency,
					BorderSizePixel = 0
				}) or nil,
				ShareGameInviteLink = var12 and reactModule.createElement(shareGameInviteLinkModule, {
					layoutOrder = 1,
					isDesktop = var11,
					isFullSize = var13,
					size = uDim2
				}) or nil
			})
		}
	end, {
		var7,
		var13,
		isCompact,
		var12,
		var11
	}))
end