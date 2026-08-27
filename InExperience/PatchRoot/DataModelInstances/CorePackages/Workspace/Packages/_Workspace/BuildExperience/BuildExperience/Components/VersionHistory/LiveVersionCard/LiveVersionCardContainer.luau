local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local liveVersionCardViewModule = require(script.Parent.LiveVersionCardView)
local useLiveVersionCardViewModelModule = require(script.Parent.useLiveVersionCardViewModel)

return function(p1)
	-- upvalues: useLiveVersionCardViewModelModule (ref), reactModule (ref), liveVersionCardViewModule (ref)
	local var1 = useLiveVersionCardViewModelModule(p1)
	
	return if var1 then reactModule.createElement(liveVersionCardViewModule, var1) else nil
end