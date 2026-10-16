local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local UserRowModule = require(script.Parent.UserRow)
local ContactRowModule = require(script.Parent.ContactRow)
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagAddStatusIndicatorToBaseRow = require(Parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow

return ReactModule.memo(function(p1) --[[ Line: 43 | Named "EntityRow" ]]
	-- upvalues: ReactModule (copy), EnumsModule (copy), ContactRowModule (copy), UserRowModule (copy), FFlagUserListCtaIntegrationEnabled (copy), FFlagAddStatusIndicatorToBaseRow (copy)
	local Entity = p1.entity
	local UseResult = ReactModule.useCallback(function() --[[ Line: 46 ]]
		-- upvalues: p1 (copy), Entity (copy)
		if p1.onActivated then
			p1.onActivated(Entity.id, Entity.type)
		end
	end, { p1.onActivated, Entity.id, Entity.type })
	local Compact = if p1.layoutMode == EnumsModule.LayoutMode.Horizontal then EnumsModule.RowLayoutMode.Compact else EnumsModule.RowLayoutMode.Wide
	
	return if Entity.type == EnumsModule.EntityType.Contact then ReactModule.createElement(ContactRowModule, {
		entityId = Entity.id,
		layoutMode = Compact,
		onActivated = UseResult,
		layoutOrder = p1.layoutOrder,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		contextualInfo = p1.contextualInfo,
		loadingState = p1.loadingState,
		trailingContent = p1.trailingContent,
		configs = p1.configs
	}) else ReactModule.createElement(UserRowModule, {
		entityId = Entity.id,
		layoutMode = Compact,
		onActivated = UseResult,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		ctaLoading = if FFlagUserListCtaIntegrationEnabled then p1.ctaLoading else nil,
		contextualInfo = p1.contextualInfo,
		layoutOrder = p1.layoutOrder,
		loadingState = p1.loadingState,
		presence = p1.presence,
		shouldShowNewIndicator = if FFlagAddStatusIndicatorToBaseRow then p1.shouldShowNewIndicator else nil,
		trailingContent = p1.trailingContent,
		configs = p1.configs
	})
end)