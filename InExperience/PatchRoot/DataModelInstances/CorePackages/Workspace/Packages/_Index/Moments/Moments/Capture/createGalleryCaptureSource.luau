local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local FFlagMomentsCreationEntryOutcomeModule = require(Moments.Flags.FFlagMomentsCreationEntryOutcome)
local FFlagMyStatsMediaSelector = require(Parent.SharedFlags).FFlagMyStatsMediaSelector

local function _(Sound: Sound): boolean --[[ Line: 47 | Named "isCaptureEligible" ]]
	return Sound.CaptureType ~= Enum.CaptureType.Video or Sound.TimeLength == nil or Sound.TimeLength >= 1
end

return function(p1, Callback, p2) --[[ Line: 74 | Named "createGalleryCaptureSource" ]]
	-- upvalues: SignalsModule (copy), FFlagMyStatsMediaSelector (copy), FFlagMomentsCreationEntryOutcomeModule (copy)
	local P1 = p1 or game:GetService("CaptureService")
	local P2 = p2 or {}
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Pages = nil
	
	local function appendCurrentPage() --[[ Line: 90 ]]
		-- upvalues: Signal (copy), Pages (ref), Signal2 (copy), Signal2_1 (copy)
		local Copy = table.clone(Signal(false))
		
		for _, Sound in Pages:GetCurrentPage() do
			if Sound.CaptureType ~= Enum.CaptureType.Video or Sound.TimeLength == nil or Sound.TimeLength >= 1 then
				table.insert(Copy, Sound)
			end
		end
		Signal2(Copy)
		Signal2_1(Pages.IsFinished == true)
	end
	
	local function _() --[[ Line: 101 | Named "fetchInitial" ]]
		-- upvalues: P1 (copy), FFlagMyStatsMediaSelector (upval), P2 (copy), Pages (ref), Signal2_1 (copy), Callback (copy), FFlagMomentsCreationEntryOutcomeModule (upval), appendCurrentPage (copy), Signal (copy)
		task.spawn(function() --[[ Line: 102 ]]
			-- upvalues: P1 (upval), FFlagMyStatsMediaSelector (upval), P2 (upval), Pages (upval), Signal2_1 (upval), Callback (upval), FFlagMomentsCreationEntryOutcomeModule (upval), appendCurrentPage (upval), Signal (upval)
			local Success, Result = pcall(function() --[[ Line: 103 ]]
				-- upvalues: P1 (upval), FFlagMyStatsMediaSelector (upval), P2 (upval), Pages (upval)
				local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = P1:ReadCapturesFromGalleryAsync(if FFlagMyStatsMediaSelector then P2 else {}, true)
				Pages = CapturesFromGalleryAsync2
				
				return CapturesFromGalleryAsync
			end)
			
			if Success and Pages ~= nil and Result == Enum.ReadCapturesFromGalleryResult.Success then
				appendCurrentPage()
				
				if Callback ~= nil then
					Callback(Signal(false), true)
				end
				return
			else
				Pages = nil
				Signal2_1(true)
				
				if Callback ~= nil then
					Callback({}, false, if FFlagMomentsCreationEntryOutcomeModule then if Success and Result == Enum.ReadCapturesFromGalleryResult.NeedPermission then "permission_denied" else "read_error" else nil)
				end
			end
		end)
	end
	
	local function fetchMore() --[[ Line: 137 ]]
		-- upvalues: Pages (ref), appendCurrentPage (copy)
		if Pages ~= nil and Pages.IsFinished ~= true then
			task.spawn(function() --[[ Line: 141 ]]
				-- upvalues: Pages (upval), appendCurrentPage (upval)
				if pcall(function() --[[ Line: 142 ]]
					-- upvalues: Pages (upval)
					Pages:AdvanceToNextPageAsync()
				end) then
					appendCurrentPage()
					
					return
				end
			end)
			
			return
		end
	end
	
	task.spawn(function() --[[ Line: 102 ]]
		-- upvalues: P1 (copy), FFlagMyStatsMediaSelector (upval), P2 (copy), Pages (ref), Signal2_1 (copy), Callback (copy), FFlagMomentsCreationEntryOutcomeModule (upval), appendCurrentPage (copy), Signal (copy)
		local Success, Result = pcall(function() --[[ Line: 103 ]]
			-- upvalues: P1 (upval), FFlagMyStatsMediaSelector (upval), P2 (upval), Pages (upval)
			local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = P1:ReadCapturesFromGalleryAsync(if FFlagMyStatsMediaSelector then P2 else {}, true)
			Pages = CapturesFromGalleryAsync2
			
			return CapturesFromGalleryAsync
		end)
		
		if Success and Pages ~= nil and Result == Enum.ReadCapturesFromGalleryResult.Success then
			appendCurrentPage()
			
			if Callback ~= nil then
				Callback(Signal(false), true)
			end
			return
		else
			Pages = nil
			Signal2_1(true)
			
			if Callback ~= nil then
				Callback({}, false, if FFlagMomentsCreationEntryOutcomeModule then if Success and Result == Enum.ReadCapturesFromGalleryResult.NeedPermission then "permission_denied" else "read_error" else nil)
			end
		end
	end)
	
	return {
		getCaptures = Signal,
		getIsFinished = Signal1,
		fetchMore = fetchMore
	}
end