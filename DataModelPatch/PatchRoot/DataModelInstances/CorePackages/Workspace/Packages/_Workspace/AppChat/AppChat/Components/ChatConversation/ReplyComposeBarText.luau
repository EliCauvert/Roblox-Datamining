local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local config = { layoutOrder = 2, userText = "", contentText = "" }

function ReplyComposeBarText(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), View (copy), Text (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	
	return ReactModule.createElement(View, {
		tag = "col fill auto-y align-x-left clip",
		LayoutOrder = UnionResult.layoutOrder
	}, {
		UserReplyingTo = ReactModule.createElement(Text, {
			tag = "text-caption-medium content-muted text-truncate-end text-align-x-left auto-xy",
			LayoutOrder = 1,
			Text = UnionResult.userText
		}),
		ContentReplyingTo = ReactModule.createElement(Text, {
			tag = "text-body-medium content-emphasis text-truncate-end text-align-x-left auto-xy",
			LayoutOrder = 2,
			Text = UnionResult.contentText
		})
	})
end

return ReactModule.memo(ReplyComposeBarText)