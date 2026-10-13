local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local _ = require(parent.React)
local _ = require(parent.DataHydration)
local _ = require(userList.Common.Types)
local fFlagUserListComposeRenderRowWithCta = require(parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local fFlagUserListSurfacePresenceWins = require(parent.SharedFlags).FFlagUserListSurfacePresenceWins

return function(p1, p2, p3, p4)
	-- upvalues: fFlagUserListComposeRenderRowWithCta (ref), fFlagUserListSurfacePresenceWins (ref)
	local var1 = if p4.isLoading and (p2 ~= nil and (p2.showLoadingPlaceholder ~= false and p2.primaryCtaMinWidth ~= nil)) and p2 then {
		minWidth = p2.primaryCtaMinWidth,
		maxWidth = p2.primaryCtaMaxWidth
	} else nil
	local var2 = if p3 then p3.userPresenceType else nil
	local renderRow = p1.renderRow
	
	if fFlagUserListComposeRenderRowWithCta and renderRow then
		local createRow = p1.createRow
		
		return renderRow(function(p5)
			-- upvalues: var2 (ref), fFlagUserListSurfacePresenceWins (copy), p4 (ref), var1 (ref), createRow (ref)
			local cloned = table.clone(p5)
			cloned.presence = var2
			
			if fFlagUserListSurfacePresenceWins and p5.presence ~= nil then
				cloned.presence = p5.presence
			end
			cloned.primaryCta = p4.primaryCta
			cloned.secondaryCta = p4.secondaryCta
			cloned.ctaLoading = var1
			
			return createRow(cloned)
		end, p1.entity, p1.index or 0)
	end
	return p1.createRow({
		presence = var2,
		primaryCta = p4.primaryCta,
		secondaryCta = p4.secondaryCta,
		ctaLoading = var1
	})
end