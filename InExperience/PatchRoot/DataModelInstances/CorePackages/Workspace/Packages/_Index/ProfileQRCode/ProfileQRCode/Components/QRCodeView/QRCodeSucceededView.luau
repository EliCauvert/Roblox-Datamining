local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local parent = profileQRCode.Parent
local QRCodeDisplayModule = require(parent.QRCodeDisplay)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local userLibModule = require(parent.UserLib)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local lightTheme = UIBloxModule.App.Style.Themes.LightTheme
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useLocalUserInfoModule = require(profileQRCode.Utils.useLocalUserInfo)
local useStyle = UIBloxModule.Core.Style.useStyle
local fFlagProfileQrCodeDeprecateUserReduxModule = require(profileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)
local displayQRCode = QRCodeDisplayModule.DisplayQRCode
local getStandardSizeAvatarHeadShotRbxthumb = userLibModule.Utils.getStandardSizeAvatarHeadShotRbxthumb
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local dropshadow568 = images["component_assets/dropshadow_56_8"]

return function(p0) --[[ line: 40 ]]
	-- upvalues: useLocalUserId (ref), useLocalUserInfoModule (ref), useStyle (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), reactModule (ref), lightTheme (ref), displayQRCode (ref), QRCodeDisplayModule (ref), imageSetLabel (ref), dropshadow568 (ref), styledTextLabel (ref), fFlagProfileQrCodeDeprecateUserReduxModule (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref)
	local var7 = useLocalUserId()
	local var8 = useLocalUserInfoModule(var7)
	local var9 = useStyle()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = lightTheme.BackgroundUIDefault.Transparency,
		BackgroundColor3 = lightTheme.BackgroundUIDefault.Color,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if p0.isSmallScreen then p0.padding / 2 else p0.padding),
			PaddingRight = UDim.new(0, p0.padding),
			PaddingBottom = UDim.new(0, if p0.isSmallScreen then p0.padding / 2 else p0.padding),
			PaddingLeft = UDim.new(0, p0.padding)
		}),
		QRCodeWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, p0.qrCodeLength, 0, p0.qrCodeLength)
		}, {
			QRCode = reactModule.createElement(displayQRCode, {
				qrCodeRotation = 15,
				toEncode = p0.url,
				ecLevel = QRCodeDisplayModule.ECLevels.EC_LEVEL_4,
				sideLength = p0.qrCodeLength,
				pixelColor = lightTheme.UIEmphasis.Color
			}),
			PlayerAvatar = reactModule.createElement("Frame", {
				Rotation = 15,
				ZIndex = 3,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = lightTheme.BackgroundUIDefault.Color,
				BackgroundTransparency = lightTheme.BackgroundUIDefault.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(44, 44)
			}, {
				Canvas = reactModule.createElement("CanvasGroup", {
					BorderSizePixel = 0,
					ClipsDescendants = true,
					BackgroundColor3 = lightTheme.BackgroundUIDefault.Color,
					BackgroundTransparency = lightTheme.BackgroundUIDefault.Transparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					Avatar = reactModule.createElement("ImageLabel", {
						BorderSizePixel = 0,
						Rotation = -15,
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = lightTheme.BackgroundUIDefault.Color,
						BackgroundTransparency = lightTheme.BackgroundUIDefault.Transparency,
						Image = if var7 then getStandardSizeAvatarHeadShotRbxthumb(var7) else nil,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromOffset(60, 60)
					})
				}),
				UIStroke = reactModule.createElement("UIStroke", {
					Thickness = 2,
					Color = lightTheme.BackgroundUIDefault.Color
				})
			}),
			BigShadow = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 70, 0, 70),
				Image = dropshadow568,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(28, 28, 29, 29),
				ImageColor3 = var9.Theme.DropShadow.Color,
				ImageTransparency = var9.Theme.DropShadow.Transparency
			})
		}),
		Spacer1 = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 10)
		}),
		DisplayName = reactModule.createElement(styledTextLabel, {
			layoutOrder = 3,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			text = var8.displayName,
			fontStyle = var9.Font.SubHeader1,
			colorStyle = lightTheme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.Y,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			size = UDim2.new(1, 0, 0, 0)
		}),
		Username = reactModule.createElement(styledTextLabel, {
			layoutOrder = 4,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			size = UDim2.new(1, 0, 0, 0),
			text = "@" .. (if fFlagProfileQrCodeDeprecateUserReduxModule then var8.username or "" else var8.username),
			fontStyle = var9.Font.CaptionBody,
			automaticSize = Enum.AutomaticSize.Y,
			colorStyle = lightTheme.TextEmphasis,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			openTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil
		}),
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) })
	})
end