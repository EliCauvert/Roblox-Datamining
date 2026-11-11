local Parent = script.Parent.Parent.Parent.Parent
local UseRefFunction = require(Parent.Parent.React).useRef
local EqualModule = require(Parent.jsutils.equal)

return {
	useDeepMemo = function(Callback, Key)
		-- upvalues: UseRefFunction (copy), EqualModule (copy)
		local UseRefResult = UseRefFunction(nil)
		
		if not UseRefResult.current or not EqualModule(Key, UseRefResult.current.key) then
			UseRefResult.current = { key = Key, value = Callback() }
		end
		return UseRefResult.current.value
	end
}