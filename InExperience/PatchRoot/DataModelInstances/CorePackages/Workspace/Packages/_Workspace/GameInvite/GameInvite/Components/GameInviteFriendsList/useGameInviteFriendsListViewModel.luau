local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local FriendsMenuModule = require(Parent.FriendsMenu)
local DataHydrationModule = require(Parent.DataHydration)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local _ = require(GameInvite.gameInviteModalType)
local GameDetailsContextModule = require(GameInvite.Context.GameDetailsContext)
local GameInviteFriendRowModule = require(script.Parent.GameInviteFriendRow)
local _ = require(script.Parent.GameInviteFriendsListView)
local CanShareGameInviteLinkModule = require(script.Parent.canShareGameInviteLink)
local UseGameInviteJoinCardModule = require(script.Parent.useGameInviteJoinCard)
local IsJoinExpectedModule = require(GameInvite.utils.isJoinExpected)
local IsInThisServerModule = require(GameInvite.utils.isInThisServer)
local IsJoinVisibleModule = require(GameInvite.utils.isJoinVisible)
local ShouldShowJoinCtaModule = require(GameInvite.utils.shouldShowJoinCta)
local FFlagGameInviteHidePresenceInOtherExperienceModule = require(GameInvite.Flags.FFlagGameInviteHidePresenceInOtherExperience)
local FFlagGameInviteInExpJoinCtaModule = require(GameInvite.Flags.FFlagGameInviteInExpJoinCta)
local FFlagGameInviteInExpLivePresenceModule = require(GameInvite.Flags.FFlagGameInviteInExpLivePresence)
local FFlagGameInviteInExpRefetchOnPresenceEventModule = require(GameInvite.Flags.FFlagGameInviteInExpRefetchOnPresenceEvent)
local FFlagGameInviteEnableJoinForPioneer = require(Parent.SharedFlags).FFlagGameInviteEnableJoinForPioneer
local NotificationsCommonModule = require(Parent.NotificationsCommon)
local UseRefetchOnlineFriendsOnPresenceEventModule = if FFlagGameInviteInExpRefetchOnPresenceEventModule or FFlagGameInviteEnableJoinForPioneer then require(script.Parent.useRefetchOnlineFriendsOnPresenceEvent) else nil
local FFlagUserListHideNotJoinableJoin = require(Parent.SharedFlags).FFlagUserListHideNotJoinableJoin
local IsPioneerLaunch = if FFlagUserListHideNotJoinableJoin then require(Parent.PioneerUtils).isPioneerLaunch else nil
local User = require(Parent.UserList).Enums.EntityType.User

local function ignoreRowSelection() end

local function createJoinCtaConfig(p1, OnActivated)
	-- upvalues: NotificationsCommonModule (copy), GameInviteConstantsModule (copy), FFlagUserListHideNotJoinableJoin (copy), IsPioneerLaunch (copy), FFlagGameInviteHidePresenceInOtherExperienceModule (copy), IsJoinVisibleModule (copy), IsInThisServerModule (copy), IsJoinExpectedModule (copy)
	local IsGameInviteJoinForPioneerEnabled = NotificationsCommonModule.isGameInviteJoinForPioneerEnabled
	
	return {
		supportedActions = { "JoinExperience" },
		primaryCtaMinWidth = GameInviteConstantsModule.Layout.JoinCtaMinWidth,
		primaryCtaMaxWidth = GameInviteConstantsModule.Layout.JoinCtaMaxWidth,
		enableJoinabilityCheck = if FFlagUserListHideNotJoinableJoin and IsPioneerLaunch() then true else nil,
		join = {
			onActivated = OnActivated,
			isVisible = function(p2)
				-- upvalues: FFlagGameInviteHidePresenceInOtherExperienceModule (upval), IsGameInviteJoinForPioneerEnabled (copy), IsJoinVisibleModule (upval), IsInThisServerModule (upval)
				return if FFlagGameInviteHidePresenceInOtherExperienceModule and IsGameInviteJoinForPioneerEnabled then IsJoinVisibleModule(p2, game.JobId) else not IsInThisServerModule(p2, game.JobId)
			end,
			isJoinExpected = function(p2, p3)
				-- upvalues: FFlagGameInviteHidePresenceInOtherExperienceModule (upval), IsGameInviteJoinForPioneerEnabled (copy), IsJoinVisibleModule (upval), IsJoinExpectedModule (upval), p1 (copy)
				return if FFlagGameInviteHidePresenceInOtherExperienceModule and IsGameInviteJoinForPioneerEnabled then IsJoinVisibleModule(p3, game.JobId) else IsJoinExpectedModule(p3, p1[p2], game.JobId)
			end
		}
	}
end

