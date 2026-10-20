local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local _ = require(Parent.React)
local _ = require(Parent.DataHydration)
local _ = require(UserList.Common.Types)
local FFlagUserListComposeRenderRowWithCta = require(Parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local FFlagUserListSurfacePresenceWins = require(Parent.SharedFlags).FFlagUserListSurfacePresenceWins

return function(p1, p2, p3, p4)
	-- upvalues: FFlagUserListComposeRenderRowWithCta (copy), FFlagUserListSurfacePresenceWins (copy)
	local HasPrimaryCtaMinWidth: boolean = p2 ~= nil and (p2.showLoadingPlaceholder ~= false and p2.primaryCtaMinWidth ~= nil)
	local Config = if p4.isLoading and HasPrimaryCtaMinWidth and p2 then {
		minWidth = p2.primaryCtaMinWidth,
		maxWidth = p2.primaryCtaMaxWidth
	} else nil
	local UserPresenceType = if p3 then p3.userPresenceType else nil
	local RenderRowFunction = p1.renderRow
	
	if FFlagUserListComposeRenderRowWithCta and RenderRowFunction then
		local CreateRowFunction = p1.createRow
		
		return RenderRowFunction(function(Tbl)
			-- upvalues: UserPresenceType (copy), FFlagUserListSurfacePresenceWins (upval), p4 (copy), Config (copy), CreateRowFunction (copy)
			local Copy = table.clone(Tbl)
			Copy.presence = UserPresenceType
			
			if FFlagUserListSurfacePresenceWins and Tbl.presence ~= nil then
				Copy.presence = Tbl.presence
			end
			Copy.primaryCta = p4.primaryCta
			Copy.secondaryCta = p4.secondaryCta
			Copy.ctaLoading = Config
			
			return CreateRowFunction(Copy)
		end, p1.entity, p1.index or 0)
	else
		return p1.createRow({
			presence = UserPresenceType,
			primaryCta = p4.primaryCta,
			secondaryCta = p4.secondaryCta,
			ctaLoading = Config
		})
	end
end