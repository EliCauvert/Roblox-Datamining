local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local profileCtaServiceModule = require(parent.ProfileCtaService)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local ctaRowModule = require(userList.Cta.CtaRow)
local useCtaActionHandlersModule = require(script.Parent.useCtaActionHandlers)
local profileCTAService = profileCtaServiceModule.ProfileCTAService
local t = {}

return function(p1)
	-- upvalues: reactModule (ref), profileCTAService (ref), useCtaActionHandlersModule (ref), enumsModule (ref), t (ref), ctaRowModule (ref)
	reactModule.useEffect(function()
		-- upvalues: profileCTAService (copy)
		local var1 = profileCTAService.connectRealTimeUpdates()
		
		return function()
			-- upvalues: var1 (ref)
			var1.Disconnect()
		end
	end, {})
	local var1 = useCtaActionHandlersModule(p1)
	
	return reactModule.useMemo(function()
		-- upvalues: enumsModule (copy), t (copy), reactModule (copy), ctaRowModule (copy), var1 (ref), p1 (ref)
		return function(p2, p3, _)
			-- upvalues: enumsModule (copy), t (copy), reactModule (copy), ctaRowModule (copy), var1 (copy), p1 (copy)
			return if p3.type == enumsModule.EntityType.User then reactModule.createElement(ctaRowModule, {
				createRow = p2,
				entity = p3,
				actionHandlers = var1,
				ctaConfig = p1
			}) else p2(t)
		end
	end, { var1, p1 })
end