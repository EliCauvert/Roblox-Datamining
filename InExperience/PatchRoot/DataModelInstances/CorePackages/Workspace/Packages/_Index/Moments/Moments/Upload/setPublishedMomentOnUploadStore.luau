local refreshOwnMomentsAfterPublishModule = require(script.Parent.refreshOwnMomentsAfterPublish)

return function(value, p0, p1)
	-- upvalues: refreshOwnMomentsAfterPublishModule (ref)
	local var1 = refreshOwnMomentsAfterPublishModule(value, p1)
	
	if var1 == nil then
		p0.setSuccess(value)
		
		return
	end
	p0.setSuccess(var1)
end