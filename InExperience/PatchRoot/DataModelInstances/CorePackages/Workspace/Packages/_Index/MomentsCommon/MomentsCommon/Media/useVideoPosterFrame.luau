local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local videoService = game:GetService("VideoService")
local full = Enum.VideoSampleSize.Full

return function(p1)
	-- upvalues: reactModule (ref), videoService (ref), full (ref)
	local var1, var2 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), videoService (copy), full (copy)
		var2(nil)
		
		if p1 == nil then
			return
		end
		local var3 = false
		task.spawn(function()
			-- upvalues: videoService (copy), p1 (copy), full (copy), var3 (write), var2 (copy)
			local var4 = nil
			local ok, status = pcall(function()
				-- upvalues: var4 (write), videoService (copy), p1 (copy), full (copy)
				var4 = videoService:CreateVideoSamplerAsync(p1, { Size = full })
				
				return var4:GetSamplesAtTimesAsync({ 0 })
			end)
			
			if var4 ~= nil then
				pcall(function()
					-- upvalues: var4 (write)
					var4:Destroy()
				end)
			end
			if var3 then return end
			local var5 = if ok then status[1] else nil
			
			if var5 ~= nil and var5.Image ~= nil then
				var2(var5.Image)
			end
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, { p1 })
	
	return var1
end