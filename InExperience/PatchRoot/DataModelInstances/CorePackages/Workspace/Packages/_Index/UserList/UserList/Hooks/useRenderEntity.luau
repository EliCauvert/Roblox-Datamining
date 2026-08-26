local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(userList.Common.Types)
local entityRow = require(userList.Components.UserRow).EntityRow
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagAddStatusIndicatorToBaseRow = require(parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow

return function(p1)
	-- upvalues: reactModule (ref), view (ref), entityRow (ref), fFlagUserListCtaIntegrationEnabled (ref), fFlagAddStatusIndicatorToBaseRow (ref)
	local onActivated = p1.onActivated
	local renderRow = p1.renderRow
	local entitiesMap = p1.entitiesMap
	local configs = p1.configs
	local layoutMode = p1.layoutMode
	
	return reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: entitiesMap (ref), renderRow (ref), onActivated (ref), reactModule (copy), view (copy), entityRow (copy), fFlagUserListCtaIntegrationEnabled (copy), fFlagAddStatusIndicatorToBaseRow (copy), configs (ref), layoutMode (ref)
		local var1 = entitiesMap[p2]
		
		return if var1 then if renderRow then renderRow(function(p5)
			-- upvalues: var1 (ref), p3 (ref), onActivated (copy), reactModule (copy), view (copy), p4 (ref), entityRow (copy), fFlagUserListCtaIntegrationEnabled (copy), fFlagAddStatusIndicatorToBaseRow (copy), configs (copy), layoutMode (copy)
			return reactModule.createElement(view, { tag = "size-full-full", Size = p4, LayoutOrder = p3 }, {
				reactModule.createElement(entityRow, {
					entity = var1,
					onActivated = if p5.onRowActivated then function()
						-- upvalues: p5 (ref), var1 (copy), p3 (copy)
						p5.onRowActivated(var1.id, var1.type, p3)
					end else onActivated,
					primaryCta = p5.primaryCta,
					secondaryCta = p5.secondaryCta,
					ctaLoading = if fFlagUserListCtaIntegrationEnabled then p5.ctaLoading else nil,
					contextualInfo = p5.contextualInfo,
					loadingState = p5.loadingState,
					presence = p5.presence,
					shouldShowNewIndicator = if fFlagAddStatusIndicatorToBaseRow then p5.shouldShowNewIndicator else nil,
					trailingContent = p5.trailingContent,
					configs = configs,
					layoutMode = layoutMode
				})
			})
		end, var1, p3) else reactModule.createElement(view, { tag = "size-full-full", Size = p4, LayoutOrder = p3 }, {
			reactModule.createElement(entityRow, {
				entity = var1,
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