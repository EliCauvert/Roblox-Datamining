local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions

local function v7(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Border = ReactModule.createElement("UIStroke", {
			Thickness = 2,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p1.Theme.BackgroundUIDefault.Color,
			Transparency = p1.Theme.BackgroundUIDefault.Transparency
		})
	})
end

local function v8(Friends, p1)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), ReactModule (copy), ImageSetLabel (copy), v7 (copy), StyledTextLabel (copy)
	local Elements = {}
	
	if not Friends then
		return nil, nil
	end
	local Count = 0
	
	for _, friend in pairs(Friends) do
		Count += 1
		local Text = tostring(friend)
		
		if Count <= 3 then
			Elements["mini_avatar_" .. Text] = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 0,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, Count * 16 / 2, 0.5, 0),
				Size = UDim2.fromOffset(16, 16),
				Image = GetRbxthumbWithTypeSizeAndOptionsFunction(Text, Constants.RbxthumbTypes.AvatarHeadShot, 100),
				BackgroundColor3 = Color3.fromRGB(209, 209, 209),
				ZIndex = 4 - Count
			}, { v7(p1) })
		end
	end
	Elements.online_indicator = ReactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		ZIndex = 4,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109)
	}, {
		v7(p1),
		InExperienceCounter = ReactModule.createElement(StyledTextLabel, {
			lineHeight = 1,
			richText = false,
			colorStyle = p1.Theme.TextEmphasis,
			fontStyle = p1.Font.Footer,
			textXAlignment = Enum.TextXAlignment.Center,
			size = UDim2.fromScale(1, 1),
			text = tostring(Count),
			textTruncate = Enum.TextTruncate.None
		})
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}, Elements), Count
end

return function(p2)
	-- upvalues: UseStyleFunction (copy), v8 (copy), UseLocalizationFunction (copy), ReactModule (copy), StyledTextLabel (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local ActiveFriends, v1 = v8(p2.friends, UseStyleResult)
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 6)
		}),
		PresenceList = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, math.min(3, v1 or 0) * 16 / 2 + 16, 0, 22)
		}, { ActiveFriends = ActiveFriends }),
		FriendsLabel = ReactModule.createElement(StyledTextLabel, {
			lineHeight = 1,
			richText = false,
			layoutOrder = 2,
			colorStyle = UseStyleResult.Theme.TextMuted,
			fontStyle = UseStyleResultFont.CaptionHeader,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, -40, 0, UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionHeader.RelativeSize),
			text = UseLocalizationFunction({ friendsText = "CommonUI.Features.Label.Friends" }).friendsText,
			textTruncate = Enum.TextTruncate.AtEnd
		})
	})
end