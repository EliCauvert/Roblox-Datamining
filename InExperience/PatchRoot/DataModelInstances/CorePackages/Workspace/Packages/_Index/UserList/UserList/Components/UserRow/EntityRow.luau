local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local enumsModule = require(userList.Common.Enums)
local _ = require(userList.Common.Types)
local userRowModule = require(script.Parent.UserRow)
local contactRowModule = require(script.Parent.ContactRow)

return reactModule.memo(function(p0) --[[ line: 37 | named "EntityRow" ]]
	-- upvalues: reactModule (ref), enumsModule (ref), contactRowModule (ref), userRowModule (ref)
	local entity = p0.entity
	local var5 = reactModule.useCallback(function() --[[ line: 40 ]]
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
		contextualInfo = p0.contextualInfo,
		layoutOrder = p0.layoutOrder,
		loadingState = p0.loadingState,
		presence = p0.presence,
		trailingContent = p0.trailingContent,
		configs = p0.configs
	})
end)