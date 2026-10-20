local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.React)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local MomentDetailsStatusModule = require(script.Parent.MomentDetailsStatus)
local _ = require(script.Parent.MomentShareCardView)
local IconName = require(Parent.Foundation).Enums.IconName
local Status = require(AppChat.Components.ChatConversation.AssetCardView.AssetCardTypes).Status
local config = {
	[MomentDetailsStatusModule.Loading] = Status.Loading,
	[MomentDetailsStatusModule.Ready] = Status.Ready,
	[MomentDetailsStatusModule.Unavailable] = Status.Error,
	[MomentDetailsStatusModule.Locked] = Status.Error,
	[MomentDetailsStatusModule.Error] = Status.Error
}

return function(p1, p2)
	-- upvalues: config (copy), Status (copy), MomentDetailsStatusModule (copy), IconName (copy)
	local Entry = config[p1.status] or Status.Loading
	
	return {
		status = Entry,
		errorText = if Entry == Status.Error then if p1.status == MomentDetailsStatusModule.Error then p2.errorText else p2.unavailableText else nil,
		groupShape = p2.groupShape,
		mediaRef = p2.mediaRef,
		media = {
			aspectRatio = 1,
			image = if p1.hasMedia then p1.posterContent else nil,
			isLoading = not p1.isPosterLoaded,
			overlayIcon = if p1.isVideo then IconName.PlayLarge else nil,
			onActivated = p1.onActivated,
			isSelectable = p1.selectable
		},
		footer = {
			titleText = p1.username,
			isTitleLoading = p1.isUsernameLoading,
			subtitleText = p1.metadataText,
			subtitleIcon = if p2.showMomentsGlyph then IconName.Moments else nil,
			isSubtitleLoading = p1.isMetadataLoading,
			onActivated = p1.onActivated
		}
	}
end