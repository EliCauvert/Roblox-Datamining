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
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions
local ProfileCTAService = require(Parent.ProfileCtaService).ProfileCTAService
local t = {}

return function(Tbl, Callback)
	-- upvalues: ReactModule (copy), ProfileCTAService (copy), UseCtaActionHandlersModule (copy), FFlagUserListDefaultCtaWidths (copy), ConstantsModule (copy), FFlagUserListSurfaceExtensions (copy), SurfaceJoinCtaRowModule (copy), CtaRowModule (copy), EnumsModule (copy), t (copy), FFlagUserListCanonicalCtaAnalyticsModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: ProfileCTAService (upval)
		local ConnectRealTimeUpdatesResult = ProfileCTAService.connectRealTimeUpdates()
		
		return function()
			-- upvalues: ConnectRealTimeUpdatesResult (copy)
			ConnectRealTimeUpdatesResult.Disconnect()
		end
	end, {})
	local UseCtaActionHandlersModuleResult = UseCtaActionHandlersModule(Tbl)
	local UseMemoResult = ReactModule.useMemo(function()
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
	
	return ReactModule.useMemo(function()
		-- upvalues: FFlagUserListSurfaceExtensions (upval), UseMemoResult (copy), SurfaceJoinCtaRowModule (upval), CtaRowModule (upval), EnumsModule (upval), Callback (copy), t (upval), ReactModule (upval), UseCtaActionHandlersModuleResult (copy), FFlagUserListCanonicalCtaAnalyticsModule (upval)
		local SurfaceJoinCtaRowModule1 = if FFlagUserListSurfaceExtensions and UseMemoResult and UseMemoResult.join then SurfaceJoinCtaRowModule else CtaRowModule
		
		return function(Callback1, Entity, p1)
			-- upvalues: EnumsModule (upval), Callback (upval), t (upval), ReactModule (upval), SurfaceJoinCtaRowModule1 (copy), UseCtaActionHandlersModuleResult (upval), UseMemoResult (upval), FFlagUserListCanonicalCtaAnalyticsModule (upval)
			return if Entity.type == EnumsModule.EntityType.User then ReactModule.createElement(SurfaceJoinCtaRowModule1, {
				createRow = Callback1,
				entity = Entity,
				actionHandlers = UseCtaActionHandlersModuleResult,
				ctaConfig = UseMemoResult,
				index = if FFlagUserListCanonicalCtaAnalyticsModule then p1 elseif Callback then p1 else nil,
				renderRow = Callback
			}) elseif Callback then Callback(Callback1, Entity, p1) else Callback1(t)
		end
	end, {
		UseCtaActionHandlersModuleResult,
		UseMemoResult,
		Callback
	})
end