local CreateSignalFunction = require(script:FindFirstAncestor("SocialCarousel").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Config = nil
	local v1 = nil
	local Flag = false
	local Count = 0
	
	return {
		getLoopsRemaining = Signal,
		getHomeFocusVersion = Signal1,
		notifyHomeFocused = function()
			-- upvalues: Signal2_1 (copy), Signal1 (copy)
			Signal2_1(Signal1(false) + 1)
		end,
		reset = function()
			-- upvalues: Signal2 (copy), Config (ref), Flag (ref), v1 (ref)
			Signal2({})
			Config = nil
			Flag = false
			v1 = nil
		end,
		setCurrentScroll = function(TileId, Offset)
			-- upvalues: Config (ref), Flag (ref), v1 (ref)
			Config = { tileId = TileId, offset = Offset }
			
			if Flag then
				v1 = Config
			end
		end,
		getCurrentScroll = function()
			-- upvalues: Config (ref)
			return Config
		end,
		clearCurrentScroll = function(TileId)
			-- upvalues: Config (ref), v1 (ref)
			if Config ~= nil and Config.tileId == TileId then
				Config = nil
			end
			if v1 ~= nil and v1.tileId == TileId then
				v1 = nil
			end
		end,
		holdCurrentScroll = function()
			-- upvalues: Flag (ref), Config (ref), v1 (ref)
			Flag = true
			
			if Config ~= nil then
				v1 = Config
			end
		end,
		getHeldScroll = function()
			-- upvalues: v1 (ref)
			return v1
		end,
		discardHeldScroll = function()
			-- upvalues: Flag (ref), v1 (ref)
			Flag = false
			v1 = nil
		end,
		isScrollHeld = function()
			-- upvalues: Flag (ref)
			return Flag
		end,
		beginMount = function(): number
			-- upvalues: Count (ref)
			Count += 1
			
			return Count
		end,
		isCurrentMount = function(Count1): boolean
			-- upvalues: Count (ref)
			return Count == Count1
		end
	}
end