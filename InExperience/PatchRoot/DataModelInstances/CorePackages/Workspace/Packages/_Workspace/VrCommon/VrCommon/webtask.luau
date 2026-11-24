local v1 = script
local OpenWebTaskModule = require(v1.openWebTask)

return {
	Page = { AccountInfo = require(v1.WebTaskPage).AccountInfo },
	isAvailable = require(v1.isAvailable),
	openWebTask = function(p1, p2)
		-- upvalues: OpenWebTaskModule (copy)
		return OpenWebTaskModule(p1, p2)
	end
}