local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local openTypeSupport = UIBlox.Utility.OpenTypeSupport
local parent = script.Parent.Parent
local fFlagLuaMenuPerfImprovementsModule = require(parent.Flags.FFlagLuaMenuPerfImprovements)
local getFFlagLuaAppEnableOpenTypeSupport = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local getFFlagLuaAppEnableOpenTypeIGMFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = foundationModule.Image
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
	function playerLabelV2.init(p1)
		function p0.onActivated()
			-- upvalues: p1 (ref)
			p1.props.onActivated(p1.props.userId)
		end
	end
end
function playerLabelV2.renderButtons(p1)
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

function playerLabelV2.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), fFlagLuaMenuPerfImprovementsModule (ref), roact (ref), var2 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), cryo (ref), t_1 (ref), imageSetLabel (ref), themedTextLabelModule (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), getFFlagLuaAppEnableOpenTypeIGMFix (ref), openTypeSupport (ref)
	local props = p1.props
	local var3 = if props.displayName ~= "" then props.displayName else props.username
	
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				BackgroundContrast = {
					Color = p3.Color.Surface.Surface_100.Color3,
					Transparency = p3.Color.Surface.Surface_100.Transparency
				},
				BackgroundOnHover = {
					Color = p3.Color.State.Hover.Color3,
					Transparency = p3.Color.State.Hover.Transparency
				}
			}
		}
	end, function(p3)
		-- upvalues: p1 (ref), fFlagLuaMenuPerfImprovementsModule (copy), roact (copy), props (ref), p2 (ref), var2 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), cryo (copy), t_1 (copy), imageSetLabel (copy), themedTextLabelModule (copy), var3 (ref), getFFlagLuaAppEnableOpenTypeSupport (copy), getFFlagLuaAppEnableOpenTypeIGMFix (copy), openTypeSupport (copy)
		local var4 = if p1.props.isSelected then p3.Theme.BackgroundOnHover else p3.Theme.BackgroundContrast
		
		return roact.createElement("TextButton", {
			BackgroundTransparency = var4.Transparency,
			BackgroundColor3 = var4.Color,
			BorderSizePixel = 0,
			LayoutOrder = props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 71),
			Visible = props.Visible,
			Text = "",
			AutoButtonColor = false,
			[roact.Event.Activated] = if fFlagLuaMenuPerfImprovementsModule then if p1.props.onActivated then p1.onActivated else nil else p1.props.onActivated,
			[roact.Change.AbsolutePosition] = p1.props[roact.Change.AbsolutePosition],
			[roact.Ref] = p1.props.forwardRef,
			SelectionImageObject = p2(var2.Square)
		}, {
			PlayerIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, cryo.Dictionary.join(t_1, {
				ZIndex = 2,
				Image = if props.userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. props.userId .. "&w=60&h=60" else "",
				imageStyle = {
					Transparency = 0,
					Color3 = props.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115)
				}
			})) else roact.createElement(imageSetLabel, cryo.Dictionary.join(t_1, {
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
				Text = var3,
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
			}, p1:renderButtons())
		})
	end)
end

function playerLabelV2.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), playerLabelV2 (ref), cryo (ref)
	return roact.createElement(playerLabelV2, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)