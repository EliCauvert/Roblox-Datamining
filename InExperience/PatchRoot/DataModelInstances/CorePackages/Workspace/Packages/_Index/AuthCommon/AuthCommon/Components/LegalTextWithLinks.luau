local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local InlineRichTextModule = require(Parent.InlineRichText)
local CreateLegalLinkRendererModule = require(AuthCommon.Utils.createLegalLinkRenderer)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Renderer = InlineRichTextModule.Renderer
local PrepareRichTextCopyFunction = InlineRichTextModule.prepareRichTextCopy

return function(Frame) --[[ Line: 23 | Named "LegalTextWithLinks" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CreateLegalLinkRendererModule (copy), PrepareRichTextCopyFunction (copy), View (copy), Renderer (copy)
	local UseTokensResult = UseTokensFunction()
	local OnLinkActivatedFunction = Frame.onLinkActivated
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Text = ReactModule.createElement(Renderer, {
			text = ReactModule.useMemo(function() --[[ Line: 35 ]]
				-- upvalues: PrepareRichTextCopyFunction (upval), Frame (copy)
				return PrepareRichTextCopyFunction(Frame.text)
			end, { Frame.text }),
			renderers = ReactModule.useMemo(function() --[[ Line: 26 ]]
				-- upvalues: CreateLegalLinkRendererModule (upval), OnLinkActivatedFunction (copy)
				return {
					LINK = CreateLegalLinkRendererModule(function(p1) --[[ Line: 28 ]]
						-- upvalues: OnLinkActivatedFunction (upval)
						if OnLinkActivatedFunction then
							OnLinkActivatedFunction(p1)
						end
					end)
				}
			end, { OnLinkActivatedFunction }),
			textStyle = UseTokensResult.Color.Content.Muted,
			fontStyle = UseTokensResult.Typography.CaptionSmall,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			wrapperProps = { tag = "size-full-0 auto-y" }
		})
	})
end