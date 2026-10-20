local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local CommunityLinkBannerModule = require(script.Parent.CommunityLinkBanner)
local _ = require(script.Parent.Parent.Models.CommunityInfo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), StyledTextLabel (copy), CommunityLinkBannerModule (copy)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8)
		}),
		Title = ReactModule.createElement(StyledTextLabel, {
			richText = false,
			fluidSizing = false,
			layoutOrder = 1,
			text = UseLocalizationFunction({
				CommunityTitle = "Feature.CommunityLinks.Heading.CommunityTitle"
			}).CommunityTitle,
			size = UDim2.fromScale(1, 0),
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.Y
		}),
		Banner = ReactModule.createElement(CommunityLinkBannerModule, {
			layoutOrder = 2,
			size = UDim2.fromScale(1, 0),
			communityInfo = p1.communityInfo,
			linkedEntityName = p1.experienceName,
			universeId = p1.universeId
		})
	})
end