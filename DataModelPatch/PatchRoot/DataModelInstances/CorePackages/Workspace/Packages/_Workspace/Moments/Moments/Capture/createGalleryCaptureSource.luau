local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

local function _(Sound: Sound): boolean
	return Sound.CaptureType ~= Enum.CaptureType.Video or Sound.TimeLength == nil or Sound.TimeLength >= 1
end

return function(p1, Callback)
	-- upvalues: SignalsModule (copy)
	local P1 = p1 or game:GetService("CaptureService")
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Pages = nil
	
	local function appendCurrentPage()
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
	
	local function _()
		-- upvalues: P1 (copy), Pages (ref), Signal2_1 (copy), Callback (copy), appendCurrentPage (copy), Signal (copy)
		task.spawn(function()
			-- upvalues: P1 (upval), Pages (upval), Signal2_1 (upval), Callback (upval), appendCurrentPage (upval), Signal (upval)
			local Success, Result = pcall(function()
				-- upvalues: P1 (upval), Pages (upval)
				local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = P1:ReadCapturesFromGalleryAsync({}, true)
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
					Callback({}, false)
				end
			end
		end)
	end
	
	local function fetchMore()
		-- upvalues: Pages (ref), appendCurrentPage (copy)
		if Pages ~= nil and Pages.IsFinished ~= true then
			task.spawn(function()
				-- upvalues: Pages (upval), appendCurrentPage (upval)
				if pcall(function()
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
	
	task.spawn(function()
		-- upvalues: P1 (copy), Pages (ref), Signal2_1 (copy), Callback (copy), appendCurrentPage (copy), Signal (copy)
		local Success, Result = pcall(function()
			-- upvalues: P1 (upval), Pages (upval)
			local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = P1:ReadCapturesFromGalleryAsync({}, true)
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
				Callback({}, false)
			end
		end
	end)
	
	return {
		getCaptures = Signal,
		getIsFinished = Signal1,
		fetchMore = fetchMore
	}
end