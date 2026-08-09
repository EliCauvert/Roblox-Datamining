local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local creationFlowStateModule = require(momentsCreation.Enums.CreationFlowState)
local createSignal = require(momentsCreation.Parent.Signals).createSignal
local gallery = creationFlowStateModule.Gallery
local preview = creationFlowStateModule.Preview
local music = creationFlowStateModule.Music
local textOverlay = creationFlowStateModule.TextOverlay
local trimming = creationFlowStateModule.Trimming
local description = creationFlowStateModule.Description
local t = {
	[gallery] = { [preview] = true },
	[preview] = {
		[gallery] = true,
		[trimming] = true,
		[music] = true,
		[textOverlay] = true,
		[description] = true
	},
	[trimming] = { [preview] = true },
	[music] = { [preview] = true },
	[textOverlay] = { [preview] = true },
	[description] = { [preview] = true }
}

return function(p0) --[[ line: 55 | named "createNavigationMachine" ]]
	-- upvalues: createSignal (ref), gallery (ref), t (ref)
	local var3, var4 = createSignal(p0 or gallery)
	
	return {
		getStep = var3,
		canNavigate = function(p1) --[[ line: 58 ]]
			-- upvalues: var3 (ref), t (copy)
			local var5 = var3(false)
			
			if var5 == p1 then
				return true
			end
			local var6 = t[var5]
			
			return var6 ~= nil and var6[p1] == true
		end,
		navigate = function(p2) --[[ line: 67 ]]
			-- upvalues: var3 (ref), t (copy), var4 (ref)
			local var8
			local var7 = var3(false)
			
			if var7 == p2 then
				var8 = true
			else
				local var9 = t[var7]
				var8 = var9 ~= nil and var9[p2] == true
			end
			if var8 then
				var4(p2)
				
				return true
			end
			return false
		end,
		reset = function(value) --[[ line: 77 ]]
			-- upvalues: var4 (ref)
			var4(value)
		end
	}
end