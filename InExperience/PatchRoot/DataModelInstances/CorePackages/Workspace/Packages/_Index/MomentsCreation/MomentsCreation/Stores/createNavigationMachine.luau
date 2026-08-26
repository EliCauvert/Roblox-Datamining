local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local createSignal = require(momentsCreation.Parent.Signals).createSignal
local gallery = creationFlowStateModule.Gallery
local preview = creationFlowStateModule.Preview
local music = creationFlowStateModule.Music
local textOverlay = creationFlowStateModule.TextOverlay
local trimming = creationFlowStateModule.Trimming
local description = creationFlowStateModule.Description
local stickerOverlay = creationFlowStateModule.StickerOverlay
local voice = creationFlowStateModule.Voice
local t = {
	[gallery] = { [preview] = true },
	[preview] = {
		[gallery] = true,
		[trimming] = true,
		[music] = true,
		[textOverlay] = true,
		[voice] = true,
		[description] = true,
		[stickerOverlay] = true
	},
	[trimming] = { [preview] = true },
	[music] = { [preview] = true },
	[textOverlay] = { [preview] = true },
	[voice] = { [preview] = true },
	[description] = { [preview] = true },
	[stickerOverlay] = { [preview] = true }
}

return function(p1)
	-- upvalues: createSignal (ref), gallery (ref), t (ref)
	local var1, var2 = createSignal(p1 or gallery)
	
	return {
		getStep = var1,
		canNavigate = function(p2)
			-- upvalues: var1 (ref), t (copy)
			local var3 = var1(false)
			
			if var3 == p2 then
				return true
			end
			local var4 = t[var3]
			
			return var4 ~= nil and var4[p2] == true
		end,
		navigate = function(p2)
			-- upvalues: var1 (ref), t (copy), var2 (ref)
			local var3
			local var4 = var1(false)
			
			if var4 == p2 then
				var3 = true
			else
				local var5 = t[var4]
				var3 = var5 ~= nil and var5[p2] == true
			end
			if var3 then
				var2(p2)
				
				return true
			end
			return false
		end,
		reset = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end
	}
end