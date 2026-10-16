local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.Foundation)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)

local function _() --[[ Line: 22 | Named "createSduiTokensStore" ]]
	-- upvalues: SignalsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getTokens = function(p1, p2) --[[ Line: 25 ]]
			-- upvalues: Signal (copy), SduiLoggerModule (upval), SduiErrorsModule (upval)
			local v1 = Signal(p1)
			
			if v1 == nil then
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.GetNilTokens, { message = "Getting tokens before they were set" }, p2)
			end
			return v1
		end,
		setTokens = Signal2
	}
end

local Config = nil

return function() --[[ Line: 43 | Named "getSduiTokensStore" ]]
	-- upvalues: Config (ref), SignalsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy)
	if Config == nil then
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		Config = {
			getTokens = function(p1, p2) --[[ Line: 25 ]]
				-- upvalues: Signal (copy), SduiLoggerModule (upval), SduiErrorsModule (upval)
				local v1 = Signal(p1)
				
				if v1 == nil then
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.GetNilTokens, { message = "Getting tokens before they were set" }, p2)
				end
				return v1
			end,
			setTokens = Signal2
		}
	end
	return Config
end