local CorePackages = game:GetService("CorePackages")
local Immutable = require(CorePackages.Workspace.Packages.AppCommonLib).Immutable
local UpdateUsersFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.UpdateUsers

return function(p1)
	-- upvalues: Immutable (copy), UpdateUsersFunction (copy)
	return function(p2)
		-- upvalues: p1 (copy), Immutable (upval), UpdateUsersFunction (upval)
		local User = p2:getState().Users[p1]
		
		if User then
			p2:dispatch(UpdateUsersFunction({ (Immutable.Set(User, "isFriend", false)) }))
		end
	end
end