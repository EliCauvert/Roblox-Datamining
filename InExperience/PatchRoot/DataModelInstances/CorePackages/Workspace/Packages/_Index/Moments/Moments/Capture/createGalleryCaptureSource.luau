local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local fFlagMomentsCreationEntryOutcomeModule = require(moments.Flags.FFlagMomentsCreationEntryOutcome)
local fFlagMyStatsMediaSelector = sharedFlagsModule.FFlagMyStatsMediaSelector

local function _(p1)
	return p1.CaptureType == Enum.CaptureType.Video and p1.TimeLength ~= nil and p1.TimeLength < 1
end

return function(p1, p2, p3)
	-- upvalues: signalsModule (ref), fFlagMyStatsMediaSelector (ref), fFlagMomentsCreationEntryOutcomeModule (ref)
	p1 = p1 or game:GetService("CaptureService")
	p3 = p3 or {}
	local var1, var2 = signalsModule.createSignal({})
	local var3, var4 = signalsModule.createSignal(false)
	local var5 = nil
	
	local function appendCurrentPage()
		-- upvalues: var1 (ref), var5 (write), var2 (ref), var4 (ref)
		local cloned = table.clone(var1(false))
		
		for i, v in var5:GetCurrentPage() do
			local var6
			if v.CaptureType == Enum.CaptureType.Video and v.TimeLength ~= nil then
				var6 = v.TimeLength >= 1
			end
			if var6 then
				table.insert(cloned, v)
			end
		end
		var2(cloned)
		var4(var5.IsFinished == true)
	end
	
	local function _()
		-- upvalues: p1 (ref), fFlagMyStatsMediaSelector (copy), p3 (ref), var5 (write), var4 (ref), p2 (ref), fFlagMomentsCreationEntryOutcomeModule (copy), appendCurrentPage (ref), var1 (ref)
		task.spawn(function()
			-- upvalues: p1 (copy), fFlagMyStatsMediaSelector (copy), p3 (copy), var5 (copy), var4 (copy), p2 (copy), fFlagMomentsCreationEntryOutcomeModule (copy), appendCurrentPage (copy), var1 (copy)
			local ok, status = pcall(function()
				-- upvalues: p1 (copy), fFlagMyStatsMediaSelector (copy), p3 (copy), var5 (copy)
				local var7, var8 = p1:ReadCapturesFromGalleryAsync(if fFlagMyStatsMediaSelector then p3 else {}, true)
				var5 = var8
				
				return var7
			end)
			
			if ok and var5 ~= nil and status == Enum.ReadCapturesFromGalleryResult.Success then
				appendCurrentPage()
				
				if p2 ~= nil then
					p2(var1(false), true)
				end
				return
			else
				var5 = nil
				var4(true)
				
				if p2 ~= nil then
					p2({}, false, if not fFlagMomentsCreationEntryOutcomeModule then if ok and status == Enum.ReadCapturesFromGalleryResult.NeedPermission then "permission_denied" else "read_error" else nil)
				end
			end
		end)
	end
	
	local function fetchMore()
		-- upvalues: var5 (write), appendCurrentPage (ref)
		if var5 == nil or var5.IsFinished == true then
			return
		end
		task.spawn(function()
			-- upvalues: var5 (copy), appendCurrentPage (copy)
			if pcall(function()
				-- upvalues: var5 (copy)
				var5:AdvanceToNextPageAsync()
			end) then
				appendCurrentPage()
				
				return
			end
		end)
	end
	
	task.spawn(function()
		-- upvalues: p1 (ref), fFlagMyStatsMediaSelector (copy), p3 (ref), var5 (write), var4 (ref), p2 (ref), fFlagMomentsCreationEntryOutcomeModule (copy), appendCurrentPage (ref), var1 (ref)
		local ok, status = pcall(function()
			-- upvalues: p1 (copy), fFlagMyStatsMediaSelector (copy), p3 (copy), var5 (copy)
			local var7, var8 = p1:ReadCapturesFromGalleryAsync(if fFlagMyStatsMediaSelector then p3 else {}, true)
			
			return var7
		end)
		
		if ok and var5 ~= nil and status == Enum.ReadCapturesFromGalleryResult.Success then
			appendCurrentPage()
			
			if p2 ~= nil then
				p2(var1(false), true)
			end
			return
		else
			var5 = nil
			var4(true)
			
			if p2 ~= nil then
				p2({}, false, if not fFlagMomentsCreationEntryOutcomeModule then if ok and status == Enum.ReadCapturesFromGalleryResult.NeedPermission then "permission_denied" else "read_error" else nil)
			end
		end
	end)
	
	return {
		getCaptures = var1,
		getIsFinished = var3,
		fetchMore = fetchMore
	}
end