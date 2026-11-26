local GameInvite = script:FindFirstAncestor("GameInvite")
local Components = GameInvite.Components
local Context = GameInvite.Context
local Parent = GameInvite.Parent
local FriendsMenuModule = require(Parent.FriendsMenu)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local DeviceInfo = NotificationsCommonModule.DeviceInfo
local FriendsMenuFriendsList = FriendsMenuModule.FriendsMenuFriendsList
local InviteFriendContext = FriendsMenuModule.InviteFriendContext
local FriendsMenuContextWrapper = FriendsMenuModule.FriendsMenuContextWrapper
local FriendsMenuSearch = FriendsMenuModule.FriendsMenuSearch
local FriendMenuType = FriendsMenuModule.FriendMenuType
local GameInviteAnalyticsManagerModule = require(GameInvite.analytics.GameInviteAnalyticsManager)
local GameInviteTitleModule = require(Components.GameInviteTitle)
local GameInviteRewardsBannerModule = require(Components.GameInviteRewardsBanner)
local GameInviteCustomTextModule = require(Components.GameInviteCustomText)
local GameInviteFriendsListContainerModule = require(Components.GameInviteFriendsList.GameInviteFriendsListContainer)
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local GameInviteModalLayoutContextModule = require(Context.GameInviteModalLayoutContext)
local GameDetailsContextModule = require(Context.GameDetailsContext)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetFFlagEnableCommonFriendsMenuFunction = require(Parent.SharedFlags).GetFFlagEnableCommonFriendsMenu
local GetFFlagEnableGameInviteRewardsBannerFunction = require(Parent.SharedFlags).GetFFlagEnableGameInviteRewardsBanner
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local GetRewardMetadataModule = require(GameInvite.Requests.GetRewardMetadata)
local FFlagGameInviteInExpUserListRendererModule = require(GameInvite.Flags.FFlagGameInviteInExpUserListRenderer)
local FFlagGameInviteHidePresenceOnLegacyList = require(Parent.SharedFlags).FFlagGameInviteHidePresenceOnLegacyList
local IsPioneerEnabledLegacyInviteFriendsListModule = require(GameInvite.utils.isPioneerEnabledLegacyInviteFriendsList)
local FFlagGameInviteLegacyListJoin = require(Parent.SharedFlags).FFlagGameInviteLegacyListJoin
local ShouldShowJoinCtaModule = require(GameInvite.utils.shouldShowJoinCta)
local GameInviteLegacyJoinButtonModule = if FFlagGameInviteLegacyListJoin then require(Components.GameInviteLegacyJoinButton) else nil
local UseGameInviteJoinCardModule = require(Components.GameInviteFriendsList.useGameInviteJoinCard)
local _ = require(Components.GameInviteFriendsList.joinFriendFromExperience)
local GameInvitePresenceHiddenFriendsListModule = if FFlagGameInviteHidePresenceOnLegacyList then require(Components.GameInvitePresenceHiddenFriendsList) else nil
local SidePadding = GameInviteConstantsModule.Layout.SidePadding
local TitleHeight = GameInviteConstantsModule.Layout.TitleHeight

