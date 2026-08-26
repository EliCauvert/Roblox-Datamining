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

function t.useMutation(p1, p2)
	-- upvalues: useContext (ref), getApolloContext (ref), useState (ref), object (ref), useRef (ref), mutationData (ref), useEffect (ref)
	local var1 = useContext(getApolloContext())
	local var2, var3 = useState({ called = false, loading = false })
	local var4 = if p2 then object.assign({}, p2, { mutation = p1 }) else { mutation = p1 }
	local var5 = useRef(nil)
	local var6 = (function()
		-- upvalues: var5 (ref), mutationData (copy), var4 (ref), var1 (ref), var2 (ref), var3 (ref)
		if not var5.current then
			var5.current = mutationData.new({
				options = var4,
				context = var1,
				result = var2,
				setResult = function(_, p3)
					-- upvalues: var3 (copy)
					var3(p3)
					
					return nil
				end
			})
		end
		return var5.current
	end)()
	var6:setOptions(var4)
	var6.context = var1
	useEffect(function()
		-- upvalues: var6 (ref)
		return var6:afterExecute()
	end)
	
	return var6:execute(var2)
end

return t