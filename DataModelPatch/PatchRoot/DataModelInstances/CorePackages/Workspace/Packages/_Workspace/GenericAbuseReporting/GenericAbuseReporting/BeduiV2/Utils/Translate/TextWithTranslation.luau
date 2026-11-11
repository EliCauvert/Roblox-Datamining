local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ControlState = FoundationModule.Enums.ControlState
local Text = FoundationModule.Text
local UseOpenLinkModule = require(GenericAbuseReporting.BeduiV2.Hooks.useOpenLink)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local AddFontStyleToTextWithTranslation = game:DefineFastFlag("AddFontStyleToTextWithTranslation", false)
local AddUnderlineToLinksInTextWithTranslation = game:DefineFastFlag("AddUnderlineToLinksInTextWithTranslation", false)

return ReactModule.memo(function(p1)
	-- upvalues: UseArTranslationFunction (copy), UseOpenLinkModule (copy), ReactModule (copy), AddUnderlineToLinksInTextWithTranslation (copy), ControlState (copy), Text (copy), AddFontStyleToTextWithTranslation (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local TranslateIntoRichTextStringFunction = UseArTranslationFunction().translateIntoRichTextString
	local UseOpenLinkModuleResult = UseOpenLinkModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: TranslateIntoRichTextStringFunction (copy), p1 (copy)
		return TranslateIntoRichTextStringFunction(p1.input)
	end, { p1.input, TranslateIntoRichTextStringFunction })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult2 (copy), UseOpenLinkModuleResult (copy), TranslateIntoStringFunction (copy), p1 (copy)
		UseOpenLinkModuleResult(TranslateIntoStringFunction(p1.input), if UseMemoResult2 == nil then nil else UseMemoResult2.href)
	end, {
		UseMemoResult2,
		p1.input,
		UseOpenLinkModuleResult,
		TranslateIntoStringFunction
	})
	local UseResult1 = if AddUnderlineToLinksInTextWithTranslation then ReactModule.useCallback(function(Hover)
		-- upvalues: ControlState (upval), UseStateResult2 (copy)
		if Hover == ControlState.Hover then
			UseStateResult2(true)
			
			return
		else
			UseStateResult2(false)
		end
	end, {}) else nil
	
	return ReactModule.createElement(Text, {
		RichText = true,
		TextWrapped = true,
		Text = if UseStateResult then `<u>{UseMemoResult}</u>` else UseMemoResult,
		TextXAlignment = Enum.TextXAlignment.Left,
		fontStyle = if AddFontStyleToTextWithTranslation then p1.fontStyle else nil,
		tag = p1.tag,
		LayoutOrder = p1.layoutOrder,
		onActivated = if UseMemoResult2 == nil then nil else UseResult,
		onStateChanged = if AddUnderlineToLinksInTextWithTranslation and UseMemoResult2 ~= nil then UseResult1 else nil
	})
end)