local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppGuiService = require(Parent.RoactServiceTags).AppGuiService
local NotificationType = require(Parent.RobloxAppEnums).NotificationType

local function AppReadyHandler(p1)
	-- upvalues: ReactModule (copy), NotificationType (copy), AppReadyHandler (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), NotificationType (upval)
		if p1.state.routeName ~= nil then
			p1.guiService:BroadcastNotification(p1.state.routeName, NotificationType.APP_READY)
		end
	end, { p1.state.routeName })
	
	return if p1.state.routes == nil then nil else ReactModule.createElement(AppReadyHandler, {
		state = p1.state.routes[p1.state.index],
		guiService = p1.guiService
	})
end

return function(_)
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppGuiService (copy), ReactModule (copy), AppReadyHandler (copy)
	return ReactModule.createElement(AppReadyHandler, {
		state = UseNavigationFunction().state,
		guiService = UseRoactServiceFunction(AppGuiService)
	})
end