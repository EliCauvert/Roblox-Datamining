local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

local function _(p0) --[[ line: 38 | named "isCaptureEligible" ]]
	return p0.CaptureType == Enum.CaptureType.Video and p0.TimeLength ~= nil and p0.TimeLength < 1
end

return function(p1, p2) --[[ line: 53 | named "createGalleryCaptureSource" ]]
	-- upvalues: signalsModule (ref)
	p1 = p1 or game:GetService("CaptureService")
	local var2, var3 = signalsModule.createSignal({})
	local var4, var5 = signalsModule.createSignal(false)
	local var6 = nil
	
	local function appendCurrentPage() --[[ line: 67 ]]
		-- upvalues: var2 (ref), var6 (write), var3 (ref), var5 (ref)
		local cloned = table.clone(var2(false))
		
		for i, v in var6:GetCurrentPage() do
			local var10
			if v.CaptureType == Enum.CaptureType.Video and v.TimeLength ~= nil then
				var10 = v.TimeLength >= 1
			end
			if var10 then
				table.insert(cloned, v)
			end
		end
		var3(cloned)
		var5(var6.IsFinished == true)
	end
	
	local function _() --[[ line: 78 | named "fetchInitial" ]]
		-- upvalues: p1 (ref), var6 (write), var5 (ref), p2 (ref), appendCurrentPage (ref), var2 (ref)
		task.spawn(function() --[[ line: 79 ]]
			-- upvalues: p1 (copy), var6 (copy), var5 (copy), p2 (copy), appendCurrentPage (copy), var2 (copy)
			local ok, status = pcall(function() --[[ line: 80 ]]
				-- upvalues: p1 (copy), var6 (copy)
				local var11, var12 = p1:ReadCapturesFromGalleryAsync({}, true)
				var6 = var12
				
				return var11
			end)
			
			if ok and var6 ~= nil and status == Enum.ReadCapturesFromGalleryResult.Success then
				appendCurrentPage()
				
				if p2 ~= nil then
					p2(var2(false), true)
				end
				return
			else
				var6 = nil
				var5(true)
				
				if p2 ~= nil then
					p2({}, false)
				end
			end
		end)
	end
	
	local function fetchMore() --[[ line: 101 ]]
		-- upvalues: var6 (write), appendCurrentPage (ref)
		if var6 == nil or var6.IsFinished == true then
			return
		end
		task.spawn(function() --[[ line: 105 ]]
			-- upvalues: var6 (copy), appendCurrentPage (copy)
			if pcall(function() --[[ line: 106 ]]
				-- upvalues: var6 (copy)
				var6:AdvanceToNextPageAsync()
			end) then
				appendCurrentPage()
				
				return
			end
		end)
	end
	
	task.spawn(function() --[[ line: 79 ]]
		-- upvalues: p1 (ref), var6 (write), var5 (ref), p2 (ref), appendCurrentPage (ref), var2 (ref)
		local ok, status = pcall(function() --[[ line: 80 ]]
			-- upvalues: p1 (copy), var6 (copy)
			local var11, var12 = p1:ReadCapturesFromGalleryAsync({}, true)
			
			return var11
		end)
		
		if ok and var6 ~= nil and status == Enum.ReadCapturesFromGalleryResult.Success then
			appendCurrentPage()
			
			if p2 ~= nil then
				p2(var2(false), true)
			end
			return
		else
			var6 = nil
			var5(true)
			
			if p2 ~= nil then
				p2({}, false)
			end
		end
	end)
	
	return {
		getCaptures = var2,
		getIsFinished = var4,
		fetchMore = fetchMore
	}
end