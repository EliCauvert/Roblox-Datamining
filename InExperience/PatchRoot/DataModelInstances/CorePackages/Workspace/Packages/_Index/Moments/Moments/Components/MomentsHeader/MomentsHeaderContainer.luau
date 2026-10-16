local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local ImmersiveHeaderChromeModule = require(script.Parent.ImmersiveHeaderChrome)
local MomentsHeaderViewModule = require(script.Parent.MomentsHeaderView)
local UseMomentsHeaderViewModelModule = require(script.Parent.useMomentsHeaderViewModel)

return function(p1) --[[ Line: 13 | Named "MomentsHeaderContainer" ]]
	-- upvalues: UseMomentsHeaderViewModelModule (copy), ReactModule (copy), MomentsHeaderViewModule (copy), ImmersiveHeaderChromeModule (copy)
	local IsAnimateWithImmersiveChrome = p1.animateWithImmersiveChrome == true
	local Element = ReactModule.createElement(MomentsHeaderViewModule, (UseMomentsHeaderViewModelModule(p1, IsAnimateWithImmersiveChrome, p1.showHamburger ~= false)))
	
	return if IsAnimateWithImmersiveChrome then ReactModule.createElement(ImmersiveHeaderChromeModule, { layoutOrder = p1.layoutOrder, children = Element }) else Element
end