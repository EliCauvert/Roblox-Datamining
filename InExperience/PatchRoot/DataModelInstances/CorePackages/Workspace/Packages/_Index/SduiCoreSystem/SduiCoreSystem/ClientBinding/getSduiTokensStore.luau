local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.Foundation)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)

local function _()
	-- upvalues: signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getTokens = function(p1, p2)
			-- upvalues: var1 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy)
			local var3 = var1(p1)
			
			if var3 == nil then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.GetNilTokens, { message = "Getting tokens before they were set" }, p2)
			end
			return var3
		end,
		setTokens = var2
	}
end

local var1 = nil

return function()
	-- upvalues: var1 (write), signalsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	if var1 == nil then
		local var2, var3 = signalsModule.createSignal(nil)
		var1 = {
			getTokens = function(p1, p2)
				-- upvalues: var2 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy)
				local var4 = var2(p1)
				
				if var4 == nil then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.GetNilTokens, { message = "Getting tokens before they were set" }, p2)
				end
				return var4
			end,
			setTokens = var3
		}
	end
	return var1
end