local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local parent = chatLineReporting.Parent
local constantsModule = require(chatLineReporting.Common.Constants)
local getMessageTextModule = require(chatLineReporting.Common.getMessageText)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text

return function(p0)
	-- upvalues: reactModule (ref), getMessageTextModule (ref), view (ref), constantsModule (ref), text (ref)
	local var5, var6 = reactModule.useState(nil)
	local var7 = getMessageTextModule(p0.selectedMessage.useTranslation, p0.selectedMessage.translation, p0.selectedMessage.text)
	local var5_1 = var5 or (p0.selectedMessage.prefixText or "")
	local userId = p0.selectedMessage.userId
	
	if userId and userId.data then
		local names = userId.data.userProfiles[1].names
		var6(string.gsub(var5_1, names.displayName, names.combinedName))
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
				Text = `{var5_1} {var7}`,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
end