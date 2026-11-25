local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local IsInThisServerModule = require(GameInvite.utils.isInThisServer)
local _ = require(script.Parent.joinFriendFromExperience)
local NavigateBack = FocusNavigationUtilsModule.FocusNavigationEventNameEnum.NavigateBack
local InGame = DataHydrationModule.Presence.PresenceEnums.PresenceType.InGame
local config = { skipFetch = true }

local function getJoinTarget(UserId, p1)
	-- upvalues: InGame (copy), IsInThisServerModule (copy)
	return if p1 == nil or p1.userPresenceType ~= InGame or p1.universeId == "" or IsInThisServerModule(p1, game.JobId) then nil else {
		userId = UserId,
		placeId = p1.placeId,
		rootPlaceId = p1.rootPlaceId,
		universeId = p1.universeId
	}
end

return function(p1)
	-- upvalues: UseGetPresenceByUserIdFunction (copy), config (copy), ReactModule (copy), getJoinTarget (copy), NavigateBack (copy), InputHandlersModule (copy)
	local UserId = p1.userId
	local OnJoinFunction = p1.onJoin
	local OnCloseFunction = p1.onClose
	local UseGetPresenceByUserIdResult = UseGetPresenceByUserIdFunction(UserId, config)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getJoinTarget (upval), UserId (copy), UseGetPresenceByUserIdResult (copy)
		return (getJoinTarget(UserId, UseGetPresenceByUserIdResult))
	end, { UserId, UseGetPresenceByUserIdResult })
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), OnJoinFunction (copy), OnCloseFunction (copy)
		if p2 and UseMemoResult ~= nil then
			if UseRefResult.current then
				return nil
			end
			UseRefResult.current = true
			OnJoinFunction(UseMemoResult)
		end
		OnCloseFunction()
		
		return nil
	end, { UseMemoResult, OnJoinFunction, OnCloseFunction })
	
	return {
		titleKey = "Notifications.ToastNotifications.Title.LeavingServer",
		bodyKey = "Notifications.ToastNotifications.Label.LeaveServerConfirmation",
		closeCallback = UseResult,
		focusEventHandlers = ReactModule.useMemo(function()
			-- upvalues: NavigateBack (upval), InputHandlersModule (upval), UseResult (copy)
			return {
				[NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: UseResult (upval)
						UseResult(false)
						p2:cancel()
					end)
				}
			}
		end, { UseResult })
	}
end