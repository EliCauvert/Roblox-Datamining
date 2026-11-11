local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, p1.height)
	})
end