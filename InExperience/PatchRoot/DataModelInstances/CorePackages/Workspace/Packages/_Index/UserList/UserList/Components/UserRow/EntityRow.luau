local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local userRowModule = require(script.Parent.UserRow)
local contactRowModule = require(script.Parent.ContactRow)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagAddStatusIndicatorToBaseRow = require(parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow

return reactModule.memo(function(p0) --[[ line: 43 | named "EntityRow" ]]
	-- upvalues: reactModule (ref), enumsModule (ref), contactRowModule (ref), userRowModule (ref), fFlagUserListCtaIntegrationEnabled (ref), fFlagAddStatusIndicatorToBaseRow (ref)
	local entity = p0.entity
	local var5 = reactModule.useCallback(function() --[[ line: 46 ]]
		-- upvalues: p0 (ref), entity (ref)
		if p0.onActivated then
			p0.onActivated(entity.id, entity.type)
		end
	end, { p0.onActivated, entity.id, entity.type })
	local var6 = if p0.layoutMode == enumsModule.LayoutMode.Horizontal then enumsModule.RowLayoutMode.Compact else enumsModule.RowLayoutMode.Wide
	
	return if entity.type == enumsModule.EntityType.Contact then reactModule.createElement(contactRowModule, {
		entityId = entity.id,
		layoutMode = var6,
		onActivated = var5,
		layoutOrder = p0.layoutOrder,
		primaryCta = p0.primaryCta,
		secondaryCta = p0.secondaryCta,
		contextualInfo = p0.contextualInfo,
		loadingState = p0.loadingState,
		trailingContent = p0.trailingContent,
		configs = p0.configs
	}) else reactModule.createElement(userRowModule, {
		entityId = entity.id,
		layoutMode = var6,
		onActivated = var5,
		primaryCta = p0.primaryCta,
		secondaryCta = p0.secondaryCta,
		ctaLoading = if fFlagUserListCtaIntegrationEnabled then p0.ctaLoading else nil,
		contextualInfo = p0.contextualInfo,
		layoutOrder = p0.layoutOrder,
		loadingState = p0.loadingState,
		presence = p0.presence,
		shouldShowNewIndicator = if fFlagAddStatusIndicatorToBaseRow then p0.shouldShowNewIndicator else nil,
		trailingContent = p0.trailingContent,
		configs = p0.configs
	})
end)