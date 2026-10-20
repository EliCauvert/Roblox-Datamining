local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local IconTextButtonModule = require(AvatarExperienceControlBar.Components.Buttons.IconTextButton)
local ColorTextButtonModule = require(AvatarExperienceControlBar.Components.Buttons.ColorTextButton)
local AXDisableControlBarMenuAnimation = game:DefineFastFlag("AXDisableControlBarMenuAnimation", false)
local config = { dampingRatio = 1, frequency = 5 }

return function(Frame: Frame)
	-- upvalues: UseSemanticTokensModule (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), IconTextButtonModule (copy), ColorTextButtonModule (copy), FoundationModule (copy), AXDisableControlBarMenuAnimation (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local v1 = #Frame.items > 0
	local UseRefResult = ReactModule.useRef(nil)
	local Radius = Frame.radius or UseSemanticTokensModuleResult.defaultIconTextMenuRadius
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), v1 (copy), config (upval)
		local AbsoluteSize = Frame.AbsoluteSize
		UseBindingResult2(AbsoluteSize.X)
		UseAnimatedBindingResult2(ReactOtterModule.spring(if v1 then AbsoluteSize.Y else 0, config))
	end, { v1 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), ReactModule (upval), IconTextButtonModule (upval), ColorTextButtonModule (upval)
		local Elements = {}
		
		for LayoutOrder, item in Frame.items do
			if item.type == "icon" then
				Elements[`IconTextMenuItem-{item.id}`] = ReactModule.createElement(IconTextButtonModule, {
					icon = item.icon,
					text = item.text,
					iconSize = item.iconSize,
					disabled = item.disabled,
					onActivated = function()
						-- upvalues: Frame (upval), item (copy)
						if Frame.onItemActivated then
							Frame.onItemActivated(item.id)
						end
						if item.onActivated then
							item.onActivated()
						end
					end,
					Visible = item.visible,
					LayoutOrder = LayoutOrder
				})
			elseif item.type == "color" then
				Elements[`IconTextMenuItem-{item.id}`] = ReactModule.createElement(ColorTextButtonModule, {
					colors = item.colors,
					colorSize = item.colorSize,
					size = item.size,
					text = item.text,
					disabled = item.disabled,
					onActivated = function()
						-- upvalues: Frame (upval), item (copy)
						if Frame.onItemActivated then
							Frame.onItemActivated(item.id)
						end
						if item.onActivated then
							item.onActivated()
						end
					end,
					Visible = item.visible,
					LayoutOrder = LayoutOrder
				})
			end
		end
		return Elements
	end, { Frame.items, Frame.onItemActivated })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "clip",
		Name = "IconTextMenu-Animation-Container",
		Size = if AXDisableControlBarMenuAnimation then nil else ReactModule.joinBindings({ X = UseBindingResult, Y = UseAnimatedBindingResult }):map(function(Vector): UDim2
			return UDim2.fromOffset(Vector.X, (math.round(Vector.Y)))
		end),
		AutomaticSize = if AXDisableControlBarMenuAnimation then Enum.AutomaticSize.XY else nil,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		LayoutOrder = Frame.LayoutOrder
	}, {
		MenuContent = if #Frame.items > 0 then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy clip col clip padding-xsmall gap-xsmall",
			backgroundStyle = UseSemanticTokensModuleResult.menuBackgroundStyle,
			cornerRadius = UDim.new(0, Radius),
			ref = UseRefResult,
			onAbsoluteSizeChanged = UseResult
		}, UseMemoResult) else nil
	})
end