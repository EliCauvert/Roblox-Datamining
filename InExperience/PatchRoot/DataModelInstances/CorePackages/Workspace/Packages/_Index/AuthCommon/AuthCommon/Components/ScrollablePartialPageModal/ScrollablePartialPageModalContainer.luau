local ReactModule = require(script:FindFirstAncestor("AuthCommon").Parent.React)
local ScrollablePartialPageModalViewModule = require(script.Parent.ScrollablePartialPageModalView)
local UseScrollablePartialPageModalViewModelModule = require(script.Parent.useScrollablePartialPageModalViewModel)

return function(p1)
	-- upvalues: UseScrollablePartialPageModalViewModelModule (copy), ReactModule (copy), ScrollablePartialPageModalViewModule (copy)
	return ReactModule.createElement(ScrollablePartialPageModalViewModule, (UseScrollablePartialPageModalViewModelModule(p1)))
end