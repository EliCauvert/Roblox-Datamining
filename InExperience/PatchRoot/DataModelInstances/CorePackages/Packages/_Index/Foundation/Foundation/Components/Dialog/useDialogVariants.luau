local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local DialogSizeModule = require(Foundation.Enums.DialogSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local UseDialogModule = require(script.Parent.useDialog)
local config = {
	[DialogSizeModule.Small] = 320,
	[DialogSizeModule.Medium] = 480,
	[DialogSizeModule.Large] = 640
}

local function variantsFactory(p1) --[[ Line: 43 ]]
	-- upvalues: DialogSizeModule (copy), config (copy)
	return {
		common = {
			backdrop = { backgroundStyle = p1.Color.Common.Backdrop },
			shadow = {
				tag = "auto-xy",
				imageStyle = p1.Color.Extended.Black.Black_15
			},
			container = { tag = "col align-x-center align-y-center size-full-full" },
			inner = {
				tag = "shrink-1 size-full-0 auto-y clip bg-surface-100 stroke-default"
			},
			body = { tag = "col size-full auto-y padding-bottom-xlarge" },
			heroMediaWrapper = { tag = "position-top-center size-full-full auto-y" },
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
			[DialogSizeModule.Small] = {
				shadow = { tag = "padding-large" },
				inner = {
					tag = "radius-large",
					maxWidth = config[DialogSizeModule.Small]
				},
				body = { tag = "gap-large padding-x-large" },
				closeAffordance = { offset = p1.Size.Size_300 },
				heroMedia = { tag = "radius-top-large", offsetX = p1.Padding.Large },
				titleText = { tag = "text-heading-small" },
				contentText = { tag = "text-body-medium" },
				actionsLabel = { tag = "padding-top-large" }
			},
			[DialogSizeModule.Medium] = {
				shadow = { tag = "padding-xlarge" },
				inner = {
					tag = "radius-large",
					maxWidth = config[DialogSizeModule.Medium]
				},
				body = { tag = "gap-xlarge padding-x-xlarge" },
				closeAffordance = { offset = p1.Size.Size_400 },
				heroMedia = { tag = "radius-top-large", offsetX = p1.Padding.XLarge },
				titleText = { tag = "text-heading-medium" },
				contentText = { tag = "text-body-medium" },
				actionsLabel = { tag = "padding-top-xlarge" }
			},
			[DialogSizeModule.Large] = {
				shadow = { tag = "padding-xlarge" },
				inner = {
					tag = "radius-large",
					maxWidth = config[DialogSizeModule.Large]
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

function useDialogVariants() --[[ Line: 175 ]]
	-- upvalues: UseTokensModule (copy), VariantsContextModule (copy), variantsFactory (copy), UseDialogModule (copy), ComposeStyleVariantModule (copy)
	local Dialog = VariantsContextModule.useVariants("Dialog", variantsFactory, (UseTokensModule()))
	
	return ComposeStyleVariantModule(Dialog.common, Dialog.size[UseDialogModule().responsiveSize])
end

return {
	useDialogVariants = useDialogVariants,
	DIALOG_SIZES = config
}