local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Object = require(Parent1.LuauPolyfill).Object
local _ = require(script.Parent.Parent.Parent.core)
local ReactModule = require(Parent1.React)
local UseContextFunction = ReactModule.useContext
local UseStateFunction = ReactModule.useState
local UseRefFunction = ReactModule.useRef
local UseEffectFunction = ReactModule.useEffect
local _ = require(Parent1.GraphQL)
local _ = require(Parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.types.types)
local MutationData = require(script.Parent.Parent.data).MutationData
local GetApolloContextFunction = require(script.Parent.Parent.context).getApolloContext

return {
	useMutation = function(Mutation, p1)
		-- upvalues: UseContextFunction (copy), GetApolloContextFunction (copy), UseStateFunction (copy), Object (copy), UseRefFunction (copy), MutationData (copy), UseEffectFunction (copy)
		local UseContextResult = UseContextFunction(GetApolloContextFunction())
		local UseStateResult, UseStateResult2 = UseStateFunction({ called = false, loading = false })
		local AssignResult = if p1 then Object.assign({}, p1, { mutation = Mutation }) else { mutation = Mutation }
		local UseRefResult = UseRefFunction(nil)
		local v1 = (function()
			-- upvalues: UseRefResult (copy), MutationData (upval), AssignResult (copy), UseContextResult (copy), UseStateResult (copy), UseStateResult2 (copy)
			if not UseRefResult.current then
				UseRefResult.current = MutationData.new({
					options = AssignResult,
					context = UseContextResult,
					result = UseStateResult,
					setResult = function(_, p2)
						-- upvalues: UseStateResult2 (upval)
						UseStateResult2(p2)
						
						return nil
					end
				})
			end
			return UseRefResult.current
		end)()
		v1:setOptions(AssignResult)
		v1.context = UseContextResult
		UseEffectFunction(function()
			-- upvalues: v1 (copy)
			return v1:afterExecute()
		end)
		
		return v1:execute(UseStateResult)
	end
}