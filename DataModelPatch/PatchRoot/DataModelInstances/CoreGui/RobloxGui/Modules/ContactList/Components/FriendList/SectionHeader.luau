local CoreGui = game:GetService("CoreGui")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local UIBlox = require(CoreGui:WaitForChild("RobloxGui").Modules.ContactList.dependencies).UIBlox
local Colors = UIBlox.App.Style.Colors
local UseStyleFunction = UIBlox.Core.Style.useStyle
local Interactable = UIBlox.Core.Control.Interactable
local TooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local WithTooltipFunction = UIBlox.App.Dialog.TooltipV2.withTooltip
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images

local function OnStateChanged() end

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), WithTooltipFunction (copy), TooltipOrientation (copy), CoreGui (copy), Interactable (copy), OnStateChanged (copy), ImageSetLabel (copy), Images (copy), Colors (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement("Frame", {
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 0, 24),
		BackgroundColor3 = Theme.BackgroundContrast.Color,
		LayoutOrder = p1.layoutOrder
	}, {
		UIPadding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) }),
		HeaderText = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -28, 1, 0),
			Font = UseStyleResultFont.Footer.Font,
			Text = string.upper(p1.name),
			TextColor3 = Theme.TextDefault.Color,
			TextSize = UseStyleResultFont.Footer.RelativeSize * UseStyleResultFont.BaseSize,
			TextTransparency = Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0)
		}),
		Tooltip = WithTooltipFunction({ headerText = p1.name, bodyText = p1.description }, {
			DisplayOrder = 100,
			preferredOrientation = TooltipOrientation.Right,
			guiTarget = CoreGui,
			active = UseStateResult
		}, function(p2)
			-- upvalues: ReactModule (upval), Interactable (upval), UseStateResult2 (copy), UseStateResult (copy), OnStateChanged (upval), ImageSetLabel (upval), Images (upval), Colors (upval)
			return ReactModule.createElement(Interactable, {
				Position = UDim2.new(1, -28, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.fromOffset(28, 28),
				BackgroundTransparency = 1,
				[ReactModule.Change.AbsolutePosition] = p2,
				[ReactModule.Change.AbsoluteSize] = p2,
				[ReactModule.Event.Activated] = function(_)
					-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
					UseStateResult2(not UseStateResult)
				end,
				onStateChanged = OnStateChanged
			}, {
				Label = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Image = Images["icons/actions/info"],
					ImageColor3 = Colors.White
				})
			})
		end)
	})
end