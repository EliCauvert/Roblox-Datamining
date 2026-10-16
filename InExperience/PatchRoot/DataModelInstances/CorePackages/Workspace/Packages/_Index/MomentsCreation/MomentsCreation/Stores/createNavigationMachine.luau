local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local CreationFlowStateModule = require(MomentsCreation.Enums.CreationFlowState)
local CreateSignalFunction = require(MomentsCreation.Parent.Signals).createSignal
local Gallery = CreationFlowStateModule.Gallery
local Preview = CreationFlowStateModule.Preview
local Music = CreationFlowStateModule.Music
local TextOverlay = CreationFlowStateModule.TextOverlay
local Trimming = CreationFlowStateModule.Trimming
local Description = CreationFlowStateModule.Description
local StickerOverlay = CreationFlowStateModule.StickerOverlay
local Voice = CreationFlowStateModule.Voice
local config = {
	[Gallery] = { [Preview] = true },
	[Preview] = {
		[Gallery] = true,
		[Trimming] = true,
		[Music] = true,
		[TextOverlay] = true,
		[Voice] = true,
		[Description] = true,
		[StickerOverlay] = true
	},
	[Trimming] = { [Preview] = true },
	[Music] = { [Preview] = true },
	[TextOverlay] = { [Preview] = true },
	[Voice] = { [Preview] = true },
	[Description] = { [Preview] = true },
	[StickerOverlay] = { [Preview] = true }
}

return function(p1) --[[ Line: 60 | Named "createNavigationMachine" ]]
	-- upvalues: CreateSignalFunction (copy), Gallery (copy), config (copy)
	local Signal, Signal2 = CreateSignalFunction(p1 or Gallery)
	
	return {
		getStep = Signal,
		canNavigate = function(p2): boolean --[[ Line: 63 ]]
			-- upvalues: Signal (copy), config (upval)
			local SignalResult = Signal(false)
			
			if SignalResult == p2 then
				return true
			else
				local Entry = config[SignalResult]
				
				return Entry ~= nil and Entry[p2] == true
			end
		end,
		navigate = function(p2): boolean --[[ Line: 72 ]]
			-- upvalues: Signal (copy), config (upval), Signal2 (copy)
			local SignalResult = Signal(false)
			local v1 = nil
			
			if SignalResult == p2 then
				v1 = true
			else
				local Entry = config[SignalResult]
				v1 = Entry ~= nil and Entry[p2] == true
			end
			if v1 then
				Signal2(p2)
				
				return true
			else
				return false
			end
		end,
		reset = function(p2) --[[ Line: 82 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p2)
		end
	}
end