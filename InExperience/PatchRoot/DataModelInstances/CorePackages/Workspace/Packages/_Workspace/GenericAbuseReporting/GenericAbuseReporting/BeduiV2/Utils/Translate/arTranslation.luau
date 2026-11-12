local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local TranslateModule = require(script.Parent.translate)
local TranslateIntoStringFunction = TranslateModule.translateIntoString
local TranslateIntoRichTextStringFunction = TranslateModule.translateIntoRichTextString
local Context = ReactModule.createContext(nil)

return {
	ArTranslationContext = Context,
	ArTranslationProvider = function(p1)
		-- upvalues: ReactModule (copy), TranslateIntoStringFunction (copy), TranslateIntoRichTextStringFunction (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: TranslateIntoStringFunction (upval), p1 (copy), TranslateIntoRichTextStringFunction (upval)
				return {
					translateIntoString = function(p2)
						-- upvalues: TranslateIntoStringFunction (upval), p1 (upval)
						return TranslateIntoStringFunction(p1.translations, p2)
					end,
					translateIntoRichTextString = function(p2)
						-- upvalues: TranslateIntoRichTextStringFunction (upval), p1 (upval)
						return TranslateIntoRichTextStringFunction(p1.translations, p2)
					end
				}
			end, { p1.translations })
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