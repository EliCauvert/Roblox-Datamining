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

return function(p0) --[[ line: 24 | named "useCtaRenderRow" ]]
	-- upvalues: reactModule (ref), profileCTAService (ref), useCtaActionHandlersModule (ref), enumsModule (ref), t (ref), ctaRowModule (ref)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: profileCTAService (copy)
		local var8 = profileCTAService.connectRealTimeUpdates()
		
		return function() --[[ line: 27 ]]
			-- upvalues: var8 (ref)
			var8.Disconnect()
		end
	end, {})
	local var7 = useCtaActionHandlersModule(p0)
	
	return reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: enumsModule (copy), t (copy), reactModule (copy), ctaRowModule (copy), var7 (ref), p0 (ref)
		return function(p1, p2, _) --[[ line: 35 ]]
			-- upvalues: enumsModule (copy), t (copy), reactModule (copy), ctaRowModule (copy), var7 (copy), p0 (copy)
			return if p2.type == enumsModule.EntityType.User then reactModule.createElement(ctaRowModule, {
				createRow = p1,
				entity = p2,
				actionHandlers = var7,
				ctaConfig = p0
			}) else p1(t)
		end
	end, { var7, p0 })
end