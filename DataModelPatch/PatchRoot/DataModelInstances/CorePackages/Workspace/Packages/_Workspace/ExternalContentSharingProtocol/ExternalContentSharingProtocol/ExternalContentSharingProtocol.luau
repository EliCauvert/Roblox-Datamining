local Parent = script.Parent.Parent
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)
local _ = require(script.Parent.ExternalContentSharingProtocolTypes)
local _ = require(Parent.MessageBus)
local ExternalContentSharingProtocolModule = {
	EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR = {
		mid = MessageBus.getMessageId("ExternalContentSharing", "shareText"),
		validateParams = TModule.strictInterface({
			text = TModule.string,
			context = TModule.optional(TModule.string)
		})
	},
	EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR = {
		mid = MessageBus.getMessageId("ExternalContentSharing", "shareUrl"),
		validateParams = TModule.strictInterface({
			url = TModule.string,
			context = TModule.optional(TModule.string)
		})
	},
	EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR = {
		mid = MessageBus.getMessageId("ExternalContentSharing", "shareImage"),
		validateParams = TModule.strictInterface({
			context = TModule.optional(TModule.string),
			image = TModule.string,
			shareSheetTitle = TModule.optional(TModule.string),
			url = TModule.optional(TModule.string)
		})
	},
	EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR = {
		mid = MessageBus.getMessageId("ExternalContentSharing", "shareVideo"),
		validateParams = TModule.strictInterface({
			context = TModule.optional(TModule.string),
			shareSheetTitle = TModule.optional(TModule.string),
			url = TModule.optional(TModule.string),
			video = TModule.string
		})
	},
	EXTERNAL_CONTENT_SHARING_SET_CLIPBOARD_TEXT_DESCRIPTOR = {
		mid = MessageBus.getMessageId("ExternalContentSharing", "setClipboardText"),
		validateParams = TModule.strictInterface({
			text = TModule.string,
			context = TModule.optional(TModule.string)
		})
	}
}
ExternalContentSharingProtocolModule.__index = ExternalContentSharingProtocolModule

function ExternalContentSharingProtocolModule.new(p1)
	-- upvalues: MessageBus (copy), ExternalContentSharingProtocolModule (copy)
	return (setmetatable({ messageBus = p1 or MessageBus }, ExternalContentSharingProtocolModule))
end

function ExternalContentSharingProtocolModule:shareText(p1)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR, p1)
end

function ExternalContentSharingProtocolModule:shareUrl(p1)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR, p1)
end

function ExternalContentSharingProtocolModule:shareImage(p1)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR, p1)
end

function ExternalContentSharingProtocolModule:shareVideo(p1)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR, p1)
end

function ExternalContentSharingProtocolModule:setClipboardText(p1)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SET_CLIPBOARD_TEXT_DESCRIPTOR, p1)
end

ExternalContentSharingProtocolModule.default = ExternalContentSharingProtocolModule.new()

return ExternalContentSharingProtocolModule