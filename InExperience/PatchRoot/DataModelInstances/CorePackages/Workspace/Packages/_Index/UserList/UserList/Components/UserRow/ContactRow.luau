local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local _ = require(userList.Common.Types)
local _ = require(userList.Common.Enums)
local baseRowModule = require(script.Parent.BaseRow)
local useContactsDataModule = require(userList.Hooks.useContactsData)

return reactModule.memo(function(p1)
	-- upvalues: useContactsDataModule (ref), reactModule (ref), baseRowModule (ref)
	local var1 = useContactsDataModule(p1.entityId)
	
	return if var1 == nil then nil else reactModule.createElement(baseRowModule, {
		avatarThumbnailUrl = var1.avatarThumbnailUrl,
		title = var1.name,
		layoutMode = p1.layoutMode,
		onActivated = p1.onActivated,
		isTitleLoading = if p1.loadingState and p1.loadingState.title ~= nil then p1.loadingState.title else var1.isLoading,
		isContextualInfoLoading = p1.loadingState and p1.loadingState.contextualInfo,
		contextualInfo = p1.contextualInfo,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		trailingContent = p1.trailingContent,
		layoutOrder = p1.layoutOrder
	})
end)