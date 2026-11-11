local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FriendsStore = require(Parent.DataHydration).Friends.FriendsStore
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local Button = FoundationModule.Button
local Enums = FoundationModule.Enums
local Small = Enums.InputSize.Small
local RawValueResult = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType.PlayerSearch.rawValue()

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), SignalsReactModule (copy), FriendsStore (copy), ReactModule (copy), RawValueResult (copy), SetCurrentToastMessageFunction (copy), Button (copy), Enums (copy), Small (copy)
	local UserId = p1.userId
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(FriendsStore.get().GetFriendshipStatus(UserId or "").data)
	local IsUseSignalStateResultMatch: boolean = UseSignalStateResult == Enum.FriendStatus.FriendRequestSent or UseSignalStateResult == Enum.FriendStatus.FriendRequestReceived
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsUseSignalStateResultMatch (copy), UserId (copy), p1 (copy), RawValueResult (upval), FriendsStore (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval)
		if not IsUseSignalStateResultMatch and UserId ~= nil then
			FriendsStore.get().RequestFriendship(UserId, if typeof(p1.source) == "string" and p1.source ~= "" then p1.source else RawValueResult):andThen(function()
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
				UseDispatchResult(SetCurrentToastMessageFunction({
					toastMessage = "Feature.Friends.Action.FriendRequestSent",
					isLocalized = false
				}))
			end):catch(function(_)
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval)
				UseDispatchResult(SetCurrentToastMessageFunction({
					toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
					isLocalized = false
				}))
			end)
			
			return
		end
	end, {
		IsUseSignalStateResultMatch,
		UserId,
		p1.source,
		UseDispatchResult
	})
	
	return if UseSignalStateResult == nil or UseSignalStateResult == Enum.FriendStatus.Friend then nil else ReactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		Text = "",
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible == nil or p1.visible
	}, {
		Button = ReactModule.createElement(Button, {
			icon = "icons/common/plus",
			variant = if IsUseSignalStateResultMatch then Enums.ButtonVariant.SubEmphasis else Enums.ButtonVariant.OverMedia,
			isDisabled = IsUseSignalStateResultMatch,
			size = p1.size or Small,
			onActivated = if IsUseSignalStateResultMatch then nil else UseResult
		})
	})
end)