local coreGuiService = game:GetService("CoreGui")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local UIBlox = require(coreGuiService:WaitForChild("RobloxGui").Modules.ContactList.dependencies).UIBlox
local colors = UIBlox.App.Style.Colors
local useStyle = UIBlox.Core.Style.useStyle
local interactable = UIBlox.Core.Control.Interactable
local tooltipOrientation = UIBlox.App.Dialog.Enum.TooltipOrientation
local withTooltip = UIBlox.App.Dialog.TooltipV2.withTooltip
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local images = UIBlox.App.ImageSet.Images

local var2 = function() --[[ line: 29 ]] end

return function(p0) --[[ line: 31 | named "SectionHeader" ]]
	-- upvalues: useStyle (ref), reactModule (ref), withTooltip (ref), tooltipOrientation (ref), coreGuiService (ref), interactable (ref), var2 (ref), imageSetLabel (ref), images (ref), colors (ref)
	local var3 = useStyle()
	local theme = var3.Theme
	local font = var3.Font
	local var4, var5 = reactModule.useState(false)
	
	return reactModule.createElement("Frame", {
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.new(1, 0, 0, 24),
		BackgroundColor3 = theme.BackgroundContrast.Color,
		LayoutOrder = p0.layoutOrder
	}, {
		UIPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) }),
		HeaderText = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -28, 1, 0),
			Font = font.Footer.Font,
			Text = string.upper(p0.name),
			TextColor3 = theme.TextDefault.Color,
			TextSize = font.Footer.RelativeSize * font.BaseSize,
			TextTransparency = theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0)
		}),
		Tooltip = withTooltip({ headerText = p0.name, bodyText = p0.description }, {
			DisplayOrder = 100,
			preferredOrientation = tooltipOrientation.Right,
			guiTarget = coreGuiService,
			active = var4
		}, function(p1) --[[ line: 68 ]]
			-- upvalues: reactModule (copy), interactable (copy), var5 (ref), var4 (ref), var2 (copy), imageSetLabel (copy), images (copy), colors (copy)
			return reactModule.createElement(interactable, {
				Position = UDim2.new(1, -28, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Size = UDim2.fromOffset(28, 28),
				BackgroundTransparency = 1,
				[reactModule.Change.AbsolutePosition] = p1,
				[reactModule.Change.AbsoluteSize] = p1,
				[reactModule.Event.Activated] = function(_) --[[ line: 76 ]]
					-- upvalues: var5 (copy), var4 (copy)
					var5(not var4)
				end,
				onStateChanged = var2
			}, {
				Label = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Image = images["icons/actions/info"],
					ImageColor3 = colors.White
				})
			})
		end)
	})
end