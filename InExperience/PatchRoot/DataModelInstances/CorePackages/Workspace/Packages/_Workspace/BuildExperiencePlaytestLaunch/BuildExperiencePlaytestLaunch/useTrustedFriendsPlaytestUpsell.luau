local parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = navigationModule.useNavigation
local useLocalization = localizationModule.Hooks.useLocalization
local appPage = robloxAppEnumsModule.AppPage
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local dialogSize = foundationModule.Enums.DialogSize

return function(value)
	-- upvalues: useDispatch (ref), useNavigation (ref), useLocalization (ref), reactModule (ref), setCentralOverlay (ref), centralOverlayType (ref), dialogSize (ref), closeCentralOverlay (ref), appPage (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useLocalization({
		title = "Feature.Friends.TrustedFriend.Label.Title",
		body = "Feature.Build.Message.TrustedFriendsRequiredForPlaytest",
		addTrustedFriend = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		cancel = "Feature.Build.Action.Cancel",
		ok = "CommonUI.Controls.Action.OK"
	})
	local var4 = var2 ~= nil and value ~= nil
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref), setCentralOverlay (copy), centralOverlayType (copy), var3 (ref), var4 (ref), dialogSize (copy), closeCentralOverlay (copy), var2 (ref), appPage (copy), value (ref)
		var1(setCentralOverlay(centralOverlayType.ConfirmationDialog, {
			showCloseButton = false,
			orientButtonsVertically = true,
			title = var3.title,
			body = var3.body,
			confirmButtonText = var3.addTrustedFriend,
			cancelButtonText = if var4 then var3.cancel else var3.ok,
			hideConfirmButton = not var4,
			size = dialogSize.Small,
			onConfirm = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy), var4 (copy), var2 (copy), appPage (copy), value (copy)
				var1(closeCentralOverlay())
				
				if var4 then
					var2.push(appPage.TrustedContactsModal, { props = { userId = value } })
				end
			end,
			onCancel = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy)
				var1(closeCentralOverlay())
			end
		}))
	end, {
		var1, var2, value, var4, var3.title, var3.body, var3.addTrustedFriend,
		var3.cancel, var3.ok
	})
end