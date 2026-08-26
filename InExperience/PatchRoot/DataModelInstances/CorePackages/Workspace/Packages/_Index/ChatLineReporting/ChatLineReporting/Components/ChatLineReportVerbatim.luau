local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local constantsModule = require(chatLineReporting.Common.Constants)
local getMessageTextModule = require(chatLineReporting.Common.getMessageText)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text

return function(p1)
	-- upvalues: reactModule (ref), getMessageTextModule (ref), view (ref), constantsModule (ref), text (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = getMessageTextModule(p1.selectedMessage.useTranslation, p1.selectedMessage.translation, p1.selectedMessage.text)
	local var4 = var1 or (p1.selectedMessage.prefixText or "")
	local userId = p1.selectedMessage.userId
	
	if userId and userId.data then
		local names = userId.data.userProfiles[1].names
		var2(string.gsub(var4, names.displayName, names.combinedName))
	end
	return reactModule.createElement(view, {
		tag = "radius-medium padding-left-medium padding-right-medium stroke-neutral stroke-standard",
		Size = UDim2.new(1, 0, 0, constantsModule.SelectableChatLineHeight)
	}, {
		messageFrame = reactModule.createElement(view, { tag = "auto-xy position-center-left anchor-center-left" }, {
			messageText = reactModule.createElement(text, {
				TextScaled = false,
				RichText = true,
				tag = "auto-xy content-muted",
				Text = `{var4} {var3}`,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
end