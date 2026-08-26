local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local sampleMomentShareCardVideoFrameModule = require(script.Parent.sampleMomentShareCardVideoFrame)

return function(p1)
	-- upvalues: reactModule (ref), sampleMomentShareCardVideoFrameModule (ref)
	local var1, var2 = reactModule.useState(function()
		return nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), sampleMomentShareCardVideoFrameModule (copy)
		var2(nil)
		
		if p1 == nil then
			return
		end
		local var3 = false
		task.spawn(function()
			-- upvalues: sampleMomentShareCardVideoFrameModule (copy), p1 (copy), var3 (write), var2 (copy)
			local var4 = sampleMomentShareCardVideoFrameModule(p1)
			
			if not var3 and var4 ~= nil then
				var2(var4)
			end
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, { p1 })
	
	return var1
end