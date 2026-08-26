local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p1)
	-- upvalues: reactModule (ref)
	if p1 and p1.windowSize then
		local windowSize = p1.windowSize
		local var1, var2 = reactModule.useState(windowSize:get())
		reactModule.useEffect(function()
			-- upvalues: windowSize (ref), var2 (ref), var1 (ref)
			local var3 = windowSize:connect(function()
				-- upvalues: var2 (copy), windowSize (copy)
				var2(windowSize:get())
			end)
			
			if var1 ~= windowSize:get() then
				var2(windowSize:get())
			end
			return function()
				-- upvalues: var3 (ref)
				var3:disconnect()
			end
		end, { p1.id })
		
		return var1
	end
	warn("windowSize object not found")
	
	return UDim2.new()
end