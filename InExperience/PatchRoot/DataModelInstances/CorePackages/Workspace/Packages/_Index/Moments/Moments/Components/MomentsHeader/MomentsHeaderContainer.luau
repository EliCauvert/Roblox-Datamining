local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local immersiveHeaderChromeModule = require(script.Parent.ImmersiveHeaderChrome)
local momentsHeaderViewModule = require(script.Parent.MomentsHeaderView)
local useMomentsHeaderViewModelModule = require(script.Parent.useMomentsHeaderViewModel)

return function(p1)
	-- upvalues: fFlagMomentsImmersiveChromeModule (ref), useMomentsHeaderViewModelModule (ref), reactModule (ref), momentsHeaderViewModule (ref), immersiveHeaderChromeModule (ref)
	local var1 = p1.animateWithImmersiveChrome == true and fFlagMomentsImmersiveChromeModule
	local var2 = reactModule.createElement(momentsHeaderViewModule, useMomentsHeaderViewModelModule(p1, var1, p1.showHamburger ~= false))
	
	return if var1 then reactModule.createElement(immersiveHeaderChromeModule, { layoutOrder = p1.layoutOrder, children = var2 }) else var2
end