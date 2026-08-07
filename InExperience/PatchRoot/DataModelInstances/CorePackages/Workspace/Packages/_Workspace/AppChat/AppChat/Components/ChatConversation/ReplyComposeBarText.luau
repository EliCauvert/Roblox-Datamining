local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local t = { layoutOrder = 2, userText = "", contentText = "" }

function ReplyComposeBarText(p0) --[[ line: 22 ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), view (ref), text (ref)
	local var4 = cryoModule.Dictionary.union(t, p0)
	
	return reactModule.createElement(view, {
		tag = "col fill auto-y align-x-left clip",
		LayoutOrder = var4.layoutOrder
	}, {
		UserReplyingTo = reactModule.createElement(text, {
			tag = "text-caption-medium content-muted text-truncate-end text-align-x-left auto-xy",
			LayoutOrder = 1,
			Text = var4.userText
		}),
		ContentReplyingTo = reactModule.createElement(text, {
			tag = "text-body-medium content-emphasis text-truncate-end text-align-x-left auto-xy",
			LayoutOrder = 2,
			Text = var4.contentText
		})
	})
end

return reactModule.memo(ReplyComposeBarText)