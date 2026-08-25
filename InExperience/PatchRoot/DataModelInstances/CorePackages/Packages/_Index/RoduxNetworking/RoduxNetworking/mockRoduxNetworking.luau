local makeActionCreatorModule = require(script.Parent.makeActionCreator)

local function makeMockRequestObject(p0)
	-- upvalues: makeActionCreatorModule (ref)
	local var2 = makeActionCreatorModule(p0)
	
	local var3 = function() end
	
	function var2.API()
		-- upvalues: var2 (ref)
		return var2.Succeeded()
	end
	
	var2.Mock = { reply = var3, clear = var3, replyWithError = var3 }
	
	return var2
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