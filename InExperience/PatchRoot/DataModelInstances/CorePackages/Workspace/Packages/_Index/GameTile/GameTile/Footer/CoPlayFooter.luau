local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions

local var1 = function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement(reactModule.Fragment, nil, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Border = reactModule.createElement("UIStroke", {
			Thickness = 2,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = p1.Theme.BackgroundUIDefault.Color,
			Transparency = p1.Theme.BackgroundUIDefault.Transparency
		})
	})
end

local var2 = function(p1, p2)
	-- upvalues: getRbxthumbWithTypeSizeAndOptions (ref), constants (ref), reactModule (ref), imageSetLabel (ref), var1 (ref), styledTextLabel (ref)
	local t = {}
	
	if not p1 then
		return nil, nil
	end
	local var3 = 0
	
	for i, v in pairs(p1) do
		var3 += 1
		local var4 = tostring(v)
		
		if var3 <= 3 then
			t["mini_avatar_" .. var7] = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 0,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, var3 * 16 / 2, 0.5, 0),
				Size = UDim2.fromOffset(16, 16),
				Image = getRbxthumbWithTypeSizeAndOptions(var4, constants.RbxthumbTypes.AvatarHeadShot, 100),
				BackgroundColor3 = Color3.fromRGB(209, 209, 209),
				ZIndex = 4 - var3
			}, { var1(p2) })
		end
	end
	t.online_indicator = reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		ZIndex = 4,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.fromOffset(14, 14),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109)
	}, {
		var1(p2),
		InExperienceCounter = reactModule.createElement(styledTextLabel, {
			lineHeight = 1,
			richText = false,
			colorStyle = p2.Theme.TextEmphasis,
			fontStyle = p2.Font.Footer,
			textXAlignment = Enum.TextXAlignment.Center,
			size = UDim2.fromScale(1, 1),
			text = tostring(var3),
			textTruncate = Enum.TextTruncate.None
		})
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5)
	}, t), var3
end

return function(p3)
	-- upvalues: useStyle (ref), var2 (ref), useLocalization (ref), reactModule (ref), styledTextLabel (ref)
	local var5 = useStyle()
	local font = var5.Font
	local var6, var7 = var2(p3.friends, var5)
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 6)
		}),
		PresenceList = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(0, math.min(3, var7 or 0) * 16 / 2 + 16, 0, 22)
		}, { ActiveFriends = var6 }),
		FriendsLabel = reactModule.createElement(styledTextLabel, {
			lineHeight = 1,
			richText = false,
			layoutOrder = 2,
			colorStyle = var5.Theme.TextMuted,
			fontStyle = font.CaptionHeader,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, -40, 0, font.BaseSize * font.CaptionHeader.RelativeSize),
			text = useLocalization({ friendsText = "CommonUI.Features.Label.Friends" }).friendsText,
			textTruncate = Enum.TextTruncate.AtEnd
		})
	})
end