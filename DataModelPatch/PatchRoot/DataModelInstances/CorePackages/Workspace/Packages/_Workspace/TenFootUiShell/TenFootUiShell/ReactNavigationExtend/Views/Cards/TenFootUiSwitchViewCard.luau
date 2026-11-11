local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local ReactNavigationExtend = TenFootUiShell.ReactNavigationExtend
local UseTabAnimationModule = require(ReactNavigationExtend.Hooks.useTabAnimation)
local TenFootUiBaseViewCardModule = require(ReactNavigationExtend.Views.Cards.TenFootUiBaseViewCard)
local _ = require(Parent.TenFootUiCommon)
local _ = require(Parent.Navigation)

return function(p1)
	-- upvalues: UseTabAnimationModule (copy), ReactModule (copy), TenFootUiBaseViewCardModule (copy)
	local UseTabAnimationModuleResult = UseTabAnimationModule({
		isActiveTab = p1.isActiveTab,
		currentTabIndex = p1.currentTabIndex,
		previousTabIndex = p1.previousTabIndex
	})
	
	return ReactModule.createElement(TenFootUiBaseViewCardModule, {
		descriptor = p1.descriptor,
		screenProps = p1.screenProps,
		navigation = p1.navigation,
		isActiveCard = p1.isActiveTab,
		isVisible = UseTabAnimationModuleResult.isVisible,
		adorneeCFrame = UseTabAnimationModuleResult.cFrame,
		groupTransparency = UseTabAnimationModuleResult.transparency
	})
end