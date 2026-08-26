local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers).Services.UserInputService
local flagsModule = require(foundation.Utility.Flags)
local constantsModule = require(foundation.Constants)
local loggerModule = require(foundation.Utility.Logger)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverContextModule = require(foundation.Components.Popover.PopoverContext)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local popoverModule = require(foundation.Components.Popover)
local t = {
	testId = "--foundation-tooltip",
	align = popoverAlignModule.Start,
	side = popoverSideModule.Right,
	hasArrow = if flagsModule.FoundationTooltipBeta then true else nil
}

local function AnchorWrapper(p1)
	-- upvalues: reactModule (ref), popoverContextModule (ref), loggerModule (ref), popoverModule (ref), withCommonPropsModule (ref)
	local var1 = reactModule.useContext(popoverContextModule)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), loggerModule (copy), var2 (ref), p1 (ref)
		if var1.anchor ~= nil then
			if typeof(var1.anchor) ~= "Instance" then
				loggerModule:warning("MeasurableRef cannot be an anchor for the tooltip")
				
				return
			end
			var2.current = var1.anchor:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: p1 (copy), var1 (copy)
				p1.onHover(var1.anchor.GuiState == Enum.GuiState.Hover)
			end)
		end
		return function()
			-- upvalues: var2 (copy)
			if var2.current ~= nil then
				var2.current:Disconnect()
			end
		end
	end, { var1.anchor, p1.onHover })
	
	return reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(p1, {}), p1.children)
end

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useScaledValueModule (ref), flagsModule (ref), constantsModule (ref), userInputService (ref), popoverModule (ref), AnchorWrapper (ref), withCommonPropsModule (ref), radiusModule (ref), viewModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2, var3 = reactModule.useState(false)
	local var4 = useTokensModule()
	local var5 = var1.text ~= nil and var1.text ~= ""
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var2, testId = var1.testId }, {
		Anchor = reactModule.createElement(AnchorWrapper, withCommonPropsModule(var1, { onHover = var3 }), var1.children),
		Content = reactModule.createElement(popoverModule.Content, {
			selectionGroup = false,
			hasArrow = if flagsModule.FoundationTooltipBeta then var1.hasArrow else false,
			align = var1.align,
			side = { position = var1.side, offset = var4.Size.Size_200 },
			radius = radiusModule.Small,
			backgroundStyle = var4.Inverse.Surface.Surface_0,
			onPressedOutside = if flagsModule.FoundationTooltipPressedOutside then function()
				-- upvalues: var3 (ref)
				var3(false)
			end else nil
		}, reactModule.createElement(viewModule, {
			tag = {
				["col gap-xsmall auto-xy"] = true,
				["padding-x-medium padding-y-small"] = not flagsModule.FoundationTooltipBeta and var1.text ~= nil,
				["padding-x-small padding-y-xsmall"] = not flagsModule.FoundationTooltipBeta and var1.text == nil
			},
			padding = if flagsModule.FoundationTooltipBeta then if var5 then {
				top = UDim.new(0, var4.Size.Size_150),
				bottom = UDim.new(0, var4.Size.Size_200),
				left = UDim.new(0, var4.Size.Size_200),
				right = UDim.new(0, var4.Size.Size_200)
			} else {
				top = UDim.new(0, var4.Size.Size_100),
				bottom = UDim.new(0, var4.Size.Size_150),
				left = UDim.new(0, var4.Size.Size_150),
				right = UDim.new(0, var4.Size.Size_150)
			} else nil,
			sizeConstraint = {
				MaxSize = Vector2.new(useScaledValueModule(if flagsModule.FoundationTooltipBeta then constantsModule.TOOLTIP_MAX_WIDTH else 320), 1e999)
			}
		}, {
			Header = if var1.title == "" and not var1.shortcut then nil else reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "row flex-between gap-small size-full-0 auto-y"
			}, {
				Title = if var1.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var1.title,
					tag = {
						["shrink auto-xy text-truncate-end content-inverse-emphasis"] = true,
						["text-title-small"] = not flagsModule.FoundationTooltipBeta,
						["text-caption-medium"] = flagsModule.FoundationTooltipBeta and var5,
						["text-body-small"] = flagsModule.FoundationTooltipBeta and not var5
					},
					testId = `{var1.testId}--title`
				}),
				Shortcut = if var1.shortcut then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small content-inverse-muted",
					Text = reactModule.useMemo(function()
						-- upvalues: var1 (ref), userInputService (copy)
						if var1.shortcut == nil then
							return nil
						end
						local var6 = ""
						
						for i, v in var1.shortcut do
							local var7 = userInputService:GetStringForKeyCode(v)
							
							if var7 == nil or var7 == "" then
								var7 = v.Name
							end
							if i > 1 then
								var6 ..= " + "
							end
							var6 ..= var7
						end
						return var6
					end, { var1.shortcut }),
					testId = `{var1.testId}--shortcut`
				}) else nil
			}),
			Text = if var1.text and var1.text ~= "" then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
				Text = var1.text,
				testId = `{var1.testId}--text`
			}) else nil
		}))
	})
end)