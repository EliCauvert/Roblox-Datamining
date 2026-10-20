local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local UseStackScreensFunction = NavigationModule.useStackScreens
local ViewState = NavigationModule.ViewState
local TenFootUiStackViewCardModule = require(TenFootUiShell.ReactNavigationExtend.Views.Cards.TenFootUiStackViewCard)
local _ = require(Parent.TenFootUiCommon)

return function(p1)
	-- upvalues: UseStackScreensFunction (copy), ReactModule (copy), TenFootUiStackViewCardModule (copy), ViewState (copy)
	local Navigation = p1.navigation
	local State = Navigation.state
	local Key = State.routes[State.index].key
	local Elements = {}
	
	for _, value in UseStackScreensFunction({ navigation = Navigation, descriptors = p1.descriptors }) do
		Elements[value.descriptor.key] = ReactModule.createElement(TenFootUiStackViewCardModule, {
			descriptor = value.descriptor,
			screenProps = p1.screenProps,
			navigation = Navigation,
			isTopOfStack = value.descriptor.key == Key,
			totalInStack = State.index,
			viewState = value.viewState,
			onAnimationComplete = function()
				-- upvalues: value (copy), ViewState (upval)
				if value.viewState == ViewState.Opening or value.viewState == ViewState.Opened then
					value.setOpened()
					
					return
				end
				if value.viewState == ViewState.Closing then
					value.setClosed()
				end
			end
		})
	end
	return Elements
end