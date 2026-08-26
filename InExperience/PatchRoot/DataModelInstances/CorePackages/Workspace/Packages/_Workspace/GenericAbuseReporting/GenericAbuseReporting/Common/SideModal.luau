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

local function _(p1)
	return p1 < 540
end

local function getAnchorPoint(p1)
	return if p1.X < 540 then Vector2.new(0.5, 1) else Vector2.new(0, 0)
end

local function getSize(p1, p2, p3)
	return if p1.X < 540 then UDim2.new(0, p1.X, 0, p3) else UDim2.new(0, p2, 0, p1.Y)
end

local function getPosition(p1, p2)
	return if p1.X < 540 then UDim2.new(0.5, 0, 1, 0) else UDim2.new(1, -p2, 0, 0)
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), getAnchorPoint (ref), getSize (ref), getPosition (ref), reactOtterModule (ref), t (ref), view (ref), iconButton (ref), iconSize (ref), text (ref), button (ref), buttonVariant (ref), buttonSize (ref), fillBehavior (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(getAnchorPoint(p1.screenSize))
	local var4, var5 = reactModule.useState(getSize(p1.screenSize, p1.width, p1.height))
	local var6, var7 = reactModule.useState(getPosition(p1.screenSize, p1.width))
	local var8, var9 = reactModule.useState(true)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.footerContent then p1.footerContent() else nil
	end, { p1.footerContent })
	local var13 = if var12 then 35 else 0
	local var14, var15 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var8 (ref), var10 (ref), p1 (ref)
		if not var8 then
			if var10 then
				if p1.buttonProps then
					p1.buttonProps.onActivated()
					
					return
				end
			elseif p1.onAbandon then
				p1.onAbandon()
			end
		end
	end)
	local var16 = reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return if var8 then 0 else 1
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var9 (ref)
		if p1.closeWithAnimation then
			var9(false)
		end
	end, { p1.closeWithAnimation })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), reactOtterModule (copy), var16 (ref), t (copy)
		var15(reactOtterModule.spring(var16, t))
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), getAnchorPoint (copy), p1 (ref), var5 (ref), getSize (copy), var7 (ref), getPosition (copy)
		var3(getAnchorPoint(p1.screenSize))
		var5(getSize(p1.screenSize, p1.width, p1.height))
		var7(getPosition(p1.screenSize, p1.width))
	end, { p1.screenSize })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(false)
	end, { var9 })
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = var14:map(function(p2)
			return p2 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Text = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[reactModule.Event.Activated] = var17
	}, {
		SideModalContainer = reactModule.createElement(view, {
			tag = "size-full",
			AnchorPoint = Vector2.new(1, 0),
			Position = var14:map(function(p2)
				-- upvalues: p1 (ref)
				return if p1.screenSize.X < 540 then UDim2.new(1, 0, 0, p1.height * p2) else UDim2.new(1, p1.width * p2, 0, 0)
			end)
		}, {
			SideModal = reactModule.createElement(view, {
				tag = "bg-surface-300 radius-medium col",
				AnchorPoint = var2,
				Position = var6,
				Size = var4
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
						onActivated = var17
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
						fontStyle = var1.Typography.TitleLarge,
						textStyle = var1.Color.Content.Emphasis,
						Text = p1.title,
						Size = UDim2.new(1, 0, 0, 32)
					})
				}),
				Content = reactModule.createElement(view, {
					ClipsDescendants = true,
					tag = "padding-x-medium",
					LayoutOrder = 2,
					Size = if p1.buttonProps then UDim2.new(1, 0, 1, -116 - var13) else UDim2.new(1, 0, 1, -84 - var13)
				}, {
					MiddleContent = reactModule.createElement(view, { tag = "size-full" }, p1.children)
				}),
				ButtonRow = p1.buttonProps and reactModule.createElement(view, {
					tag = "padding-x-medium padding-bottom-medium",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					Button = reactModule.createElement(button, {
						isDisabled = false,
						text = p1.buttonProps.text,
						variant = buttonVariant.Emphasis,
						onActivated = reactModule.useCallback(function()
							-- upvalues: p1 (ref), var11 (ref), var9 (ref)
							if p1.buttonProps and p1.buttonProps.validateState and not p1.buttonProps.validateState() then
								return
							end
							var11(true)
							var9(false)
						end, { var9, var11, p1.buttonProps }),
						size = buttonSize.Small,
						fillBehavior = fillBehavior.Fill
					})
				}),
				BottomFrame = if p1.footerContent then reactModule.createElement(view, {
					tag = "padding-x-medium padding-bottom-medium",
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 32),
					AutomaticSize = Enum.AutomaticSize.Y
				}, { FooterContent = var12 }) else nil
			})
		})
	})
end