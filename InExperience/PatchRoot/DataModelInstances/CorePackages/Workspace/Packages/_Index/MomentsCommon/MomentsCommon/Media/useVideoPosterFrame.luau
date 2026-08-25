local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local videoService = game:GetService("VideoService")
local full = Enum.VideoSampleSize.Full

return function(p0)
	-- upvalues: reactModule (ref), videoService (ref), full (ref)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p0 (ref), videoService (copy), full (copy)
		var3(nil)
		
		if p0 == nil then
			return
		end
		local var4 = false
		task.spawn(function()
			-- upvalues: videoService (copy), p0 (copy), full (copy), var4 (write), var3 (copy)
			local var5 = nil
			local ok, status = pcall(function()
				-- upvalues: var5 (write), videoService (copy), p0 (copy), full (copy)
				var5 = videoService:CreateVideoSamplerAsync(p0, { Size = full })
				
				return var5:GetSamplesAtTimesAsync({ 0 })
			end)
			
			if var5 ~= nil then
				pcall(function()
					-- upvalues: var5 (write)
					var5:Destroy()
				end)
			end
			if var4 then return end
			local var6 = if ok then status[1] else nil
			
			if var6 ~= nil and var6.Image ~= nil then
				var3(var6.Image)
			end
		end)
		
		return function()
			-- upvalues: var4 (write)
			var4 = true
		end
	end, { p0 })
	
	return var2
end