local ModelViewport = script:FindFirstAncestor("ModelViewport")
local ReactModule = require(ModelViewport.Parent.React)
local _ = require(ModelViewport.Types)

return function()
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy)
		return {
			viewportFrame = UseRefResult,
			worldModel = UseRefResult1,
			camera = UseRefResult2,
			onSceneChanged = UseRefResult3
		}
	end, {
		UseRefResult,
		UseRefResult1,
		UseRefResult2,
		UseRefResult3
	})
end