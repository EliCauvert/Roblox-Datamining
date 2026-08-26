local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local t = { layoutOrder = 2, userText = "", contentText = "" }

function ReplyComposeBarText(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), view (ref), text (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	
	return reactModule.createElement(view, {
		tag = "col fill auto-y align-x-left clip",
		LayoutOrder = var1.layoutOrder
	}, {
		UserReplyingTo = reactModule.createElement(text, {
			tag = "text-caption-medium content-muted text-truncate-end text-align-x-left auto-xy",
			LayoutOrder = 1,
			Text = var1.userText
		}),
		ContentReplyingTo = reactModule.createElement(text, {
			tag = "text-body-medium content-emphasis text-truncate-end text-align-x-left auto-xy",
			LayoutOrder = 2,
			Text = var1.contentText
		})
	})
end

return reactModule.memo(ReplyComposeBarText)