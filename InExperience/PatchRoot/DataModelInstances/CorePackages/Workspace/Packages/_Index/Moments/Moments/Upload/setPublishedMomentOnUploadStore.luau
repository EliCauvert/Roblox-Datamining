local RefreshOwnMomentsAfterPublishModule = require(script.Parent.refreshOwnMomentsAfterPublish)

return function(p1, p2, p3)
	-- upvalues: RefreshOwnMomentsAfterPublishModule (copy)
	local RefreshOwnMomentsAfterPublishModuleResult = RefreshOwnMomentsAfterPublishModule(p1, p3)
	
	if RefreshOwnMomentsAfterPublishModuleResult == nil then
		p2.setSuccess(p1)
		
		return
	else
		p2.setSuccess(RefreshOwnMomentsAfterPublishModuleResult)
	end
end