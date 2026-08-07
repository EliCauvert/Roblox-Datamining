local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local fFlagMomentsImmersiveChromeModule = require(moments.Flags.FFlagMomentsImmersiveChrome)
local fFlagMomentsUseCompositionLibraryModule = require(moments.Flags.FFlagMomentsUseCompositionLibrary)
local fFlagMomentsUseFoundationHeaderBarModule = require(moments.Flags.FFlagMomentsUseFoundationHeaderBar)
local immersiveHeaderChromeModule = require(script.Parent.ImmersiveHeaderChrome)
local momentsHeaderViewModule = require(script.Parent.MomentsHeaderView)
local momentsLegacyHeaderViewModule = require(script.Parent.MomentsLegacyHeaderView)
local useMomentsHeaderViewModelModule = require(script.Parent.useMomentsHeaderViewModel)

return function(p0) --[[ line: 18 | named "MomentsHeaderContainer" ]]
	-- upvalues: fFlagMomentsImmersiveChromeModule (ref), fFlagMomentsUseCompositionLibraryModule (ref), fFlagMomentsUseFoundationHeaderBarModule (ref), useMomentsHeaderViewModelModule (ref), reactModule (ref), momentsHeaderViewModule (ref), momentsLegacyHeaderViewModule (ref), immersiveHeaderChromeModule (ref)
	local var11
	local var9 = p0.animateWithImmersiveChrome == true and fFlagMomentsImmersiveChromeModule
	local fFlagMomentsUseFoundationHeaderBarModule_1 = fFlagMomentsUseCompositionLibraryModule and fFlagMomentsUseFoundationHeaderBarModule
	
	if fFlagMomentsUseFoundationHeaderBarModule_1 then
		var11 = p0.showHamburger ~= false
		var11 = nil
	else
		var11 = true
	end
	local var12 = useMomentsHeaderViewModelModule(p0, var9, var11)
	local var13 = if fFlagMomentsUseFoundationHeaderBarModule_1 then reactModule.createElement(momentsHeaderViewModule, var12) else reactModule.createElement(momentsLegacyHeaderViewModule, var12)
	
	return if var9 then reactModule.createElement(immersiveHeaderChromeModule, { layoutOrder = p0.layoutOrder, children = var13 }) else var13
end