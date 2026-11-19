local ReactModule = require(script:FindFirstAncestor("FriendsCalling").Parent.React)
local Context = ReactModule.createContext({ tryMuteExperienceVoice = function() end })

return {
	Context = Context,
	useFriendsCallingExternal = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}