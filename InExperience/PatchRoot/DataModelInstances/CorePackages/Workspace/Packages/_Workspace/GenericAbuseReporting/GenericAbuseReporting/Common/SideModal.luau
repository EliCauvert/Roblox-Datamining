local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	stiffness = 400,
	damping = 40,
	mass = 1,
	restingPositionLimit = 0.5,
	restingVelocityLimit = 0.1
}

local function _(p1: number): boolean --[[ Line: 53 | Named "isFullWidth" ]]
	return p1 < 540
end

local function getAnchorPoint(ScreenSize): Vector2 --[[ Line: 57 ]]
	return if ScreenSize.X < 540 then Vector2.new(0.5, 1) else Vector2.new(0, 0)
end

local function getSize(ScreenSize, XOffset, YOffset): UDim2 --[[ Line: 65 ]]
	return if ScreenSize.X < 540 then UDim2.new(0, ScreenSize.X, 0, YOffset) else UDim2.new(0, XOffset, 0, ScreenSize.Y)
end

local function getPosition(ScreenSize, Width): UDim2 --[[ Line: 73 ]]
	return if ScreenSize.X < 540 then UDim2.new(0.5, 0, 1, 0) else UDim2.new(1, -Width, 0, 0)
end

return function(p1) --[[ Line: 81 | Named "SideModal" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), getAnchorPoint (copy), getSize (copy), getPosition (copy), ReactOtterModule (copy), config (copy), View (copy), IconButton (copy), IconSize (copy), Text (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), FillBehavior (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(getAnchorPoint(p1.screenSize))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(getSize(p1.screenSize, p1.width, p1.height))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(getPosition(p1.screenSize, p1.width))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 90 ]]
		-- upvalues: p1 (copy)
		return if p1.footerContent then p1.footerContent() else nil
	end, { p1.footerContent })
	local v1: number = if UseMemoResult then 35 else 0
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function() --[[ Line: 95 ]]
		-- upvalues: UseStateResult4 (copy), UseStateResult5 (copy), p1 (copy)
		if not UseStateResult4 then
			if UseStateResult5 then
				if p1.buttonProps then
					p1.buttonProps.onActivated()
					
					return
				end
			elseif p1.onAbandon then
				p1.onAbandon()
			end
		end
	end)
	local UseMemoResult1 = ReactModule.useMemo(function(): number --[[ Line: 110 ]]
		-- upvalues: UseStateResult4 (copy)
		return if UseStateResult4 then 0 else 1
	end, { UseStateResult4 })
	ReactModule.useEffect(function() --[[ Line: 114 ]]
		-- upvalues: p1 (copy), UseStateResult2_3 (copy)
		if p1.closeWithAnimation then
			UseStateResult2_3(false)
		end
	end, { p1.closeWithAnimation })
	ReactModule.useEffect(function() --[[ Line: 120 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult1 (copy), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult1, config))
	end, { UseMemoResult1 })
	ReactModule.useEffect(function() --[[ Line: 124 ]]
		-- upvalues: UseStateResult2 (copy), getAnchorPoint (upval), p1 (copy), UseStateResult2_1 (copy), getSize (upval), UseStateResult2_2 (copy), getPosition (upval)
		UseStateResult2(getAnchorPoint(p1.screenSize))
		UseStateResult2_1(getSize(p1.screenSize, p1.width, p1.height))
		UseStateResult2_2(getPosition(p1.screenSize, p1.width))
	end, { p1.screenSize })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 130 ]]
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(false)
	end, { UseStateResult2_3 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 134 ]]
		-- upvalues: p1 (copy), UseStateResult2_4 (copy), UseStateResult2_3 (copy)
		if not p1.buttonProps or not p1.buttonProps.validateState or p1.buttonProps.validateState() then
			UseStateResult2_4(true)
			UseStateResult2_3(false)
			
			return
		end
	end, { UseStateResult2_3, UseStateResult2_4, p1.buttonProps })
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = UseAnimatedBindingResult:map(function(p2: number): number --[[ Line: 148 ]]
			return p2 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Text = "",
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[ReactModule.Event.Activated] = UseResult
	}, {
		SideModalContainer = ReactModule.createElement(View, {
			tag = "size-full",
			AnchorPoint = Vector2.new(1, 0),
			Position = UseAnimatedBindingResult:map(function(p2): UDim2 --[[ Line: 160 ]]
				-- upvalues: p1 (copy)
				return if p1.screenSize.X < 540 then UDim2.new(1, 0, 0, p1.height * p2) else UDim2.new(1, p1.width * p2, 0, 0)
			end)
		}, {
			SideModal = ReactModule.createElement(View, {
				tag = "bg-surface-300 radius-medium col",
				AnchorPoint = UseStateResult,
				Position = UseStateResult3,
				Size = UseStateResult1
			}, {
				IconRow = ReactModule.createElement(View, {
					tag = "padding-left-medium",
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					IconButton = ReactModule.createElement(IconButton, {
						icon = "icons/navigation/pushBack",
						tag = "anchor-center-left position-center-left",
						size = IconSize.Medium,
						onActivated = UseResult
					})
				}),
				TitleRow = ReactModule.createElement(View, {
					tag = "auto-xy",
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					Title = ReactModule.createElement(Text, {
						TextWrapped = true,
						tag = "auto-xy",
						fontStyle = UseTokensResult.Typography.TitleLarge,
						textStyle = UseTokensResult.Color.Content.Emphasis,
						Text = p1.title,
						Size = UDim2.new(1, 0, 0, 32)
					})
				}),
				Content = ReactModule.createElement(View, {
					ClipsDescendants = true,
					tag = "padding-x-medium",
					LayoutOrder = 2,
					Size = if p1.buttonProps then UDim2.new(1, 0, 1, -116 - v1) else UDim2.new(1, 0, 1, -84 - v1)
				}, {
					MiddleContent = ReactModule.createElement(View, { tag = "size-full" }, p1.children)
				}),
				ButtonRow = p1.buttonProps and ReactModule.createElement(View, {
					tag = "padding-x-medium padding-bottom-medium",
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 32)
				}, {
					Button = ReactModule.createElement(Button, {
						isDisabled = false,
						text = p1.buttonProps.text,
						variant = ButtonVariant.Emphasis,
						onActivated = UseResult1,
						size = ButtonSize.Small,
						fillBehavior = FillBehavior.Fill
					})
				}),
				BottomFrame = if p1.footerContent then ReactModule.createElement(View, {
					tag = "padding-x-medium padding-bottom-medium",
					LayoutOrder = 4,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 32),
					AutomaticSize = Enum.AutomaticSize.Y
				}, { FooterContent = UseMemoResult }) else nil
			})
		})
	})
end