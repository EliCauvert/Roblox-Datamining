local Parent = script:FindFirstAncestor("PasskeyUpsell").Parent
local AuthCommonModule = require(Parent.AuthCommon)
local RegisterPasskeyFunction = AuthCommonModule.Thunks.RegisterPasskey
local PasskeyConstants = AuthCommonModule.Common.PasskeyConstants
local PromiseModule = require(Parent.Promise)
local Logger = require(Parent.Loggers).Logger

return function(p1, p2)
	-- upvalues: Logger (copy), RegisterPasskeyFunction (copy), PromiseModule (copy), PasskeyConstants (copy)
	Logger:info("Invoking RegisterPasskey")
	
	return RegisterPasskeyFunction(p1, p2 or "passkeyUpsell"):andThen(function()
		-- upvalues: Logger (upval), PromiseModule (upval)
		Logger:info("Passkey Upsell Registration completed.")
		
		return PromiseModule.resolve(true)
	end, function(p3)
		-- upvalues: Logger (upval), PasskeyConstants (upval), PromiseModule (upval)
		Logger:debug("User encountered unknown error during passkey upsell registration: ", p3)
		
		return if p3 and p3.name == PasskeyConstants.USER_OS_DIALOG_ERROR_NAME then PromiseModule.resolve(false) else PromiseModule.reject()
	end)
end