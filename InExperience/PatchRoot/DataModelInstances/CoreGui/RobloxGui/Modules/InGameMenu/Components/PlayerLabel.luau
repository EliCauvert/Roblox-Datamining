local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent
local FFlagLuaMenuPerfImprovementsModule = require(Parent.Flags.FFlagLuaMenuPerfImprovements)
local AssetsModule = require(Parent.Resources.Assets)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local Image = FoundationModule.Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local OpenTypeSupport = UIBlox.Utility.OpenTypeSupport
local config = {
	AnchorPoint = Vector2.new(0, 0.5),
	Position = UDim2.new(0, 24, 0.5, 0),
	Size = UDim2.new(0, 44, 0, 44)
}
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local GetFFlagLuaAppEnableOpenTypeIGMFixFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local PlayerLabel = Roact.PureComponent:extend("PlayerLabel")
PlayerLabel.validateProps = T.strictInterface(require(CorePackages.Workspace.Packages.RoactUtils).validatePropsWithForwardRef({
	userId = T.number,
	username = T.string,
	isOnline = T.boolean,
	isSelected = T.boolean,
	LayoutOrder = T.integer,
	Visible = T.optional(T.boolean),
	onActivated = T.optional(T.callback),
	[Roact.Children] = T.optional(T.table),
	[Roact.Change.AbsolutePosition] = T.optional(T.callback),
	[Roact.Ref] = T.optional(T.union(T.callback, T.table))
}))
PlayerLabel.defaultProps = { Visible = true }

if FFlagLuaMenuPerfImprovementsModule then
	function PlayerLabel.init(p1)
		function p1.onActivated()
			-- upvalues: p1 (copy)
			p1.props.onActivated(p1.props.userId)
		end
	end
end
function PlayerLabel.renderButtons(p1)
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

function PlayerLabel.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FFlagLuaMenuPerfImprovementsModule (copy), Roact (copy), CursorType (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), Cryo (copy), config (copy), AssetsModule (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), GetFFlagLuaAppEnableOpenTypeIGMFixFunction (copy), OpenTypeSupport (copy)
	local Props = p1.props
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				BackgroundContrast = {
					Color = p2.Color.Surface.Surface_100.Color3,
					Transparency = p2.Color.Surface.Surface_100.Transparency
				},
				UIDefault = {
					Color = p2.Color.Shift.Shift_200.Color3,
					Transparency = p2.Color.Shift.Shift_200.Transparency
				},
				OnlineStatus = {
					Color = p2.Color.System.Success.Color3,
					Transparency = p2.Color.System.Success.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: p1 (copy), FFlagLuaMenuPerfImprovementsModule (upval), Roact (upval), Props (copy), Callback (copy), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), Cryo (upval), config (upval), AssetsModule (upval), ImageSetLabel (upval), ThemedTextLabelModule (upval), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), GetFFlagLuaAppEnableOpenTypeIGMFixFunction (upval), OpenTypeSupport (upval)
		local Config = if p1.props.isSelected then { Transparency = 0, Color = Color3.fromRGB(48, 50, 52) } else p2.Theme.BackgroundContrast
		
		return Roact.createElement("TextButton", {
			BackgroundTransparency = Config.Transparency,
			BackgroundColor3 = Config.Color,
			BorderSizePixel = 0,
			LayoutOrder = Props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 70),
			Visible = Props.Visible,
			Text = "",
			AutoButtonColor = false,
			[Roact.Event.Activated] = if FFlagLuaMenuPerfImprovementsModule then p1.props.onActivated and p1.onActivated or nil else p1.props.onActivated,
			[Roact.Change.AbsolutePosition] = p1.props[Roact.Change.AbsolutePosition],
			[Roact.Ref] = p1.props.forwardRef,
			SelectionImageObject = Callback(CursorType.Square)
		}, {
			PlayerCutout = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, Cryo.Dictionary.join(config, {
				ZIndex = 3,
				Image = AssetsModule.Images.CircleCutout,
				imageStyle = { Transparency = 0, Color3 = Config.Color }
			})) else Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(config, {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Image = AssetsModule.Images.CircleCutout,
				ImageColor3 = Config.Color
			})),
			PlayerIcon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, Cryo.Dictionary.join(config, {
				ZIndex = 2,
				Image = Props.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. Props.userId .. "&w=48&h=48" or ""
			})) else Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(config, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Image = Props.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. Props.userId .. "&w=48&h=48" or ""
			})),
			PlayerBackground = Roact.createElement("Frame", Cryo.Dictionary.join(config, {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				BackgroundColor3 = p2.Theme.UIDefault.Color
			})),
			OnlineIndicator = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
				AnchorPoint = Vector2.new(0, 0.5),
				Image = AssetsModule.Images.Circle,
				imageStyle = {
					Transparency = 0,
					Color3 = Props.isOnline and p2.Theme.OnlineStatus.Color or p2.Theme.UIDefault.Color
				},
				Position = UDim2.new(0, 80, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16)
			}) else Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = AssetsModule.Images.Circle,
				ImageColor3 = Props.isOnline and p2.Theme.OnlineStatus.Color or p2.Theme.UIDefault.Color,
				Position = UDim2.new(0, 80, 0.5, 0),
				Size = UDim2.new(0, 16, 0, 16)
			}),
			UsernameLabel = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 100, 0.5, 0),
				Size = UDim2.new(0, 219, 0, 22),
				Text = Props.username,
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

function PlayerLabel.render(p1)
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), PlayerLabel (copy), Cryo (copy)
	return Roact.createElement(PlayerLabel, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)