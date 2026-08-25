local parent = script.Parent.Parent
local messageBus = require(parent.MessageBus).MessageBus
local tModule = require(parent.t)
local _ = require(script.Parent.ExternalContentSharingProtocolTypes)
local _ = require(parent.MessageBus)
local t = {
	EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR = {
		mid = messageBus.getMessageId("ExternalContentSharing", "shareText"),
		validateParams = tModule.strictInterface({
			text = tModule.string,
			context = tModule.optional(tModule.string)
		})
	},
	EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR = {
		mid = messageBus.getMessageId("ExternalContentSharing", "shareUrl"),
		validateParams = tModule.strictInterface({
			url = tModule.string,
			context = tModule.optional(tModule.string)
		})
	},
	EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR = {
		mid = messageBus.getMessageId("ExternalContentSharing", "shareImage"),
		validateParams = tModule.strictInterface({
			context = tModule.optional(tModule.string),
			image = tModule.string,
			shareSheetTitle = tModule.optional(tModule.string),
			url = tModule.optional(tModule.string)
		})
	},
	EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR = {
		mid = messageBus.getMessageId("ExternalContentSharing", "shareVideo"),
		validateParams = tModule.strictInterface({
			context = tModule.optional(tModule.string),
			shareSheetTitle = tModule.optional(tModule.string),
			url = tModule.optional(tModule.string),
			video = tModule.string
		})
	},
	EXTERNAL_CONTENT_SHARING_SET_CLIPBOARD_TEXT_DESCRIPTOR = {
		mid = messageBus.getMessageId("ExternalContentSharing", "setClipboardText"),
		validateParams = tModule.strictInterface({
			text = tModule.string,
			context = tModule.optional(tModule.string)
		})
	}
}
t.__index = t

function t.new(p0)
	-- upvalues: messageBus (ref), t (ref)
	return setmetatable({ messageBus = p0 or messageBus }, t)
end

function t:shareText(p1)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_TEXT_DESCRIPTOR, p1)
end

function t:shareUrl(p2)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_URL_DESCRIPTOR, p2)
end

function t:shareImage(p3)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_IMAGE_DESCRIPTOR, p3)
end

function t:shareVideo(p4)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SHARE_VIDEO_DESCRIPTOR, p4)
end

function t:setClipboardText(p5)
	self.messageBus.publish(self.EXTERNAL_CONTENT_SHARING_SET_CLIPBOARD_TEXT_DESCRIPTOR, p5)
end

t.default = t.new()

return t