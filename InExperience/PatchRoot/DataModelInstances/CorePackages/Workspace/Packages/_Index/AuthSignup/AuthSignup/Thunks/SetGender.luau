local authSignup = script:FindFirstAncestor("AuthSignup")
local postSetGenderModule = require(authSignup.Requests.PostSetGender)
local promiseModule = require(authSignup.Parent.Promise)

return {
	setGender = function(value, p1)
		-- upvalues: postSetGenderModule (ref), promiseModule (ref)
		return postSetGenderModule(value, p1):andThen(function(p2)
			-- upvalues: promiseModule (copy)
			return if p2 == nil or p2.responseBody == nil then promiseModule.reject() else promiseModule.resolve()
		end):catch(function(_)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject()
		end)
	end
}