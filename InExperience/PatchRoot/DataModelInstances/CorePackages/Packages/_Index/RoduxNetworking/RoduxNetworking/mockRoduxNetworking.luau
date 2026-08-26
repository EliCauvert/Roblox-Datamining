local makeActionCreatorModule = require(script.Parent.makeActionCreator)

local function makeMockRequestObject(p1)
	-- upvalues: makeActionCreatorModule (ref)
	local var1 = makeActionCreatorModule(p1)
	
	local var2 = function() end
	
	function var2.API()
		-- upvalues: var1 (ref)
		return var1.Succeeded()
	end
	
	var1.Mock = { reply = var2, clear = var2, replyWithError = var2 }
	
	return var1
end

return function()
	-- upvalues: makeMockRequestObject (ref)
	return {
		GET = makeMockRequestObject,
		POST = makeMockRequestObject,
		PATCH = makeMockRequestObject,
		DELETE = makeMockRequestObject
	}
end