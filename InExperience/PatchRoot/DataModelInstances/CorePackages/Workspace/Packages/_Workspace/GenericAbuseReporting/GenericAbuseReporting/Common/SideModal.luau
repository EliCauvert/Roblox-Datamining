local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local t = {
	stiffness = 400,
	damping = 40,
	mass = 1,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}

local function _(p0)
	return p0 < 540
end

local function getAnchorPoint(p1)
	return if p1.X < 540 then Vector2.new(0.5, 1) else Vector2.new(0, 0)
end

local function getSize(p2, p3, p4)
	return if p2.X < 540 then UDim2.new(0, p2.X, 0, p4) else UDim2.new(0, p3, 0, p2.Y)
end

local function getPosition(p5, p6)
	return if p5.X < 540 then UDim2.new(0.5, 0, 1, 0) else UDim2.new(1, -p6, 0, 0)
end

return function(p7)
	-- upvalues: useTokens (ref), reactModule (ref), getAnchorPoint (ref), getSize (ref), getPosition (ref), reactOtterModule (ref), t (ref), view (ref), iconButton (ref), iconSize (ref), text (ref), button (ref), buttonVariant (ref), buttonSize (ref), fillBehavior (ref)
	local var7 = useTokens()
	local var8, var9 = reactModule.useState(getAnchorPoint(p7.screenSize))
	local var10, var11 = reactModule.useState(getSize(p7.screenSize, p7.width, p7.height))
	local var12, var13 = reactModule.useState(getPosition(p7.screenSize, p7.width))
	local var14, var15 = reactModule.useState(true)
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useMemo(function()
		-- upvalues: p7 (ref)
		return if p7.footerContent then p7.footerContent() else nil
	end, { p7.footerContent })
	local var19 = if var18 then 35 else 0
	local var20, var21 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var14 (ref), var16 (ref), p7 (ref)
		if not var14 then
			if var16 then
				if p7.buttonProps then
					p7.buttonProps.onActivated()
					
					return
				end
			elseif p7.onAbandon then
				p7.onAbandon()
			end
		end
	end)
	local var22 = reactModule.useMemo(function()
		-- upvalues: var14 (ref)
		return if var14 then 0 else 1
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: p7 (ref), var15 (ref)
		if p7.closeWithAnimation then
			var15(false)
		end
	end, { p7.closeWithAnimation })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), reactOtterModule (copy), var22 (ref), t (copy)
		var21(reactOtterModule.spring(var22, t))
	end, { var22 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), getAnchorPoint (copy), p7 (ref), var11 (ref), getSize (copy), var13 (ref), getPosition (copy)
		var9(getAnchorPoint(p7.screenSize))
		var11(getSize(p7.screenSize, p7.width, p7.height))
		var13(getPosition(p7.screenSize, p7.width))
	end, { p7.screenSize })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15(false)
	end, { var15 })
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = var20:map(function(p8)
			return p8 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Text = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[reactModule.Event.Activated] = var23
	}, {
		SideModalContainer = reactModule.createElement(view, {
			tag = "size-full",
			AnchorPoint = Vector2.new(1, 0),
			Position = var20:map(function(p9)
				-- upvalues: p7 (ref)
				return if p7.screenSize.X < 540 then UDim2.new(1, 0, 0, p7.height * p9) else UDim2.new(1, p7.width * p9, 0, 0)
			end)
		}, {
			SideModal = reactModule.createElement(view, {
				tag = "bg-surface-300 radius-medium col",
				AnchorPoint = var8,
				Position = var12,
				Size = var10
			}, {
				IconRow = reactModule.createElement(view, {
					tag = "padding-left-medium",
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					IconButton = reactModule.createElement(iconButton, {
						icon = "icons/navigation/pushBack",
						tag = "anchor-center-left position-center-left",
						size = iconSize.Medium,
						onActivated = var23
					})
				}),
				TitleRow = reactModule.createElement(view, {
					tag = "auto-xy",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					Title = reactModule.createElement(text, {
						TextWrapped = true,
						tag = "auto-xy",
						fontStyle = var7.Typography.TitleLarge,
						textStyle = var7.Color.Content.Emphasis,
						Text = p7.title,
						Size = UDim2.new(1, 0, 0, 32)
					})
				}),
				Content = reactModule.createElement(view, {
					ClipsDescendants = true,
					tag = "padding-x-medium",
					LayoutOrder = 2,
					Size = if p7.buttonProps then UDim2.new(1, 0, 1, -116 - var19) else UDim2.new(1, 0, 1, -84 - var19)
				}, {
					MiddleContent = reactModule.createElement(view, { tag = "size-full" }, p7.children)
				}),
				ButtonRow = p7.buttonProps and reactModule.createElement(view, {
					tag = "padding-x-medium padding-bottom-medium",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					Button = reactModule.createElement(button, {
						isDisabled = false,
						text = p7.buttonProps.text,
						variant = buttonVariant.Emphasis,
						onActivated = reactModule.useCallback(function()
							-- upvalues: p7 (ref), var17 (ref), var15 (ref)
							if p7.buttonProps and p7.buttonProps.validateState and not p7.buttonProps.validateState() then
								return
							end
							var17(true)
							var15(false)
						end, { var15, var17, p7.buttonProps }),
						size = buttonSize.Small,
						fillBehavior = fillBehavior.Fill
					})
				}),
				BottomFrame = if p7.footerContent then reactModule.createElement(view, {
					tag = "padding-x-medium padding-bottom-medium",
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 32),
					AutomaticSize = Enum.AutomaticSize.Y
				}, { FooterContent = var18 }) else nil
			})
		})
	})
end