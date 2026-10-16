local MakeActionCreatorModule = require(script.Parent.makeActionCreator)

local function makeMockRequestObject(p1) --[[ Line: 3 ]]
	-- upvalues: MakeActionCreatorModule (copy)
	local ActionCreatorModule = MakeActionCreatorModule(p1)
	
	local function Clear() --[[ Line: 5 ]] end
	
	function ActionCreatorModule.API() --[[ Line: 6 ]]
		-- upvalues: ActionCreatorModule (copy)
		return ActionCreatorModule.Succeeded()
	end
	
	ActionCreatorModule.Mock = { reply = Clear, clear = Clear, replyWithError = Clear }
	
	return ActionCreatorModule
end

return function() --[[ Line: 19 ]]
	-- upvalues: makeMockRequestObject (copy)
	return {
		GET = makeMockRequestObject,
		POST = makeMockRequestObject,
		PATCH = makeMockRequestObject,
		DELETE = makeMockRequestObject
	}
end