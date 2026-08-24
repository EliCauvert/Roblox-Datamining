local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers).Services.UserInputService
local flagsModule = require(foundation.Utility.Flags)
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
	side = popoverSideModule.Right
}

local function AnchorWrapper(p0)
	-- upvalues: reactModule (ref), popoverContextModule (ref), loggerModule (ref), popoverModule (ref), withCommonPropsModule (ref)
	local var17 = reactModule.useContext(popoverContextModule)
	local var18 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), loggerModule (copy), var18 (ref), p0 (ref)
		if var17.anchor ~= nil then
			if typeof(var17.anchor) ~= "Instance" then
				loggerModule:warning("MeasurableRef cannot be an anchor for the tooltip")
				
				return
			end
			var18.current = var17.anchor:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: p0 (copy), var17 (copy)
				p0.onHover(var17.anchor.GuiState == Enum.GuiState.Hover)
			end)
		end
		return function()
			-- upvalues: var18 (copy)
			if var18.current ~= nil then
				var18.current:Disconnect()
			end
		end
	end, { var17.anchor, p0.onHover })
	
	return reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(p0, {}), p0.children)
end

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useScaledValueModule (ref), flagsModule (ref), userInputService (ref), popoverModule (ref), AnchorWrapper (ref), withCommonPropsModule (ref), radiusModule (ref), viewModule (ref), textModule (ref)
	local var19 = withDefaultsModule(p1, t)
	local var20, var21 = reactModule.useState(false)
	local var22 = useTokensModule()
	local var23 = var19.text ~= nil and var19.text ~= ""
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var20, testId = var19.testId }, {
		Anchor = reactModule.createElement(AnchorWrapper, withCommonPropsModule(var19, { onHover = var21 }), var19.children),
		Content = reactModule.createElement(popoverModule.Content, {
			selectionGroup = false,
			hasArrow = if flagsModule.FoundationTooltipBeta then true else false,
			align = var19.align,
			side = { position = var19.side, offset = var22.Size.Size_200 },
			radius = radiusModule.Small,
			backgroundStyle = var22.Inverse.Surface.Surface_0,
			onPressedOutside = if flagsModule.FoundationTooltipPressedOutside then function()
				-- upvalues: var21 (ref)
				var21(false)
			end else nil
		}, reactModule.createElement(viewModule, {
			tag = {
				["col gap-xsmall auto-xy"] = true,
				["padding-x-medium padding-y-small"] = not flagsModule.FoundationTooltipBeta and var19.text ~= nil,
				["padding-x-small padding-y-xsmall"] = not flagsModule.FoundationTooltipBeta and var19.text == nil
			},
			padding = if flagsModule.FoundationTooltipBeta then if var23 then {
				top = UDim.new(0, var22.Size.Size_150),
				bottom = UDim.new(0, var22.Size.Size_200),
				left = UDim.new(0, var22.Size.Size_200),
				right = UDim.new(0, var22.Size.Size_200)
			} else {
				top = UDim.new(0, var22.Size.Size_100),
				bottom = UDim.new(0, var22.Size.Size_150),
				left = UDim.new(0, var22.Size.Size_150),
				right = UDim.new(0, var22.Size.Size_150)
			} else nil,
			sizeConstraint = {
				MaxSize = Vector2.new(useScaledValueModule(if flagsModule.FoundationTooltipBeta then 280 else 320), 1e999)
			}
		}, {
			Header = if var19.title == "" and not var19.shortcut then nil else reactModule.createElement(viewModule, {
				LayoutOrder = 1,
				tag = "row flex-between gap-small size-full-0 auto-y"
			}, {
				Title = if var19.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = var19.title,
					tag = {
						["shrink auto-xy text-truncate-end content-inverse-emphasis"] = true,
						["text-title-small"] = not flagsModule.FoundationTooltipBeta,
						["text-caption-medium"] = flagsModule.FoundationTooltipBeta and var23,
						["text-body-small"] = flagsModule.FoundationTooltipBeta and not var23
					},
					testId = `{var19.testId}--title`
				}),
				Shortcut = if var19.shortcut then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-small content-inverse-muted",
					Text = reactModule.useMemo(function()
						-- upvalues: var19 (ref), userInputService (copy)
						if var19.shortcut == nil then
							return nil
						end
						local var24 = ""
						
						for i, v in var19.shortcut do
							local var25 = userInputService:GetStringForKeyCode(v)
							
							if var25 == nil or var25 == "" then
								var25 = v.Name
							end
							if i > 1 then
								var24 ..= " + "
							end
							var24 ..= var25
						end
						return var24
					end, { var19.shortcut }),
					testId = `{var19.testId}--shortcut`
				}) else nil
			}),
			Text = if var19.text and var19.text ~= "" then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-small text-wrap text-align-x-left content-inverse-default",
				Text = var19.text,
				testId = `{var19.testId}--text`
			}) else nil
		}))
	})
end)