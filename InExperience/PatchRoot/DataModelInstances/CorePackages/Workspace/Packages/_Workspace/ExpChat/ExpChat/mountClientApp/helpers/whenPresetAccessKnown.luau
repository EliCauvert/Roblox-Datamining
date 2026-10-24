local ExpChat = script:FindFirstAncestor("ExpChat")
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local WhenFirstTrueModule = require(ExpChat.whenFirstTrue)
local t = {}

return function(p1, Callback)
	-- upvalues: WhenFirstTrueModule (copy), t (copy), ConstantsModule (copy)
	local v1 = nil
	local Flag = false
	v1 = WhenFirstTrueModule(function(p2): boolean
		-- upvalues: p1 (copy)
		return not p1.getIsLoading(p2)
	end, function()
		-- upvalues: Flag (ref), v1 (ref), t (upval), p1 (copy), ConstantsModule (upval), Callback (copy)
		Flag = true
		
		if v1 then
			t[v1] = nil
		end
		task.spawn(Callback, p1.getIsEnabled(false) and p1.getAccessLevel(false) == ConstantsModule.AccessLevel.Enabled)
	end)
	
	if not Flag and v1 then
		t[v1] = true
	end
end