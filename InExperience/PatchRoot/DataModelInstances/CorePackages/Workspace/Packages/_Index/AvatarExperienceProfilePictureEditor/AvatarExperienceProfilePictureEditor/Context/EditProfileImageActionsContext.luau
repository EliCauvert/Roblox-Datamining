local ReactModule = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.React)
local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	Provider = Context.Provider,
	useEditProfileImageActions = function() --[[ Line: 19 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult == nil then
			error("useEditProfileImageActions must be used within an EditProfileImageActions Provider")
		end
		return UseContextResult
	end
}