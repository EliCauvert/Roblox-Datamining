local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local SampleMomentShareCardVideoFrameModule = require(script.Parent.sampleMomentShareCardVideoFrame)

return function(p1)
	-- upvalues: ReactModule (copy), SampleMomentShareCardVideoFrameModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		return nil
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), SampleMomentShareCardVideoFrameModule (upval)
		UseStateResult2(nil)
		
		if p1 == nil then return end
		local Flag = false
		task.spawn(function()
			-- upvalues: SampleMomentShareCardVideoFrameModule (upval), p1 (upval), Flag (ref), UseStateResult2 (upval)
			local SampleMomentShareCardVideoFrameModuleResult = SampleMomentShareCardVideoFrameModule(p1)
			
			if not Flag and SampleMomentShareCardVideoFrameModuleResult ~= nil then
				UseStateResult2(SampleMomentShareCardVideoFrameModuleResult)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1 })
	
	return UseStateResult
end