local reactModule = require(script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent.React)
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	Provider = var1.Provider,
	useEditProfileImageActions = function() --[[ line: 19 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if var2 == nil then
			error("useEditProfileImageActions must be used within an EditProfileImageActions Provider")
		end
		return var2
	end
}