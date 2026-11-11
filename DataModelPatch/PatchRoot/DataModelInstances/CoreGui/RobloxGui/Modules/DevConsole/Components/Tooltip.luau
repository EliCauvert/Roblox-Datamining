local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local MainWindowHeader1 = ConstantsModule.DefaultFontSize.MainWindowHeader
local Text = ConstantsModule.Color.Text
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local Padding = ConstantsModule.Tooltip.Padding
local Offset = ConstantsModule.Tooltip.Offset
local MaxWidth = ConstantsModule.Tooltip.MaxWidth
local Delay = ConstantsModule.Tooltip.Delay

return function(p1)
	-- upvalues: ReactModule (copy), Delay (copy), RoactModule (copy), CoreGui (copy), MainWindowHeader1 (copy), Text (copy), MainWindowHeader (copy), Offset (copy), UnselectedGray (copy), Padding (copy), MaxWidth (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Text1 = p1.text
	local Pos = p1.pos
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Delay (upval)
		UseStateResult2(false)
		local Flag = false
		task.delay(Delay, function()
			-- upvalues: Flag (ref), UseStateResult2 (upval)
			if not Flag then
				UseStateResult2(true)
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Text1, Pos })
	
	return RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		TooltipContainer = RoactModule.createElement("ScreenGui", {
			DisplayOrder = 20,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			Enabled = UseStateResult
		}, {
			Tooltip = RoactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Text = Text1,
				TextSize = MainWindowHeader1,
				TextColor3 = Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = MainWindowHeader,
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = Pos + Offset,
				BackgroundColor3 = UnselectedGray
			}, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = Padding,
					PaddingBottom = Padding,
					PaddingLeft = Padding,
					PaddingRight = Padding
				}),
				SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(MaxWidth, 1e999) })
			})
		})
	})
end