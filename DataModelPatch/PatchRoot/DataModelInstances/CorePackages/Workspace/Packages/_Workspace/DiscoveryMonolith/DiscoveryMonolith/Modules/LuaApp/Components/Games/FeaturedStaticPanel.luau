local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local DashModule = require(Parent.Dash)
local GameTileModule = require(Parent.GameTile)
local GridTileTextFooter = GameTileModule.GridTileTextFooter
local ExperienceFooter = GameTileModule.ExperienceFooter
local ItemTileCreatorNameModule = require(DiscoveryMonolith.Modules.LuaApp.Components.Common.ItemTileCreatorName)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), ReactModule (copy), DashModule (copy), GridTileTextFooter (copy), ExperienceFooter (copy), ItemTileCreatorNameModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Padding = p1.padding or 0
	local Ceiled = math.ceil(UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Ceiled)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Ceiled (copy), UseTextSizeOffsetResult (copy)
		UseStateResult2(Ceiled + UseTextSizeOffsetResult)
	end, { Ceiled, UseTextSizeOffsetResult })
	local JoinResult = DashModule.join(p1.footerData, {
		layoutOrder = 2,
		isStatsOnly = true,
		size = UDim2.new(0, 132, 0, Ceiled)
	})
	local Element = nil
	
	if p1.licenseDescription then
		Element = ReactModule.createElement(GridTileTextFooter, {
			useLargerFont = true,
			LayoutOrder = 2,
			text = p1.licenseDescription
		})
	elseif p1.paidAccessDescription then
		Element = ReactModule.createElement(GridTileTextFooter, {
			useLargerFont = true,
			LayoutOrder = 2,
			text = p1.paidAccessDescription
		})
	else
		ReactModule.createElement(ExperienceFooter, JoinResult)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Padding),
			PaddingLeft = if p1.hasBackground then UDim.new(0, Padding) else nil,
			PaddingRight = if p1.hasBackground then UDim.new(0, Padding) else nil,
			PaddingBottom = if p1.hasBackground then UDim.new(0, Padding) else nil
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, Padding)
		}),
		Title = if p1.title and string.len(p1.title) > 0 then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, UseStateResult),
			Text = p1.title,
			Font = UseStyleResultFont.Header2.Font,
			TextSize = Ceiled,
			TextTransparency = Theme.TextEmphasis.Transparency,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}) else nil,
		Footer = Element,
		CreatorName = if p1.creatorName then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, UseStateResult)
		}, {
			Text = ReactModule.createElement(ItemTileCreatorNameModule, {
				name = p1.creatorName,
				hasVerifiedBadge = p1.creatorVerified,
				creatorId = p1.creatorId
			})
		}) else nil,
		Description = if p1.description and string.len(p1.description) > 0 then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, UseStateResult * 3),
			Text = p1.description,
			Font = UseStyleResultFont.Body.Font,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
			TextTransparency = Theme.TextDefault.Transparency,
			TextColor3 = Theme.TextDefault.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", {
				MaxTextSize = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.FontSize.FontSize_600 else UseStyleResult.Tokens.Global.FontSize_300
			})
		}) else nil
	})
end