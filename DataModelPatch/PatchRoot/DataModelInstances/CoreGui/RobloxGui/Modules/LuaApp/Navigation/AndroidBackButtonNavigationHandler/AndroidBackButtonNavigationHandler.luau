local AndroidBackButtonConnectionModule = require(script:FindFirstAncestor("Modules").LuaApp.Navigation.AndroidBackButtonConnection)
local AndroidBackButtonNavigationHandler = require(game:GetService("CorePackages").Packages.Roact).PureComponent:extend("AndroidBackButtonNavigationHandler")
AndroidBackButtonNavigationHandler.defaultProps = {
	androidBackButtonConnection = function()
		-- upvalues: AndroidBackButtonConnectionModule (copy)
		return AndroidBackButtonConnectionModule()
	end
}

function AndroidBackButtonNavigationHandler.init(p1)
	p1.androidBackButtonConnection = p1.props.androidBackButtonConnection()
	
	function p1.onBackButtonPressed()
		-- upvalues: p1 (copy)
		if p1.props.disabled then return end
		if p1.props.canGoBackInRN and p1.props.navigateBackInRN then
			p1.props.navigateBackInRN()
			
			return
		end
		if p1.props.canGoBackInAppRoute then
			p1.props.navigateBackInAppRoute()
			
			return
		else
			p1.androidBackButtonConnection.showExitDialog()
		end
	end
end

function AndroidBackButtonNavigationHandler.didMount(p1)
	p1.androidBackButtonConnection.connect(p1.onBackButtonPressed)
end

function AndroidBackButtonNavigationHandler.didUpdate(p1, p2)
	if not p2.isVisible and p1.props.isVisible then
		p1.androidBackButtonConnection.connect(p1.onBackButtonPressed)
		
		return
	end
	if p2.isVisible and not p1.props.isVisible then
		p1.androidBackButtonConnection.disconnect()
	end
end

function AndroidBackButtonNavigationHandler.willUnmount(p1)
	p1.androidBackButtonConnection.disconnect()
end

function AndroidBackButtonNavigationHandler:render()
	return nil
end

return AndroidBackButtonNavigationHandler