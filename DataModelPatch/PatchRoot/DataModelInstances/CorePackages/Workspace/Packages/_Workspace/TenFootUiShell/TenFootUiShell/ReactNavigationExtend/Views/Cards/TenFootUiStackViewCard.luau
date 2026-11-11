local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactNavigationExtend = TenFootUiShell.ReactNavigationExtend
local ReactModule = require(Parent.React)
local UseStackAnimationModule = require(ReactNavigationExtend.Hooks.useStackAnimation)
local TenFootUiBaseViewCardModule = require(ReactNavigationExtend.Views.Cards.TenFootUiBaseViewCard)
local _ = require(Parent.TenFootUiCommon)
local _ = require(Parent.Navigation)

return function(p1)
	-- upvalues: UseStackAnimationModule (copy), ReactModule (copy), TenFootUiBaseViewCardModule (copy)
	local UseStackAnimationModuleResult = UseStackAnimationModule({
		isTopOfStack = p1.isTopOfStack,
		totalInStack = p1.totalInStack,
		viewState = p1.viewState,
		onAnimationComplete = p1.onAnimationComplete
	})
	
	return ReactModule.createElement(TenFootUiBaseViewCardModule, {
		descriptor = p1.descriptor,
		screenProps = p1.screenProps,
		navigation = p1.navigation,
		isActiveCard = p1.isTopOfStack,
		isVisible = UseStackAnimationModuleResult.isVisible,
		adorneeCFrame = UseStackAnimationModuleResult.cFrame,
		groupTransparency = UseStackAnimationModuleResult.transparency
	})
end