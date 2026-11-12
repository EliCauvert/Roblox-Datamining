local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("TextSize").Parent
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), FoundationModule (copy), UserGameSettings (copy)
	local Signal, Signal2 = SignalsModule.createSignal(FoundationModule.Utility.getTextSizeOffset() or 0)
	local Connection = UserGameSettings:GetPropertyChangedSignal("PreferredTextSize"):Connect(function()
		-- upvalues: Signal2 (copy), FoundationModule (upval)
		Signal2(FoundationModule.Utility.getTextSizeOffset() or 0)
	end)
	
	return {
		getTextSizeOffset = Signal,
		cleanup = function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	}
end