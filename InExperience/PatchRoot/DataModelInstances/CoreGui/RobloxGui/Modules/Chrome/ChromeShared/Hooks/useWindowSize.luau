local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: ReactModule (copy)
	if p1 and p1.windowSize then
		local WindowSize = p1.windowSize
		local UseStateResult, UseStateResult2 = ReactModule.useState(WindowSize:get())
		ReactModule.useEffect(function()
			-- upvalues: WindowSize (copy), UseStateResult2 (copy), UseStateResult (copy)
			local Connection = WindowSize:connect(function()
				-- upvalues: UseStateResult2 (upval), WindowSize (upval)
				UseStateResult2(WindowSize:get())
			end)
			
			if UseStateResult ~= WindowSize:get() then
				UseStateResult2(WindowSize:get())
			end
			return function()
				-- upvalues: Connection (copy)
				Connection:disconnect()
			end
		end, { p1.id })
		
		return UseStateResult
	else
		warn("windowSize object not found")
		
		return UDim2.new()
	end
end