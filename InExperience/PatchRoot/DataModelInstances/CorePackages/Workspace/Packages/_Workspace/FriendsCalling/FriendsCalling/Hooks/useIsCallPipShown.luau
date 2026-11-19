local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagFriendsCallingCallPipModule = require(FriendsCalling.Flags.FFlagFriendsCallingCallPip)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local IsCallPipShownModule = require(FriendsCalling.Utils.isCallPipShown)
local UseSignalStateFunction = SignalsReactModule.useSignalState
local Signal = SignalsModule.createSignal(nil)

return function()
	-- upvalues: FFlagFriendsCallingCallPipModule (copy), GetFriendsCallingStoreModule (copy), Signal (copy), ReactModule (copy), SignalsModule (copy), IsCallPipShownModule (copy), UseSignalStateFunction (copy)
	local GetCall = if FFlagFriendsCallingCallPipModule then GetFriendsCallingStoreModule(false).getCall else Signal
	
	return (UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), IsCallPipShownModule (upval), GetCall (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: IsCallPipShownModule (upval), GetCall (upval)
			return IsCallPipShownModule(GetCall(p1))
		end)
	end, { GetCall }))))
end