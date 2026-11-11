local CorePackages = game:GetService("CorePackages")
local Birthday = require(CorePackages.Workspace.Packages.AuthCommon).Models.Birthday

return require(CorePackages.Packages.Rodux).createReducer(Birthday.new(), {
	[require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpBirthday).name] = function(_, p1)
		-- upvalues: Birthday (copy)
		assert(Birthday.is(p1.birthday), "SignUpBirthday must be a Birthday model")
		
		return p1.birthday
	end
})