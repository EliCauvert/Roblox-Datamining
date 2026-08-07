local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local translateModule = require(script.Parent.translate)
local useTokens = foundationModule.Hooks.useTokens
local translateIntoString = translateModule.translateIntoString
local translateIntoRichTextString = translateModule.translateIntoRichTextString
local var3 = reactModule.createContext(nil)

return {
	ArTranslationContext = var3,
	ArTranslationProvider = function(p0) --[[ line: 27 ]]
		-- upvalues: useTokens (ref), reactModule (ref), translateIntoString (ref), translateIntoRichTextString (ref), var3 (ref)
		local color3 = useTokens().Color.Content.Link.Color3
		
		return reactModule.createElement(var3.Provider, {
			value = reactModule.useMemo(function() --[[ line: 31 ]]
				-- upvalues: translateIntoString (copy), p0 (ref), translateIntoRichTextString (copy), color3 (ref)
				return {
					translateIntoString = function(p1) --[[ line: 32 ]]
						-- upvalues: translateIntoString (copy), p0 (copy)
						return translateIntoString(p0.translations, p1)
					end,
					translateIntoRichTextString = function(p2) --[[ line: 36 ]]
						-- upvalues: translateIntoRichTextString (copy), p0 (copy), color3 (copy)
						return translateIntoRichTextString(p0.translations, p2, color3)
					end
				}
			end, { p0.translations, color3 })
		}, p0.children)
	end,
	useArTranslation = function() --[[ line: 51 ]]
		-- upvalues: reactModule (ref), var3 (ref)
		local var4 = reactModule.useContext(var3)
		
		if not var4 then
			error("Invalid use of `useArTranslation` hook. Ensure your component has an ancestor wrapped in `ArTranslationProvider`")
		end
		return var4
	end
}