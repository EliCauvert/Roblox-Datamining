local CorePackages = game:GetService("CorePackages")
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LogoutUserOnUnauthorizedModule = require(Modules.LuaApp.Thunks.LogoutUserOnUnauthorized)
local UserModerationCheckModule = require(Modules.LuaApp.Thunks.Moderation.UserModerationCheck)
local _Instance = require(CorePackages.Workspace.Packages.HttpStore).Instance

function createAppHttpStoreWrapper(p1, p2, p3)
	-- upvalues: _Instance (copy), StatusCodes (copy), UserModerationCheckModule (copy), LogoutUserOnUnauthorizedModule (copy)
	return _Instance._create({
		[StatusCodes.UNAUTHORIZED] = function(p4)
			-- upvalues: p1 (copy), UserModerationCheckModule (upval), p2 (copy)
			p1:dispatch(UserModerationCheckModule(p2, p4))
		end,
		[StatusCodes.FORBIDDEN] = function(p4)
			-- upvalues: p1 (copy), LogoutUserOnUnauthorizedModule (upval), p2 (copy), p3 (copy)
			p1:dispatch(LogoutUserOnUnauthorizedModule(p2, p3, p4.config.Url))
		end
	})
end

return createAppHttpStoreWrapper