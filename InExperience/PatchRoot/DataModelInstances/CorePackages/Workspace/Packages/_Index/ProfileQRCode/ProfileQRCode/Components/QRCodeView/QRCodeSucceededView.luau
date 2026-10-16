local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local QRCodeDisplayModule = require(Parent.QRCodeDisplay)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LightTheme = UIBloxModule.App.Style.Themes.LightTheme
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseLocalUserInfoModule = require(ProfileQRCode.Utils.useLocalUserInfo)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local FFlagProfileQrCodeDeprecateUserReduxModule = require(ProfileQRCode.Flags.FFlagProfileQrCodeDeprecateUserRedux)
local DisplayQRCode = QRCodeDisplayModule.DisplayQRCode
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local ComponentAssetsDropshadow568 = UIBloxModule.App.ImageSet.Images["component_assets/dropshadow_56_8"]

return function(p1) --[[ Line: 40 ]]
	-- upvalues: UseLocalUserIdFunction (copy), UseLocalUserInfoModule (copy), UseStyleFunction (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), ReactModule (copy), LightTheme (copy), DisplayQRCode (copy), QRCodeDisplayModule (copy), ImageSetLabel (copy), ComponentAssetsDropshadow568 (copy), StyledTextLabel (copy), FFlagProfileQrCodeDeprecateUserReduxModule (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseLocalUserInfoModuleResult = UseLocalUserInfoModule(UseLocalUserIdResult)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = LightTheme.BackgroundUIDefault.Transparency,
		BackgroundColor3 = LightTheme.BackgroundUIDefault.Color,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, if p1.isSmallScreen then p1.padding / 2 else p1.padding),
			PaddingRight = UDim.new(0, p1.padding),
			PaddingBottom = UDim.new(0, if p1.isSmallScreen then p1.padding / 2 else p1.padding),
			PaddingLeft = UDim.new(0, p1.padding)
		}),
		QRCodeWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, p1.qrCodeLength, 0, p1.qrCodeLength)
		}, {
			QRCode = ReactModule.createElement(DisplayQRCode, {
				qrCodeRotation = 15,
				toEncode = p1.url,
				ecLevel = QRCodeDisplayModule.ECLevels.EC_LEVEL_4,
				sideLength = p1.qrCodeLength,
				pixelColor = LightTheme.UIEmphasis.Color
			}),
			PlayerAvatar = ReactModule.createElement("Frame", {
				Rotation = 15,
				ZIndex = 3,
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = LightTheme.BackgroundUIDefault.Color,
				BackgroundTransparency = LightTheme.BackgroundUIDefault.Transparency,
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(44, 44)
			}, {
				Canvas = ReactModule.createElement("CanvasGroup", {
					BorderSizePixel = 0,
					ClipsDescendants = true,
					BackgroundColor3 = LightTheme.BackgroundUIDefault.Color,
					BackgroundTransparency = LightTheme.BackgroundUIDefault.Transparency,
					Size = UDim2.fromScale(1, 1)
				}, {
					Avatar = ReactModule.createElement("ImageLabel", {
						BorderSizePixel = 0,
						Rotation = -15,
						ZIndex = 2,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = LightTheme.BackgroundUIDefault.Color,
						BackgroundTransparency = LightTheme.BackgroundUIDefault.Transparency,
						Image = if UseLocalUserIdResult then GetStandardSizeAvatarHeadShotRbxthumbFunction(UseLocalUserIdResult) else nil,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromOffset(60, 60)
					})
				}),
				UIStroke = ReactModule.createElement("UIStroke", {
					Thickness = 2,
					Color = LightTheme.BackgroundUIDefault.Color
				})
			}),
			BigShadow = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 70, 0, 70),
				Image = ComponentAssetsDropshadow568,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(28, 28, 29, 29),
				ImageColor3 = UseStyleResult.Theme.DropShadow.Color,
				ImageTransparency = UseStyleResult.Theme.DropShadow.Transparency
			})
		}),
		Spacer1 = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 10)
		}),
		DisplayName = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 3,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			text = UseLocalUserInfoModuleResult.displayName,
			fontStyle = UseStyleResult.Font.SubHeader1,
			colorStyle = LightTheme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.Y,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			size = UDim2.new(1, 0, 0, 0)
		}),
		Username = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 4,
			lineHeight = 1,
			fluidSizing = false,
			richText = false,
			size = UDim2.new(1, 0, 0, 0),
			text = "@" .. (if FFlagProfileQrCodeDeprecateUserReduxModule then UseLocalUserInfoModuleResult.username or "" else UseLocalUserInfoModuleResult.username),
			fontStyle = UseStyleResult.Font.CaptionBody,
			automaticSize = Enum.AutomaticSize.Y,
			colorStyle = LightTheme.TextEmphasis,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
		}),
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.05, 0) })
	})
end