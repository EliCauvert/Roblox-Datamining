local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local NavigateDownModule = require(NavigationRodux.Thunks.NavigateDown)
local AppPage = require(Parent.RobloxAppEnums).AppPage

return function(OnClose) --[[ Line: 10 ]]
	-- upvalues: ArgCheckModule (copy), NavigateDownModule (copy), AppPage (copy)
	ArgCheckModule.isTypeOrNil(OnClose, "function", "onClose")
	
	return NavigateDownModule({
		name = AppPage.Notifications,
		extraProps = { onClose = OnClose }
	})
end