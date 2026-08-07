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

function listEntry.render(p0) --[[ line: 34 ]]
	-- upvalues: withStyle (ref), text (ref), roactModule (ref), roactFitComponents (ref), fitTextLabel (ref)
	return withStyle(function(p1) --[[ line: 35 ]]
		-- upvalues: text (copy), p0 (ref), roactModule (copy), roactFitComponents (copy), fitTextLabel (copy)
		local font = p1.Font
		local theme = p1.Theme
		local font_1 = font.CaptionBody.Font
		local var6 = font.BaseSize * font.CaptionBody.RelativeSize
		local textWidth = text.GetTextWidth("\226\128\162 ", font_1, var6)
		
		return roactModule.createElement(roactFitComponents.FitFrameVertical, {
			width = UDim.new(1, 0),
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			[roactModule.Change.AbsolutePosition] = p0.props.positionChangedCallback,
			NextSelectionLeft = p0.props.NextSelectionLeft,
			NextSelectionRight = p0.props.NextSelectionRight,
			NextSelectionUp = p0.props.NextSelectionUp,
			NextSelectionDown = p0.props.NextSelectionDown,
			[roactModule.Ref] = p0.props.forwardRef
		}, {
			Bullet = p0.props.hasBullet and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = "\226\128\162 ",
				LayoutOrder = 1,
				Size = UDim2.fromOffset(textWidth, var6),
				Font = font_1,
				TextSize = var6,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Text = roactModule.createElement(fitTextLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				width = UDim.new(1, if p0.props.hasBullet then -textWidth else 0),
				Text = p0.props.text,
				Font = font_1,
				TextSize = var6,
				TextColor3 = theme.TextDefault.Color,
				TextTransparency = theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	end)
end

return roactModule.forwardRef(function(p2, p3) --[[ line: 91 ]]
	-- upvalues: roactModule (ref), listEntry (ref), cryoModule (ref)
	return roactModule.createElement(listEntry, cryoModule.Dictionary.join(p2, { forwardRef = p3 }))
end)