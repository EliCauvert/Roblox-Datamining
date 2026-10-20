local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local OpenTypeSupport = UIBlox.Utility.OpenTypeSupport
local Parent = script.Parent.Parent
local FFlagLuaMenuPerfImprovementsModule = require(Parent.Flags.FFlagLuaMenuPerfImprovements)
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local GetFFlagLuaAppEnableOpenTypeIGMFixFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Image = FoundationModule.Image
local config = {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.new(0, 24, 1, 1),
	Size = UDim2.new(0, 56, 0, 56)
}
local PlayerLabelV2 = Roact.PureComponent:extend("PlayerLabelV2")
PlayerLabelV2.validateProps = T.strictInterface(require(CorePackages.Workspace.Packages.RoactUtils).validatePropsWithForwardRef({
	userId = T.number,
	username = T.string,
	displayName = T.string,
	isOnline = T.boolean,
	isSelected = T.boolean,
	LayoutOrder = T.integer,
	Visible = T.optional(T.boolean),
	onActivated = T.optional(T.callback),
	[Roact.Children] = T.optional(T.table),
	[Roact.Change.AbsolutePosition] = T.optional(T.callback),
	[Roact.Ref] = T.optional(T.union(T.callback, T.table))
}))
PlayerLabelV2.defaultProps = { Visible = true }

if FFlagLuaMenuPerfImprovementsModule then
	function PlayerLabelV2.init(p1)
		function p1.onActivated()
			-- upvalues: p1 (copy)
			p1.props.onActivated(p1.props.userId)
		end
	end
end
function PlayerLabelV2.renderButtons(p1)
	-- upvalues: Roact (copy), Cryo (copy)
	return (Cryo.Dictionary.join(p1.props[Roact.Children] or {}, {
		List = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		})
	}))
end

function PlayerLabelV2.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FFlagLuaMenuPerfImprovementsModule (copy), Roact (copy), CursorType (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), Cryo (copy), config (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), GetFFlagLuaAppEnableOpenTypeIGMFixFunction (copy), OpenTypeSupport (copy)
	local Props = p1.props
	local Username = if Props.displayName == "" then Props.username else Props.displayName or Props.username
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				BackgroundContrast = {
					Color = p2.Color.Surface.Surface_100.Color3,
					Transparency = p2.Color.Surface.Surface_100.Transparency
				},
				BackgroundOnHover = {
					Color = p2.Color.State.Hover.Color3,
					Transparency = p2.Color.State.Hover.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: p1 (copy), FFlagLuaMenuPerfImprovementsModule (upval), Roact (upval), Props (copy), Callback (copy), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), Cryo (upval), config (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), Username (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), GetFFlagLuaAppEnableOpenTypeIGMFixFunction (upval), OpenTypeSupport (upval)
		local BackgroundOnHover = if p1.props.isSelected then p2.Theme.BackgroundOnHover else p2.Theme.BackgroundContrast
		
		return Roact.createElement("TextButton", {
			BackgroundTransparency = BackgroundOnHover.Transparency,
			BackgroundColor3 = BackgroundOnHover.Color,
			BorderSizePixel = 0,
			LayoutOrder = Props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 71),
			Visible = Props.Visible,
			Text = "",
			AutoButtonColor = false,
			[Roact.Event.Activated] = if FFlagLuaMenuPerfImprovementsModule then p1.props.onActivated and p1.onActivated or nil else p1.props.onActivated,
			[Roact.Change.AbsolutePosition] = p1.props[Roact.Change.AbsolutePosition],
			[Roact.Ref] = p1.props.forwardRef,
			SelectionImageObject = Callback(CursorType.Square)
		}, {
			PlayerIcon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, Cryo.Dictionary.join(config, {
				ZIndex = 2,
				Image = Props.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. Props.userId .. "&w=60&h=60" or "",
				imageStyle = {
					Transparency = 0,
					Color3 = Props.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115)
				}
			})) else Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(config, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				ImageColor3 = Props.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115),
				Image = Props.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. Props.userId .. "&w=60&h=60" or ""
			})),
			DisplayNameLabel = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				Position = UDim2.new(0, 104, 0, 14),
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(0, 219, 0, 22),
				Text = Username,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			UsernameLabel = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextDefault",
				Position = UDim2.new(0, 104, 0, 36),
				Size = UDim2.new(0, 219, 0, 22),
				Text = "@" .. Props.username,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				OpenTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() and GetFFlagLuaAppEnableOpenTypeIGMFixFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			}),
			ButtonContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -24, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p1:renderButtons())
		})
	end)
end

function PlayerLabelV2.render(p1)
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), PlayerLabelV2 (copy), Cryo (copy)
	return Roact.createElement(PlayerLabelV2, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)