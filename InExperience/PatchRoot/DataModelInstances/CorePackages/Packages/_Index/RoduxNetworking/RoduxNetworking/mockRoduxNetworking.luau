local MakeActionCreatorModule = require(script.Parent.makeActionCreator)

local function makeMockRequestObject(p1)
	-- upvalues: MakeActionCreatorModule (copy)
	local ActionCreatorModule = MakeActionCreatorModule(p1)
	
	local function Clear() end
	
	function ActionCreatorModule.API()
		-- upvalues: ActionCreatorModule (copy)
		return ActionCreatorModule.Succeeded()
	end
	
	ActionCreatorModule.Mock = { reply = Clear, clear = Clear, replyWithError = Clear }
	
	return ActionCreatorModule
end

return function()
	-- upvalues: makeMockRequestObject (copy)
	return {
		GET = makeMockRequestObject,
		POST = makeMockRequestObject,
		PATCH = makeMockRequestObject,
		DELETE = makeMockRequestObject
	}
end