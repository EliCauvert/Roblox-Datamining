local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Workspace.Packages.Chrome)

return function(p0) --[[ line: 7 ]]
	-- upvalues: reactModule (ref)
	if p0 and p0.windowSize then
		local windowSize = p0.windowSize
		local var2, var3 = reactModule.useState(windowSize:get())
		reactModule.useEffect(function() --[[ line: 13 ]]
			-- upvalues: windowSize (ref), var3 (ref), var2 (ref)
			local var4 = windowSize:connect(function() --[[ line: 14 ]]
				-- upvalues: var3 (copy), windowSize (copy)
				var3(windowSize:get())
			end)
			
			if var2 ~= windowSize:get() then
				var3(windowSize:get())
			end
			return function() --[[ line: 22 ]]
				-- upvalues: var4 (ref)
				var4:disconnect()
			end
		end, { p0.id })
		
		return var2
	end
	warn("windowSize object not found")
	
	return UDim2.new()
end