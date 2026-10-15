local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
local immersiveHeaderChromeModule = require(script.Parent.ImmersiveHeaderChrome)
local momentsHeaderViewModule = require(script.Parent.MomentsHeaderView)
local momentsLegacyHeaderViewModule = require(script.Parent.MomentsLegacyHeaderView)
local useMomentsHeaderViewModelModule = require(script.Parent.useMomentsHeaderViewModel)

return function(p1)
	-- upvalues: fFlagMomentsImmersiveChromeModule (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsHeaderViewModelModule (ref), reactModule (ref), momentsHeaderViewModule (ref), momentsLegacyHeaderViewModule (ref), immersiveHeaderChromeModule (ref)
	local var1
	local var2 = p1.animateWithImmersiveChrome == true and fFlagMomentsImmersiveChromeModule
	
	if fFlagMomentsUseFoundationHeaderBarModule then
		var1 = p1.showHamburger ~= false
		var1 = nil
	else
		var1 = true
	end
	local var3 = useMomentsHeaderViewModelModule(p1, var2, var1)
	local var4 = if fFlagMomentsUseFoundationHeaderBarModule then reactModule.createElement(momentsHeaderViewModule, var3) else reactModule.createElement(momentsLegacyHeaderViewModule, var3)
	
	return if var2 then reactModule.createElement(immersiveHeaderChromeModule, { layoutOrder = p1.layoutOrder, children = var4 }) else var4
end