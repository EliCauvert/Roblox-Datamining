local CorePackages = game:GetService("CorePackages")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local WidgetInfoContextModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Context.WidgetInfoContext)

return function(p1)
	-- upvalues: ReactModule (copy), WidgetInfoContextModule (copy), DashModule (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), WidgetInfoContextModule (upval), p1 (copy), DashModule (upval)
		return ReactModule.createElement(WidgetInfoContextModule.Consumer, {
			render = function(WidgetInfo)
				-- upvalues: ReactModule (upval), p1 (upval), DashModule (upval), p2 (copy)
				return ReactModule.createElement(p1, DashModule.join(p2, { widgetInfo = WidgetInfo }))
			end
		})
	end
end