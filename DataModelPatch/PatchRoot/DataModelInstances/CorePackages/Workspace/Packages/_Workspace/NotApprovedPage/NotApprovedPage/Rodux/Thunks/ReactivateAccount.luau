local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local PostReactivateAccountModule = require(NotApprovedPage.Http.PostReactivateAccount)
local Parent = NotApprovedPage.Parent
local PromiseModule = require(Parent.Promise)
local NotificationType = require(Parent.RobloxAppEnums).NotificationType
local SetModerationStatusFunction = require(Parent.NotApprovedPageShared).SetModerationStatus
local GuiService = game:GetService("GuiService")

return function(p1, p2)
	-- upvalues: PostReactivateAccountModule (copy), SetModerationStatusFunction (copy), GuiService (copy), NotificationType (copy), PromiseModule (copy)
	return function(p3)
		-- upvalues: PostReactivateAccountModule (upval), p1 (copy), p2 (copy), SetModerationStatusFunction (upval), GuiService (upval), NotificationType (upval), PromiseModule (upval)
		return PostReactivateAccountModule(p1, p2):andThen(function(_)
			-- upvalues: p3 (copy), SetModerationStatusFunction (upval), GuiService (upval), NotificationType (upval), PromiseModule (upval)
			p3:dispatch(SetModerationStatusFunction(false))
			GuiService:BroadcastNotification("", NotificationType.RESTART_LUA_APP)
			
			return PromiseModule.resolve()
		end, function(p4)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject({ error = p4 })
		end)
	end
end