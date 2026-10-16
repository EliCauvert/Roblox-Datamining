local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local SampleMomentShareCardVideoFrameModule = require(script.Parent.sampleMomentShareCardVideoFrame)

return function(p1) --[[ Line: 8 | Named "useMomentShareCardVideoFrame" ]]
	-- upvalues: ReactModule (copy), SampleMomentShareCardVideoFrameModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 9 ]]
		return nil
	end)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy), SampleMomentShareCardVideoFrameModule (upval)
		UseStateResult2(nil)
		
		if p1 == nil then return end
		local Flag = false
		task.spawn(function() --[[ Line: 20 ]]
			-- upvalues: SampleMomentShareCardVideoFrameModule (upval), p1 (upval), Flag (ref), UseStateResult2 (upval)
			local SampleMomentShareCardVideoFrameModuleResult = SampleMomentShareCardVideoFrameModule(p1)
			
			if not Flag and SampleMomentShareCardVideoFrameModuleResult ~= nil then
				UseStateResult2(SampleMomentShareCardVideoFrameModuleResult)
			end
		end)
		
		return function() --[[ Line: 27 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { p1 })
	
	return UseStateResult
end