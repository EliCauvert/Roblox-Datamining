local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local _ = require(parent.React)
local assetCardTypesModule = require(appChat.Components.ChatConversation.AssetCardView.AssetCardTypes)
local _ = require(appChat.Components.ChatConversation.Grouping.MessageGroupShape)
local momentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local _ = require(script.Parent.MomentShareCardView)
local iconName = foundationModule.Enums.IconName
local status = assetCardTypesModule.Status
local t = {
	[momentDetailsStatusModule.Loading] = status.Loading,
	[momentDetailsStatusModule.Ready] = status.Ready,
	[momentDetailsStatusModule.Unavailable] = status.Error,
	[momentDetailsStatusModule.Locked] = status.Error,
	[momentDetailsStatusModule.Error] = status.Error
}

return function(value, p1)
	-- upvalues: t (ref), status (ref), momentDetailsStatusModule (ref), iconName (ref)
	local status_1 = t[value.status] or status.Loading
	
	return {
		status = status_1,
		errorText = if status_1 ~= status.Error then if value.status == momentDetailsStatusModule.Error then p1.errorText else p1.unavailableText else nil,
		groupShape = p1.groupShape,
		mediaRef = p1.mediaRef,
		media = {
			aspectRatio = 1,
			image = if value.hasMedia then value.posterContent else nil,
			isLoading = not value.isPosterLoaded,
			overlayIcon = if value.isVideo then iconName.PlayLarge else nil,
			onActivated = value.onActivated,
			isSelectable = value.selectable
		},
		footer = {
			titleText = value.username,
			isTitleLoading = value.isUsernameLoading,
			subtitleText = value.metadataText,
			subtitleIcon = if p1.showMomentsGlyph then iconName.Moments else nil,
			isSubtitleLoading = value.isMetadataLoading,
			onActivated = value.onActivated
		}
	}
end