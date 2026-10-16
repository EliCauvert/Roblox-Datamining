local Parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = RobloxAppEnumsModule.AppPage
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local DialogSize = require(Parent.Foundation).Enums.DialogSize
local FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability = require(Parent.SharedFlags).FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability

return function(UserId, p1) --[[ Line: 27 | Named "useTrustedFriendsPlaytestUpsell" ]]
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), DialogSize (copy), CloseCentralOverlayFunction (copy), AppPage (copy), FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		body = "Feature.Build.Message.TrustedFriendsRequiredForPlaytest",
		add = "Feature.Friends.Action.Add",
		cancel = "Feature.Build.Action.Cancel",
		ok = "CommonUI.Controls.Action.OK"
	})
	local HasUserId: boolean = UseNavigationResult ~= nil and UserId ~= nil
	
	return (ReactModule.useCallback(function() --[[ Line: 42 ]]
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseLocalizationResult (copy), HasUserId (copy), DialogSize (upval), CloseCentralOverlayFunction (upval), UseNavigationResult (copy), AppPage (upval), UserId (copy), FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (upval), p1 (copy)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.ConfirmationDialog, {
			showCloseButton = false,
			orientButtonsVertically = true,
			title = UseLocalizationResult.title,
			body = UseLocalizationResult.body,
			confirmButtonText = UseLocalizationResult.add,
			cancelButtonText = if HasUserId then UseLocalizationResult.cancel else UseLocalizationResult.ok,
			hideConfirmButton = not HasUserId,
			size = DialogSize.Small,
			onConfirm = function() --[[ Line: 53 ]]
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), HasUserId (upval), UseNavigationResult (upval), AppPage (upval), UserId (upval), FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (upval), p1 (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
				
				if HasUserId then
					UseNavigationResult.push(AppPage.TrustedContactsModal, {
						props = {
							userId = UserId,
							onRequestAccepted = if FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability then p1 else nil
						}
					})
				end
			end,
			onCancel = function() --[[ Line: 66 ]]
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
		}))
	end, {
		UseDispatchResult, UseNavigationResult, UserId,
		if FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability then p1 else nil,
		HasUserId, UseLocalizationResult.title, UseLocalizationResult.body,
		UseLocalizationResult.add, UseLocalizationResult.cancel,
		UseLocalizationResult.ok
	}))
end