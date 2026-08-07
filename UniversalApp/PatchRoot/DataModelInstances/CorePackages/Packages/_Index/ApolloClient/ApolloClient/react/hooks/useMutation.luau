local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local object = require(parent_1.LuauPolyfill).Object
local _ = require(script.Parent.Parent.Parent.core)
local reactModule = require(parent_1.React)
local useContext = reactModule.useContext
local useState = reactModule.useState
local useRef = reactModule.useRef
local useEffect = reactModule.useEffect
local _ = require(parent_1.GraphQL)
local _ = require(parent.jsutils.typedDocumentNode)
local _ = require(script.Parent.Parent.types.types)
local mutationData = require(script.Parent.Parent.data).MutationData
local getApolloContext = require(script.Parent.Parent.context).getApolloContext

function t.useMutation(p0, p1) --[[ line: 40 ]]
	-- upvalues: useContext (ref), getApolloContext (ref), useState (ref), object (ref), useRef (ref), mutationData (ref), useEffect (ref)
	local var2 = useContext(getApolloContext())
	local var3, var4 = useState({ called = false, loading = false })
	local var5 = if p1 then object.assign({}, p1, { mutation = p0 }) else { mutation = p0 }
	local var6 = useRef(nil)
	local var7 = (function() --[[ line: 52 | named "getMutationDataRef" ]]
		-- upvalues: var6 (ref), mutationData (copy), var5 (ref), var2 (ref), var3 (ref), var4 (ref)
		if not var6.current then
			var6.current = mutationData.new({
				options = var5,
				context = var2,
				result = var3,
				setResult = function(_, p2) --[[ line: 58 ]]
					-- upvalues: var4 (copy)
					var4(p2)
					
					return nil
				end
			})
		end
		return var6.current
	end)()
	var7:setOptions(var5)
	var7.context = var2
	useEffect(function() --[[ line: 72 ]]
		-- upvalues: var7 (ref)
		return var7:afterExecute()
	end)
	
	return var7:execute(var3)
end

return t