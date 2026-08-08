local reactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local sampleMomentShareCardVideoFrameModule = require(script.Parent.sampleMomentShareCardVideoFrame)

return function(p0) --[[ line: 8 | named "useMomentShareCardVideoFrame" ]]
	-- upvalues: reactModule (ref), sampleMomentShareCardVideoFrameModule (ref)
	local var2, var3 = reactModule.useState(function() --[[ line: 9 ]]
		return nil
	end)
	reactModule.useEffect(function() --[[ line: 13 ]]
		-- upvalues: var3 (ref), p0 (ref), sampleMomentShareCardVideoFrameModule (copy)
		var3(nil)
		
		if p0 == nil then
			return
		end
		local var4 = false
		task.spawn(function() --[[ line: 20 ]]
			-- upvalues: sampleMomentShareCardVideoFrameModule (copy), p0 (copy), var4 (write), var3 (copy)
			local var5 = sampleMomentShareCardVideoFrameModule(p0)
			
			if not var4 and var5 ~= nil then
				var3(var5)
			end
		end)
		
		return function() --[[ line: 27 ]]
			-- upvalues: var4 (write)
			var4 = true
		end
	end, { p0 })
	
	return var2
end