local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local FriendsMenuModule = require(Parent.FriendsMenu)
local _ = require(Parent.DataHydration)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GameInviteConstantsModule = require(GameInvite.GameInviteConstants)
local _ = require(GameInvite.gameInviteModalType)
local GameDetailsContextModule = require(GameInvite.Context.GameDetailsContext)
local GameInviteFriendRowModule = require(script.Parent.GameInviteFriendRow)
local _ = require(script.Parent.GameInviteFriendsListView)
local CanShareGameInviteLinkModule = require(script.Parent.canShareGameInviteLink)
local UseGameInviteJoinCardModule = require(script.Parent.useGameInviteJoinCard)
local IsInThisServerModule = require(GameInvite.utils.isInThisServer)
local IsJoinExpectedModule = require(GameInvite.utils.isJoinExpected)
local ShouldShowJoinCtaModule = require(GameInvite.utils.shouldShowJoinCta)
local FFlagGameInviteInExpJoinCtaModule = require(GameInvite.Flags.FFlagGameInviteInExpJoinCta)
local User = require(Parent.UserList).Enums.EntityType.User

local function ignoreRowSelection() end

local function isJoinVisible(p1): boolean
	-- upvalues: IsInThisServerModule (copy)
	return not IsInThisServerModule(p1, game.JobId)
end

local function createJoinCtaConfig(p1, OnActivated)
	-- upvalues: GameInviteConstantsModule (copy), isJoinVisible (copy), IsJoinExpectedModule (copy)
	return {
		supportedActions = { "JoinExperience" },
		primaryCtaMinWidth = GameInviteConstantsModule.Layout.JoinCtaMinWidth,
		primaryCtaMaxWidth = GameInviteConstantsModule.Layout.JoinCtaMaxWidth,
		join = {
			onActivated = OnActivated,
			isVisible = isJoinVisible,
			isJoinExpected = function(p2, p3)
				-- upvalues: IsJoinExpectedModule (upval), p1 (copy)
				return IsJoinExpectedModule(p3, p1[p2], game.JobId)
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
	-- upvalues: ReactModule (copy), FriendsMenuModule (copy), GameDetailsContextModule (copy), UseAppPolicyFunction (copy), User (copy), FFlagGameInviteInExpJoinCtaModule (copy), UseGameInviteJoinCardModule (copy), useJoinCtaConfig (copy), GameInviteFriendRowModule (copy), ignoreRowSelection (copy), CanShareGameInviteLinkModule (copy)
	local Friends = ReactModule.useContext(FriendsMenuModule.FriendsListContext).friends
	local UseContextResult = ReactModule.useContext(GameDetailsContextModule)
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
	local UseGameInviteJoinCardModuleResult = if FFlagGameInviteInExpJoinCtaModule then UseGameInviteJoinCardModule() else nil
	local UseJoinCtaConfigResult = if FFlagGameInviteInExpJoinCtaModule then useJoinCtaConfig(FriendsById, UseContextResult, UseGameInviteJoinCardModuleResult.open) else nil
	
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
		showShareGameInviteLink = CanShareGameInviteLinkModule(game.GameId, UseContextResult, (UseAppPolicyFunction(function(p2)
			return p2.getExperienceInviteShareLinkEnabled()
		end))),
		ctaConfig = if FFlagGameInviteInExpJoinCtaModule then UseJoinCtaConfigResult else nil,
		joinCard = if FFlagGameInviteInExpJoinCtaModule and UseJoinCtaConfigResult ~= nil then UseGameInviteJoinCardModuleResult else nil
	}
end