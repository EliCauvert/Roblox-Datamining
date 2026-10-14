local parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = navigationModule.useNavigation
local useLocalization = localizationModule.Hooks.useLocalization
local appPage = robloxAppEnumsModule.AppPage
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local dialogSize = foundationModule.Enums.DialogSize
local fFlagLuaAppPlaytestTrustedFriendsRefetchPlayability = sharedFlagsModule.FFlagLuaAppPlaytestTrustedFriendsRefetchPlayability

return function(value, p1)
	-- upvalues: useDispatch (ref), useNavigation (ref), useLocalization (ref), reactModule (ref), setCentralOverlay (ref), centralOverlayType (ref), dialogSize (ref), closeCentralOverlay (ref), appPage (ref), fFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useLocalization({
		title = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		body = "Feature.Build.Message.TrustedFriendsRequiredForPlaytest",
		add = "Feature.Friends.Action.Add",
		cancel = "Feature.Build.Action.Cancel",
		ok = "CommonUI.Controls.Action.OK"
	})
	local var4 = var2 ~= nil and value ~= nil
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref), setCentralOverlay (copy), centralOverlayType (copy), var3 (ref), var4 (ref), dialogSize (copy), closeCentralOverlay (copy), var2 (ref), appPage (copy), value (ref), fFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (copy), p1 (ref)
		var1(setCentralOverlay(centralOverlayType.ConfirmationDialog, {
			showCloseButton = false,
			orientButtonsVertically = true,
			title = var3.title,
			body = var3.body,
			confirmButtonText = var3.add,
			cancelButtonText = if var4 then var3.cancel else var3.ok,
			hideConfirmButton = not var4,
			size = dialogSize.Small,
			onConfirm = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy), var4 (copy), var2 (copy), appPage (copy), value (copy), fFlagLuaAppPlaytestTrustedFriendsRefetchPlayability (copy), p1 (copy)
				var1(closeCentralOverlay())
				
				if var4 then
					var2.push(appPage.TrustedContactsModal, {
						props = {
							userId = value,
							onRequestAccepted = if fFlagLuaAppPlaytestTrustedFriendsRefetchPlayability then p1 else nil
						}
					})
				end
			end,
			onCancel = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy)
				var1(closeCentralOverlay())
			end
		}))
	end, {
		var1, var2, value,
		if fFlagLuaAppPlaytestTrustedFriendsRefetchPlayability then p1 else nil, var4,
		var3.title, var3.body, var3.add, var3.cancel, var3.ok
	})
end