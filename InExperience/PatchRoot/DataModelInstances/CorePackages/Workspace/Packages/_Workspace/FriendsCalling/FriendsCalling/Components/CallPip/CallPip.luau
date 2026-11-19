local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local _ = require(Parent.FloatingWindow)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local IsCallPipShownModule = require(FriendsCalling.Utils.isCallPipShown)
local CallPipContainerModule = require(script.Parent.CallPipContainer)
local ColorMode = FoundationModule.Enums.ColorMode
local FoundationProvider = FoundationModule.FoundationProvider
local UseSelectedThemeFunction = RoactUtilsModule.Hooks.useSelectedTheme
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), GetFriendsCallingStoreModule (copy), UseSelectedThemeFunction (copy), ColorMode (copy), ReactModule (copy), FoundationProvider (copy), IsCallPipShownModule (copy), CallPipContainerModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetFriendsCallingStoreModule(false).getCall)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	
	return ReactModule.createElement(FoundationProvider, {
		colorMode = if p1.host.followsAppColorMode and UseSelectedThemeResult == "light" then ColorMode.Light else ColorMode.Dark
	}, if UseSignalStateResult == nil or not IsCallPipShownModule(UseSignalStateResult) then nil else {
		[UseSignalStateResult.callId] = ReactModule.createElement(CallPipContainerModule, { call = UseSignalStateResult, host = p1.host })
	})
end