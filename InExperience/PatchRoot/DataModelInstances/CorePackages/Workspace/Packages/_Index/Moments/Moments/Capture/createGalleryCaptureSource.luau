local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local fFlagMyStatsMediaSelector = require(parent.SharedFlags).FFlagMyStatsMediaSelector

local function _(p0)
	return p0.CaptureType == Enum.CaptureType.Video and p0.TimeLength ~= nil and p0.TimeLength < 1
end

return function(p1, p2, p3)
	-- upvalues: signalsModule (ref), fFlagMyStatsMediaSelector (ref)
	p1 = p1 or game:GetService("CaptureService")
	p3 = p3 or {}
	local var3, var4 = signalsModule.createSignal({})
	local var5, var6 = signalsModule.createSignal(false)
	local var7 = nil
	
	local function appendCurrentPage()
		-- upvalues: var3 (ref), var7 (write), var4 (ref), var6 (ref)
		local cloned = table.clone(var3(false))
		
		for i, v in var7:GetCurrentPage() do
			local var11
			if v.CaptureType == Enum.CaptureType.Video and v.TimeLength ~= nil then
				var11 = v.TimeLength >= 1
			end
			if var11 then
				table.insert(cloned, v)
			end
		end
		var4(cloned)
		var6(var7.IsFinished == true)
	end
	
	local function _()
		-- upvalues: p1 (ref), fFlagMyStatsMediaSelector (copy), p3 (ref), var7 (write), var6 (ref), p2 (ref), appendCurrentPage (ref), var3 (ref)
		task.spawn(function()
			-- upvalues: p1 (copy), fFlagMyStatsMediaSelector (copy), p3 (copy), var7 (copy), var6 (copy), p2 (copy), appendCurrentPage (copy), var3 (copy)
			local ok, status = pcall(function()
				-- upvalues: p1 (copy), fFlagMyStatsMediaSelector (copy), p3 (copy), var7 (copy)
				local var12, var13 = p1:ReadCapturesFromGalleryAsync(if fFlagMyStatsMediaSelector then p3 else {}, true)
				var7 = var13
				
				return var12
			end)
			
			if ok and var7 ~= nil and status == Enum.ReadCapturesFromGalleryResult.Success then
				appendCurrentPage()
				
				if p2 ~= nil then
					p2(var3(false), true)
				end
				return
			else
				var7 = nil
				var6(true)
				
				if p2 ~= nil then
					p2({}, false)
				end
			end
		end)
	end
	
	local function fetchMore()
		-- upvalues: var7 (write), appendCurrentPage (ref)
		if var7 == nil or var7.IsFinished == true then
			return
		end
		task.spawn(function()
			-- upvalues: var7 (copy), appendCurrentPage (copy)
			if pcall(function()
				-- upvalues: var7 (copy)
				var7:AdvanceToNextPageAsync()
			end) then
				appendCurrentPage()
				
				return
			end
		end)
	end
	
	task.spawn(function()
		-- upvalues: p1 (ref), fFlagMyStatsMediaSelector (copy), p3 (ref), var7 (write), var6 (ref), p2 (ref), appendCurrentPage (ref), var3 (ref)
		local ok, status = pcall(function()
			-- upvalues: p1 (copy), fFlagMyStatsMediaSelector (copy), p3 (copy), var7 (copy)
			local var12, var13 = p1:ReadCapturesFromGalleryAsync(if fFlagMyStatsMediaSelector then p3 else {}, true)
			
			return var12
		end)
		
		if ok and var7 ~= nil and status == Enum.ReadCapturesFromGalleryResult.Success then
			appendCurrentPage()
			
			if p2 ~= nil then
				p2(var3(false), true)
			end
			return
		else
			var7 = nil
			var6(true)
			
			if p2 ~= nil then
				p2({}, false)
			end
		end
	end)
	
	return {
		getCaptures = var3,
		getIsFinished = var5,
		fetchMore = fetchMore
	}
end