local function GameInviteLegacyJoinCardPortal(p1)
	-- upvalues: FoundationModule (copy), ReactRobloxModule (copy), ReactModule (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local JoinCard = p1.joinCard
	local CardComponent = JoinCard.cardComponent
	
	return if UseOverlayResult == nil or CardComponent == nil then nil else ReactRobloxModule.createPortal({
		GameInviteLegacyJoinCard = ReactModule.createElement(CardComponent, {
			userId = JoinCard.userId,
			onJoin = p1.onJoin,
			onClose = JoinCard.close
		})
	}, UseOverlayResult)
end

local function v37(p1)
	-- upvalues: NotificationsCommonModule (copy), ReactModule (copy), GameInviteModalLayoutContextModule (copy), GameDetailsContextModule (copy), GetFFlagEnableGameInviteRewardsBannerFunction (copy), GetRewardMetadataModule (copy), NewResult (copy), FFlagGameInviteLegacyListJoin (copy), IsPioneerEnabledLegacyInviteFriendsListModule (copy), UseGameInviteJoinCardModule (copy), GameInviteLegacyJoinButtonModule (copy), UseSelectorFunction (copy), DeviceInfo (copy), TitleHeight (copy), GameInviteConstantsModule (copy), FriendMenuType (copy), ShouldShowJoinCtaModule (copy), GameInviteTitleModule (copy), SidePadding (copy), FriendsMenuSearch (copy), GameInviteAnalyticsManagerModule (copy), GameInviteCustomTextModule (copy), GameInviteRewardsBannerModule (copy), FFlagGameInviteInExpUserListRendererModule (copy), GameInviteFriendsListContainerModule (copy), FFlagGameInviteHidePresenceOnLegacyList (copy), GameInvitePresenceHiddenFriendsListModule (copy), FriendsMenuFriendsList (copy), GameInviteLegacyJoinCardPortal (copy)
	local IsGameInviteJoinForPioneerEnabled = NotificationsCommonModule.isGameInviteJoinForPioneerEnabled
	local UseContextResult = ReactModule.useContext(GameInviteModalLayoutContextModule)
	local UseContextResult1 = ReactModule.useContext(GameDetailsContextModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	if GetFFlagEnableGameInviteRewardsBannerFunction() then
		ReactModule.useEffect(function()
			-- upvalues: GetRewardMetadataModule (upval), UseStateResult2 (copy), NewResult (upval)
			if game.GameId > 0 then
				GetRewardMetadataModule():andThen(function(Result)
					-- upvalues: UseStateResult2 (upval)
					if Result.responseBody and Result.responseBody.name and Result.responseBody.description then
						UseStateResult2(Result.responseBody)
					end
				end):catch(function(Err)
					-- upvalues: NewResult (upval)
					NewResult:error(`Error fetching reward metadata: {Err}`)
				end)
			end
		end, {})
	end
	local JoinCard = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if FFlagGameInviteLegacyListJoin and (not IsGameInviteJoinForPioneerEnabled and IsPioneerEnabledLegacyInviteFriendsListModule()) then
		local Text = tostring(game.GameId)
		local JobId = game.JobId
		local UseGameInviteJoinCardModuleResult = UseGameInviteJoinCardModule(Text, JobId)
		local Open = UseGameInviteJoinCardModuleResult.open
		local JoinFunction = UseGameInviteJoinCardModuleResult.join
		JoinCard = UseGameInviteJoinCardModuleResult
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: Text (copy), JoinFunction (copy)
			if p2.universeId == Text then
				JoinFunction(p2)
			end
		end, { JoinFunction, Text })
		UseResult1 = ReactModule.useCallback(function(p2, LayoutOrder)
			-- upvalues: ReactModule (upval), GameInviteLegacyJoinButtonModule (upval), Text (copy), JobId (copy), Open (copy)
			return ReactModule.createElement(GameInviteLegacyJoinButtonModule, {
				userId = p2.id,
				universeId = Text,
				jobId = JobId,
				layoutOrder = LayoutOrder,
				onJoin = Open
			})
		end, { Open, Text, JobId })
	end
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.TopBar
	end)
	local IsConsole = DeviceInfo.isConsole()
	local IsCompact = UseContextResult.modalMode == "compact"
	local PromptMessage = UseContextResult1.promptMessage
	local v1: boolean = PromptMessage and #PromptMessage > 0
	local NewTitleHeight = TitleHeight + 12
	local NoIsConsole: boolean = not IsCompact and not IsConsole
	
	if NoIsConsole then
		NewTitleHeight += 48
	end
	if v1 then
		NewTitleHeight += 48
	end
	local YOffset: number = TitleHeight
	
	if not UseContextResult1.isCoreScript and UseSelectorResult and UseSelectorResult.statusBarHeight and UseSelectorResult then
		NewTitleHeight += UseSelectorResult.statusBarHeight
		YOffset += UseSelectorResult.statusBarHeight
	end
	local config = {
		layoutOrder = 3,
		size = UDim2.new(1, 0, 1, -NewTitleHeight),
		parentComponentName = GameInviteConstantsModule.ParentComponentName,
		menuType = FriendMenuType.SingleSelect,
		gameDetailsData = UseContextResult1,
		disableSelectionParentManagement = p1.disableSelectionParentManagement,
		renderJoinButton = if UseResult1 and ShouldShowJoinCtaModule(UseContextResult1) then UseResult1 else nil
	}
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 8)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		TitleContainer = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.new(1, 0, 0, YOffset)
		}, {
			GameInviteTitle = ReactModule.createElement(GameInviteTitleModule, {
				layoutOrder = 0,
				size = UDim2.new(1, 0, 0, TitleHeight),
				hideCloseButton = p1.hideCloseButton
			})
		}),
		SearchBox = NoIsConsole and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 36)
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, SidePadding),
				PaddingRight = UDim.new(0, SidePadding)
			}),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 12),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			FriendsMenuSearch = ReactModule.createElement(FriendsMenuSearch, {
				layoutOrder = 1,
				focusElement = false,
				size = UDim2.new(1, 0, 0, 36),
				onFocus = function()
					-- upvalues: GameInviteAnalyticsManagerModule (upval)
					GameInviteAnalyticsManagerModule:onSearchFocused()
				end
			})
		}) or nil,
		CustomTextContainer = v1 and ReactModule.createElement(GameInviteCustomTextModule, {
			layoutOrder = 2,
			size = UDim2.new(1, 0, 0, 36),
			promptMessage = PromptMessage
		}) or nil,
		RewardsBanner = GetFFlagEnableGameInviteRewardsBannerFunction() and UseStateResult ~= nil and ReactModule.createElement(GameInviteRewardsBannerModule, { layoutOrder = 2, rewardMetadata = UseStateResult }) or nil,
		FriendsList = if (FFlagGameInviteInExpUserListRendererModule or IsGameInviteJoinForPioneerEnabled) and UseContextResult1.trigger == GameInviteConstantsModule.Triggers.GameMenu then ReactModule.createElement(GameInviteFriendsListContainerModule, {
			layoutOrder = 3,
			size = UDim2.new(1, 0, 1, -NewTitleHeight)
		}) elseif FFlagGameInviteHidePresenceOnLegacyList and IsPioneerEnabledLegacyInviteFriendsListModule() then ReactModule.createElement(GameInvitePresenceHiddenFriendsListModule, config) else ReactModule.createElement(FriendsMenuFriendsList, config),
		LegacyJoinCard = if JoinCard and UseResult then ReactModule.createElement(GameInviteLegacyJoinCardPortal, { joinCard = JoinCard, onJoin = UseResult }) else nil
	})
end

return function(p1)
	-- upvalues: GetFFlagEnableCommonFriendsMenuFunction (copy), ReactModule (copy), InviteFriendContext (copy), FriendsMenuContextWrapper (copy), v37 (copy)
	local UseContextResult = if GetFFlagEnableCommonFriendsMenuFunction() then ReactModule.useContext(InviteFriendContext) else {
		inviteSingleFriend = function() end,
		getMaxRecipientRowNum = function() end
	}
	
	return if GetFFlagEnableCommonFriendsMenuFunction() then ReactModule.createElement(FriendsMenuContextWrapper, {
		inviteSingleFriend = UseContextResult.inviteSingleFriend,
		inviteMultiFriends = function() end,
		isLoadingCustomParams = p1.isLoadingCustomParams
	}, { GameInviteContent = ReactModule.createElement(v37, p1) }) else ReactModule.createElement(v37, p1)
end