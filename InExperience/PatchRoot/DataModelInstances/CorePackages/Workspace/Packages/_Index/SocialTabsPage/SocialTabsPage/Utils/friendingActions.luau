local httpService = game:GetService("HttpService")
local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local profileCTAStore = require(parent.DataHydration).Profile.ProfileCTAStore
local friendingErrorCodesModule = require(socialTabsPage.Enums.FriendingErrorCodes)
local images = require(parent.UIBlox).App.ImageSet.Images
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local networkingFriendsModule = require(socialTabsPage.Networking.NetworkingFriends)
local friendAdd = images["icons/actions/friends/friendAdd"]
local _ = {
	BAD_REQUEST = 400,
	UNAUTHORIZED = 401,
	FORBIDDEN = 403,
	TOO_MANY_REQUESTS = 429
}

local function _(p0) --[[ line: 59 | named "refreshCTA" ]]
	-- upvalues: profileCTAStore (ref)
	profileCTAStore.get().getCTA(p0, true)
end

local function getErrorToastMessage(p1, p2, p3) --[[ line: 64 ]]
	-- upvalues: friendingErrorCodesModule (ref)
	return if p2 == 400 then ({
		[friendingErrorCodesModule.INVALID_TARGET_USER] = p1.invalidTargetUserError,
		[friendingErrorCodesModule.ALREADY_FRIEND] = p1.alreadyFriendError,
		[friendingErrorCodesModule.MAX_FRIENDS] = p1.maxFriendsError,
		[friendingErrorCodesModule.INVALID_NICKNAME] = p1.invalidNicknameError
	})[p3] elseif p2 == 401 then ({
		[friendingErrorCodesModule.UNAUTHORIZED] = p1.unauthorizedError
	})[p3] elseif p2 == 403 then ({
		[friendingErrorCodesModule.USER_BANNED] = p1.userBannedError,
		[friendingErrorCodesModule.USER_BLOCKED] = p1.userBlockedError,
		[friendingErrorCodesModule.USER_NOT_PASSED_CAPTCHA] = p1.userNotPassedCaptchaError
	})[p3] elseif p2 == 429 then ({
		[friendingErrorCodesModule.TOO_MANY_REQUESTS] = p1.tooManyRequestsError
	})[p3] else nil
end

local function showErrorToast(p4, p5, p6) --[[ line: 90 ]]
	-- upvalues: httpService (ref), getErrorToastMessage (ref), setCurrentToastMessage (ref)
	local defaultFriendingError = p5.defaultFriendingError
	
	if p6 ~= nil then
		local statusCode = p6.StatusCode
		local ok, status = pcall(function() --[[ line: 95 ]]
			-- upvalues: p6 (ref), httpService (copy)
			return if p6.Body then httpService:JSONDecode(p6.Body) else nil
		end)
		defaultFriendingError = getErrorToastMessage(p5, statusCode, if ok and status and (status.errors and status.errors[1]) and status.errors[1].code then status.errors[1].code else nil) or defaultFriendingError
	end
	p4(setCurrentToastMessage({ isLocalized = true, toastMessage = defaultFriendingError }))
end

return {
	executeAddFriend = function(p7) --[[ line: 114 ]]
		-- upvalues: networkingFriendsModule (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return p7.dispatch(networkingFriendsModule.RequestFriendshipFromUserId.API({
			currentUserId = p7.currentUserId,
			targetUserId = p7.targetUserId,
			friendshipOriginSourceType = p7.friendshipOriginSourceType
		})):andThen(function() --[[ line: 121 ]]
			-- upvalues: p7 (ref), profileCTAStore (copy), setCurrentToastMessage (copy), friendAdd (copy)
			profileCTAStore.get().getCTA(p7.targetUserId, true)
			p7.dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = p7.localized.friendRequestSent,
				toastIcon = friendAdd
			}))
		end):catch(function(p8) --[[ line: 129 ]]
			-- upvalues: showErrorToast (copy), p7 (ref)
			showErrorToast(p7.dispatch, p7.localized, p8)
		end)
	end,
	executeAcceptFriendRequest = function(p9) --[[ line: 134 ]]
		-- upvalues: networkingFriendsModule (ref), profileCTAStore (ref), setCurrentToastMessage (ref), friendAdd (ref), showErrorToast (ref)
		return p9.dispatch(networkingFriendsModule.AcceptFriendRequestFromUserId.API({
			currentUserId = p9.currentUserId,
			targetUserId = p9.targetUserId
		})):andThen(function() --[[ line: 140 ]]
			-- upvalues: p9 (ref), profileCTAStore (copy), setCurrentToastMessage (copy), friendAdd (copy)
			profileCTAStore.get().getCTA(p9.targetUserId, true)
			p9.dispatch(setCurrentToastMessage({
				isLocalized = true,
				toastMessage = p9.localized.friendAdded,
				toastIcon = friendAdd
			}))
		end):catch(function(p10) --[[ line: 148 ]]
			-- upvalues: showErrorToast (copy), p9 (ref)
			showErrorToast(p9.dispatch, p9.localized, p10)
		end)
	end
}