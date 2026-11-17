local TrustedFriendCandidates = script:FindFirstAncestor("TrustedFriendCandidates")
local Parent = TrustedFriendCandidates.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)
local ProfileInsightsStore = require(Parent.DataHydration.ProfileInsights).ProfileInsightsStore
local UserListModule = require(Parent.UserList)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local ContextualInfoTypes = require(Parent.SocialCommon).Enums.ContextualInfoTypes
local EventNamesModule = require(TrustedFriendCandidates.Analytics.EventNames)
local FireAnalyticsEventModule = require(TrustedFriendCandidates.Analytics.fireAnalyticsEvent)
local _ = require(TrustedFriendCandidates.Analytics.useFireRowSeenEvent)
local GetCandidateContextTextModule = require(script.Parent.getCandidateContextText)
local ReadCandidateProfileInsightModule = require(script.Parent.readCandidateProfileInsight)
local FFlagFriendsLandingRefreshKeepsFilter = require(Parent.SharedFlags).FFlagFriendsLandingRefreshKeepsFilter
local DataStatus = DataHydrationModule.DataStatus
local TrustedConnectionStatus = DataHydrationModule.TrustedConnections.TrustedConnectionsEnums.TrustedConnectionStatus
local TrustedConnectionsStore = DataHydrationModule.TrustedConnections.TrustedConnectionsStore
local ButtonTypes = UserListModule.Enums.ButtonTypes
local config = { contextualInfo = true }

local function noop() end

