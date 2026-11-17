local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local _ = require(Parent.FloatingWindow)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local SignalsReactModule = require(Parent.SignalsReact)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local GetLocalUserIdModule = require(FriendsCalling.Utils.getLocalUserId)
local CallPipContainerModule = require(script.Parent.CallPipContainer)
local ColorMode = FoundationModule.Enums.ColorMode
local FoundationProvider = FoundationModule.FoundationProvider
local FriendsCallingPhase = Enum.FriendsCallingPhase
local UseSelectedThemeFunction = RoactUtilsModule.Hooks.useSelectedTheme
local UseSignalStateFunction = SignalsReactModule.useSignalState

local function _(p1): boolean
	-- upvalues: FriendsCallingPhase (copy), GetLocalUserIdModule (copy)
	local InitiatorUserId = p1.initiatorUserId
	
	return p1.phase == FriendsCallingPhase.Ringing and (InitiatorUserId ~= 0 and InitiatorUserId ~= GetLocalUserIdModule())
end

return function(p1)
	-- upvalues: UseSignalStateFunction (copy), GetFriendsCallingStoreModule (copy), UseSelectedThemeFunction (copy), ColorMode (copy), ReactModule (copy), FoundationProvider (copy), FriendsCallingPhase (copy), GetLocalUserIdModule (copy), CallPipContainerModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetFriendsCallingStoreModule(false).getCall)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local CreateElementFunction = ReactModule.createElement
	local config = {
		colorMode = if p1.host.followsAppColorMode and UseSelectedThemeResult == "light" then ColorMode.Light else ColorMode.Dark
	}
	local v1 = nil
	repeat
		if UseSignalStateResult ~= nil then
			local InitiatorUserId = UseSignalStateResult.initiatorUserId
			
			if UseSignalStateResult.phase ~= FriendsCallingPhase.Ringing or (InitiatorUserId == 0 or InitiatorUserId == GetLocalUserIdModule()) then
				v1 = {
					[UseSignalStateResult.callId] = ReactModule.createElement(CallPipContainerModule, { call = UseSignalStateResult, host = p1.host })
				}
				break
			end
		end
		v1 = nil
	until true
	return CreateElementFunction(FoundationProvider, config, v1)
end