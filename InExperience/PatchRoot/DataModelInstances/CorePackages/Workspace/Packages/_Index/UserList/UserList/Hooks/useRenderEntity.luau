local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(userList.Common.Types)
local entityRow = require(userList.Components.UserRow).EntityRow
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagAddStatusIndicatorToBaseRow = require(parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow

return function(p0)
	-- upvalues: reactModule (ref), view (ref), entityRow (ref), fFlagUserListCtaIntegrationEnabled (ref), fFlagAddStatusIndicatorToBaseRow (ref)
	local onActivated = p0.onActivated
	local renderRow = p0.renderRow
	local entitiesMap = p0.entitiesMap
	local configs = p0.configs
	local layoutMode = p0.layoutMode
	
	return reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: entitiesMap (ref), renderRow (ref), onActivated (ref), reactModule (copy), view (copy), entityRow (copy), fFlagUserListCtaIntegrationEnabled (copy), fFlagAddStatusIndicatorToBaseRow (copy), configs (ref), layoutMode (ref)
		local var2 = entitiesMap[p1]
		
		return if var2 then if renderRow then renderRow(function(p4)
			-- upvalues: var2 (ref), p2 (ref), onActivated (copy), reactModule (copy), view (copy), p3 (ref), entityRow (copy), fFlagUserListCtaIntegrationEnabled (copy), fFlagAddStatusIndicatorToBaseRow (copy), configs (copy), layoutMode (copy)
			return reactModule.createElement(view, { tag = "size-full-full", Size = p3, LayoutOrder = p2 }, {
				reactModule.createElement(entityRow, {
					entity = var2,
					onActivated = if p4.onRowActivated then function()
						-- upvalues: p4 (ref), var2 (copy), p2 (copy)
						p4.onRowActivated(var2.id, var2.type, p2)
					end else onActivated,
					primaryCta = p4.primaryCta,
					secondaryCta = p4.secondaryCta,
					ctaLoading = if fFlagUserListCtaIntegrationEnabled then p4.ctaLoading else nil,
					contextualInfo = p4.contextualInfo,
					loadingState = p4.loadingState,
					presence = p4.presence,
					shouldShowNewIndicator = if fFlagAddStatusIndicatorToBaseRow then p4.shouldShowNewIndicator else nil,
					trailingContent = p4.trailingContent,
					configs = configs,
					layoutMode = layoutMode
				})
			})
		end, var2, p2) else reactModule.createElement(view, { tag = "size-full-full", Size = p3, LayoutOrder = p2 }, {
			reactModule.createElement(entityRow, {
				entity = var2,
				onActivated = onActivated,
				configs = configs,
				layoutMode = layoutMode
			})
		}) else nil
	end, {
		onActivated,
		renderRow,
		entitiesMap,
		configs,
		layoutMode
	})
end