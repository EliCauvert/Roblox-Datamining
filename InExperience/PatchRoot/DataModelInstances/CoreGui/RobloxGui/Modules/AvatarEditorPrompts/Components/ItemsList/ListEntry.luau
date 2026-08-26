local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui.Modules
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local text = require(corePackagesService.Workspace.Packages.AppCommonLib).Text
local roactFitComponents = require(corePackagesService.Packages.AvatarExperienceDeps).RoactFitComponents
local fitTextLabel = roactFitComponents.FitTextLabel
local withStyle = UIBloxModule.Style.withStyle
local listEntry = roactModule.PureComponent:extend("ListEntry")
listEntry.validateProps = tModule.strictInterface({
	text = tModule.string,
	hasBullet = tModule.boolean,
	layoutOrder = tModule.integer,
	positionChangedCallback = tModule.optional(tModule.callback),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	forwardRef = tModule.optional(tModule.table)
})

function listEntry.render(p1)
	-- upvalues: withStyle (ref), text (ref), roactModule (ref), roactFitComponents (ref), fitTextLabel (ref)
	return withStyle(function(p2)
		-- upvalues: text (copy), p1 (ref), roactModule (copy), roactFitComponents (copy), fitTextLabel (copy)
		local font = p2.Font
		local theme = p2.Theme
		local font_1 = font.CaptionBody.Font
		local var1 = font.BaseSize * font.CaptionBody.RelativeSize
		local textWidth = text.GetTextWidth("\226\128\162 ", font_1, var1)
		
		return roactModule.createElement(roactFitComponents.FitFrameVertical, {
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			[roactModule.Change.AbsolutePosition] = p1.props.positionChangedCallback,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			[roactModule.Ref] = p1.props.forwardRef
		}, {
			Bullet = p1.props.hasBullet and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = "\226\128\162 ",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(textWidth, var1),
				Font = font_1,
				TextSize = var1,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Text = roactModule.createElement(fitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				width = UDim.new(1, if p1.props.hasBullet then -textWidth else 0),
				Text = p1.props.text,
				Font = font_1,
				TextSize = var1,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	end)
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), listEntry (ref), cryoModule (ref)
	return roactModule.createElement(listEntry, cryoModule.Dictionary.join(p1, { forwardRef = p2 }))
end)