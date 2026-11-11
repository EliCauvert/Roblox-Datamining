local UtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils)

return function(Callback, p1, p2)
	-- upvalues: UtilsModule (copy)
	return function(p3)
		-- upvalues: UtilsModule (upval), Callback (copy), p1 (copy), p2 (copy)
		Callback(p1, p3:getState().AvatarExperience.AvatarEditor.Categories.category, p3:getState().AvatarExperience.AvatarEditor.Categories.subcategory, p2, UtilsModule.getUserId(p3:getState()), p3:getState().AvatarExperience.Common.Widgets.WidgetInfo.RequestId)
	end
end