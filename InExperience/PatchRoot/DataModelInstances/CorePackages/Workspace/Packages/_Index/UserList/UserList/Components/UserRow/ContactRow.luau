local userList = script:FindFirstAncestor("UserList")
local reactModule = require(userList.Parent.React)
local _ = require(userList.Common.Types)
local _ = require(userList.Common.Enums)
local baseRowModule = require(script.Parent.BaseRow)
local useContactsDataModule = require(userList.Hooks.useContactsData)

return reactModule.memo(function(p0) --[[ line: 34 | named "ContactRow" ]]
	-- upvalues: useContactsDataModule (ref), reactModule (ref), baseRowModule (ref)
	local var4 = useContactsDataModule(p0.entityId)
	
	return if var4 == nil then nil else reactModule.createElement(baseRowModule, {
		avatarThumbnailUrl = var4.avatarThumbnailUrl,
		title = var4.name,
		layoutMode = p0.layoutMode,
		onActivated = p0.onActivated,
		isTitleLoading = if p0.loadingState and p0.loadingState.title ~= nil then p0.loadingState.title else var4.isLoading,
		isContextualInfoLoading = p0.loadingState and p0.loadingState.contextualInfo,
		contextualInfo = p0.contextualInfo,
		primaryCta = p0.primaryCta,
		secondaryCta = p0.secondaryCta,
		trailingContent = p0.trailingContent,
		layoutOrder = p0.layoutOrder
	})
end)