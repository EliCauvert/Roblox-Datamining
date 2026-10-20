local AccountService = game:GetService("AccountService")
local MagicLoginEngineFeature = game:GetEngineFeature("MagicLogin")
local ConstantsModule = require(script:FindFirstAncestor("LoginV2").Components.Constants)

return function(p1)
	-- upvalues: AccountService (copy), MagicLoginEngineFeature (copy), ConstantsModule (copy)
	if AccountService and MagicLoginEngineFeature then
		if p1 then
			AccountService:MagicLogin(ConstantsModule.START_ADVERTISEMENT)
			
			return
		end
		AccountService:MagicLogin(ConstantsModule.STOP_ADVERTISEMENT)
	end
end