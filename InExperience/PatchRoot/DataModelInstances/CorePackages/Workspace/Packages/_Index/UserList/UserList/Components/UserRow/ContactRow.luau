local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local _ = require(UserList.Common.Types)
local _ = require(UserList.Common.Enums)
local BaseRowModule = require(script.Parent.BaseRow)
local UseContactsDataModule = require(UserList.Hooks.useContactsData)
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions

return ReactModule.memo(function(p1)
	-- upvalues: UseContactsDataModule (copy), ReactModule (copy), BaseRowModule (copy), FFlagUserListSurfaceExtensions (copy)
	local UseContactsDataModuleResult = UseContactsDataModule(p1.entityId)
	
	return if UseContactsDataModuleResult == nil then nil else ReactModule.createElement(BaseRowModule, {
		avatarThumbnailUrl = UseContactsDataModuleResult.avatarThumbnailUrl,
		title = UseContactsDataModuleResult.name,
		layoutMode = p1.layoutMode,
		onActivated = p1.onActivated,
		isTitleLoading = if p1.loadingState and p1.loadingState.title ~= nil then p1.loadingState.title else UseContactsDataModuleResult.isLoading,
		isContextualInfoLoading = p1.loadingState and p1.loadingState.contextualInfo,
		contextualInfo = p1.contextualInfo,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		trailingContent = p1.trailingContent,
		layoutOrder = p1.layoutOrder,
		disableRowActivation = if FFlagUserListSurfaceExtensions and p1.configs then p1.configs.disableRowActivation else nil
	})
end)