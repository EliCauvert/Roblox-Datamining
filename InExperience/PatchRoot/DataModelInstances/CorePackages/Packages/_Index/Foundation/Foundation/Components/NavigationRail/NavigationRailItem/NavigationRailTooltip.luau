local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local PopoverModule = require(Foundation.Components.Popover)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local RadiusModule = require(Foundation.Enums.Radius)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function NavigationRailTooltipPanel(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), UseScaledValueModule (copy), ConstantsModule (copy), PopoverSideModule (copy), PopoverModule (copy), RadiusModule (copy), ViewModule (copy), TextModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.isHovered and p1.noLabel)
	end, { p1.isHovered, p1.noLabel })
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = UseStateResult and p1.noLabel,
		testId = p1.testId
	}, {
		Anchor = ReactModule.createElement(PopoverModule.Anchor, { anchorRef = p1.anchorRef }),
		Content = ReactModule.createElement(PopoverModule.Content, {
			selectionGroup = false,
			side = ReactModule.useMemo(function()
				-- upvalues: PopoverSideModule (upval), UseTokensModuleResult (copy)
				return {
					position = PopoverSideModule.Right,
					offset = UseTokensModuleResult.Size.Size_200
				}
			end, { UseTokensModuleResult }),
			radius = RadiusModule.Small,
			backgroundStyle = UseTokensModuleResult.Inverse.Surface.Surface_0
		}, ReactModule.createElement(ViewModule, {
			tag = "col gap-xsmall auto-xy",
			padding = {
				top = UDim.new(0, UseTokensModuleResult.Size.Size_100),
				bottom = UDim.new(0, UseTokensModuleResult.Size.Size_150),
				left = UDim.new(0, UseTokensModuleResult.Size.Size_150),
				right = UDim.new(0, UseTokensModuleResult.Size.Size_150)
			},
			sizeConstraint = {
				MaxSize = Vector2.new(UseScaledValueModule(ConstantsModule.TOOLTIP_MAX_WIDTH), 1e999)
			}
		}, {
			Title = ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				tag = "shrink auto-xy text-body-small text-truncate-end content-inverse-emphasis",
				Text = p1.title,
				testId = `{p1.testId}--title`
			})
		}))
	})
end

return function(p1)
	-- upvalues: UsePluginModule (copy), IsPluginSecurityModule (copy), ReactModule (copy), NavigationRailTooltipPanel (copy)
	local _, UsePluginModuleResult2 = UsePluginModule()
	
	return if IsPluginSecurityModule() and UsePluginModuleResult2 then nil else ReactModule.createElement(NavigationRailTooltipPanel, p1)
end