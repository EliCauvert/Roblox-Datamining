local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local inlineRichTextModule = require(parent.InlineRichText)
local createLegalLinkRendererModule = require(authCommon.Utils.createLegalLinkRenderer)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local renderer = inlineRichTextModule.Renderer
local prepareRichTextCopy = inlineRichTextModule.prepareRichTextCopy

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), createLegalLinkRendererModule (ref), prepareRichTextCopy (ref), view (ref), renderer (ref)
	local var1 = useTokens()
	local onLinkActivated = p1.onLinkActivated
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		testId = p1.testId
	}, {
		Text = reactModule.createElement(renderer, {
			text = reactModule.useMemo(function()
				-- upvalues: prepareRichTextCopy (copy), p1 (ref)
				return prepareRichTextCopy(p1.text)
			end, { p1.text }),
			renderers = reactModule.useMemo(function()
				-- upvalues: createLegalLinkRendererModule (copy), onLinkActivated (ref)
				return {
					LINK = createLegalLinkRendererModule(function(p2)
						-- upvalues: onLinkActivated (copy)
						if onLinkActivated then
							onLinkActivated(p2)
						end
					end)
				}
			end, { onLinkActivated }),
			textStyle = var1.Color.Content.Muted,
			fontStyle = var1.Typography.CaptionSmall,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			wrapperProps = { tag = "size-full-0 auto-y" }
		})
	})
end