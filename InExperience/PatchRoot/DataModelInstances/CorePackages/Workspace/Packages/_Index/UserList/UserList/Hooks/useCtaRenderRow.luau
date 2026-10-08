local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local profileCtaServiceModule = require(parent.ProfileCtaService)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local ctaRowModule = require(userList.Cta.CtaRow)
local useCtaActionHandlersModule = require(script.Parent.useCtaActionHandlers)
local constantsModule = require(userList.Common.Constants)
local fFlagUserListCanonicalCtaAnalyticsModule = require(userList.Flags.FFlagUserListCanonicalCtaAnalytics)
local fFlagUserListDefaultCtaWidths = require(parent.SharedFlags).FFlagUserListDefaultCtaWidths
local fFlagUserListComposeRenderRowWithCta = require(parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local profileCTAService = profileCtaServiceModule.ProfileCTAService
local t = {}

return function(p1, p2)
	-- upvalues: reactModule (ref), profileCTAService (ref), useCtaActionHandlersModule (ref), fFlagUserListComposeRenderRowWithCta (ref), fFlagUserListDefaultCtaWidths (ref), constantsModule (ref), enumsModule (ref), t (ref), ctaRowModule (ref), fFlagUserListCanonicalCtaAnalyticsModule (ref)
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
	local var3 = reactModule.useMemo(function()
		-- upvalues: fFlagUserListDefaultCtaWidths (copy), p1 (ref), constantsModule (copy)
		if fFlagUserListDefaultCtaWidths and p1 and (p1.primaryCtaMinWidth == nil or p1.primaryCtaMaxWidth == nil) then
			local cloned = table.clone(p1)
			cloned.primaryCtaMinWidth = p1.primaryCtaMinWidth or constantsModule.DEFAULT_PRIMARY_CTA_MIN_WIDTH
			cloned.primaryCtaMaxWidth = p1.primaryCtaMaxWidth or constantsModule.DEFAULT_PRIMARY_CTA_MAX_WIDTH
			
			return cloned
		end
		return p1
	end, { p1 })
	
	return reactModule.useMemo(function()
		-- upvalues: enumsModule (copy), var2 (ref), t (copy), reactModule (copy), ctaRowModule (copy), var1 (ref), var3 (ref), fFlagUserListCanonicalCtaAnalyticsModule (copy), fFlagUserListComposeRenderRowWithCta (copy)
		return function(p3, p4, p5)
			-- upvalues: enumsModule (copy), var2 (copy), t (copy), reactModule (copy), ctaRowModule (copy), var1 (copy), var3 (copy), fFlagUserListCanonicalCtaAnalyticsModule (copy), fFlagUserListComposeRenderRowWithCta (copy)
			return if p4.type == enumsModule.EntityType.User then reactModule.createElement(ctaRowModule, {
				createRow = p3,
				entity = p4,
				actionHandlers = var1,
				ctaConfig = var3,
				index = if fFlagUserListCanonicalCtaAnalyticsModule then p5 elseif fFlagUserListComposeRenderRowWithCta and var2 then p5 else nil,
				renderRow = var2
			}) elseif var2 then var2(p3, p4, p5) else p3(t)
		end
	end, { var1, var3, var2 })
end