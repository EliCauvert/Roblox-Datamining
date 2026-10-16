local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local CtaRowModule = require(UserList.Cta.CtaRow)
local SurfaceJoinCtaRowModule = require(UserList.Cta.SurfaceJoinCtaRow)
local UseCtaActionHandlersModule = require(script.Parent.useCtaActionHandlers)
local ConstantsModule = require(UserList.Common.Constants)
local FFlagUserListCanonicalCtaAnalyticsModule = require(UserList.Flags.FFlagUserListCanonicalCtaAnalytics)
local FFlagUserListDefaultCtaWidths = require(Parent.SharedFlags).FFlagUserListDefaultCtaWidths
local FFlagUserListComposeRenderRowWithCta = require(Parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions
local ProfileCTAService = require(Parent.ProfileCtaService).ProfileCTAService
local t = {}

return function(Tbl, p1) --[[ Line: 30 | Named "useCtaRenderRow" ]]
	-- upvalues: ReactModule (copy), ProfileCTAService (copy), UseCtaActionHandlersModule (copy), FFlagUserListComposeRenderRowWithCta (copy), FFlagUserListDefaultCtaWidths (copy), ConstantsModule (copy), FFlagUserListSurfaceExtensions (copy), SurfaceJoinCtaRowModule (copy), CtaRowModule (copy), EnumsModule (copy), t (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy)
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: ProfileCTAService (upval)
		local ConnectRealTimeUpdatesResult = ProfileCTAService.connectRealTimeUpdates()
		
		return function() --[[ Line: 33 ]]
			-- upvalues: ConnectRealTimeUpdatesResult (copy)
			ConnectRealTimeUpdatesResult.Disconnect()
		end
	end, {})
	local UseCtaActionHandlersModuleResult = UseCtaActionHandlersModule(Tbl)
	local Callback = if FFlagUserListComposeRenderRowWithCta then p1 else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 41 ]]
		-- upvalues: FFlagUserListDefaultCtaWidths (upval), Tbl (copy), ConstantsModule (upval)
		if FFlagUserListDefaultCtaWidths and Tbl and (Tbl.primaryCtaMinWidth == nil or Tbl.primaryCtaMaxWidth == nil) then
			local Copy = table.clone(Tbl)
			Copy.primaryCtaMinWidth = Tbl.primaryCtaMinWidth or ConstantsModule.DEFAULT_PRIMARY_CTA_MIN_WIDTH
			Copy.primaryCtaMaxWidth = Tbl.primaryCtaMaxWidth or ConstantsModule.DEFAULT_PRIMARY_CTA_MAX_WIDTH
			
			return Copy
		else
			return Tbl
		end
	end, { Tbl })
	
	return ReactModule.useMemo(function() --[[ Line: 55 ]]
		-- upvalues: FFlagUserListSurfaceExtensions (upval), UseMemoResult (copy), SurfaceJoinCtaRowModule (upval), CtaRowModule (upval), EnumsModule (upval), Callback (copy), t (upval), ReactModule (upval), UseCtaActionHandlersModuleResult (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval), FFlagUserListComposeRenderRowWithCta (upval)
		local SurfaceJoinCtaRowModule1 = if FFlagUserListSurfaceExtensions and UseMemoResult and UseMemoResult.join then SurfaceJoinCtaRowModule else CtaRowModule
		
		return function(Callback1, Entity, p2) --[[ Line: 66 ]]
			-- upvalues: EnumsModule (upval), Callback (upval), t (upval), ReactModule (upval), SurfaceJoinCtaRowModule1 (copy), UseCtaActionHandlersModuleResult (upval), UseMemoResult (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval), FFlagUserListComposeRenderRowWithCta (upval)
			return if Entity.type == EnumsModule.EntityType.User then ReactModule.createElement(SurfaceJoinCtaRowModule1, {
				createRow = Callback1,
				entity = Entity,
				actionHandlers = UseCtaActionHandlersModuleResult,
				ctaConfig = UseMemoResult,
				index = if FFlagUserListCanonicalCtaAnalyticsModule then p2 elseif FFlagUserListComposeRenderRowWithCta and Callback then p2 else nil,
				renderRow = Callback
			}) elseif Callback then Callback(Callback1, Entity, p2) else Callback1(t)
		end
	end, {
		UseCtaActionHandlersModuleResult,
		UseMemoResult,
		Callback
	})
end