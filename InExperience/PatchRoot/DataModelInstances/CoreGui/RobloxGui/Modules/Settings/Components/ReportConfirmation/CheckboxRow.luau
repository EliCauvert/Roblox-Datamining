local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local checkbox = require(corePackagesService.Packages.Foundation).Checkbox
local withStyle = UIBloxModule.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local checkboxRow = roactModule.PureComponent:extend("CheckboxRow")
checkboxRow.defaultProps = {
	height = 28,
	image = "icons/controls/microphone",
	descriptionText = "Description Text",
	checkboxSelected = false,
	actionDisabled = false,
	LayoutOrder = 1,
	onCheckboxActivated = function() --[[ line: 25 ]] end
}
checkboxRow.validateProps = tModule.interface({
	height = tModule.number,
	image = tModule.string,
	descriptionText = tModule.string,
	checkboxSelected = tModule.boolean,
	actionDisabled = tModule.boolean,
	onCheckboxActivated = tModule.callback,
	LayoutOrder = tModule.optional(tModule.number)
})

function checkboxRow.render(p0) --[[ line: 39 ]]
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), images (ref), checkbox (ref)
	return withStyle(function(p1) --[[ line: 40 ]]
		-- upvalues: p0 (ref), roactModule (copy), imageSetLabel (copy), images (copy), checkbox (copy)
		local textMuted, iconDefault
		local baseSize = p1.Font.BaseSize
		local _ = nil
		local _ = nil
		
		if p0.props.actionDisabled then
			textMuted = p1.Theme.TextMuted
			iconDefault = p1.Theme.IconDefault
		else
			textMuted = p1.Theme.TextEmphasis
			iconDefault = p1.Theme.IconEmphasis
		end
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p0.props.height),
			LayoutOrder = p0.props.LayoutOrder
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 12),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			image = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(p0.props.height, p0.props.height),
				Image = images[p0.props.image],
				ImageColor3 = iconDefault.Color,
				ImageTransparency = iconDefault.Transparency
			}),
			text = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, -(p0.props.height + 12) * 4, 1, 0),
				Text = p0.props.descriptionText,
				TextColor3 = textMuted.Color,
				TextTransparency = textMuted.Transparency,
				TextSize = p1.Font.Header2.RelativeSize * baseSize,
				Font = p1.Font.Header2.Font,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			checkbox = roactModule.createElement(checkbox, {
				label = "",
				LayoutOrder = 3,
				isDisabled = p0.props.actionDisabled,
				isChecked = p0.props.checkboxSelected,
				onActivated = p0.props.onCheckboxActivated
			})
		})
	end)
end

return checkboxRow