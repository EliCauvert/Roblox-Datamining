local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindowHeader_1 = constantsModule.DefaultFontSize.MainWindowHeader
local text = constantsModule.Color.Text
local unselectedGray = constantsModule.Color.UnselectedGray
local padding = constantsModule.Tooltip.Padding
local offset = constantsModule.Tooltip.Offset
local maxWidth = constantsModule.Tooltip.MaxWidth
local delay = constantsModule.Tooltip.Delay

return function(p0)
	-- upvalues: reactModule (ref), delay (ref), roactModule (ref), coreGuiService (ref), mainWindowHeader_1 (ref), text (ref), mainWindowHeader (ref), offset (ref), unselectedGray (ref), padding (ref), maxWidth (ref)
	local var5, var6 = reactModule.useState(false)
	local text_1 = p0.text
	local pos = p0.pos
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), delay (copy)
		var6(false)
		local var7 = false
		task.delay(delay, function()
			-- upvalues: var7 (write), var6 (copy)
			if var7 then
				return
			end
			var6(true)
		end)
		
		return function()
			-- upvalues: var7 (write)
			var7 = true
		end
	end, { text_1, pos })
	
	return roactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
		TooltipContainer = roactModule.createElement("ScreenGui", {
			DisplayOrder = 20,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			Enabled = var5
		}, {
			Tooltip = roactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Text = text_1,
				TextSize = mainWindowHeader_1,
				TextColor3 = text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = mainWindowHeader,
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = pos + offset,
				BackgroundColor3 = unselectedGray
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = padding,
					PaddingBottom = padding,
					PaddingLeft = padding,
					PaddingRight = padding
				}),
				SizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(maxWidth, 1e999) })
			})
		})
	})
end