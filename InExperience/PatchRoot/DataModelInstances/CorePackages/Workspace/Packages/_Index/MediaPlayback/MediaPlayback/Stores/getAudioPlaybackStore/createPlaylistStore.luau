local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local _ = require(MediaPlayback.Stores.getAudioPlaybackStore.types)
local CreateSignalFunction = require(MediaPlayback.Parent.Signals).createSignal

return function() --[[ Line: 9 | Named "createPlaylistStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	
	local function _(p1, p2) --[[ Line: 13 | Named "getRelativeIndex" ]]
		-- upvalues: Signal1 (copy), Signal (copy)
		local SignalResultEntry = Signal1(false)[tostring(p1)]
		
		return if SignalResultEntry then Signal(false)[SignalResultEntry + p2] else nil
	end
	
	return {
		get = Signal,
		set = function(List) --[[ Line: 22 ]]
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(List)
			local t = {}
			
			for i, value in List do
				t[tostring(value)] = i
			end
			Signal2_1(t)
		end,
		getNext = function(p1) --[[ Line: 32 ]]
			-- upvalues: Signal1 (copy), Signal (copy)
			local SignalResultEntry: number = Signal1(false)[tostring(p1)]
			
			return if SignalResultEntry then Signal(false)[SignalResultEntry + 1] else nil
		end,
		getPrev = function(p1) --[[ Line: 36 ]]
			-- upvalues: Signal1 (copy), Signal (copy)
			local SignalResultEntry: number = Signal1(false)[tostring(p1)]
			
			return if SignalResultEntry then Signal(false)[SignalResultEntry + -1] else nil
		end
	}
end