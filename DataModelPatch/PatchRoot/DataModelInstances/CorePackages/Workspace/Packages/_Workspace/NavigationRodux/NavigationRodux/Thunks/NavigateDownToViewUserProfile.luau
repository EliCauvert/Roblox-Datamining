local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local NavigateDownModule = require(NavigationRodux.Thunks.NavigateDown)
local AppPage = require(Parent.RobloxAppEnums).AppPage

return function(Detail, OnClose)
	-- upvalues: ArgCheckModule (copy), NavigateDownModule (copy), AppPage (copy)
	ArgCheckModule.isInTypes(Detail, { "string", "number" }, "userId")
	ArgCheckModule.isTypeOrNil(OnClose, "function", "onClose")
	
	return NavigateDownModule({
		name = AppPage.ViewUserProfile,
		detail = Detail,
		extraProps = { onClose = OnClose }
	})
end