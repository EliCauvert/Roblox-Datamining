local SocialCards = script:FindFirstAncestor("SocialCards")
local Parent = SocialCards.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MapCallCardModule = require(SocialCards.Components.CallCard.mapCallCard)
local ParseCallCardModule = require(SocialCards.Components.CallCard.parseCallCard)
local RingingIndicatorModule = require(SocialCards.Components.CallCard.RingingIndicator)
local UseCallCardModule = require(SocialCards.Components.CallCard.useCallCard)
local _UDim = UDim.new(0, 20)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ParseCallCardModule (copy), UseCallCardModule (copy), MapCallCardModule (copy), View (copy), _UDim (copy), Icon (copy), IconSize (copy), Text (copy), RingingIndicatorModule (copy)
	local UseTokensResult = UseTokensFunction()
	local MapCallCardModuleResult = MapCallCardModule((UseCallCardModule((ReactModule.useMemo(function()
		-- upvalues: ParseCallCardModule (upval), p1 (copy)
		return ParseCallCardModule.parseMessageCard({
			call_id = p1.call_id,
			duration_seconds = p1.duration_seconds,
			enable_join = p1.enable_join,
			is_initiator = p1.is_initiator,
			status = p1.status
		})
	end, {
		p1.call_id,
		p1.duration_seconds,
		p1.enable_join,
		p1.is_initiator,
		p1.status
	})))))
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small auto-y padding-x-medium padding-y-small bg-shift-400",
		Size = UDim2.fromOffset(200, 0),
		cornerRadius = _UDim,
		onActivated = MapCallCardModuleResult.onActivated,
		testId = p1.testId
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = MapCallCardModuleResult.icon,
			size = IconSize.Large,
			style = UseTokensResult.Color.Content.Muted
		}),
		Content = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill auto-y" }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
				Text = MapCallCardModuleResult.title
			}),
			Status = if MapCallCardModuleResult.description == nil then nil else ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-xsmall size-full-0 auto-y"
			}, {
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
					Text = MapCallCardModuleResult.description
				}),
				Ringing = if MapCallCardModuleResult.isRinging then ReactModule.createElement(RingingIndicatorModule, { LayoutOrder = 2 }) else nil
			})
		})
	})
end