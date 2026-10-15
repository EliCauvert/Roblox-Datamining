local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local escapeRichTextModule = require(chatUIPrimitives.Utils.escapeRichText)
local _ = require(script.Parent.PresetTypes)
local getPresetIconRichTextModule = require(script.Parent.getPresetIconRichText)

return function(value)
	-- upvalues: foundationModule (ref), signalsReactModule (ref), reactModule (ref), getPresetIconRichTextModule (ref), escapeRichTextModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: getPresetIconRichTextModule (copy), var1 (ref)
		return getPresetIconRichTextModule(var1.Typography.BodyLarge.FontSize)
	end, { var1 })
	
	return reactModule.createElement(foundationModule.Text, {
		tag = "size-full-0 auto-y text-wrap text-align-x-left text-align-y-top",
		RichText = true,
		Text = signalsReactModule.useSignalBinding(value.getContent):map(function(p1)
			-- upvalues: escapeRichTextModule (copy), var2 (ref)
			return `{escapeRichTextModule(p1.displayText)} {var2}`
		end),
		LayoutOrder = value.LayoutOrder
	})
end