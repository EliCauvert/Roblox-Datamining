local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local InGameAvatarPreviewContainerModule = require(AvatarWorkshop.Components.InGameAvatarPreview.InGameAvatarPreviewContainer)
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), InGameAvatarPreviewContainerModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-full radius-medium bg-shift-200",
		testId = "avatar-workshop-avatar-preview"
	}, {
		Preview = if p1.avatarState then ReactModule.createElement(InGameAvatarPreviewContainerModule, { avatarState = p1.avatarState }) elseif p1.loadFailed then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full padding-large",
			testId = "avatar-workshop-avatar-preview-error"
		}, {
			ErrorState = ReactModule.createElement(FoundationModule.Empty, {
				text = p1.loadErrorText,
				button = { text = p1.tryAgainText, onActivated = p1.onTryAgain }
			})
		}) else ReactModule.createElement(FoundationModule.View, {
			tag = "row align-x-center align-y-center size-full",
			testId = "avatar-workshop-avatar-preview-loading"
		}, {
			Loading = ReactModule.createElement(FoundationModule.Loading)
		})
	})
end