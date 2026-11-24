local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagFriendsCallingCallPipModule = require(FriendsCalling.Flags.FFlagFriendsCallingCallPip)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local Signal = SignalsModule.createSignal(false)

return function()
	-- upvalues: FFlagFriendsCallingCallPipModule (copy), GetFriendsCallingStoreModule (copy), Signal (copy), UseSignalStateFunction (copy)
	return UseSignalStateFunction(if FFlagFriendsCallingCallPipModule then GetFriendsCallingStoreModule(false).getHasCall else Signal)
end