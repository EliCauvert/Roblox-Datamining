local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(UserList.Common.Enums)
local _ = require(UserList.Common.Types)
local UserRowModule = require(script.Parent.UserRow)
local ContactRowModule = require(script.Parent.ContactRow)
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagUserListClientRowProps = require(Parent.SharedFlags).FFlagUserListClientRowProps

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), EnumsModule (copy), ContactRowModule (copy), UserRowModule (copy), FFlagUserListCtaIntegrationEnabled (copy), FFlagUserListClientRowProps (copy)
	local Entity = p1.entity
	local UseResult = ReactModule.useCallback(function()
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
		shouldShowNewIndicator = p1.shouldShowNewIndicator,
		trailingContent = p1.trailingContent,
		configs = p1.configs,
		primaryClientAction = if FFlagUserListClientRowProps then p1.primaryClientAction else nil,
		secondaryClientAction = if FFlagUserListClientRowProps then p1.secondaryClientAction else nil,
		onClientActionSuccess = if FFlagUserListClientRowProps then p1.onClientActionSuccess else nil,
		contextualInfoSource = if FFlagUserListClientRowProps then p1.contextualInfoSource else nil,
		rowSize = if FFlagUserListClientRowProps then p1.rowSize else nil,
		showToast = if FFlagUserListClientRowProps then p1.showToast else nil,
		friendshipOriginSourceType = if FFlagUserListClientRowProps then p1.friendshipOriginSourceType else nil
	})
end)