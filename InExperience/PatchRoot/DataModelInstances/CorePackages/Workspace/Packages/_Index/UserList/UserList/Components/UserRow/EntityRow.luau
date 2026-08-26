local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local userRowModule = require(script.Parent.UserRow)
local contactRowModule = require(script.Parent.ContactRow)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagAddStatusIndicatorToBaseRow = require(parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), enumsModule (ref), contactRowModule (ref), userRowModule (ref), fFlagUserListCtaIntegrationEnabled (ref), fFlagAddStatusIndicatorToBaseRow (ref)
	local entity = p1.entity
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), entity (ref)
		if p1.onActivated then
			p1.onActivated(entity.id, entity.type)
		end
	end, { p1.onActivated, entity.id, entity.type })
	local var2 = if p1.layoutMode == enumsModule.LayoutMode.Horizontal then enumsModule.RowLayoutMode.Compact else enumsModule.RowLayoutMode.Wide
	
	return if entity.type == enumsModule.EntityType.Contact then reactModule.createElement(contactRowModule, {
		entityId = entity.id,
		layoutMode = var2,
		onActivated = var1,
		layoutOrder = p1.layoutOrder,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		contextualInfo = p1.contextualInfo,
		loadingState = p1.loadingState,
		trailingContent = p1.trailingContent,
		configs = p1.configs
	}) else reactModule.createElement(userRowModule, {
		entityId = entity.id,
		layoutMode = var2,
		onActivated = var1,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		ctaLoading = if fFlagUserListCtaIntegrationEnabled then p1.ctaLoading else nil,
		contextualInfo = p1.contextualInfo,
		layoutOrder = p1.layoutOrder,
		loadingState = p1.loadingState,
		presence = p1.presence,
		shouldShowNewIndicator = if fFlagAddStatusIndicatorToBaseRow then p1.shouldShowNewIndicator else nil,
		trailingContent = p1.trailingContent,
		configs = p1.configs
	})
end)