local Parent = script:FindFirstAncestor("GameTile").Parent
local SignalsModule = require(Parent.Signals)
local FFlagLuaAppNotInterestedTileFeedbackButton = require(Parent.SharedFlags).FFlagLuaAppNotInterestedTileFeedbackButton

return function()
	-- upvalues: SignalsModule (copy), FFlagLuaAppNotInterestedTileFeedbackButton (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Callback = nil
	local Callback1 = nil
	
	if FFlagLuaAppNotInterestedTileFeedbackButton then
		Callback, Callback1 = SignalsModule.createSignal({})
	end
	return {
		setGameHidden = function(Key, p1)
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			Copy[Key] = p1
			Signal2(Copy)
		end,
		getHiddenGames = Signal,
		setGameFeedbackOpener = if FFlagLuaAppNotInterestedTileFeedbackButton then function(Key, p1)
			-- upvalues: Callback (ref), Callback1 (ref)
			local Copy = table.clone(Callback(false))
			
			if p1 then
				Copy[Key] = p1
			else
				Copy[Key] = nil
			end
			Callback1(Copy)
		end else nil,
		getFeedbackOpeners = if FFlagLuaAppNotInterestedTileFeedbackButton then Callback else nil
	}
end