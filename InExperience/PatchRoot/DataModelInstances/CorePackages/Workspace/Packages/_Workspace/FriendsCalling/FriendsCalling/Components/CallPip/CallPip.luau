local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local _ = require(Parent.FloatingWindow)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagFriendsCallingCallEndedSnackbarModule = require(FriendsCalling.Flags.FFlagFriendsCallingCallEndedSnackbar)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local IsCallPipShownModule = require(FriendsCalling.Utils.isCallPipShown)
local CallEndedSnackbarContainerModule = require(FriendsCalling.Components.CallEndedSnackbar.CallEndedSnackbarContainer)
local CallPipContainerModule = require(script.Parent.CallPipContainer)
local ColorMode = FoundationModule.Enums.ColorMode
local FoundationProvider = FoundationModule.FoundationProvider
local UseSelectedThemeFunction = RoactUtilsModule.Hooks.useSelectedTheme
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), GetFriendsCallingStoreModule (copy), UseSelectedThemeFunction (copy), ColorMode (copy), FFlagFriendsCallingCallEndedSnackbarModule (copy), ReactModule (copy), FoundationProvider (copy), IsCallPipShownModule (copy), CallPipContainerModule (copy), CallEndedSnackbarContainerModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetFriendsCallingStoreModule(false).getCall)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local Light = if p1.host.followsAppColorMode and UseSelectedThemeResult == "light" then ColorMode.Light else ColorMode.Dark
	
	if not FFlagFriendsCallingCallEndedSnackbarModule then
		return ReactModule.createElement(FoundationProvider, { colorMode = Light }, if UseSignalStateResult == nil or not IsCallPipShownModule(UseSignalStateResult) then nil else {
			[UseSignalStateResult.callId] = ReactModule.createElement(CallPipContainerModule, { call = UseSignalStateResult, host = p1.host })
		})
	end
	local Elements = {}
	
	if UseSignalStateResult ~= nil and IsCallPipShownModule(UseSignalStateResult) then
		Elements[UseSignalStateResult.callId] = ReactModule.createElement(CallPipContainerModule, { call = UseSignalStateResult, host = p1.host })
	end
	Elements.CallEndedSnackbar = ReactModule.createElement(CallEndedSnackbarContainerModule, {
		call = UseSignalStateResult,
		displayOrder = p1.host.displayOrder
	})
	
	return ReactModule.createElement(FoundationProvider, { colorMode = Light }, Elements)
end