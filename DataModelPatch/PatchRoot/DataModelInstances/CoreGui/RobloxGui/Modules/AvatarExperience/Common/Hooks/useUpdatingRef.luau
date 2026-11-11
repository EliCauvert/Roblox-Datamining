local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(Current)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	
	return UseRefResult
end