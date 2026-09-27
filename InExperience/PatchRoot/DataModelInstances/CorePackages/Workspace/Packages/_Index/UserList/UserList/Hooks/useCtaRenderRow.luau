local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local profileCtaServiceModule = require(parent.ProfileCtaService)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local ctaRowModule = require(userList.Cta.CtaRow)
local useCtaActionHandlersModule = require(script.Parent.useCtaActionHandlers)
local fFlagUserListCanonicalCtaAnalyticsModule = require(userList.Flags.FFlagUserListCanonicalCtaAnalytics)
local fFlagUserListComposeRenderRowWithCta = require(parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local profileCTAService = profileCtaServiceModule.ProfileCTAService
local t = {}

return function(p1, p2)
	-- upvalues: reactModule (ref), profileCTAService (ref), useCtaActionHandlersModule (ref), fFlagUserListComposeRenderRowWithCta (ref), enumsModule (ref), t (ref), ctaRowModule (ref), fFlagUserListCanonicalCtaAnalyticsModule (ref)
	reactModule.useEffect(function()
		-- upvalues: profileCTAService (copy)
		local var1 = profileCTAService.connectRealTimeUpdates()
		
		return function()
			-- upvalues: var1 (ref)
			var1.Disconnect()
		end
	end, {})
	local var1 = useCtaActionHandlersModule(p1)
	local var2 = if fFlagUserListComposeRenderRowWithCta then p2 else nil
	
	return reactModule.useMemo(function()
		-- upvalues: enumsModule (copy), var2 (ref), t (copy), reactModule (copy), ctaRowModule (copy), var1 (ref), p1 (ref), fFlagUserListCanonicalCtaAnalyticsModule (copy), fFlagUserListComposeRenderRowWithCta (copy)
		return function(p3, p4, p5)
			-- upvalues: enumsModule (copy), var2 (copy), t (copy), reactModule (copy), ctaRowModule (copy), var1 (copy), p1 (copy), fFlagUserListCanonicalCtaAnalyticsModule (copy), fFlagUserListComposeRenderRowWithCta (copy)
			return if p4.type == enumsModule.EntityType.User then reactModule.createElement(ctaRowModule, {
				createRow = p3,
				entity = p4,
				actionHandlers = var1,
				ctaConfig = p1,
				index = if fFlagUserListCanonicalCtaAnalyticsModule then p5 elseif fFlagUserListComposeRenderRowWithCta and var2 then p5 else nil,
				renderRow = var2
			}) elseif var2 then var2(p3, p4, p5) else p3(t)
		end
	end, { var1, p1, var2 })
end