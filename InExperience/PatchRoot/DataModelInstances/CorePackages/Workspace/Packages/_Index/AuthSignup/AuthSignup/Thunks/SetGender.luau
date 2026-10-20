local AuthSignup = script:FindFirstAncestor("AuthSignup")
local PostSetGenderModule = require(AuthSignup.Requests.PostSetGender)
local PromiseModule = require(AuthSignup.Parent.Promise)

return {
	setGender = function(p1, p2)
		-- upvalues: PostSetGenderModule (copy), PromiseModule (copy)
		return PostSetGenderModule(p1, p2):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return if Result == nil or Result.responseBody == nil then PromiseModule.reject() else PromiseModule.resolve()
		end):catch(function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject()
		end)
	end
}