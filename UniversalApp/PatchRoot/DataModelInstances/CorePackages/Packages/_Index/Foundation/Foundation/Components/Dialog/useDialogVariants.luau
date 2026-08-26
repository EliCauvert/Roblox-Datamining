local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local dialogSizeModule = require(foundation.Enums.DialogSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Providers.Style.Tokens)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local useDialogModule = require(script.Parent.useDialog)
local t = {
	[dialogSizeModule.Small] = 320,
	[dialogSizeModule.Medium] = 480,
	[dialogSizeModule.Large] = 640
}

local function variantsFactory(p1)
	-- upvalues: flagsModule (ref), dialogSizeModule (ref), t (ref)
	return {
		common = {
			backdrop = { backgroundStyle = p1.Color.Common.Backdrop },
			shadow = {
				tag = "auto-xy",
				imageStyle = p1.Color.Extended.Black.Black_15
			},
			container = { tag = "col align-x-center align-y-center size-full-full" },
			inner = {
				tag = if flagsModule.FoundationDialogBetaUpdate then "shrink-1 size-full-0 auto-y clip bg-surface-100 stroke-default" else "shrink-1 size-full-0 auto-y clip bg-surface-100"
			},
			body = { tag = "col size-full auto-y padding-bottom-xlarge" },
			heroMediaWrapper = {
				tag = if flagsModule.FoundationDialogBetaUpdate then "position-top-center size-full-full auto-y" else "shrink position-top-center size-full-full auto-y"
			},
			title = { tag = "size-full-0 auto-y" },
			titleText = {
				tag = "size-full-0 auto-y text-wrap text-align-x-left content-emphasis"
			},
			content = { tag = "fill size-full auto-y" },
			contentText = {
				tag = "size-full-0 auto-y text-wrap text-align-x-left text-align-y-top"
			},
			actionsLabel = {
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left text-align-y-top"
			}
		},
		size = {
			[dialogSizeModule.Small] = {
				shadow = { tag = "padding-large" },
				inner = {
					maxWidth = t[dialogSizeModule.Small],
					tag = if flagsModule.FoundationDialogBetaUpdate then "radius-large" else "radius-medium"
				},
				body = { tag = "gap-large padding-x-large" },
				closeAffordance = { offset = p1.Size.Size_300 },
				heroMedia = {
					tag = if flagsModule.FoundationDialogBetaUpdate then "radius-top-large" else "radius-top-medium",
					offsetX = p1.Padding.Large
				},
				titleText = { tag = "text-heading-small" },
				contentText = { tag = "text-body-medium" },
				actionsLabel = { tag = "padding-top-large" }
			},
			[dialogSizeModule.Medium] = {
				shadow = { tag = "padding-xlarge" },
				inner = {
					tag = "radius-large",
					maxWidth = t[dialogSizeModule.Medium]
				},
				body = { tag = "gap-xlarge padding-x-xlarge" },
				closeAffordance = { offset = p1.Size.Size_400 },
				heroMedia = { tag = "radius-top-large", offsetX = p1.Padding.XLarge },
				titleText = { tag = "text-heading-medium" },
				contentText = { tag = "text-body-medium" },
				actionsLabel = { tag = "padding-top-xlarge" }
			},
			[dialogSizeModule.Large] = {
				shadow = { tag = "padding-xlarge" },
				inner = {
					tag = "radius-large",
					maxWidth = t[dialogSizeModule.Large]
				},
				body = { tag = "gap-xlarge padding-x-xlarge" },
				closeAffordance = { offset = p1.Size.Size_400 },
				heroMedia = { tag = "radius-top-large", offsetX = p1.Padding.XLarge },
				titleText = { tag = "text-heading-large" },
				contentText = { tag = "text-body-large" },
				actionsLabel = { tag = "padding-top-xlarge" }
			}
		}
	}
end

function useDialogVariants()
	-- upvalues: useTokensModule (ref), variantsContextModule (ref), variantsFactory (ref), useDialogModule (ref), composeStyleVariantModule (ref)
	local dialog = variantsContextModule.useVariants("Dialog", variantsFactory, useTokensModule())
	
	return composeStyleVariantModule(dialog.common, dialog.size[useDialogModule().responsiveSize])
end

return { useDialogVariants = useDialogVariants, DIALOG_SIZES = t }