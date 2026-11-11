local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.withLocalization)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)
ExtendResult.defaultProps = { textPadding = 8, shouldUseAutomaticSize = false }

function ExtendResult.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy)
	local TextKey = p1.props.textKey
	local LayoutOrder = p1.props.layoutOrder
	local OnActivatedCallback = p1.props.onActivatedCallback
	local IsPrimaryLink = p1.props.isPrimaryLink
	local TextPadding = p1.props.textPadding
	local ShouldUseAutomaticSize = p1.props.shouldUseAutomaticSize
	
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), TextKey (copy), IsPrimaryLink (copy), OnActivatedCallback (copy), RoactModule (upval), ShouldUseAutomaticSize (copy), TextPadding (copy), LayoutOrder (copy)
		return WithLocalizationModule({ linkText = TextKey })(function(p3)
			-- upvalues: IsPrimaryLink (upval), p2 (copy), OnActivatedCallback (upval), RoactModule (upval), ShouldUseAutomaticSize (upval), TextPadding (upval), LayoutOrder (upval)
			local SubHeader1 = IsPrimaryLink and p2.Font.SubHeader1 or p2.Font.CaptionBody
			local ScaledRelativeSize = SubHeader1.RelativeSize * p2.Font.BaseSize
			
			return RoactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				RichText = true,
				Text = string.format("<u>%s</u>", p3.linkText),
				Size = if ShouldUseAutomaticSize then UDim2.new(0, 0, 0, 0) else UDim2.new(1, 0, 0, ScaledRelativeSize + TextPadding),
				AutomaticSize = if ShouldUseAutomaticSize then Enum.AutomaticSize.XY else nil,
				Font = SubHeader1.Font,
				TextColor3 = OnActivatedCallback and p2.Theme.SystemPrimaryDefault.Color or p2.Theme.UIDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				TextSize = ScaledRelativeSize,
				LayoutOrder = LayoutOrder,
				[RoactModule.Event.Activated] = OnActivatedCallback
			})
		end)
	end)
end

return ExtendResult