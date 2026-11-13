local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local TranslateModule = require(script.Parent.translate)
local FFlagAbuseReportTranslateColorWrapperModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportTranslateColorWrapper)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local TranslateIntoStringFunction = TranslateModule.translateIntoString
local TranslateIntoRichTextStringFunction = TranslateModule.translateIntoRichTextString
local Context = ReactModule.createContext(nil)

return {
	ArTranslationContext = Context,
	ArTranslationProvider = function(p1)
		-- upvalues: FFlagAbuseReportTranslateColorWrapperModule (copy), UseTokensFunction (copy), ReactModule (copy), TranslateIntoStringFunction (copy), TranslateIntoRichTextStringFunction (copy), Context (copy)
		local UseTokensResult = if FFlagAbuseReportTranslateColorWrapperModule then UseTokensFunction() else nil
		local Text = if FFlagAbuseReportTranslateColorWrapperModule then `#{UseTokensResult.Color.Content.Link.Color3:ToHex()}` else nil
		
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: TranslateIntoStringFunction (upval), p1 (copy), TranslateIntoRichTextStringFunction (upval), Text (copy)
				return {
					translateIntoString = function(p2)
						-- upvalues: TranslateIntoStringFunction (upval), p1 (upval)
						return TranslateIntoStringFunction(p1.translations, p2)
					end,
					translateIntoRichTextString = function(p2, p3)
						-- upvalues: TranslateIntoRichTextStringFunction (upval), p1 (upval), Text (upval)
						return TranslateIntoRichTextStringFunction(p1.translations, p2, Text, p3)
					end
				}
			end, { p1.translations, Text })
		}, p1.children)
	end,
	useArTranslation = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if not UseContextResult then
			error("Invalid use of `useArTranslation` hook. Ensure your component has an ancestor wrapped in `ArTranslationProvider`")
		end
		return UseContextResult
	end
}