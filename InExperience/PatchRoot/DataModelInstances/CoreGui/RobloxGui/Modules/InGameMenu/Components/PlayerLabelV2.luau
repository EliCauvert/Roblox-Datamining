local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local openTypeSupport = UIBlox.Utility.OpenTypeSupport
local parent = script.Parent.Parent
local fFlagLuaMenuPerfImprovementsModule = require(parent.Flags.FFlagLuaMenuPerfImprovements)
local getFFlagLuaAppEnableOpenTypeSupport = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local getFFlagLuaAppEnableOpenTypeIGMFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local t_1 = {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.new(0, 24, 1, 1),
	Size = UDim2.new(0, 56, 0, 56)
}
local playerLabelV2 = roact.PureComponent:extend("PlayerLabelV2")
playerLabelV2.validateProps = t.strictInterface(require(corePackagesService.Workspace.Packages.RoactUtils).validatePropsWithForwardRef({
	userId = t.number,
	username = t.string,
	displayName = t.string,
	isOnline = t.boolean,
	isSelected = t.boolean,
	LayoutOrder = t.integer,
	Visible = t.optional(t.boolean),
	onActivated = t.optional(t.callback),
	[roact.Children] = t.optional(t.table),
	[roact.Change.AbsolutePosition] = t.optional(t.callback),
	[roact.Ref] = t.optional(t.union(t.callback, t.table))
}))
playerLabelV2.defaultProps = { Visible = true }

if fFlagLuaMenuPerfImprovementsModule then
	function playerLabelV2.init(p0) --[[ line: 69 ]]
		function p0.onActivated() --[[ line: 70 ]]
			-- upvalues: p0 (ref)
			p0.props.onActivated(p0.props.userId)
		end
	end
end
function playerLabelV2.renderButtons(p1) --[[ line: 76 ]]
	-- upvalues: roact (ref), cryo (ref)
	return cryo.Dictionary.join(p1.props[roact.Children] or {}, {
		List = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		})
	})
end

function playerLabelV2.renderWithSelectionCursor(p2, p3) --[[ line: 91 ]]
	-- upvalues: withStyle (ref), fFlagLuaMenuPerfImprovementsModule (ref), roact (ref), cursorKind (ref), imageSetLabel (ref), cryo (ref), t_1 (ref), themedTextLabelModule (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), getFFlagLuaAppEnableOpenTypeIGMFix (ref), openTypeSupport (ref)
	local props = p2.props
	local var6 = if props.displayName ~= "" then props.displayName else props.username
	
	return withStyle(function(p4) --[[ line: 101 ]]
		-- upvalues: p2 (ref), fFlagLuaMenuPerfImprovementsModule (copy), roact (copy), props (ref), p3 (ref), cursorKind (copy), imageSetLabel (copy), cryo (copy), t_1 (copy), themedTextLabelModule (copy), var6 (ref), getFFlagLuaAppEnableOpenTypeSupport (copy), getFFlagLuaAppEnableOpenTypeIGMFix (copy), openTypeSupport (copy)
		local var7 = if p2.props.isSelected then p4.Theme.BackgroundOnHover else p4.Theme.BackgroundContrast
		
		return roact.createElement("TextButton", {
			BackgroundTransparency = var7.Transparency,
			BackgroundColor3 = var7.Color,
			BorderSizePixel = 0,
			LayoutOrder = props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 71),
			Visible = props.Visible,
			Text = "",
			AutoButtonColor = false,
			[roact.Event.Activated] = if fFlagLuaMenuPerfImprovementsModule then if p2.props.onActivated then p2.onActivated else nil else p2.props.onActivated,
			[roact.Change.AbsolutePosition] = p2.props[roact.Change.AbsolutePosition],
			[roact.Ref] = p2.props.forwardRef,
			SelectionImageObject = p3(cursorKind.Square)
		}, {
			PlayerIcon = roact.createElement(imageSetLabel, cryo.Dictionary.join(t_1, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				ImageColor3 = props.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115),
				Image = if props.userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. props.userId .. "&w=60&h=60" else ""
			})),
			DisplayNameLabel = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				Position = UDim2.new(0, 104, 0, 14),
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(0, 219, 0, 22),
				Text = var6,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			UsernameLabel = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextDefault",
				Position = UDim2.new(0, 104, 0, 36),
				Size = UDim2.new(0, 219, 0, 22),
				Text = "@" .. props.username,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				OpenTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() and getFFlagLuaAppEnableOpenTypeIGMFix() then openTypeSupport:getUserNameStylisticAlternative() else nil
			}),
			ButtonContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -24, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p2:renderButtons())
		})
	end)
end

function playerLabelV2.render(p5) --[[ line: 182 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p6) --[[ line: 183 ]]
		-- upvalues: p5 (ref)
		return p5:renderWithSelectionCursor(p6)
	end)
end

return roact.forwardRef(function(p7, p8) --[[ line: 188 ]]
	-- upvalues: roact (ref), playerLabelV2 (ref), cryo (ref)
	return roact.createElement(playerLabelV2, cryo.Dictionary.join(p7, { forwardRef = p8 }))
end)