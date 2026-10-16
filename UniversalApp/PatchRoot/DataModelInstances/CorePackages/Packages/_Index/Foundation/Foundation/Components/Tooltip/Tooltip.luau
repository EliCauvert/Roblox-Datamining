local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UserInputService = require(Foundation.Utility.Wrappers).Services.UserInputService
local FlagsModule = require(Foundation.Utility.Flags)
local ConstantsModule = require(Foundation.Constants)
local LoggerModule = require(Foundation.Utility.Logger)
local PopoverContextModule = require(Foundation.Components.Popover.PopoverContext)
local RadiusModule = require(Foundation.Enums.Radius)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local PopoverModule = require(Foundation.Components.Popover)
local config = {
	testId = "--foundation-tooltip",
	align = require(Foundation.Enums.PopoverAlign).Start,
	side = require(Foundation.Enums.PopoverSide).Right,
	hasArrow = if FlagsModule.FoundationTooltipBeta then true else nil
}

local function AnchorWrapper(p1) --[[ Line: 52 ]]
	-- upvalues: ReactModule (copy), PopoverContextModule (copy), LoggerModule (copy), PopoverModule (copy), WithCommonPropsModule (copy)
	local UseContextResult = ReactModule.useContext(PopoverContextModule)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 56 ]]
		-- upvalues: UseContextResult (copy), LoggerModule (upval), UseRefResult (copy), p1 (copy)
		if UseContextResult.anchor ~= nil then
			if typeof(UseContextResult.anchor) ~= "Instance" then
				LoggerModule:warning("MeasurableRef cannot be an anchor for the tooltip")
				
				return
			end
			UseRefResult.current = UseContextResult.anchor:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 62 ]]
				-- upvalues: p1 (upval), UseContextResult (upval)
				p1.onHover(UseContextResult.anchor.GuiState == Enum.GuiState.Hover)
			end)
		end
		return function() --[[ Line: 67 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current ~= nil then
				UseRefResult.current:Disconnect()
			end
		end
	end, { UseContextResult.anchor, p1.onHover })
	
	return ReactModule.createElement(PopoverModule.Anchor, WithCommonPropsModule(p1, {}), p1.children)
end

return ReactModule.memo(function(p1) --[[ Line: 77 | Named "Tooltip" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseTokensModule (copy), UseScaledValueModule (copy), FlagsModule (copy), ConstantsModule (copy), UserInputService (copy), PopoverModule (copy), AnchorWrapper (copy), WithCommonPropsModule (copy), RadiusModule (copy), ViewModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTokensModuleResult = UseTokensModule()
	local IsNotTextMatch: boolean = WithDefaultsModuleResult.text ~= nil and WithDefaultsModuleResult.text ~= ""
	local UseMemoResult = ReactModule.useMemo(function(): string? --[[ Line: 100 ]]
		-- upvalues: WithDefaultsModuleResult (copy), UserInputService (upval)
		if WithDefaultsModuleResult.shortcut == nil then
			return nil
		end
		local Text = ""
		
		for i, value in WithDefaultsModuleResult.shortcut do
			local StringForKeyCode = UserInputService:GetStringForKeyCode(value)
			
			if StringForKeyCode == nil or StringForKeyCode == "" then
				StringForKeyCode = value.Name
			end
			if i > 1 then
				Text ..= " + "
			end
			Text ..= StringForKeyCode
		end
		return Text
	end, { WithDefaultsModuleResult.shortcut })
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = UseStateResult,
		testId = WithDefaultsModuleResult.testId
	}, {
		Anchor = ReactModule.createElement(AnchorWrapper, WithCommonPropsModule(WithDefaultsModuleResult, { onHover = UseStateResult2 }), WithDefaultsModuleResult.children),
		Content = ReactModule.createElement(PopoverModule.Content, {
			selectionGroup = false,
			hasArrow = if FlagsModule.FoundationTooltipBeta then WithDefaultsModuleResult.hasArrow else false,
			align = WithDefaultsModuleResult.align,
			side = {
				position = WithDefaultsModuleResult.side,
				offset = UseTokensModuleResult.Size.Size_200
			},
			radius = RadiusModule.Small,
			backgroundStyle = UseTokensModuleResult.Inverse.Surface.Surface_0,
			onPressedOutside = if FlagsModule.FoundationTooltipPressedOutside then function() --[[ Line: 143 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end else nil
		}, ReactModule.createElement(ViewModule, {
			tag = {
				["col gap-xsmall auto-xy"] = true,
				["padding-x-medium padding-y-small"] = not FlagsModule.FoundationTooltipBeta and WithDefaultsModuleResult.text ~= nil,
				["padding-x-small padding-y-xsmall"] = not FlagsModule.FoundationTooltipBeta and WithDefaultsModuleResult.text == nil
			},
			padding = if FlagsModule.FoundationTooltipBeta then if IsNotTextMatch then {
				top = UDim.new(0, UseTokensModuleResult.Size.Size_150),
				bottom = UDim.new(0, UseTokensModuleResult.Size.Size_200),
				left = UDim.new(0, UseTokensModuleResult.Size.Size_200),
				right = UDim.new(0, UseTokensModuleResult.Size.Size_200)
			} else {
				top = UDim.new(0, UseTokensModuleResult.Size.Size_100),
				bottom = UDim.new(0, UseTokensModuleResult.Size.Size_150),
				left = UDim.new(0, UseTokensModuleResult.Size.Size_150),
				right = UDim.new(0, UseTokensModuleResult.Size.Size_150)
			} else nil,
			sizeConstraint = {
				MaxSize = Vector2.new(UseScaledValueModule(if FlagsModule.FoundationTooltipBeta then ConstantsModule.TOOLTIP_MAX_WIDTH else 320), 1e999)
			}
		}, {
			Header = if WithDefaultsModuleResult.title == "" and not WithDefaultsModuleResult.shortcut then nil else ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				tag = "row flex-between gap-small size-full-0 auto-y"
			}, {
				Title = if WithDefaultsModuleResult.title == "" then nil else ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = WithDefaultsModuleResult.title,
					tag = {
						["shrink auto-xy text-truncate-end content-inverse-emphasis"] = true,
						["text-title-small"] = not FlagsModule.FoundationTooltipBeta,
						["text-caption-medium"] = FlagsModule.FoundationTooltipBeta and IsNotTextMatch,
						["text-body-small"] = FlagsModule.FoundationTooltipBeta and not IsNotTextMatch
					},
					testId = `{WithDefaultsModuleResult.testId}--title`
				}),
				Shortcut = if WithDefaultsModuleResult.shortcut then ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small content-inverse-muted",
					Text = UseMemoResult,
					testId = `{WithDefaultsModuleResult.testId}--shortcut`
				}) else nil
			}),
			Text = if WithDefaultsModuleResult.text and WithDefaultsModuleResult.text ~= "" then ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
				Text = WithDefaultsModuleResult.text,
				testId = `{WithDefaultsModuleResult.testId}--text`
			}) else nil
		}))
	})
end)