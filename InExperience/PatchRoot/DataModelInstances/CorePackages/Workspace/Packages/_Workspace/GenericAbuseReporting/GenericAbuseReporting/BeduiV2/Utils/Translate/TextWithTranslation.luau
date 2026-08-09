local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local controlState = foundationModule.Enums.ControlState
local text = foundationModule.Text
local useOpenLinkModule = require(genericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local addFontStyleToTextWithTranslation = game:DefineFastFlag("AddFontStyleToTextWithTranslation", false)
local addUnderlineToLinksInTextWithTranslation = game:DefineFastFlag("AddUnderlineToLinksInTextWithTranslation", false)

return reactModule.memo(function(p0) --[[ line: 36 | named "TextWithTranslation" ]]
	-- upvalues: useArTranslation (ref), useOpenLinkModule (ref), reactModule (ref), addUnderlineToLinksInTextWithTranslation (ref), controlState (ref), text (ref), addFontStyleToTextWithTranslation (ref)
	local translateIntoString = useArTranslation().translateIntoString
	local translateIntoRichTextString = useArTranslation().translateIntoRichTextString
	local var6 = useOpenLinkModule()
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useMemo(function() --[[ line: 42 ]]
		-- upvalues: translateIntoRichTextString (ref), p0 (ref)
		return translateIntoRichTextString(p0.input)
	end, { p0.input, translateIntoRichTextString })
	
	return reactModule.createElement(text, {
		RichText = true,
		TextWrapped = true,
		Text = if var7 then `<u>{var9}</u>` else var9,
		TextXAlignment = Enum.TextXAlignment.Left,
		fontStyle = if addFontStyleToTextWithTranslation then p0.fontStyle else nil,
		tag = p0.tag,
		LayoutOrder = p0.layoutOrder,
		onActivated = if var10 ~= nil then nil else reactModule.useCallback(function() --[[ line: 46 ]]
			-- upvalues: var10 (ref), var6 (ref), translateIntoString (ref), p0 (ref)
			var6(translateIntoString(p0.input), if var10 ~= nil then var10.href else nil)
		end, { var10, p0.input, var6, translateIntoString }),
		onStateChanged = if addUnderlineToLinksInTextWithTranslation and var10 ~= nil then if addUnderlineToLinksInTextWithTranslation then reactModule.useCallback(function(p1) --[[ line: 55 ]]
			-- upvalues: controlState (copy), var8 (ref)
			if p1 == controlState.Hover then
				var8(true)
				
				return
			end
			var8(false)
		end, {}) else nil else nil
	})
end)