local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.Foundation)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)

local function _() --[[ line: 22 | named "createSduiTokensStore" ]]
	-- upvalues: signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	local var5, var6 = signalsModule.createSignal(nil)
	
	return {
		getTokens = function(p0, p1) --[[ line: 25 ]]
			-- upvalues: var5 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy)
			local var7 = var5(p0)
			
			if var7 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.GetNilTokens, { message = "Getting tokens before they were set" }, p1)
			end
			return var7
		end,
		setTokens = var6
	}
end

local var4 = nil

return function() --[[ line: 43 | named "getSduiTokensStore" ]]
	-- upvalues: var4 (write), signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	if var4 == nil then
		local var8, var9 = signalsModule.createSignal(nil)
		var4 = {
			getTokens = function(p2, p3) --[[ line: 25 ]]
				-- upvalues: var8 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy)
				local var7 = var8(p2)
				
				if var7 == nil then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.GetNilTokens, { message = "Getting tokens before they were set" }, p3)
				end
				return var7
			end,
			setTokens = var9
		}
	end
	return var4
end