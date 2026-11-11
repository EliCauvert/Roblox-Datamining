local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local UIBloxModule = require(Parent.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local DashModule = require(Parent.Dash)
local ExperienceFooter = require(Parent.GameTile).ExperienceFooter
local ItemTileCreatorNameModule = require(DiscoveryMonolith.Modules.LuaApp.Components.Common.ItemTileCreatorName)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseTextSizeOffsetFunction (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ArgCheckModule (copy), DashModule (copy), ExperienceFooter (copy), ItemTileCreatorNameModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(2)
	local Largest = math.max(0, UseStateResult - 2)
	local IsUseStateResultAbove = UseStateResult > 3
	local IsUseStateResultMatch = UseStateResult == 2
	local Padding = p1.padding or 0
	local Ceiled = math.ceil(UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Ceiled)
	local FontSize600 = if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.FontSize.FontSize_600 else UseStyleResult.Tokens.Global.FontSize_300
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), Ceiled (copy), UseTextSizeOffsetResult (copy)
		UseStateResult2_1(Ceiled + UseTextSizeOffsetResult)
	end, { Ceiled, UseTextSizeOffsetResult })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult1 (copy), Padding (copy), FontSize600 (copy), ArgCheckModule (upval), UseStateResult2 (copy)
		if Frame and UseStateResult1 > 0 then
			local AbsoluteSize = Frame.AbsoluteSize
			local YDelta = AbsoluteSize.Y - Padding - math.max(Padding, 8) - AbsoluteSize.X - 48
			local Floored = math.floor(YDelta / (UseStateResult1 + 8))
			
			if Floored > 3 then
				local Floored1 = math.floor((YDelta - math.floor(YDelta - (UseStateResult1 + 8) * 2)) / FontSize600)
				ArgCheckModule.assert(Floored1 >= 0, "bodyRows should always be at least 0. Otherwise, it will subtract from newContentRows, breaking component behavior.")
				Floored = Floored1 + 2
			end
			UseStateResult2(Floored)
		end
	end, { Padding, UseStateResult1 })
	local Element = ReactModule.createElement(ExperienceFooter, (DashModule.join(p1.footerData, {
		isStatsOnly = true,
		size = UDim2.new(0, 132, 0, UseStateResult1),
		position = if IsUseStateResultAbove or IsUseStateResultMatch then UDim2.new(1, 0, 0, 0) else nil,
		anchorPoint = if IsUseStateResultAbove or IsUseStateResultMatch then Vector2.new(1, 0) else nil,
		automaticSize = Enum.AutomaticSize.X
	})))
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ref = UseResult,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = if p1.hasBackground then UDim.new(0, Padding) else nil,
			PaddingRight = UDim.new(0, Padding),
			PaddingTop = UDim.new(0, (math.max(Padding, 8))),
			PaddingBottom = UDim.new(0, Padding)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 8)
		}),
		TitleFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, UseStateResult1)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Title = if p1.title and string.len(p1.title) > 0 then ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = -1,
				Size = UDim2.new(1, if IsUseStateResultAbove then -132 else 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1.title,
				Font = UseStyleResultFont.Header2.Font,
				TextSize = Ceiled,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTruncate = Enum.TextTruncate.SplitWord,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}, {
				UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}) else nil,
			InlineFooter = if IsUseStateResultAbove then Element else nil
		}),
		LicenseDescription = if p1.licenseDescription then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseStateResult1)
		}, {
			LicenseDescription = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1.licenseDescription,
				Font = UseStyleResultFont.Body.Font,
				TextSize = Ceiled,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		}) else nil,
		PaidAccessDescription = if p1.paidAccessDescription and not p1.licenseDescription then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseStateResult1)
		}, {
			PaidAccessDescription = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = p1.paidAccessDescription,
				Font = UseStyleResultFont.Body.Font,
				TextSize = Ceiled,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		}) else nil,
		SubtitleFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, UseStateResult1)
		}, {
			CreatorName = if p1.creatorName then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, if IsUseStateResultMatch then -132 else 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Text = ReactModule.createElement(ItemTileCreatorNameModule, {
					name = p1.creatorName,
					hasVerifiedBadge = p1.creatorVerified,
					creatorId = p1.creatorId
				})
			}) else nil,
			InlineFooter = if IsUseStateResultMatch then Element else nil
		}),
		BodyFrame = if Largest > 0 then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = 4,
			Size = UDim2.new(1, 0, 0, if Largest > 1 then FontSize600 * Largest else UseStateResult1 * Largest)
		}, {
			ExperienceInfo = if Largest > 1 then ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 1, 0),
				Text = p1.description,
				Font = UseStyleResultFont.Body.Font,
				TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
				TextTransparency = Theme.TextDefault.Transparency,
				TextColor3 = Theme.TextDefault.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}, {
				UITextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = FontSize600 })
			}) else Element
		}) else nil
	})
end