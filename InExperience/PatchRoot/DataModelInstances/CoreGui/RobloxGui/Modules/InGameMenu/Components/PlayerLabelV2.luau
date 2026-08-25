local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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
	function playerLabelV2.init(p0)
		function p0.onActivated()
			-- upvalues: p0 (ref)
			p0.props.onActivated(p0.props.userId)
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

function playerLabelV2.renderWithSelectionCursor(p2, p3)
	-- upvalues: withFoundationOrUIBloxStyle (ref), fFlagLuaMenuPerfImprovementsModule (ref), roact (ref), var4 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), cryo (ref), t_1 (ref), imageSetLabel (ref), themedTextLabelModule (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), getFFlagLuaAppEnableOpenTypeIGMFix (ref), openTypeSupport (ref)
	local props = p2.props
	local var9 = if props.displayName ~= "" then props.displayName else props.username
	
	return withFoundationOrUIBloxStyle(function(p4)
		return {
			Theme = {
				BackgroundContrast = {
					Color = p4.Color.Surface.Surface_100.Color3,
					Transparency = p4.Color.Surface.Surface_100.Transparency
				},
				BackgroundOnHover = {
					Color = p4.Color.State.Hover.Color3,
					Transparency = p4.Color.State.Hover.Transparency
				}
			}
		}
	end, function(p5)
		-- upvalues: p2 (ref), fFlagLuaMenuPerfImprovementsModule (copy), roact (copy), props (ref), p3 (ref), var4 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), cryo (copy), t_1 (copy), imageSetLabel (copy), themedTextLabelModule (copy), var9 (ref), getFFlagLuaAppEnableOpenTypeSupport (copy), getFFlagLuaAppEnableOpenTypeIGMFix (copy), openTypeSupport (copy)
		local var10 = if p2.props.isSelected then p5.Theme.BackgroundOnHover else p5.Theme.BackgroundContrast
		
		return roact.createElement("TextButton", {
			BackgroundTransparency = var10.Transparency,
			BackgroundColor3 = var10.Color,
			BorderSizePixel = 0,
			LayoutOrder = props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 71),
			Visible = props.Visible,
			Text = "",
			AutoButtonColor = false,
			[roact.Event.Activated] = if fFlagLuaMenuPerfImprovementsModule then if p2.props.onActivated then p2.onActivated else nil else p2.props.onActivated,
			[roact.Change.AbsolutePosition] = p2.props[roact.Change.AbsolutePosition],
			[roact.Ref] = p2.props.forwardRef,
			SelectionImageObject = p3(var4.Square)
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
				Text = var9,
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

function playerLabelV2.render(p6)
	-- upvalues: var3 (ref)
	return var3(function(p7)
		-- upvalues: p6 (ref)
		return p6:renderWithSelectionCursor(p7)
	end)
end

return roact.forwardRef(function(p8, p9)
	-- upvalues: roact (ref), playerLabelV2 (ref), cryo (ref)
	return roact.createElement(playerLabelV2, cryo.Dictionary.join(p8, { forwardRef = p9 }))
end)