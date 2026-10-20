local CorePackages = game:GetService("CorePackages")
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local OpenGameDetailsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.OpenGameDetails)
local SetTabBarVisibleFromChatFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Thunks.SetTabBarVisibleFromChat

return function(p1, ReferralSource)
	-- upvalues: OpenGameDetailsModule (copy), FormFactor (copy), SetTabBarVisibleFromChatFunction (copy)
	return function(p2)
		-- upvalues: OpenGameDetailsModule (upval), p1 (copy), FormFactor (upval), SetTabBarVisibleFromChatFunction (upval), ReferralSource (copy)
		p2:dispatch(OpenGameDetailsModule(p1, {
			onClose = function()
				-- upvalues: p2 (copy), FormFactor (upval), SetTabBarVisibleFromChatFunction (upval)
				if p2:getState().FormFactor == FormFactor.WIDE then
					p2:dispatch(SetTabBarVisibleFromChatFunction(true))
				end
			end,
			referralSource = ReferralSource
		}))
	end
end