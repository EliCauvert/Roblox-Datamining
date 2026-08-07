local parent = script:FindFirstAncestor("IdentityVerification").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local QRCodeDisplayModule = require(parent.QRCodeDisplay)
local ECLevels = QRCodeDisplayModule.ECLevels

return function(p0) --[[ line: 28 | named "QRDeepLinkDialog" ]]
	-- upvalues: useTokens (ref), reactModule (ref), dialog (ref), dialogSize (ref), view (ref), text (ref), QRCodeDisplayModule (ref), ECLevels (ref)
	local var3 = useTokens()
	
	return reactModule.createElement(dialog.Root, {
		hasBackdrop = true,
		size = dialogSize.Medium,
		onClose = p0.onClose
	}, {
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			DialogView = reactModule.createElement(view, { tag = "col items-stretch size-full-0 auto-y" }, {
				TitleWrapper = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-small",
					padding = {
						right = UDim.new(0, var3.Size.Size_400 + var3.Size.Size_1000),
						top = UDim.new(0, var3.Size.Size_500)
					}
				}, {
					TitleText = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
						Text = p0.title
					})
				}),
				BodyText = reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = p0.description }),
				QRCardWrapper = reactModule.createElement(view, {
					tag = "col align-x-center items-center size-full-0 auto-y margin-y-large",
					LayoutOrder = 3
				}, {
					QRCard = reactModule.createElement(view, {
						tag = "col auto-xy padding-medium",
						cornerRadius = UDim.new(0, 14),
						backgroundStyle = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) }
					}, {
						QRCode = reactModule.createElement(QRCodeDisplayModule.DisplayQRCode, {
							sideLength = 176,
							ecLevel = ECLevels.EC_LEVEL_4,
							toEncode = p0.deeplink,
							backgroundColor = Color3.fromRGB(255, 255, 255),
							pixelColor = Color3.fromRGB(0, 0, 0)
						})
					})
				}),
				FooterText = reactModule.createElement(text, {
					LayoutOrder = 4,
					RichText = true,
					tag = "size-full-0 auto-y padding-bottom-small text-body-medium text-wrap text-align-x-left",
					Text = p0.footer
				})
			})
		})
	})
end