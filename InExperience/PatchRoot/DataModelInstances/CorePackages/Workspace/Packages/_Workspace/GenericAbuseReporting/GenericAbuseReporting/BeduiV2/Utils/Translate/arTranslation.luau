local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local translateModule = require(script.Parent.translate)
local useTokens = foundationModule.Hooks.useTokens
local translateIntoString = translateModule.translateIntoString
local translateIntoRichTextString = translateModule.translateIntoRichTextString
local var1 = reactModule.createContext(nil)

return {
	ArTranslationContext = var1,
	ArTranslationProvider = function(p1)
		-- upvalues: useTokens (ref), reactModule (ref), translateIntoString (ref), translateIntoRichTextString (ref), var1 (ref)
		local color3 = useTokens().Color.Content.Link.Color3
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: translateIntoString (copy), p1 (ref), translateIntoRichTextString (copy), color3 (ref)
				return {
					translateIntoString = function(p2)
						-- upvalues: translateIntoString (copy), p1 (copy)
						return translateIntoString(p1.translations, p2)
					end,
					translateIntoRichTextString = function(p2)
						-- upvalues: translateIntoRichTextString (copy), p1 (copy), color3 (copy)
						return translateIntoRichTextString(p1.translations, p2, color3)
					end
				}
			end, { p1.translations, color3 })
		}, p1.children)
	end,
	useArTranslation = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if not var2 then
			error("Invalid use of `useArTranslation` hook. Ensure your component has an ancestor wrapped in `ArTranslationProvider`")
		end
		return var2
	end
}