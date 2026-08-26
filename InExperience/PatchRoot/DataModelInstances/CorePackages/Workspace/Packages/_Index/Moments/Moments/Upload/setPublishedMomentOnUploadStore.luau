local refreshOwnMomentsAfterPublishModule = require(script.Parent.refreshOwnMomentsAfterPublish)

return function(value, p1, p2)
	-- upvalues: refreshOwnMomentsAfterPublishModule (ref)
	local var1 = refreshOwnMomentsAfterPublishModule(value, p2)
	
	if var1 == nil then
		p1.setSuccess(value)
		
		return
	end
	p1.setSuccess(var1)
end