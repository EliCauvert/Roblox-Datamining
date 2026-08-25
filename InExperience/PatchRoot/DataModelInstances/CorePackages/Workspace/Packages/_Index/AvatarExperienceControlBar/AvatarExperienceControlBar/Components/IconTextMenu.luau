local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local iconTextButtonModule = require(avatarExperienceControlBar.Components.Buttons.IconTextButton)
local colorTextButtonModule = require(avatarExperienceControlBar.Components.Buttons.ColorTextButton)
local AXDisableControlBarMenuAnimation = game:DefineFastFlag("AXDisableControlBarMenuAnimation", false)
local t = { dampingRatio = 1, frequency = 5 }

return function(p0)
	-- upvalues: useSemanticTokensModule (ref), reactModule (ref), reactOtterModule (ref), t (ref), iconTextButtonModule (ref), colorTextButtonModule (ref), foundationModule (ref), AXDisableControlBarMenuAnimation (ref)
	local var9 = useSemanticTokensModule()
	local var10, var11 = reactModule.useBinding(0)
	local var12, var13 = reactOtterModule.useAnimatedBinding(0)
	local var14 = #p0.items > 0
	
	return reactModule.createElement(foundationModule.View, {
		tag = "clip",
		Name = "IconTextMenu-Animation-Container",
		Size = if AXDisableControlBarMenuAnimation then nil else reactModule.joinBindings({ X = var10, Y = var12 }):map(function(p1)
			return UDim2.fromOffset(p1.X, math.round(p1.Y))
		end),
		AutomaticSize = if AXDisableControlBarMenuAnimation then Enum.AutomaticSize.XY else nil,
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		LayoutOrder = p0.LayoutOrder
	}, {
		MenuContent = if #p0.items > 0 then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy clip col clip padding-xsmall gap-xsmall",
			backgroundStyle = var9.menuBackgroundStyle,
			cornerRadius = UDim.new(0, p0.radius or var9.defaultIconTextMenuRadius),
			ref = reactModule.useRef(nil),
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
				-- upvalues: var11 (ref), var13 (ref), reactOtterModule (copy), var14 (ref), t (copy)
				local absoluteSize = p2.AbsoluteSize
				var11(absoluteSize.X)
				var13(reactOtterModule.spring(if var14 then absoluteSize.Y else 0, t))
			end, { var14 })
		}, reactModule.useMemo(function()
			-- upvalues: p0 (ref), reactModule (copy), iconTextButtonModule (copy), colorTextButtonModule (copy)
			local t = {}
			
			for i, v in p0.items do
				if v.type == "icon" then
					t[`IconTextMenuItem-{v.id}`] = reactModule.createElement(iconTextButtonModule, {
						icon = v.icon,
						text = v.text,
						iconSize = v.iconSize,
						disabled = v.disabled,
						onActivated = function()
							-- upvalues: p0 (copy), v (ref)
							if p0.onItemActivated then
								p0.onItemActivated(v.id)
							end
							if v.onActivated then
								v.onActivated()
							end
						end,
						Visible = v.visible,
						LayoutOrder = i
					})
				elseif v.type == "color" then
					t[`IconTextMenuItem-{v.id}`] = reactModule.createElement(colorTextButtonModule, {
						colors = v.colors,
						colorSize = v.colorSize,
						size = v.size,
						text = v.text,
						disabled = v.disabled,
						onActivated = function()
							-- upvalues: p0 (copy), v (ref)
							if p0.onItemActivated then
								p0.onItemActivated(v.id)
							end
							if v.onActivated then
								v.onActivated()
							end
						end,
						Visible = v.visible,
						LayoutOrder = i
					})
				end
			end
			return t
		end, { p0.items, p0.onItemActivated })) else nil
	})
end