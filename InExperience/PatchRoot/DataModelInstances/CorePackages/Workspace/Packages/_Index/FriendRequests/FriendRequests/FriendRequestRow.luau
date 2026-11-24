local Parent = script:FindFirstAncestor("FriendRequests").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local UserListModule = require(Parent.UserList)
local DataHydrationModule = require(Parent.DataHydration)
local FriendsRequestsModule = require(Parent.DataHydration.FriendsRequests)
local RemoveAcceptedFriendRequestModule = require(script.Parent.removeAcceptedFriendRequest)
local UseFriendRequestContextInfoSourceModule = require(script.Parent.useFriendRequestContextInfoSource)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local _ = UserListModule.Enums.ButtonTypes
local ClientCtaActions = UserListModule.Enums.ClientCtaActions
local RowLayoutMode = UserListModule.Enums.RowLayoutMode
local _ = UserListModule.Enums.RowSize
local config = { skipFetch = true }
local Computed = SignalsModule.createComputed(function()
	return nil
end)

local function NOOP() end

local function useFriendshipStatus(Id)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), config (copy), SignalsReactModule (copy), Computed (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: DataHydrationModule (upval), Id (copy), config (upval)
		return DataHydrationModule.Friends.FriendsStore.get().GetFriendshipStatus(Id, config)
	end, { Id })
	
	return SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.data else Computed)
end

local function usePresence(Id, IsHidePresence)
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsReactModule (copy), Computed (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsHidePresence (copy), DataHydrationModule (upval), Id (copy)
		return if IsHidePresence then nil else DataHydrationModule.Presence.PresenceStore.get().GetPresenceByUserId(Id)
	end, { Id, IsHidePresence })
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseMemoResult then UseMemoResult.data else Computed)
	
	return if UseSignalStateResult then UseSignalStateResult.userPresenceType else nil
end

local function _(p1)
	-- upvalues: ReactModule (copy), ButtonVariant (copy), NOOP (copy), UserListModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ButtonVariant (upval), NOOP (upval), UserListModule (upval)
		return if p1 == nil then nil else {
			type = p1.type,
			variant = ButtonVariant.Standard,
			onActivated = p1.onActivated or NOOP,
			isDisabled = p1.onActivated == nil or nil,
			minWidth = UserListModule.DefaultPrimaryCtaMinWidth,
			maxWidth = UserListModule.DefaultPrimaryCtaMaxWidth
		}
	end, { p1 })
end

return ReactModule.memo(function(p1)
	-- upvalues: useFriendshipStatus (copy), usePresence (copy), ReactModule (copy), ButtonVariant (copy), NOOP (copy), UserListModule (copy), UseFriendRequestContextInfoSourceModule (copy), ClientCtaActions (copy), RemoveAcceptedFriendRequestModule (copy), FriendsRequestsModule (copy), RowLayoutMode (copy)
	local Request = p1.request
	local Id = Request.id
	local UseFriendshipStatusResult = useFriendshipStatus(Id)
	local UsePresenceResult = usePresence(Id, p1.hidePresence == true)
	local AcceptedCta = p1.acceptedCta
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AcceptedCta (copy), ButtonVariant (upval), NOOP (upval), UserListModule (upval)
		return if AcceptedCta == nil then nil else {
			type = AcceptedCta.type,
			variant = ButtonVariant.Standard,
			onActivated = AcceptedCta.onActivated or NOOP,
			isDisabled = AcceptedCta.onActivated == nil or nil,
			minWidth = UserListModule.DefaultPrimaryCtaMinWidth,
			maxWidth = UserListModule.DefaultPrimaryCtaMaxWidth
		}
	end, { AcceptedCta })
	local UseFriendRequestContextInfoSourceModuleResult = UseFriendRequestContextInfoSourceModule(Request, UseFriendshipStatusResult)
	local UseResult = ReactModule.useCallback(function(AcceptFriendRequest)
		-- upvalues: ClientCtaActions (upval), RemoveAcceptedFriendRequestModule (upval), Id (copy), FriendsRequestsModule (upval)
		if AcceptFriendRequest == ClientCtaActions.AcceptFriendRequest then
			RemoveAcceptedFriendRequestModule(Id)
			
			return
		end
		if AcceptFriendRequest == ClientCtaActions.DeclineFriendRequest then
			FriendsRequestsModule.FriendsRequestsStore.get().removeFriendRequestByUserId(Id)
		end
	end, { Id })
	local NoUseFriendshipStatusResult: boolean = UseFriendshipStatusResult == nil or UseFriendshipStatusResult == Enum.FriendStatus.FriendRequestReceived
	local IsUseFriendshipStatusResultMatch = UseFriendshipStatusResult == Enum.FriendStatus.Friend
	
	return if NoUseFriendshipStatusResult or IsUseFriendshipStatusResultMatch and UseMemoResult then ReactModule.createElement(UserListModule.UserRow, {
		entityId = Id,
		layoutMode = RowLayoutMode.Wide,
		rowSize = p1.rowSize,
		layoutOrder = p1.layoutOrder,
		onActivated = p1.onActivated,
		primaryClientAction = if NoUseFriendshipStatusResult then ClientCtaActions.AcceptFriendRequest else nil,
		secondaryClientAction = if NoUseFriendshipStatusResult and not p1.hideDeclineCta then ClientCtaActions.DeclineFriendRequest else nil,
		primaryCta = if NoUseFriendshipStatusResult then nil else UseMemoResult,
		onClientActionSuccess = UseResult,
		contextualInfoSource = UseFriendRequestContextInfoSourceModuleResult,
		showToast = p1.showToast,
		presence = UsePresenceResult,
		shouldShowNewIndicator = p1.shouldShowNewIndicator == true and Request.isUnseen == true
	}) else nil
end)