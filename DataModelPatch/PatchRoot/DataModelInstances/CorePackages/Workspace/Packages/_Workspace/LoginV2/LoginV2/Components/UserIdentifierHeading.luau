local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(Parent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local UserIdentifierTypeModule = require(LoginV2.Enums.UserIdentifierType)
local LoginContextModule = require(LoginV2.Context.LoginContext)

function UserIdentifierHeading(p1)
	-- upvalues: ReactModule (copy), LoginContextModule (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UserIdentifierTypeModule (copy), LoadableImage (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), StyledTextLabel (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy)
	local State = ReactModule.useContext(LoginContextModule).state
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local IsUserIdentifierTypeMatch = State.userIdentifierType == UserIdentifierTypeModule.Username
	
	return (ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_300)
		}),
		VerticalLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, UseDesignTokensResult.Size.Size_100)
		}),
		Thumbnail = IsUserIdentifierTypeMatch and ReactModule.createElement(LoadableImage, {
			LayoutOrder = 1,
			useShimmerAnimationWhileLoading = true,
			shouldHandleReloads = true,
			Size = UDim2.new(0, 72, 0, 72),
			Image = p1.userId ~= nil and GetStandardSizeAvatarHeadShotRbxthumbFunction(p1.userId),
			cornerRadius = UDim.new(0.5, 0)
		}),
		ThumbnailSpacing = IsUserIdentifierTypeMatch and ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 0, UseDesignTokensResult.Size.Size_300)
		}),
		UserIdentifierText = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 3,
			fluidSizing = true,
			lineHeight = 1,
			text = if IsUserIdentifierTypeMatch then p1.displayName or "" else p1.userIdentifier,
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			automaticSize = Enum.AutomaticSize.XY,
			openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
		}),
		SecondaryUsernameText = IsUserIdentifierTypeMatch and ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 4,
			fluidSizing = true,
			lineHeight = 1,
			text = if p1.userIdentifier then "@" .. p1.userIdentifier else "",
			fontStyle = UseStyleResult.Font.Body,
			colorStyle = UseStyleResult.Theme.TextDefault,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			automaticSize = Enum.AutomaticSize.XY,
			openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
		})
	}))
end

return UserIdentifierHeading