local function useJoinCtaConfig(FriendsById, UseContextResult, OnActivated)
	-- upvalues: ShouldShowJoinCtaModule (copy), ReactModule (copy), createJoinCtaConfig (copy)
	local ShouldShowJoinCtaModule1 = ShouldShowJoinCtaModule(UseContextResult)
	
	return ReactModule.useMemo(function()
		-- upvalues: ShouldShowJoinCtaModule1 (copy), createJoinCtaConfig (upval), FriendsById (copy), OnActivated (copy)
		return if ShouldShowJoinCtaModule1 then createJoinCtaConfig(FriendsById, OnActivated) else nil
	end, { ShouldShowJoinCtaModule1, FriendsById, OnActivated })
end

return function(p1)
	-- upvalues: NotificationsCommonModule (copy), ReactModule (copy), FriendsMenuModule (copy), GameDetailsContextModule (copy), UseAppPolicyFunction (copy), FFlagGameInviteInExpLivePresenceModule (copy), DataHydrationModule (copy), User (copy), FFlagGameInviteInExpRefetchOnPresenceEventModule (copy), UseRefetchOnlineFriendsOnPresenceEventModule (copy), FFlagGameInviteInExpJoinCtaModule (copy), UseGameInviteJoinCardModule (copy), useJoinCtaConfig (copy), GameInviteFriendRowModule (copy), ignoreRowSelection (copy), CanShareGameInviteLinkModule (copy)
	local IsGameInviteJoinForPioneerEnabled = NotificationsCommonModule.isGameInviteJoinForPioneerEnabled
	local UseContextResult = ReactModule.useContext(FriendsMenuModule.FriendsListContext)
	local Friends = UseContextResult.friends
	local UseContextResult1 = ReactModule.useContext(GameDetailsContextModule)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.getExperienceInviteShareLinkEnabled()
	end)
	
	if FFlagGameInviteInExpLivePresenceModule or IsGameInviteJoinForPioneerEnabled then
		ReactModule.useEffect(function()
			-- upvalues: DataHydrationModule (upval)
			DataHydrationModule.Friends.FriendsStore.get().RefetchOnlineFriends()
		end, {})
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Friends (copy), User (upval)
		local Entities = {}
		local FriendsById = {}
		
		for _, friend in Friends do
			if not friend.isLoadingPlaceholder and FriendsById[friend.id] == nil then
				table.insert(Entities, { id = friend.id, type = User })
				FriendsById[friend.id] = friend
			end
		end
		return { entities = Entities, friendsById = FriendsById }
	end, { Friends })
	local FriendsById = UseMemoResult.friendsById
	
	if FFlagGameInviteInExpRefetchOnPresenceEventModule or IsGameInviteJoinForPioneerEnabled then
		UseRefetchOnlineFriendsOnPresenceEventModule(FriendsById)
	end
	local UseGameInviteJoinCardModuleResult = if FFlagGameInviteInExpJoinCtaModule or IsGameInviteJoinForPioneerEnabled then UseGameInviteJoinCardModule(tostring(game.GameId), game.JobId) else nil
	local UseJoinCtaConfigResult = if FFlagGameInviteInExpJoinCtaModule or IsGameInviteJoinForPioneerEnabled then useJoinCtaConfig(FriendsById, UseContextResult1, UseGameInviteJoinCardModuleResult.open) else nil
	local FetchMoreFriendsFunction = UseContextResult.fetchMoreFriends
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FetchMoreFriendsFunction (copy)
		FetchMoreFriendsFunction()
	end, { FetchMoreFriendsFunction })
	
	return {
		layoutOrder = p1.layoutOrder,
		size = p1.size,
		entities = UseMemoResult.entities,
		renderRow = ReactModule.useCallback(function(CreateRow, p2, RowNumber)
			-- upvalues: FriendsById (copy), ReactModule (upval), GameInviteFriendRowModule (upval)
			local FriendsByIdEntry = FriendsById[p2.id]
			
			return if FriendsByIdEntry == nil then nil else ReactModule.createElement(GameInviteFriendRowModule, {
				createRow = CreateRow,
				friend = FriendsByIdEntry,
				rowNumber = RowNumber
			})
		end, { FriendsById }),
		onRowSelected = ignoreRowSelection,
		onEndReached = if FetchMoreFriendsFunction and UseContextResult.searchFriendsString == "" then UseResult else nil,
		showShareGameInviteLink = CanShareGameInviteLinkModule(game.GameId, UseContextResult1, UseAppPolicyResult),
		ctaConfig = if FFlagGameInviteInExpJoinCtaModule or IsGameInviteJoinForPioneerEnabled then UseJoinCtaConfigResult else nil,
		joinCard = if FFlagGameInviteInExpJoinCtaModule or IsGameInviteJoinForPioneerEnabled then if UseJoinCtaConfigResult == nil then nil else UseGameInviteJoinCardModuleResult else nil
	}
end