return function(p1)
	-- upvalues: ReactModule (copy), FFlagFriendsLandingRefreshKeepsFilter (copy), ReadCandidateProfileInsightModule (copy), ProfileInsightsStore (copy), SignalsReactModule (copy), TrustedConnectionsStore (copy), UseGetPresenceByUserIdFunction (copy), UseLocalizationFunction (copy), GetCandidateContextTextModule (copy), ContextualInfoTypes (copy), DataStatus (copy), TrustedConnectionStatus (copy), ButtonTypes (copy), FireAnalyticsEventModule (copy), EventNamesModule (copy), noop (copy), config (copy)
	local Id = p1.entity.id
	local OnAddPressFunction = p1.onAddPress
	local OnAcceptPressFunction = p1.onAcceptPress
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagFriendsLandingRefreshKeepsFilter (upval), ReadCandidateProfileInsightModule (upval), Id (copy), ProfileInsightsStore (upval)
		return if FFlagFriendsLandingRefreshKeepsFilter then ReadCandidateProfileInsightModule(Id) else ProfileInsightsStore.get().GetProfileInsight(Id, { rankingStrategy = "tf_candidates" })
	end, { Id })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	local Status = TrustedConnectionsStore.get().getStatus(Id)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(Status.data)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(Status.status)
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(Id)
	local UseLocalizationResult = UseLocalizationFunction({
		singularMutualConnection = "Feature.Friends.Label.MutualFriendTitle",
		fromQrCode = "Feature.Friends.Description.FromQrCode",
		fromContacts = "Feature.Friends.Description.FromContacts",
		fromSearch = "Feature.PlayerSearchResults.Label.FromSearch",
		mutualConnections = {
			"Feature.Friends.Label.MutualFriendsTitle",
			numConnections = if UseSignalStateResult and UseSignalStateResult.mutualFriends then #UseSignalStateResult.mutualFriends else 0
		}
	})
	local SingularMutualConnection = UseLocalizationResult.singularMutualConnection
	local MutualConnections = UseLocalizationResult.mutualConnections
	local FromQrCode = UseLocalizationResult.fromQrCode
	local FromContacts = UseLocalizationResult.fromContacts
	local FromSearch = UseLocalizationResult.fromSearch
	local UseMemoResult1, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: GetCandidateContextTextModule (upval), UseSignalStateResult (copy), SingularMutualConnection (copy), MutualConnections (copy), FromQrCode (copy), FromContacts (copy), FromSearch (copy)
		return GetCandidateContextTextModule(UseSignalStateResult, {
			singularMutualConnection = SingularMutualConnection,
			mutualConnections = MutualConnections,
			fromQrCode = FromQrCode,
			fromContacts = FromContacts,
			fromSearch = FromSearch
		})
	end, {
		UseSignalStateResult, SingularMutualConnection, MutualConnections, FromQrCode,
		FromContacts, FromSearch
	})
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult1 (copy)
		return if UseMemoResult1 then { text = UseMemoResult1 } else nil
	end, { UseMemoResult1 })
	local AbsolutePosition = p1.absolutePosition
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: Id (copy), AbsolutePosition (copy), UseMemoResult2 (copy), ContextualInfoTypes (upval), UseSignalStateResult (copy), UseSignalStateResult2 (copy)
		return {
			targetUserId = Id,
			absolutePosition = AbsolutePosition,
			contextType = UseMemoResult2,
			friendRequestOriginSource = if UseMemoResult2 == ContextualInfoTypes.FriendRequestOrigin and UseSignalStateResult then UseSignalStateResult.friendRequestOriginSource else nil,
			candidateState = UseSignalStateResult2
		}
	end, {
		Id,
		AbsolutePosition,
		UseSignalStateResult,
		UseMemoResult2,
		UseSignalStateResult2
	})
	local IsNotUseSignalStateResultMatch: boolean = UseSignalStateResult1 ~= DataStatus.NotReady and UseSignalStateResult3 ~= DataStatus.NotReady
	local OnAnalyticsInfoFunction = p1.onAnalyticsInfo
	ReactModule.useEffect(function()
		-- upvalues: OnAnalyticsInfoFunction (copy), UseMemoResult3 (copy), IsNotUseSignalStateResultMatch (copy)
		OnAnalyticsInfoFunction(UseMemoResult3, IsNotUseSignalStateResultMatch)
	end, {
		OnAnalyticsInfoFunction,
		UseMemoResult3,
		IsNotUseSignalStateResultMatch
	})
	
	return {
		primaryCta = ReactModule.useMemo(function()
			-- upvalues: UseSignalStateResult2 (copy), TrustedConnectionStatus (upval), ButtonTypes (upval), FireAnalyticsEventModule (upval), EventNamesModule (upval), UseMemoResult3 (copy), OnAcceptPressFunction (copy), Id (copy), noop (upval), OnAddPressFunction (copy), TrustedConnectionsStore (upval)
			return if UseSignalStateResult2 == TrustedConnectionStatus.RequestReceived then {
				type = ButtonTypes.Accept,
				onActivated = function()
					-- upvalues: FireAnalyticsEventModule (upval), EventNamesModule (upval), UseMemoResult3 (upval), OnAcceptPressFunction (upval), Id (upval)
					FireAnalyticsEventModule(EventNamesModule.AcceptClicked, UseMemoResult3)
					OnAcceptPressFunction(Id)
				end
			} elseif UseSignalStateResult2 == TrustedConnectionStatus.RequestSent then {
				isDisabled = true,
				type = ButtonTypes.Pending,
				onActivated = noop
			} elseif UseSignalStateResult2 == nil then {
				isDisabled = true,
				isLoading = true,
				type = ButtonTypes.Add,
				onActivated = noop
			} else {
				type = ButtonTypes.Add,
				onActivated = function()
					-- upvalues: FireAnalyticsEventModule (upval), EventNamesModule (upval), UseMemoResult3 (upval), OnAddPressFunction (upval), Id (upval), TrustedConnectionsStore (upval)
					FireAnalyticsEventModule(EventNamesModule.AddClicked, UseMemoResult3)
					OnAddPressFunction(Id, function()
						-- upvalues: TrustedConnectionsStore (upval), Id (upval)
						TrustedConnectionsStore.get().refetchStatus(Id)
					end)
				end
			}
		end, {
			Id,
			UseSignalStateResult2,
			OnAddPressFunction,
			OnAcceptPressFunction,
			UseMemoResult3
		}),
		contextualInfo = UseMemoResult11,
		loadingState = if UseSignalStateResult1 == DataStatus.NotReady then config else nil,
		presence = if UseGetPresenceByUserIdResult then UseGetPresenceByUserIdResult.userPresenceType else nil
	}
end