local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ReactModule = require(Parent.React)
local _ = require(ExpChat.Stores.GetVoiceStore.createVoiceStore)
local v1 = require(ExpChat.Stores.GetVoiceStore)(false)
local Signal = require(Parent.Signals).createSignal(nil)

return function(p1) --[[ Line: 24 | Named "withSignalsData" ]]
	-- upvalues: v1 (copy), UseSignalStateFunction (copy), Signal (copy), ReactModule (copy)
	return function(Tbl) --[[ Line: 25 ]]
		-- upvalues: v1 (upval), UseSignalStateFunction (upval), Signal (upval), ReactModule (upval), p1 (copy)
		local UserId = Tbl.userId
		local Copy = table.clone(Tbl)
		Copy.voiceState = UseSignalStateFunction((if UserId then v1.getOrCreateVoiceState(UserId) else nil) or Signal)
		
		return ReactModule.createElement(p1, Copy)
	end
end