local Parent = script:FindFirstAncestor("IdentityVerification").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local QRCodeDisplayModule = require(Parent.QRCodeDisplay)
local ECLevels = QRCodeDisplayModule.ECLevels

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), QRCodeDisplayModule (copy), ECLevels (copy)
	local Deeplink = p1.deeplink
	local Title = p1.title
	local Description = p1.description
	local Footer = p1.footer
	local OnClose = p1.onClose
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = DialogSize.Medium,
		onClose = OnClose
	}, {
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogView = ReactModule.createElement(View, { tag = "col items-stretch size-full-0 auto-y" }, {
				TitleWrapper = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y padding-bottom-small",
					padding = {
						right = UDim.new(0, UseTokensResult.Size.Size_400 + UseTokensResult.Size.Size_1000),
						top = UDim.new(0, UseTokensResult.Size.Size_500)
					}
				}, {
					TitleText = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
						Text = Title
					})
				}),
				BodyText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 2, Text = Description }),
				QRCardWrapper = ReactModule.createElement(View, {
					tag = "col align-x-center items-center size-full-0 auto-y margin-y-large",
					LayoutOrder = 3
				}, {
					QRCard = ReactModule.createElement(View, {
						tag = "col auto-xy padding-medium",
						cornerRadius = UDim.new(0, 14),
						backgroundStyle = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) }
					}, {
						QRCode = ReactModule.createElement(QRCodeDisplayModule.DisplayQRCode, {
							sideLength = 176,
							ecLevel = ECLevels.EC_LEVEL_4,
							toEncode = Deeplink,
							backgroundColor = Color3.fromRGB(255, 255, 255),
							pixelColor = Color3.fromRGB(0, 0, 0)
						})
					})
				}),
				FooterText = ReactModule.createElement(Text, {
					LayoutOrder = 4,
					RichText = true,
					tag = "size-full-0 auto-y padding-bottom-small text-body-medium text-wrap text-align-x-left",
					Text = Footer
				})
			})
		})
	})
end