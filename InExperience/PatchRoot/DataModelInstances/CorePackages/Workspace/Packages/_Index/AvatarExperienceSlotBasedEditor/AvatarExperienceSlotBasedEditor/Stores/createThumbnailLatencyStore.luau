local SignalsModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal({})
	local t = {}
	
	return {
		getStartTime = Signal,
		getEndTime = Signal1,
		getThumbnailMap = Signal3,
		getAnyLoaded = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: Signal3 (copy)
			for _, value in Signal3(p1) do
				if value then
					return true
				end
			end
			return false
		end),
		getIsLoaded = function(Key)
			-- upvalues: t (copy), SignalsModule (upval), Signal3 (copy)
			local Entry = t[Key]
			
			if Entry then
				return Entry
			else
				local Computed = SignalsModule.createComputed(function(p2): boolean
					-- upvalues: Signal3 (upval), Key (copy)
					return Signal3(p2)[Key] == true
				end)
				t[Key] = Computed
				
				return Computed
			end
		end,
		startTracking = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy)
			Signal2(os.clock())
			Signal2_1(nil)
			Signal2_2({})
		end,
		appendThumbnail = function(Key)
			-- upvalues: Signal3 (copy), Signal2_2 (copy)
			local SignalResult = Signal3(false)
			
			if SignalResult[Key] == nil then
				local Copy = table.clone(SignalResult)
				Copy[Key] = false
				Signal2_2(Copy)
				
				return
			end
		end,
		setThumbnailLoaded = function(Key)
			-- upvalues: Signal3 (copy), Signal2_2 (copy)
			local SignalResult = Signal3(false)
			
			if SignalResult[Key] ~= true then
				local Copy = table.clone(SignalResult)
				Copy[Key] = true
				Signal2_2(Copy)
				
				return
			end
		end,
		endTracking = function()
			-- upvalues: Signal2_1 (copy)
			Signal2_1(os.clock())
		end
	}
end